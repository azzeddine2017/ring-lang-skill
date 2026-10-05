# ====================================================================
# Ring Qt GUI Application Starter Template (Style 3 - Brace Style)
# ====================================================================

load "guilib.ring"

oApp = new qApp {
    win = new qWidget() {
        setWindowTitle("Ring Application")
        setGeometry(150, 150, 420, 260)

        lblPrompt = new qLabel(win) {
            setText("Enter your name:")
            setGeometry(20, 20, 380, 30)
            setAlignment(Qt_AlignLeft | Qt_AlignVCenter)
        }

        txtInput = new qLineEdit(win) {
            setGeometry(20, 60, 380, 35)
            setPlaceholderText("Type your name here...")
        }

        btnGreet = new qPushButton(win) {
            setGeometry(20, 110, 180, 35)
            setText("Say Hello")
            setClickEvent("onGreet()")
        }

        btnClose = new qPushButton(win) {
            setGeometry(220, 110, 180, 35)
            setText("Close")
            setClickEvent("onClose()")
        }

        lblResult = new qLabel(win) {
            setText("")
            setGeometry(20, 160, 380, 60)
            setAlignment(Qt_AlignCenter)
        }

        show()
    }
    exec()
}

func onGreet {
    cName = trim(txtInput.text())
    if cName = "" {
        lblResult.setText("Please enter your name first!")
    else
        lblResult.setText("Hello, " + cName + "! Welcome to Ring.")
    }
}

func onClose {
    oApp.quit()
}