# Ring Error Codes Reference (Ring 1.27)

This document provides a comprehensive lookup of all Compiler Errors (C), Syntax/Literal Warnings (S/W), Runtime Errors (R), and Environment Errors (E) in the Ring programming language.

---

## 1. Compiler Errors (C1 – C31)

| Code | Description | Typical Cause & Fix |
|---|---|---|
| **C1** | Error in parameters list, expected identifier | Malformed parameters in function or method definition. |
| **C2** | Error in class name | Invalid identifier for class name. |
| **C3** | Unclosed control structure, 'ok' is missing | Missing closing keyword (`ok` or `end` or `}`) for `if`. |
| **C4** | Unclosed control structure, 'end' is missing | Missing `end` / `}` for a control block. |
| **C5** | Unclosed control structure, next is missing | Missing `next` / `end` / `}` for a `for` loop. |
| **C6** | Error in function name | Using a reserved keyword as a function name (e.g. `func call` or `func main`). |
| **C7** | Error in list items | Missing comma or syntax error inside `[...]` list literal. |
| **C8** | Parentheses ')' is missing | Unmatched opening parenthesis `(`. |
| **C9** | Brackets ']' is missing | Unmatched opening bracket `[`. |
| **C10** | Error in parent class name | Invalid identifier after `from` or `:` in class inheritance. |
| **C11** | Error in expression operator | Invalid operator sequence in expression. |
| **C12** | No class definition | Using class keywords outside a valid class block. |
| **C13** | Error in variable name | Using an invalid name or keyword for a variable. |
| **C14** | Try/Catch miss the Catch keyword! | `try` block defined without `catch`. |
| **C15** | Try/Catch miss the Done keyword! | In Style 3 brace-style: `try { ... } catch { ... }` missing closing `done`. |
| **C16** | Error in Switch statement expression! | Expression in `switch` is missing or invalid. |
| **C17** | Switch statement without OFF | Missing `off` or `}` at the end of `switch` block. |
| **C18** | Missing closing brace for the block opened! | Unclosed `{` in Style 3 block. |
| **C19** | Numeric Overflow! | Number literal exceeds maximum precision limits. |
| **C20** | Error in package name | Invalid package identifier in `package` declaration. |
| **C21** | Unclosed control structure, 'again' is missing | `do ... again <cond>` loop missing `again`. |
| **C22** | Function redefinition, function is already defined! | Two functions sharing the same name in the same scope. |
| **C23** | Using '(' after number! | Syntax like `10(x)` instead of `10 * (x)`. |
| **C24** | The parent class name is identical to the subclass name | A class cannot inherit from itself (`class A from A`). |
| **C25** | Trying to access the self reference after the object name | Invalid self-referencing property access. |
| **C26** | Class redefinition, class is already defined! | Two classes declared with the same name. |
| **C27** | Syntax Error! | General syntax error. Often caused by case-insensitivity keyword collisions (e.g. naming variable `oR` which collides with `or`). |
| **C28** | Expression is expected! | Missing value or operand in expression. |
| **C29** | Braces are missing to define anonymous function! | Anonymous function `func { ... }` missing `{}`. |
| **C30** | Argument redefinition, argument is already defined! | Duplicate parameter name in function definition. |
| **C31** | Parentheses '(' is expected | Missing `(` in syntax construct. |

---

## 2. Scanner Warnings & Errors (S1, W1 – W8)

| Code | Description | Notes |
|---|---|---|
| **S1** | Literal not closed! | String literal missing closing quote (`"`, `'`, or `` ` ``). |
| **W1** | Unrecognized option | Invalid compiler CLI flag. |
| **W2** | Duplication in file name | Loading the same file multiple times with different cases. |
| **W3** | The Compiler command ChangeRingKeyword requires two words | `ChangeRingKeyword` syntax error. |
| **W4** | Compiler command ChangeRingKeyword - Keyword not found! | Target keyword to replace was not found. |
| **W5** | The Compiler command ChangeRingOperator requires two words | `ChangeRingOperator` syntax error. |
| **W6** | Compiler command ChangeRingOperator - Operator not found! | Target operator to replace was not found. |
| **W7** | Using the EXIT command outside loop! | `exit` called outside a `for`/`while`/`do` loop. |
| **W8** | Using the LOOP command outside loop! | `loop` called outside a `for`/`while`/`do` loop. |

---

## 3. Runtime Errors (R1 – R54)

| Code | Description | Cause & Solution |
|---|---|---|
| **R1** | Can't divide by zero | Division or modulo by 0. |
| **R2** | Array Access (Index out of range) | 1-based indexing violation (`list[0]` or `list[>len]`). |
| **R3** | Calling Function without definition | Function name typo, extension not loaded, or calling `new X()` when `class X` has no `init`. |
| **R4** | Stack Overflow | Infinite recursion or excessive call depth. |
| **R5** | Can't access the list item, Object is not list | Indexing a non-list variable with `[...]`. |
| **R6** | Variable is required | Assignment or pass-by-reference without a variable. |
| **R7** | Can't assign to a string letter more than one character | `cStr[1] = "abc"` (single character assignment only). |
| **R8** | Variable is not a string | String operation applied to non-string. |
| **R9** | Using exit command outside loops | Runtime exit triggered without active loop frame. |
| **R10** | Using exit command with number outside the range | `exit N` where N > loop nesting depth. |
| **R11** | Error in class name, class not found | `new UnknownClass`. |
| **R12** | Error in property name, property not found | Accessing non-existent attribute on object. |
| **R13** | Object is required | Method call or brace access on non-object. |
| **R14** | Calling Method without definition | Method not found in object class or parent classes. |
| **R15** | Error in parent class name, class not found | Inheritance from un-loaded/undefined class. |
| **R16** | Using braces to access unknown object | `oVar { ... }` where `oVar` is NULL or uninitialized. |
| **R17** | Error, using 'Super' without parent class | `super.method()` in a class with no parent. |
| **R18** | Numeric Overflow | Runtime arithmetic calculation overflow. |
| **R19** | Calling function with less number of parameters | Missing required positional arguments. |
| **R20** | Calling function with extra number of parameters | Too many positional arguments passed. |
| **R21** | Using operator with values of incorrect type | Incompatible operands. |
| **R22** | Using loop command outside loops | `loop` called without loop context. |
| **R23** | Using loop command with number outside the range | `loop N` with invalid jump level. |
| **R24** | Using uninitialized variable | Variable used before assignment. Common in Style 3 if `} else {` is used (the `else` is treated as an uninitialized variable!). |
| **R25** | Error in package name, Package not found | `import UnknownPackage`. |
| **R26** | Calling private method from outside the class | Access violation on private method. |
| **R27** | Using private attribute from outside the class | Access violation on private attribute. |
| **R28** | Using bad data type as step value | `for i = 1 to 10 step "string"`. |
| **R29** | Using bad data type in for loop | `for i = "a" to "z"` (range must be numeric). |
| **R30** | Parent class name is identical to child class name | Circular or self inheritance. |
| **R31** | Trying to destroy the object using the self reference | Illegal object destruction. |
| **R32** | The CALL command expect a variable contains string | Dynamic call target not a string. |
| **R33** | Bad decimals number (correct range >= 0 and <= 90) | `decimals(n)` with invalid value. |
| **R34** | Variable is required for the assignment operation | Left-hand side not an assignable target. |
| **R35** | Can't create/open the file | File I/O permission or non-existent path. |
| **R36** | The column number is not correct! | Matrix / 2D list column index out of bounds. |
| **R37** | Sorry, The command is not supported in this context | Restricted command in current state. |
| **R38** | Runtime Error in loading the dynamic library | Extension `.dll`/`.so` failed to load. |
| **R39** | Error occurred creating unique filename | System temp file creation failure. |
| **R40** | Numeric underflow | Number below minimum float range. |
| **R41** | Invalid numeric string | `number("invalid_string")` failure. |
| **R42** | Error in eval() function | Code evaluated in `eval()` threw a syntax/runtime error. |
| **R43** | The variable contains a protected value | Attempted modification of constant/protected symbol. |
| **R44** | Maximum nested Eval() | Recursion limit exceeded in `eval()`. |
| **R45** | Variable is not a list | List operation on non-list variable. |
| **R46** | Dynamic library doesn't contain ringlib_init() | Invalid C extension DLL. |
| **R47** | The function is not supported in this platform | OS-specific API called on unsupported platform. |
| **R48** | Assertion Failed! | `assert(condition)` evaluated to false. |
| **R49** | The Ring VM is not created/ready | Embedded VM state invalid. |
| **R50** | Object does not support operator overloading | Operator used on object without corresponding operator method. |
| **R51** | Value Error | Invalid value passed to internal C binding. |
| **R52** | Using Return inside function parameters is not allowed | Syntax error in parameter evaluation. |
| **R53** | Function redefinition, function is already defined! | Runtime function collision. |
| **R54** | Object attribute redefinition, attribute is already defined! | Runtime duplicate attribute declaration. |

---

## 4. Environment Errors (E1 – E14)

| Code | Description |
|---|---|
| **E1** | Caught SegFault |
| **E2** | Out of Memory |
| **E3** | Deleting scope while no scope! |
| **E4** | Long VM Instruction! |
| **E5** | The file type is not correct - VM expects a Ring object file (`.ringo`) |
| **E6** | The Ring Object File version is not correct! |
| **E7** | Internal error in using sscanf() function |
| **E8** | Internal error in using fscanf() function |
| **E9** | Can't open file |
| **E10** | String size overflow! |
| **E11** | List size overflow! |
| **E12** | HashTable size overflow! |
| **E13** | Reference count overflow! |
| **E14** | Can't read file |
