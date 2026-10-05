# Ring Syntax Pitfalls — Session-Hardened (Style 3 / brace-style)

Concrete errors hit and resolved while writing Ring code for the Jibrail / Ring AI stack.
Ring build observed: Ring 1.x on Windows (`ring.exe` at `C:\ring\bin\ring.exe`).

## 1. Command-line arguments: use `sysargv`, NOT `args()` / `sysargs()`
- `args()` → Runtime **R3** "Calling Function without definition: args".
- `sysargs()` → not a function either.
- The variable is **`sysargv`** (a 1-based list).
- Layout: `[ring.exe, script.ring, arg1, arg2, ...]`
  - `sysargv[1]` = ring.exe
  - `sysargv[2]` = the .ring script name
  - `sysargv[3]` = FIRST real argument
- Correct usage:
```ring
func main {
    aArgs = sysargv
    if len(aArgs) < 3 { see "Usage: ring x.ring <in> [out]" + nl return }
    cInput = aArgs[3]
    cOutput = substr(cInput, 1, len(cInput) - 4) + ".txt"
    if len(aArgs) >= 4 { cOutput = aArgs[4] }
}
```

## 2. try/catch needs a `done` terminator in brace-style
- `try { } catch { }` → Compiler **C14** "Try/Catch miss the Catch keyword".
- Correct:
```ring
try {
    a = sysargs()
catch
    see "no sysargs: " + cCatchError + nl
}
done
```

## 3. Brace-style `if/else`: `else` goes INSIDE the closing `}`
`if cond { ... } else { ... }` → R24 "Using uninitialized variable: else" (the `}` before
`else` detaches it from the `if`). CORRECT — `else`/`elseif`/`but` stay inside the braces:
```ring
# WRONG (R24):
if len(aArgs) >= 3 {
    cOutput = aArgs[3]
} else {
    cOutput = "default.txt"
}
# CORRECT:
if len(aArgs) >= 3 {
    cOutput = aArgs[3]
else
    cOutput = "default.txt"
}
```

## 4. Class with no `func init` → `new X()` fails (R3)
If a class defines methods but no `func init`, then `new X()` → **R3** "Calling Function
without definition: init". Use `new X` (no parentheses):
```ring
oReader = new QalamReader   # OK (class has no init)
# oReader = new QalamReader()  # R3
```

## 5. `eval()` inside a method runs in a scope that POPS (R24)

When a **method** calls `eval(cCode)` on a test/plugin file, the top-level variables that
file assigns live in a temporary scope destroyed when `eval()` returns. Observed on
Ring 1.26 / Windows:

- Top-level **variables** in the evaluated file → **R24 "Using uninitialized variable"**
  when a later callback (an anonymous function stored and invoked afterwards) reads them.
- Named **functions and classes** in the evaluated file DO survive (global tables), so
  `helperFn()` and `new SomeClass` work fine from callbacks.
- A closure over an evaluated-file variable also fails — the variable itself is gone.
- Confirmed: after the method's eval returned, `isglobal(v)` → 0 AND `islocal(v)` → 0,
  i.e. the variable is in neither scope any more.

`ringvm_evalinscope(nScope, cCode)` cannot work around it: every scope index raises
"Bad parameters value, error in range!".

**Workaround:** keep shared state in the *framework's* globals (in a file that was
`load`ed normally, not eval'd) and expose accessor functions that touch those globals
directly — accessor functions survive eval, so callbacks can call them. ringtest does this
with `ctxSet()/ctxGet()/ctxIncr()` backed by a framework-level `aGlobalContext`.

**Trap:** returning a list from such an accessor (`return aGlobalContext`) hands back a
**copy** — Ring deep-copies lists on assignment — so mutating the copy is lost. Use setter
functions that write the global inside the function body.

**Related:** code placed AFTER a `func`/`class` definition is swallowed into that
function/class body (silent exit 0, no output). In test files this means `describe(...)`
must come BEFORE any trailing `func`/`class` blocks, and top-level executable code must
precede the first definition.

## 7. Variable names that collide with keywords (case-insensitive)

Ring is **case-insensitive**, so `oR` is the same identifier as `or` — a keyword.
Using such a name as a variable produces **C27 Syntax Error** / **C28 Expression is
expected**, which looks like a broken expression but is actually a reserved-word
collision. This cost significant debugging time: `expect(1).toBe(1)` appeared to
fail after loading a library, but the real cause was `oR = expect(1)` on the line
above.

**Rule:** before debugging a "syntax error" on a line that calls a known-good
function, check every identifier on the preceding lines against Ring's keyword list
(`or`, `and`, `not`, `ok`, `done`, `on`, `off`, `but`, `elseif`, `other`, `give`,
`get`, `return`, `exit`, `loop`, `again`, `try`, `catch`, `done`, `class`, `func`,
`if`, `else`, `for`, `while`, `do`, `switch`, `begin`, `end`, `step`, `to`, `from`,
`in`, `private`, `public`, `static`, `new`, `this`, `super`, `null`, `true`,
`false`). Use `isfunction("name")` to test whether a name resolves to a function.

## 8. `new X` without parens NEVER calls `init`

`new X` (no parentheses) creates the object but **does not invoke `func init`** — the
object gets only the default attribute values from the class body. `new X()` always
calls `init`. This is a silent failure: `new Lock` gave `bValid=0` (init never ran),
`new Lock()` gave `bValid=1`.

**Rule:** always use `new X()` when the class has an `init`. Use `new X` only when
you explicitly want to skip initialization (rare). If a class has no `init`, `new X()`
raises R3 — but `new X` silently produces an uninitialized object.

## 9. `uv_barrier_wait` return value

`uv_barrier_wait` returns **1 for the thread that releases the barrier** and **0 for
all other waiters**. Any value >= 0 means the caller passed through. Do NOT compare
to `THREAD_UV_OK` (0) — that would make only the releasing thread see `true`.

## 10. `min` / `max` / `abs` are libuv C functions

After `load "libuv.ring"`, the names `min`, `max`, and `abs` resolve to C functions
from libuv (visible via `find(cfunctions(), "min") > 0`). They work correctly with
2+ numeric args. If you define a Ring function with one of these names, the libuv
version may shadow it depending on load order. Use `isfunction("min")` to check
which one is active.

- **`[:]` is NOT valid Ring** → `C7 : Error in list items`. Use `[]`; string-keyed
  access (`aList["key"]`) works on any list. Hash-literal syntax is `[:k = v]` at
  *definition* time only.
- **No optional parameters.** A function declared with 2 params must be called with 2
  (`ctxIncr(k, n)` then `ctxIncr(k)` → **R19**). Provide separate 1-arg and 2-arg
  wrappers instead.
- **`del()` takes the LIST, not the item**: `del(aList, i)` ✓ — `del(aList[i], i)` →
  **R45 "Variable is not a list"**.
- **`func call` is a reserved name** → `C6 Error in function name` / `C13 Error in
  variable name`. Do not name a method `call` (also `main`, `init`, `self`, `this`).
- **Counters via `+` silently concatenate**: `"" + 1` → `"1"`, then `"1" + 1` → `"11"`.
  Guard with `isNumber()` before arithmetic on a possibly-missing value.
- **`substr(s, nStart, nCount)` returns `""` for a bad start**, and `substr(s, needle)`
  returns the 1-based index (0 = not found). Passing a wrong start silently yields empty
  strings rather than erroring — check indices explicitly.

