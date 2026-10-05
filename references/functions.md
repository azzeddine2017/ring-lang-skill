# Functions

In this chapter we learn about:

- Define functions
- Call functions
- Declare parameters
- Send parameters
- Main Function
- Variables Scope
- Return Value
- Recursion

# Define Functions

Syntax:

```ring
func <function_name> [parameters] {
    # Block of statements
}
```

Example:

```ring
func hello {
    see "Hello from function" + nl
}
```

# Call Functions

To call a function without parameters, type the function name followed by `()`:

```ring
hello()

func hello {
    see "Hello from function" + nl
}
```

# Declare parameters

Separate parameter names by commas:

```ring
func sum x, y {
    see x + y + nl
}
```

# Send Parameters

Parameters are passed inside parentheses:

```ring
sum(3, 5)
sum(1000, 2000)

func sum x, y {
    see x + y + nl
}
```

# Main Function & Execution Model

Using the Ring programming language, top-level code executes first. If a `main` function is defined, it will be executed after other top-level statements.

> **Critical Execution Rule:** All statements intended for top-level execution must appear **before** the first `func` or `class` definition. Code placed after a `func` becomes part of that function body.

```ring
see "Hello World!" + nl

func main {
    see "Message from the main function" + nl
}
```

# Variables Scope

Ring uses lexical scoping:
- Variables defined inside functions (including parameters) are **local**.
- Variables defined outside functions (top-level) are **global**.
- Inside any function, local variables and global variables can be accessed.
- Lists and objects passed to functions are passed **by reference**.

Example:

```ring
x = 10     # global variable

func main {
    for t = 1 to 10 {
        mycounter()
    }
}

func mycounter {
    see x + nl
    x--
}
```

# Return Value

Functions return values using the `return` command:

```ring
func add x, y {
    return x + y
}
```

# Recursion

Functions support recursive calls:

```ring
see fact(5)      # output = 120

func fact x {
    if x = 0 {
        return 1
    else
        return x * fact(x - 1)
    }
}
```
