# RingQt GUI Pitfalls (Discovered 2026-08-23, Ring 1.26 + guilib.ring)

## Silent Exit on Event Handler Error
Qt event handlers (`setClickEvent("pFunc()")`) swallow Ring exceptions — the app **exits with no output** instead of printing R* error.

**Rule:** Wrap EVERY handler in `try/catch` and show `QMessageBox`:

```ring
func pAddTask {
    try{
        oManager.addTask(txtTask.text(), cPrio)
        pRefreshList()
    catch
        msgBox("خطأ", cCatchError)
    }
}

func msgBox (cTitle,cMsg){
    m = new QMessageBox(win) { setWindowTitle(cTitle) setText(cMsg) setStandardButtons(QMessageBox_Ok) show() }
}
```

## setBackground with QColor fails
`QListWidgetItem.setBackground()` expects `QBrush`, not `QColor`. Using `new QColor(){setRgb(...)}` directly triggers `R21 : Using operator with values of incorrect type` and silent exit.

**Fix:** Remove coloring until `QBrush` is verified, or use stylesheet on QListWidget itself.

## Forward Class `new TaskManager()` vs `new TaskManager`
`oManager = new TaskManager` (no parens) works as forward reference before `class TaskManager`.
`oManager = new TaskManager()` (with parens) intermittently fails when class not yet defined.
Use **no-parens** form when defining before class.

## Layouts vs setGeometry
`samples/UsingQt/Layouts` shows `QVBoxLayout/QHBoxLayout/QGridLayout` is official.
`setGeometry` is used in simple samples but not responsive — `setLayout(layout)` with `addWidget/addLayout` is required for resizable windows and is the pattern used in PhoneDatabase sample.

Verification for GUI:
```bash
ring file.ring -norun          # syntax only
timeout 4 ring file.ring       # 124 = window stayed open = success
ring file.ring 2> error.txt     # capture silent R* on click
```
