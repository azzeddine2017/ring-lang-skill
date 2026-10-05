# Ring Virtual Machine (VM) Bytecode Instructions Reference

Ring executes compiled bytecode on a register-and-stack-based Virtual Machine (VM). Instructions are prefixed with `ICO_`.

---

## 1. Stack and Variables Instructions

| Instruction | Description |
|---|---|
| `ICO_PUSHC` | Push string literal from Instruction Register (IR) to stack |
| `ICO_PUSHNL` | Push newline character (`\n`) to stack |
| `ICO_PUSHN` | Push number from IR to stack |
| `ICO_PUSH2N` | Push two numbers from IR to stack |
| `ICO_PUSHV` | Replace Variable Pointer (VP) in `Stack[top]` with variable value |
| `ICO_LOADADDRESS` | Read variable name from IR, push Variable Pointer (VP) to stack |
| `ICO_ASSIGNMENT` | Assign: `Stack[top-1] = Stack[top]`, pop top |
| `ICO_INC` | Increment number in `Stack[top]` by 1 |
| `ICO_LOADAPUSHV` | Combined `ICO_LOADADDRESS` followed by `ICO_PUSHV` |
| `ICO_NEWLINE` | Store source code line number for debugging and stack traces |
| `ICO_FREESTACK` | Clear all items from evaluation stack |
| `ICO_FILENAME` | Store current source file name for debugging |
| `ICO_FREELOADASCOPE`| Free scope list of current expression |

---

## 2. Control Flow & Jumps

| Instruction | Description |
|---|---|
| `ICO_JUMP` | Unconditional jump: set Program Counter (PC) to target address |
| `ICO_JUMPZERO` | Jump if `Stack[top] == 0` (falsy) |
| `ICO_JUMPONE` | Jump if `Stack[top] == 1` (truthy) |
| `ICO_JUMPZERO2` | Jump if zero, but leave 1 on stack (short-circuit `AND`) |
| `ICO_JUMPONE2` | Jump if non-zero, but leave 1 on stack (short-circuit `OR`) |
| `ICO_JUMPFOR` | Loop iteration jump for `for` construct |
| `ICO_PUSHNULLTHENJUMP` | Push NULL then jump |
| `ICO_PUSHNTHENJUMP` | Push number from REG1 then jump to REG2 |

---

## 3. Comparisons & Logic

| Instruction | Operator | Description |
|---|---|---|
| `ICO_EQUAL` | `=` | Compare `Stack[top-1] == Stack[top]` |
| `ICO_NOTEQUAL` | `!=` | Compare `Stack[top-1] != Stack[top]` |
| `ICO_LESS` | `<` | Compare `Stack[top-1] < Stack[top]` |
| `ICO_LESSEQUAL` | `<=` | Compare `Stack[top-1] <= Stack[top]` |
| `ICO_GREATER` | `>` | Compare `Stack[top-1] > Stack[top]` |
| `ICO_GREATEREQUAL` | `>=` | Compare `Stack[top-1] >= Stack[top]` |
| `ICO_AND` | `and` / `&&` | Logical AND |
| `ICO_OR` | `or` / `\|\|` | Logical OR |
| `ICO_NOT` | `not` / `!` | Logical NOT |

---

## 4. Arithmetic & Bitwise Operations

| Instruction | Operator | Description |
|---|---|---|
| `ICO_SUM` | `+` | Addition or string concatenation |
| `ICO_SUB` | `-` | Subtraction |
| `ICO_MUL` | `*` | Multiplication |
| `ICO_DIV` | `/` | Division |
| `ICO_MOD` | `%` | Modulo |
| `ICO_POW` | `**` / `^^` | Power / Exponentiation |
| `ICO_NEG` | `-x` | Unary negation |
| `ICO_PLUSPLUS` | `++` | Increment |
| `ICO_MINUSMINUS` | `--` | Decrement |
| `ICO_BITAND` | `&` | Bitwise AND |
| `ICO_BITOR` | `\|` | Bitwise OR |
| `ICO_BITXOR` | `^` | Bitwise XOR |
| `ICO_BITNOT` | `~` | Bitwise NOT |
| `ICO_BITSHL` | `<<` | Bitwise Shift Left |
| `ICO_BITSHR` | `>>` | Bitwise Shift Right |

---

## 5. Lists & Data Structures

| Instruction | Description |
|---|---|
| `ICO_LISTSTART` | Initialize a new list in temporary memory |
| `ICO_LISTITEM` | Add value from stack to current list |
| `ICO_LISTITEMN` | Add number literal from REG1 to current list |
| `ICO_LISTITEMC` | Add string literal from REG1 to current list |
| `ICO_LISTEND` | Finalize list creation and push pointer to stack |
| `ICO_LOADINDEXADDRESS` | Index access: `List[Index]` |
| `ICO_RANGE` | Generate range list (`x : y`) |

---

## 6. Functions, Methods & OOP

| Instruction | Description |
|---|---|
| `ICO_NEWFUNC` | Register function entry point |
| `ICO_LOADFUNC` | Lookup function by name in global/package symbol tables |
| `ICO_CALL` | Invoke function frame |
| `ICO_RETURN` | Return from function with top stack value |
| `ICO_RETNULL` | Return NULL from function |
| `ICO_RETURNN` | Return number constant from REG1 |
| `ICO_NEWOBJ` | Instantiate class: allocate object structure and push pointer |
| `ICO_SETSCOPE` | Switch execution context to target object scope |
| `ICO_LOADSUBADDRESS` | Access object attribute/property |
| `ICO_LOADMETHOD` | Lookup method in class hierarchy |
| `ICO_CALLCLASSINIT` | Invoke `init()` constructor if defined |
| `ICO_BRACESTART` | Enter declarative brace block `{` |
| `ICO_BRACEEND` | Exit declarative brace block `}` |
| `ICO_PRIVATE` | Mark start of private class members |
| `ICO_SETPROPERTY` | Set attribute value with setter dispatch |
| `ICO_IMPORT` | Import package symbols into current scope |
| `ICO_PACKAGE` | Define package namespace |

---

## 7. Exception Handling & Lifetime

| Instruction | Description |
|---|---|
| `ICO_TRY` | Register exception handler catch block |
| `ICO_DONE` | Deregister active exception frame |
| `ICO_EXIT` | Break out of loop |
| `ICO_LOOP` | Continue to next loop iteration |
| `ICO_BYE` | Terminate VM process |
