---
name: ring-lang
description: "Use when reading, writing, analyzing, or debugging code in the Ring programming language (Ring 1.27). Covers syntax styles (Brace Style 3 & Classic), 1-based indexing, top-level execution model, 258 built-in functions, OOP, RingQt, concurrency extensions, and session-hardened pitfalls."
version: "1.3"
---

# Ring Language Reference — Ring 1.27

This skill provides complete mastery of the **Ring programming language** (v1.27) for AI agents and LLMs. Ring is a dynamic, weakly typed, multi-paradigm, case-insensitive programming language with a highly flexible execution model and syntax.

---

## Quick Reference Index

### 1. Core Language Guides (`references/`)

| File | Description |
|---|---|
| [`references/core.md`](references/core.md) | Keywords (56), alias keywords, scanner commands, full grammar specifications |
| [`references/builtins.md`](references/builtins.md) | Comprehensive categorized guide for all 258 built-in functions (Strings, Lists, Math, I/O, System) |
| [`references/errors.md`](references/errors.md) | Complete lookup of Compiler Errors (C1–C31), Runtime Errors (R1–R54), and Environment Errors (E1–E14) |
| [`references/vm.md`](references/vm.md) | Virtual Machine (VM) bytecode instructions reference (`ICO_*`) |
| [`references/functions.md`](references/functions.md) | Functions, parameters, pass-by-reference semantics, return values, recursion |
| [`references/lists.md`](references/lists.md) | 1-based lists, multi-dimensional matrices, hash tables (`:key = value`), sorting & searching |
| [`references/strings.md`](references/strings.md) | String manipulation, length, substrings, transformations, lines conversion |
| [`references/oop.md`](references/oop.md) | Classes, declarative `{}` object scopes, constructors `init()`, getters/setters, inheritance, operator overloading |

### 2. Hardened Pitfalls & Deep-Dives (`references/`)

| File | Description |
|---|---|
| [`references/ring_execution_pitfalls.md`](references/ring_execution_pitfalls.md) | Execution model: Top-level statement order, silent function swallowing, verification checklist |
| [`references/ring_syntax_pitfalls_session.md`](references/ring_syntax_pitfalls_session.md) | Style 3 syntax traps: `sysargv`, `try/catch/done`, `else` inside closing braces, class init rules |
| [`references/ring_qt_gui_pitfalls.md`](references/ring_qt_gui_pitfalls.md) | RingQt GUI gotchas: Silent event-handler exits, `QBrush` vs `QColor`, forward class definitions |
| [`references/ring_threads_libraries.md`](references/ring_threads_libraries.md) | Concurrency: All 5 thread extensions (`ringthreads`, `ringlibuv`, `ringallegro`, `ringsdl`, `ringqt`), performance & API quirks |

### 3. Application Boilerplates (`templates/`)

- [`templates/console_app.ring`](templates/console_app.ring) — CLI / console application boilerplate with argument parsing
- [`templates/gui_app.ring`](templates/gui_app.ring) — RingQt desktop GUI boilerplate
- [`templates/web_app.ring`](templates/web_app.ring) — Web application boilerplate

### 4 extension, compiler flags (`archive/`)

- [ `archive/gui_qt.md`](archive/gui_qt.md) — RingQt GUI, Form Designer, Qt3D, Mobile & WebAssembly
- [`archive/games.md`](archive/games.md) — 2D/3D Game Engine, LibSDL, Allegro, GoldMagic800
- [`archive/c_extensions.md`](archive/c_extensions.md) — C extension APIs, low-level pointers, LibCurl, LibUI, LibUV
- [`archive/databases.md`](archive/databases.md) — Database drivers and ODBC reference
- [`archive/tools_cloud.md`](archive/tools_cloud.md) — Ring Cloud, Docker, deployment, performance tips, editors
- [`archive/misc.md`](archive/misc.md) — Additional helper functions and constants

---

## Fast Built-in Cheatsheet (Instant Lookup)

| Category | Functions |
|---|---|
| **I/O & Print** | `? expr` (print + nl), `see expr` / `put expr` (no nl), `give var` / `get var` (input) |
| **Strings** | `len(s)`, `lower(s)`, `upper(s)`, `trim(s)`, `left(s, n)`, `right(s, n)`, `substr(s, find, rep)`, `str2list(s)`, `list2str(a)`, `strcmp(s1, s2)` |
| **Lists (1-based)**| `len(a)`, `add(a, v)`, `del(a, idx)`, `insert(a, idx, v)`, `find(a, v)`, `sort(a)`, `reverse(a)`, `binarysearch(a, v)`, `list(rows, cols)` |
| **Types & Casts** | `type(v)`, `isstring(v)`, `isnumber(v)`, `islist(v)`, `isobject(v)`, `number(s)`, `string(n)`, `decimals(n)` |
| **Files & OS** | `read(file)`, `write(file, data)`, `fexists(path)`, `direxists(path)`, `dir(path)`, `remove(file)`, `rename(old, new)`, `sysargv`, `system(cmd)`, `eval(code)` |

---

## Coding Standard — Style 3 (Brace-Style `{}`)

**Write all new Ring code in brace-style `{}` by default.**

### Naming Conventions (Prefixes)
- `c`: Strings (`cName`, `cFilePath`)
- `n`: Numbers / Counts (`nCount`, `nIndex`, `nPort`)
- `a`: Lists / Arrays / Hashes (`aItems`, `aParams`)
- `o`: Objects (`oPlayer`, `oApp`)
- `b`: Booleans / Flags (`bIsActive`, `bFound`)
- `p`: Pointers / Low-level handles (`pHandle`)

### 1. Conditionals — `else` / `elseif` INSIDE the closing `}`
```ring
if condition {
    # block
else
    # block
}

if condition {
    # block
elseif condition2
    # block
else
    # block
}
```
> ⚠️ **CRITICAL TRAP:** NEVER write `} else {`. In Ring's parser, closing `}` before `else` detaches it from the `if`, producing **Runtime Error R24** (`Using uninitialized variable: else`).

### 2. Loops
```ring
for i = 1 to 10 step 2 {
    # block
}

for item in aList {
    # block
}

while condition {
    # block
}
```

### 3. Functions & Methods
```ring
func calculateTotal aItems {
    if type(aItems) != "LIST" {
        raise("Error: Expected list parameter")
    }
    nTotal = 0
    for nVal in aItems {
        nTotal += nVal
    }
    return nTotal
}
```
> Lists and objects are passed **by reference** automatically.

### 4. Classes & Declarative Object Instantiation
```ring
class Player {
    name  = "Guest"
    score = 0

    func init cName, nScore {
        this.name  = cName
        this.score = nScore
    }

    func display {
        ? "Player: " + this.name + " | Score: " + this.score
    }

    private
    id = 0
}

# Declarative initialization
oPlayer = new Player {
    name  = "Hero"
    score = 100
    display()
}
```

### 5. Error Handling (`try / catch / done`)
```ring
try {
    # risky operation
catch
    see "Error caught: " + cCatchError + nl
}
done
```
> In brace-style, `try { ... } catch ... }` MUST conclude with the `done` keyword.

---

## Critical Ring Execution Rules

1. **NO `func main()` Entry Point Requirement:**
   - Top-level statements execute from top to bottom.
   - All top-level code **must** precede any `func` or `class` definitions.
   - Code written after a `func` is swallowed into that function body and will not run on startup.
2. **Lists and Strings are 1-Indexed:**
   - `aList[1]` is the first element; `aList[0]` throws **Runtime Error R2**.
   - `cStr[1]` is the first character.
3. **`new Class()` vs `new Class`:**
   - `new Class()` (with parentheses) **always** invokes `func init`.
   - `new Class` (without parentheses) **never** invokes `func init` (leaves attributes at default values).
   - If a class has no `init`, calling `new Class()` throws **Runtime Error R3**.
4. **Case-Insensitivity & Keyword Collisions:**
   - Ring identifiers are case-insensitive (`oR` is the keyword `or`).
   - Never name variables `or`, `and`, `not`, `call`, `done`, `ok`, `step`.
5. **Loading Files vs Packages:**
   - Use `load "file.ring"` for script files and extensions.
   - Use `import PackageName` for packages.

---

## Verification & Dry-Run Protocol

Before executing or finalizing Ring code, verify using the Ring CLI:

```bash
# 1. Syntax & compilation check only (no execution)
ring script.ring -norun

# 2. Token stream inspection
ring script.ring -tokens

# 3. GUI safe test (timeout after 4s, exit 124 = success)
timeout 4 ring gui_script.ring
```
