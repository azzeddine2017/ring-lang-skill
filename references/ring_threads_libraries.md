# Threads in Ring — All Available Libraries (verified)

Ring HAS real OS threads. They are NOT built-ins: they ship as extensions. **Before
telling a user Ring cannot do threads, list `C:\ring\extensions\`** — five different
extensions expose threading, each with a different API shape.

| Library | `load` line | Thread entry point | 2nd arg is | Parallel? |
|---|---|---|---|---|
| ringthreads | `threads.ring` | `thrd_create(t, cCode)` | code string | **NO — serializes** |
| ringlibuv | `libuv.ring` | `uv_thread_create(t, cCode)` | code string | **YES** |
| ringallegro | `gamelib.ring` | `al_create_thread(cCode)` | code string | yes |
| ringsdl | `libsdl.ring` | `SDL_CreateThread(cCode, cName)` | code string | yes (unjoinable) |
| ringqt | `qtcore.ring` | `new QThread` | n/a | not usable standalone |

All of them take **a string of Ring source**, never a function reference. To run a
function, pass a call: `"worker()"` or `"worker(1)"`.

## Parallelism is NOT the same everywhere (measured)

This is the single most important finding. Measured with a CPU-bound body
(3,000,000-iteration loop), comparing 1 thread vs 4 threads on a 4-core machine:

| Library | 1 thread | 4 threads | ratio | verdict |
|---|---|---|---|---|
| ringthreads | 1.33 s | 4.22 s | **3.18x** | effectively **serialized** |
| ringlibuv | 1.50 s | 2.63 s | **1.75x** | genuinely **parallel** |

A ratio near 4 = no speedup at all. Do NOT assume "it spawned a thread" means "it runs in
parallel" — measure before promising speedup. Use **ringlibuv** when parallel throughput
matters; ringthreads still works for concurrency (e.g. overlapping I/O waits) but not for
CPU-bound parallelism.

Why: `ring_vm_runcodefromthread` gives each thread its own `RingState` while sharing the
global scope and VM locks (see `C:\ring\language\src\vmthread.c`). ringthreads re-enters
that shared state per task; libuv's callback path contends far less.

## ringthreads (`load "threads.ring"`)

```ring
load "threads.ring"

t = new_thrd_t()
thrd_create(t, "Hello()")     # STRING of code, not a function name
nRes = 0
thrd_join(t, :nRes)           # result lands in nRes
? nRes

func Hello
    ? "from the thread"
```

Passing a bare name (`thrd_create(t, "worker")`) raises `R24 Using uninitialized
variable: worker`.

| Call | Notes |
|---|---|
| `new_thrd_t()` / `new_mtx_t()` / `new_cnd_t()` | allocate a CPointer wrapper |
| `thrd_create(t, cCode)` | start a thread running the code string |
| `thrd_join(t, :nRes)` | wait; result lands in `nRes` |
| `thrd_yield()` | yield |
| `mtx_init(m, mtx_plain)` | returns `thrd_success` (1) |
| `mtx_lock` / `mtx_unlock` / `mtx_trylock` | return 1 on success |
| `cnd_init` / `cnd_signal` / `cnd_broadcast` / `cnd_wait` | condition variables |
| `cnd_destroy(c)` | safe |

Constants (`thrd_success`, `mtx_plain`, ...) come from `ring_threads.rh` and are visible as
plain globals after the load. They are NOT reachable as inherited class attributes —
`oMgr.mtx_plain` raises `R12 Error in property name`.

### Known defects (Ring 1.26, Windows)

- **`mtx_destroy` segfaults the process** (exit 127 / 0xC0000005). The extension calls
  `free()` after destroying, but `new_<type>()` hands ownership to Ring's CPointer
  mechanism — that is a double free. `cnd_destroy` has no such call and is fine.
  Workaround: do not call `mtx_destroy`.
  GENERAL RULE for Ring C extensions: when a `destroy`-style function crashes but its
  sibling does not, diff their C source for an extra `free()`. Never `free()` a pointer
  from a Ring `new_*` allocator — Ring owns it.
- **`new_timespec()` does not exist** (`R3`). Any helper building a `struct timespec`
  (timed mutex lock, timed condition wait) cannot work as written.
- **Every started thread must be joined before exit.** An abandoned live thread crashes
  the runtime (exit 139). A "terminate" helper that only flips a state flag and never
  calls `thrd_join` stops nothing AND crashes at exit.

## ringlibuv (`load "libuv.ring"`) — prefer for parallel work

```ring
load "libuv.ring"

t = new_uv_thread_t()
uv_thread_create(t, "worker()")
uv_thread_join(t)
destroy_uv_thread_t(t)      # this destroy is safe
```

`uv_thread_create` also accepts a method reference: `uv_thread_create(t, Method(:One))`.
Unlike ringthreads, `destroy_uv_thread_t` does not crash. Join every thread.

## ringallegro (`load "gamelib.ring"`)

```ring
load "gamelib.ring"

oThread = al_create_thread("? 'allegro thread ran'")
al_join_thread(oThread, NULL)
```

`al_create_thread(cCode)` returns an `ALLEGRO_THREAD *` and starts it. Also available:
`al_run_detached_thread(cCode)`, `al_set_thread_should_stop(t)`,
`al_get_thread_should_stop(t)`, `al_destroy_thread(t)`.

## ringsdl (`load "libsdl.ring"`) — thread CANNOT be joined

```ring
load "libsdl.ring"
SDL_CreateThread("? 'SDL thread ran'", "worker")
```

Two string args (code, name), and the binding **returns nothing** — it never calls
`RING_API_RETCPOINTER`, so there is no handle to join. `SDL_WaitThread` is not bound in a
callable form. Consequence: every SDL thread is fire-and-forget; the main program can exit
before the thread finishes, and you cannot synchronise on it. Use SDL threads only for
work that may be dropped.

## ringqt (`load "qtcore.ring"`)

`QThread`, `QMutex`, `QMutexLocker`, `QThreadPool` classes exist and instantiate:
`isclass("QThread")` = 1, `classname(new QThread)` = `qthread`,
`oT.idealThreadCount()` = 4 on a 4-core box.

Driving a thread from pure Ring is not reliable, though (verified):

- `oT.start()` → `R19 Calling function with less number of parameters` — the binding
  requires a priority argument, so `oT.start(0)` is needed.
- `oT.isRunning()` aborted the process silently (exit 1, no message).

A plain `new QThread` also has no `run()` body to execute. Treat Qt threading as
usable only inside a real RingQt GUI application with a subclassed `run()` and the Qt
event loop — not as a drop-in parallelism tool. Use ringlibuv instead.

## Threads and the eval-scope boundary

When a framework (like ringtest) evaluates a test file via `eval()` inside a method,
the file's top-level variables live in a temporary scope that pops when `eval()`
returns. Threads spawned from that file **cannot write those variables** — the
scope is gone. But they **can call functions** defined in the file (functions
survive in the global table).

**Verified pattern:** use `ctxSet(key, value)` from inside a thread to write
results into the framework's shared context. The main thread reads them with
`ctxGet(key)` after `joinAll()`. This works reliably — two threads writing
`ctxSet("nA", 111)` and `ctxSet("nB", 222)` were both visible to the main
thread after join.

**What does NOT work:** a thread writing `gResult = 42` (a test-file global)
— the main thread sees the original value (0), not 42. The variable's scope
is not the thread's scope.

**Safe pattern for parallel aggregation:** each thread writes its own
pre-allocated global (`gR1`, `gR2`, ...) or uses `ctxSet`. The main thread
aggregates after `joinAll()`. Verified: 4 threads × 20000 increments into
separate globals → all four read 20000 after join.

## Rebuilding the ringthreads extension

`mtx_destroy` cannot be fixed from Ring — it needs a C edit in
`C:\ring\extensions\ringthreads\ring_threads.c` (delete the `free(pMutex)` after
`mtx_destroy`), then rebuild with `buildvc_x64.bat` / `buildgcc.sh`.
