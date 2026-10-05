# Object-Oriented Programming (OOP) in Ring

Ring supports Object-Oriented Programming with classes, single inheritance, operator overloading, declarative object initialization, setters/getters, and private attributes/methods.

# Class Definition & Object Creation

```ring
# 1. Standard Instantiation
oPoint = new Point {
    x = 10
    y = 20
}

# 2. Instantiation with Constructor init()
oPoint = new Point(10, 20)

class Point {
    x = 0
    y = 0

    func init x, y {
        this.x = x
        this.y = y
    }

    func print {
        see "X: " + this.x + " Y: " + this.y + nl
    }
}
```

> **Critical Gotcha:** `new Point()` (with parentheses) always invokes `func init`. `new Point` (without parentheses) **never** invokes `func init` and leaves attributes at default values. If a class has no `init`, `new Point()` causes Runtime Error R3.

# Declarative Object Usage with Braces `{}`

Braces `{}` switch the active scope directly into the target object:

```ring
oPoint = new Point {
    x = 10
    y = 20
    print()
}
```

# Setters and Getters

Define `set<attribute>` or `get<attribute>` to intercept property reads/writes:

```ring
class Person {
    name = ""

    func setName value {
        name = trim(value)
    }

    func getName {
        return "Mr. " + name
    }
}
```

# Private Attributes & Methods

Members declared after `private` cannot be accessed from outside the class:

```ring
class Account {
    name = ""

    func printInfo {
        see name + " Balance: " + balance + nl
    }

    private

    balance = 0

    func adjustBalance nAmount {
        balance += nAmount
    }
}
```

# Inheritance and `super`

Use `from` or `:` or `<` for inheritance. Call overridden parent methods using `super`:

```ring
class Human {
    name = ""
    age  = 0

    func print {
        see "Name: " + name + " Age: " + age + nl
    }
}

class Employee from Human {
    job    = ""
    salary = 0

    func print {
        super.print()
        see "Job: " + job + " Salary: " + salary + nl
    }
}
```

# Operator Overloading

Define `func operator cOp, vPara` to overload operators (`+`, `-`, `*`, `/`, `[]`, `len`, etc.):

```ring
class Vector2 {
    x = 0
    y = 0

    func operator cOp, vOther {
        oResult = new Vector2
        switch cOp {
        on "+"
            oResult.x = this.x + vOther.x
            oResult.y = this.y + vOther.y
        on "-"
            oResult.x = this.x - vOther.x
            oResult.y = this.y - vOther.y
        }
        return oResult
    }
}
```

# Packages and Namespaces

```ring
package App.Models {
    class User {
        name = ""
    }
}

# Usage:
import App.Models
oUser = new User
```
