# ====================================================================
# Ring Console Application Template (Style 3 - Brace Style)
# ====================================================================

load "stdlibcore.ring"

# Top-level entry execution
runApp()

func runApp {
    bRunning = true
    while bRunning {
        see "
========================================
        Ring Console Application
========================================
  [1] Say Hello
  [2] Calculate Sum
  [3] Factorial
  [4] Exit
----------------------------------------
Select an option: "
        give cChoice
        see nl

        switch cChoice {
        on "1"
            sayHello()
        on "2"
            calculateSum()
        on "3"
            calculateFactorial()
        on "4"
            see "Goodbye!" + nl
            bRunning = false
        other
            see "Invalid option, please try again." + nl
        }
    }
}

func sayHello {
    see "Enter your name: "
    give cName
    cName = trim(cName)
    if cName = "" {
        cName = "Friend"
    }
    see "Hello, " + cName + "!" + nl
}

func calculateSum {
    see "Enter first number: "
    give cNum1
    see "Enter second number: "
    give cNum2

    nResult = number(cNum1) + number(cNum2)
    see "Sum: " + nResult + nl
}

func calculateFactorial {
    see "Enter an integer: "
    give cNum
    nVal = number(cNum)
    if nVal < 0 {
        see "Error: Factorial requires non-negative number." + nl
        return
    }
    see "Result: " + fact(nVal) + nl
}

func fact n {
    if n <= 1 {
        return 1
    else
        return n * fact(n - 1)
    }
}