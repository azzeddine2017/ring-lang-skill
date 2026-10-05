# Ring Execution Model — Critical Pitfalls (Discovered 2026-08-23, Ring 1.26)

## 1. Top-Level is the Main — No `func main()` Wrapper

Ring executes sequentially from line 1. There is NO required `main()` entry point.
`samples/Language` and `samples/AQuickStart/GUILib` all put executable code at the **top**
and `func`/`class` definitions **after**.

```
# CORRECT Ring file structure
load "stdlib.ring"
load "guilib.ring"

oManager = new TaskManager   # forward class reference — ALLOWED
oApp = new QApp { ...  exec() }   # top-level execution
? "done"

class Task ... end
func helper ... 
```

```ring
# WRONG — silent failure, prints nothing, EXIT 0
func main {
    ? "hello"
}
main()   # `main` is a Ring keyword, tokenized as MAIN not identifier
```

Also WRONG:
```ring
? "before func"
func foo
    ? "inside foo"
? "after func"   # <-- still INSIDE foo, never executes as top-level
foo()             # forward call may appear to work for simple cases but
                 # any code after a `func` without next func/class is swallowed
```

**Rule:** All top-level executable code MUST appear **before** the first `func`/`class`,
or be the very first block. Definitions after top-level are fine.

Verification:
```bash
ring file.ring -tokens | head   # check `main` tokenized as Keyword MAIN vs Identifier
ring file.ring -norun            # syntax check, EXIT 0 even when execution is swallowed!
timeout 4 ring file.ring         # GUI: 124 = timeout = still running = success
```

## 2. Brace Style `{}` vs Classic `ok/next/end/off`

SKILL.md previously recommended brace-style as idiomatic. In practice:
- Ring samples use classic terminators: `if ... ok`, `for ... next`, `while ... end`,
  `switch ... off`, `try ... catch ... end` / `done`
- Brace style parses but interacts badly with the execution model above
  (e.g. `func (Foo) { ? "x" } ? "y"` — `? "y"` still inside Foo)
- For reliability, use **classic style** for control flow and function bodies.

Verified working (Ring 1.26):
```ring
func cGetPriorityLabel (nChoice){
    switch nChoice{
    on 1
        return "عالية"
    on 2
        return "متوسطة"
    other
        return "متوسطة"
    }
}

for nI = 1 to 5 step 1{
    ? nI
}

while nCounter > 0{
    nCounter--
}

try{
    raise("err")

catch
    ? cCatchError
}

```

## 3. Forward References — Classes OK, Functions Fragile

- `oManager = new TaskManager` before `class TaskManager` — **works** (forward class allowed)
- `? myFunc()` before `func myFunc` — works for simple top-level calls
- `for ... ? myFunc()` before `func myFunc` **after classes** — intermittently fails with
  `R3 : Calling Function without definition: myfunc` (case-insensitive lookup).
  Seen for `cGetPriorityLabel` when defined after `class TaskManager`.
  Fix: define helpers **before** top-level that calls them inside loops, or inline the logic.

## 4. Verification Checklist (Must Do)

1. `ring file.ring -norun` — only checks syntax, not execution swallowing
2. `ring file.ring -tokens` — grep for `Keyword : MAIN` vs `Identifier : main`
3. `ring file.ring 2>&1` — actual run; empty output + EXIT 0 = likely swallowed execution
4. For GUI: `timeout 4 ring file.ring` → EXIT 124 means window stayed open = success
5. Check `C:/ring/logs` for crash logs if EXIT 1 with no stdout

## 5. Arabic / UTF-8

Ring 1.26 handles UTF-8 literals correctly:
```ring
? "مرحبا"   # works, prints correctly even via bash pipe
```
No extra encoding needed, but keep file UTF-8 without BOM.

