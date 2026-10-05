## formdesigner

# =
# Using the Form Designer

In this chapter we will learn about using the Form Designer.

We can run the From Designer from Ring Notepad

From the Menubar in Ring Notepad - View Menu - We can Show/Hide the Form Designer window.

:alt: Form Designer - Inside Ring Notepad

Also we can run the Form Designer in another window.

From the Ring Notepad - Tools Menu - Select the Form Designer.

:alt: Form Designer

# The Designer Windows

- Toolbox : To select controls to be added to the window.

- Properties : To set the properties of the active window or controls.

- Design Region : To select, move and resize the window and the controls.

# The Toolbox

We have many buttons.

- Lock : We can use it to draw many controls of the same type quickly.

- Select : We can use it to select a control in the Design Region

- Controls Buttons : Select a control to be added to the window.

# The Properties

- When we select the window or one control, We will have the selected object properties.

- Also In the properties window we have a combobox to select the active control.

- Some properties provide a button next to the property value. We can click on the button to get more options.

- When we select more than one control, We will have options for multi-selection

:alt: Form Designer - Multiple-Selection

# Running Forms

When we save the form file (*.rform), The Form Designer will create two Ring files

- The Controller Class
- The View Class

For example, if the form file is helloworld.rform

The form designer will generate two files

- helloworldcontroller.ring
- helloworldview.ring

To run the program, Open the controller class file then click the Run button (CTRL+F5)

> **Tip:**

# Events Code

(1) Just type the method name in the event property.

:alt: Form Designer - Event Method

This will add the next code to the Controller Class

```ring
func CloseWindow
	oView {
	}
```

(2) Then write the method code in the
controller class.

:alt: Form Designer - Event Code

In this example we write

```ring
func CloseWindow
	oView.win.close()
```

Where inside the controller class, We uses the oView object to access the form.

Another Example :

:alt: Form Designer - Say Hello

The Event Code

```ring
func SayHello
	oView {
		LineEdit2.setText("Hello "+ LineEdit1.text() )
	}
```


# Keyboard Shortcuts

After selecting one or group of controls

- Use the Arrows (Up, Down, Left and Right) to move them around.
- Shift + the Arrows (Up, Down, Left and Right) to Resize the controls.
- Del button to delete the controls.
- CTRL+SHIFT+V to Duplicate the controls.

# Menubar Designer

From the Window properties we can open the Menubar Designer

:alt: Form Designer - Menubar Designer

# Window Flags

From the Window properties we can open the Window Flags window.

:alt: Form Designer - Window Flags

# Entering Items

For some controls like the List Widget we can enter items separated by comma ','

:alt: Form Designer - List Items

# Using Layouts

(1) To use layouts, At first add the layout control to the window.

(2) Use the window "Set Layout" property to determine the main layout.

(3) From the layout properties determine the controls and the layout type.

# Objects Order and Layouts

All the objects that are added to a layout must comes first!

If we have a form that contains two buttons and a Layout

Then adding a third button after creating the layout requires changing the objects order

We can open the (Objects Order) window using a button from the (Properties) window

:alt: Layout Objects Order

Then we can select the (Button3) and click (Move Up)

:alt: Layout Objects Order

Then we close the (Objects Order) window

:alt: Layout Objects Order

# More Samples and Tests

Check the folder : ring/samples/UsingFormDesigner

Online : https://github.com/ring-lang/ring/tree/master/samples/UsingFormDesigner


## qt

Single: Desktop, WebAssembly and Mobile Development;  Introduction

# =
# Desktop, WebAssembly and Mobile Development using RingQt

In this chapter we will learn how to use the Qt framework classes
in our Ring applications to create Desktop, WebAssembly and Mobile Applications.

# The First GUI Application

In this example we will create an application to ask the user about his/her name.
When the user type the name in the textbox then click on "Say Hello" button, the textbox
value will be updated by adding "Hello " to the name.

```ring
load "guilib.ring"

oApp = new qApp {

	win1 = new qWidget() {

		setwindowtitle("Hello World")
		setGeometry(100,100,370,250)

		label1 = new qLabel(win1) {
			settext("What is your name ?")
			setGeometry(10,20,350,30)
			setalignment(Qt_AlignHCenter)
		}

		btn1 = new qPushButton(win1) {
			setGeometry(10,200,100,30)
			settext("Say Hello")
			setclickevent("pHello()")
		}

		btn2 = new qPushButton(win1) {
			setGeometry(150,200,100,30)
			settext("Close")
			setclickevent("pClose()")
		}

		lineedit1 = new qLineEdit(win1) {
			setGeometry(10,100,350,30)
		}

		show()
	}

	exec()
}

Func pHello
	lineedit1.settext( "Hello " + lineedit1.text())

Func pClose
	oApp.quit()
```

Program Output:

At first we type the name in the textbox

:alt: Enter the name in the textbox

Then we click on the say hello button

:alt: Click on the button

# The Events Loop

Qt uses Event-Driven and the events loop get the control when we call the exec() method from the qApp class.

Once we call exec(), The events loop starts, and the Widgets starts responding to the different events (Mouse, Keyboard, Timers, etc).

You get the control back again when an event is fired and your callback function is called.

Once the execution of your callback function is done, the control go back again to the events loop.

Useful things to remember

(1) We can do most of the work using normal events (Events provided directly by each widget).

(2) We can add more events to any widget using the Events Filter.

(3) Using Timers we can easily get the control back and check for more things to do.

Also when our callback function is busy with doing time consuming operations, we can call the ProcessEvents() method from the qApp class
to avoid stopping the GUI.

```ring
oApp.processevents()
```

We can avoid calling the exec() method, and create our main loop

It's not recommended to do that, It's just an option.

```ring
# Instead of calling the exec() method
	while true
		oApp.processevents()	# Respond to GUI Events
		# More Thing to do, We have the control!
		# .....
	end
```


# Using Layout

The next example is just an upgrade to the previous application to use the vertical layout.

```ring
Load "guilib.ring"

MyApp = New qApp {

	win1 = new qWidget() {

		setwindowtitle("Hello World")
		setGeometry(100,100,400,130)
		label1 = new qLabel(win1) {
			settext("What is your name ?")
			setGeometry(10,20,350,30)
			setalignment(Qt_AlignHCenter)
		}
		btn1 = new qpushbutton(win1) {
			setGeometry(10,200,100,30)
			settext("Say Hello")
			setclickevent("pHello()")
		}
		btn2 = new qpushbutton(win1) {
			setGeometry(150,200,100,30)
			settext("Close")
			setclickevent("pClose()")
		}
		lineedit1 = new qlineedit(win1) {
			setGeometry(10,100,350,30)
		}
		layout1 = new qVBoxLayout() {
			addwidget(label1)
			addwidget(lineedit1)
			addwidget(btn1)
			addwidget(btn2)
		}
		win1.setlayout(layout1)
		show()
	}

	exec()

}

Func pHello
	lineedit1.settext( "Hello " + lineedit1.text())

Func pClose
	MyApp.quit()
```

The application during the runtime!

:alt: Vertical Layout

# Using the QTextEdit Class

In this example we will use the QTextEdit Class

```ring
Load "guilib.ring"

New qApp {

	win1 = new qWidget() {

		setwindowtitle("QTextEdit Class")
		setGeometry(100,100,500,500)

		new qtextedit(win1) {
			setGeometry(10,10,480,480)

		}

		show()
	}

	exec()
}
```

During the runtime we can paste rich text in the qtextedit widget

:alt: QTextEdit Class

# Using the QListWidget Class

In this example we will use the QListWidget Class

```ring
Load "guilib.ring"

New qApp {

        win1 = new qWidget() {

                setGeometry(100,100,400,400)

                list1 = new qlistwidget(win1) {
       	                setGeometry(150,100,200,200)
               	        alist = ["one","two","three","four","five"]
                       	for x in alist additem(x) next
                        setcurrentrow(3,2)
       	                win1.setwindowtitle("Items Count : " + count() )
               	}

                btn1 = new qpushbutton(win1) {
       	                setGeometry(10,200,100,30)
               	        settext("selected item")
                       	setclickevent("pWork()")
                }

                btn2 = new qpushbutton(win1) {
       	                setGeometry(10,240,100,30)
               	        settext("Delete item")
                       	setclickevent("pWork2()")
                }

                show()
       	}

        exec()
}

func pWork
       	btn1.settext(string(list1.currentrow()))

func pWork2
       	list1 {
        	       takeitem(currentrow())
        }
```

The application during the runtime

:alt: QListWidget Class

Another Example:

```ring
Load "guilib.ring"

New qApp {

        win1 = new qWidget() {

                setGeometry(100,100,500,400)

                list1 = new qlistwidget(win1) {
                        setGeometry(150,100,200,200)
                        alist = ["one","two","three","four","five"]
                        for x in alist additem(x) next

                        setcurrentrow(3,2)
                        win1.setwindowtitle("Items Count : " + count() )
                }

                btn1 = new qpushbutton(win1) {
                        setGeometry(10,200,100,30)
                        settext("selected item")
                        setclickevent("pWork()")
                }

                btn2 = new qpushbutton(win1) {
                        setGeometry(10,240,100,30)
                        settext("Delete item")
                        setclickevent("pWork2()")
                }

                show()
        }

        exec()
}

func pWork

        nbrOfItems = list1.count()
        curItemNbr = list1.currentrow()
        curValue   = list1.item(list1.currentrow()).text()

        win1.setwindowtitle( "After Select - NbrOfItems: " + nbrOfItems +
ItemNbr: " + curItemNbr + " CurValue: " + curValue )

        btn1.settext( string(list1.currentrow() ) + " --- " +
 list1.item(list1.currentrow()).text() )



func pWork2
        list1 {
                takeitem(currentrow())

                nbrOfItems = count()
                curItemNbr = currentrow()
                curValue   = item(currentrow()).text()

                win1.setwindowtitle("After Delete - NbrOfItems: " + nbrOfItems +
rItemNbr: " + curItemNbr +" CurValue: " + curValue )
        }
```


# Using QTreeView and QFileSystemModel

In this example we will learn how to use the QTreeView widget to represent the File System

```ring
Load "guilib.ring"

New qApp {

	win1 = New qWidget() {

		setwindowtitle("Using QTreeView and QFileSystemModel")
		setGeometry(100,100,500,400)

		New qtreeview(win1) {
			setGeometry(00,00,500,400)
			oDir = new QDir()
			ofile = new QFileSystemModel()
			ofile.setrootpath(oDir.currentpath())
			setmodel(ofile)
		}

		show()
	}

	exec()
}
```

The application during the runtime

:alt: QTreeView and QFileSystemModel

# Using QTreeWidget and QTreeWidgetItem

In this example we will learn about using the QTreeWidget and QTreeWidgetItem classes

```ring
Load "guilib.ring"

New qApp {

	win1 = new qWidget() {

		setwindowtitle("TreeWidget")
		setGeometry(100,100,400,400)

		layout1 = new qvboxlayout()

		tree1 = new qtreewidget(win1) {
			setGeometry(00,00,400,400)
			setcolumncount(1)
			myitem = new qtreewidgetitem()
			myitem.settext(0,"The First Step")
			addtoplevelitem(myitem)
			for  x = 1 to 10
				myitem2 = new qtreewidgetitem()
				myitem2.settext(0,"hello"+x)
				myitem.addchild(myitem2)
				for  y = 1 to 10
					myitem3 = new qtreewidgetitem()
					myitem3.settext(0,"hello"+x)
					myitem2.addchild(myitem3)
				next
			next
			setheaderlabel("Steps Tree")
		}

		layout1.addwidget(tree1)
		setlayout(layout1)

		show()
	}

	exec()
}
```

The application during the runtime

:alt: QTreeWidget and QTreeWidgetItem

# Using QComboBox Class

In this example we will learn about using the QComboBox class

```ring
Load "guilib.ring"

New qApp {

        win1 = new qWidget() {

       	        setwindowtitle("Using QComboBox")
                setGeometry(100,100,400,400)

                New QComboBox(win1) {
       	                setGeometry(150,100,200,30)
               	        alist = ["one","two","three","four","five"]
                       	for x in aList additem(x,0) next
                }

                show()
       	}

        exec()
}
```

The application during the runtime

:alt: QComboBox

# Creating Menubar

In this example we will learn about using the QMenuBar class

```ring
Load "guilib.ring"

MyApp = New qApp {

	win1 = new qWidget() {

		setwindowtitle("Using QMenubar")
		setGeometry(100,100,400,400)

		menu1 = new qmenubar(win1) {
			sub1 = addmenu("File")
			sub2 = addmenu("Edit")
			sub3 = addmenu("Help")
			sub1 {
				oAction = new qAction(win1) {
					settext("New")
				}
				addaction(oAction)
				oAction = new qAction(win1) {
					settext("Open")
				}
				addaction(oAction)
				oAction = new qAction(win1) {
					settext("Save")
				}
				addaction(oAction)
				oAction = new qAction(win1) {
					settext("Save As")
				}
				addaction(oAction)
				addseparator()
				oAction = new qaction(win1) {
					settext("Exit")
					setclickevent("myapp.quit()")
				}
				addaction(oAction)
			}
			sub2 {
				oAction = new qAction(win1) {
					settext("Cut")
				}
				addaction(oAction)
				oAction = new qAction(win1) {
					settext("Copy")
				}
				addaction(oAction)
				oAction = new qAction(win1) {
					settext("Paste")
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win1) {
					settext("Select All")
				}
				addaction(oAction)
			}
			sub3 {
				oAction = new qAction(win1) {
					settext("Reference")
				}
				addaction(oAction)
				sub4 = addmenu("Sub Menu")
				sub4 {
					oAction = new qAction(win1) {
						settext("Website")
					}
					addaction(oAction)
					oAction = new qAction(win1) {
						settext("Forum")
					}
					addaction(oAction)
					oAction = new qAction(win1) {
						settext("Blog")
					}
					addaction(oAction)
				}
				addseparator()
					oAction = new qAction(win1) {
						settext("About")
					}
					addaction(oAction)
			}
		}
		show()
	}
	exec()
}
```

The application during the runtime

:alt: QMenuBar

# Context Menu

Example:

```ring
load "guilib.ring"

new qApp {
	win = new qwidget() {
		setwindowtitle("Context Menu")
		resize(400,400)
		myfilter = new qAllEvents(win) {
			setContextmenuEvent("mymenu()")
		}
		installeventfilter(myfilter)
		show()
	}
	exec()
}


func mymenu

	new qMenu(win) {
		oAction = new qAction(win) {
			settext("new")
			setClickEvent("See :New")
		}
		addaction(oAction)
		oAction = new qAction(win) {
			settext("open")
			setClickEvent("See :Open")
		}
		addaction(oAction)
		oAction = new qAction(win) {
			settext("save")
			setClickEvent("See :Save")
		}
		addaction(oAction)
		oAction = new qAction(win) {
			settext("close")
			setClickEvent("See :Close")
		}
		addaction(oAction)
		oCursor  = new qCursor()
		exec(oCursor.pos())
	}
```


# Creating Toolbar

In this example we will learn about using the QToolBar class

```ring
Load "guilib.ring"

New qApp {

	win1 = new qMainWindow() {

		setwindowtitle("Using QToolbar")
		setGeometry(100,100,600,400)

		abtns = [
				new qpushbutton(win1) { settext("Add") } ,
				new qpushbutton(win1) { settext("Edit") } ,
				new qpushbutton(win1) { settext("Find") } ,
				new qpushbutton(win1) { settext("Delete") } ,
				new qpushbutton(win1) { settext("Exit")
							setclickevent("win1.close()") }
			]

		tool1 = new qtoolbar(win1) {
			for x in abtns addwidget(x) addseparator() next
			setmovable(true)
			setGeometry(0,0,500,30)
			setFloatable(true)
		}

		show()
	}

	exec()
}
```

The application during the runtime

:alt: QToolBar

# Creating StatusBar

In this example we will learn about using the QStatusBar class

```ring
Load "guilib.ring"

New qApp {

	win1 = new qMainWindow() {

		setwindowtitle("Using QStatusbar")
		setGeometry(100,100,400,400)

		status1 = new qstatusbar(win1) {
			showmessage("Ready!",0)
		}

		setstatusbar(status1)
		show()
	}

	exec()
}
```

The application during the runtime

:alt: QStatusBar

# Using QDockWidget

In this example we will learn about using the QDockWidget class

```ring
Load "guilib.ring"

New qApp {

	win1 = new qMainWindow() {

		setwindowtitle("QDockWidget")
		setGeometry(100,100,400,400)

		label1 = new qlabel(win1) {
			settext("Hello")
			setGeometry(300,300,100,100)
		}

		label2 = new qlabel(win1) {
			settext("How are you ?")
			setGeometry(100,100,100,100)
		}

		dock1 = new qdockwidget(win1,0) {
			setwidget(label1)
			SetAllowedAreas(1)
		}

		dock2 = new qdockwidget(win1,0) {
			setwidget(label2)
			SetAllowedAreas(2)
		}

		adddockwidget(Qt_LeftDockWidgetArea,dock1,Qt_Horizontal)
		adddockwidget(Qt_LeftDockWidgetArea,dock2,Qt_Vertical)

		show()
	}
	exec()
}
```

The application during the runtime

:alt: QDockWidget

# Using QTabWidget

In this example we will learn about using the QTabWidget class

```ring
Load "guilib.ring"

New qApp {

	win1 = new qMainWindow() {

		setwindowtitle("Using QTabWidget")
		setGeometry(100,100,400,400)

		page1 = new qwidget() {
			new qpushbutton(page1) {
				settext("The First Page")
			}
		}

		page2 = new qwidget() {
			new qpushbutton(page2) {
				settext("The Second Page")
			}
		}

		page3 = new qwidget() {
			new qpushbutton(page3) {
				settext("The Third Page")
			}
		}

		tab1 = new qtabwidget(win1) {
			inserttab(0,page1,"Page 1")
			inserttab(1,page2,"Page 2")
			inserttab(2,page3,"Page 3")
			setGeometry(100,100,400,400)
		}

		status1 = new qstatusbar(win1) {
			showmessage("Ready!",0)
		}

		setstatusbar(status1)
		showMaximized()
	}

	exec()
}
```

The application during the runtime

:alt: QTabWidget

# Using QTableWidget

In this example we will learn about using the QTableWidget class

```ring
Load "guilib.ring"

New qApp {

	win1 = new qMainWindow() {

		setGeometry(100,100,1100,370)
		setwindowtitle("Using QTableWidget")

		Table1 = new qTableWidget(win1) {

			setrowcount(10) setcolumncount(10)
			setGeometry(0,0,800,400)
			setselectionbehavior(QAbstractItemView_SelectRows)

			for x = 1 to 10
				for y = 1 to 10
					item1 = new qtablewidgetitem("R"+X+"C"+Y)
					setitem(x-1,y-1,item1)
				next
			next

		}

		setcentralwidget(table1)
		show()

	}

	exec()
}
```

The application during the runtime

:alt: QTableWidget

# Using QProgressBar

In this example we will learn about using the QProgressBar class

```ring
Load "guilib.ring"

New qApp {
	win1 = new qMainWindow() {

		setGeometry(100,100,600,150)
		setwindowtitle("Using QProgressBar")

		for x = 10 to 100 step 10
			new qprogressbar(win1) {
				setGeometry(100,x,350,30)
				setvalue(x)
			}
		next

		show()
	}
	exec()
}
```

The application during the runtime

:alt: QProgressBar

# Using QSpinBox

In this example we will learn about using the QSpinBox class

```ring
Load "guilib.ring"

New qApp {
	win1 = new qMainWindow() {
		setGeometry(100,100,450,260)
		setwindowtitle("Using QSpinBox")
			new qspinbox(win1) {
				setGeometry(50,100,350,30)
				setvalue(50)
			}
		show()
	}
	exec()
}
```

The application during the runtime

:alt: QSpinBox

# Using QSlider

In this example we will learn about using the QSlider class

```ring
Load "guilib.ring"

New qApp {

	win1 = new qMainWindow() {

		setGeometry(100,100,500,400)
		setwindowtitle("Using QSlider")

		new qslider(win1) {
			setGeometry(100,100,50,130)
			settickinterval(50)
		}

		new qslider(win1) {
			setGeometry(100,250,250,30)
			settickinterval(50)
			setorientation(Qt_Horizontal)
		}

		show()

	}

	exec()
}
```

The application during the runtime

:alt: QSlider

# Using QDateEdit

In this example we will learn about using the QDateEdit class

```ring
Load "guilib.ring"

New qApp {
	win1 = new qMainWindow() {
		setwindowtitle("Using QDateEdit")
		setGeometry(100,100,250,100)
		new qdateedit(win1) {
			setGeometry(20,40,220,30)
		}
		show()
	}
	exec()
}
```

The application during the runtime

:alt: QDateEdit

# Using QDial

In this example we will learn about using the QDial class

```ring
Load "guilib.ring"

New qApp {
	win1 = new qMainWindow() {
		setGeometry(100,100,450,500)
		setwindowtitle("Using QDial")
		new qdial(win1) {
			setGeometry(100,100,250,300)
		}
		show()
	}
	exec()
}
```

The application during the runtime

:alt: QDial

Another Example

```ring
Load "guilib.ring"

New qApp {
		 win1 = new qMainWindow()
		{
			setGeometry(100,100,450,500)
			setwindowtitle("Using QDial")
			button1 = new QPushButton(win1){
				setGeometry(100,350,100,30)
				settext("Increment")
				setClickEvent("pIncrement()")
			}

			button2 = new QPushButton(win1){
				setGeometry(250,350,100,30)
				settext("Decrement")
				setClickEvent("pDecrement()")
			}
			pdial = new qdial(win1) {
				setGeometry(100,50,250,300)
				setNotchesVisible(true)
				setValue(50)
				SetValueChangedEvent("pDialMove()")
			}
			lineedit1 = new qlineedit(win1) {
				setGeometry(200,400,50,30)
				setalignment(Qt_AlignHCenter)
				settext(string(pdial.value()))
				setreturnPressedEvent("pPress()")
			}
			show()
		  }
	exec()
}

func pIncrement
	pdial{val=value()}
	pdial.setvalue(val+1)
	lineedit1{settext(string(val+1))}

func pDecrement
	pdial{val=value()}
	pdial.setvalue(val-1)
	lineedit1{settext(string(val-1))}

func pPress
	lineedit1{val=text()}
	pdial.setvalue(number(val))

func pDialMove
	lineedit1.settext(""+pdial.value())
```

:alt: QDial - Second Example

# Using QWebView

In this example we will learn about using the QWebView class

```ring
Load "guilib.ring"

New qApp {
	win1 = new qMainWindow() {
		setwindowtitle("QWebView")
		myweb = new qwebview(win1) {
			setGeometry(10,10,600,600)
			loadpage(new qurl("http://google.com"))
		}
		setcentralwidget(myweb)
		showMaximized()
	}
	exec()
}
```

The application during the runtime

:alt: QWebView

# Using QCheckBox

In this example we will learn about using the QCheckBox class

```ring
Load "guilib.ring"

New qApp {
	win1 = new qMainWindow() {
		setwindowtitle("Using QCheckBox")
		new qcheckbox(win1) {
			setGeometry(100,100,150,30)
			settext("New Customer!")
		}
		showMaximized()
	}
	exec()
}
```

The application during the runtime

:alt: QCheckBox

Another Example:

```ring
Load "guilib.ring"

New qApp {
        win1 = new qMainWindow() {
                setGeometry(100,100,400,300)
                setwindowtitle("Using QCheckBox")

                ### 0-Unchecked  1-Checked

                CheckBox = new qcheckbox(win1) {
                        setGeometry(100,100,160,30)
                        settext("New Customer!")
                        setclickedEvent("HandleClickEvent()")
                }

                show()
        }
        exec()
}

Func HandleClickEvent

    if CheckBox.isChecked() = 1
        CheckBox.settext("New Customer. Check 1-ON")
    else
        CheckBox.settext("New Customer. Check 0-OFF")
    ok
```


# Using QRadioButton and QButtonGroup

In this example we will learn about using the QRadioButton and QButtonGroup classes

```ring
Load "guilib.ring"

New qApp {

	win1 = new qMainWindow() {

		setwindowtitle("Using QRadioButton")

		new qradiobutton(win1) {
			setGeometry(100,100,100,30)
			settext("One")
		}
		new qradiobutton(win1) {
			setGeometry(100,150,100,30)
			settext("Two")
		}
		new qradiobutton(win1) {
			setGeometry(100,200,100,30)
			settext("Three")
		}


		group2  = new qbuttongroup(win1) {
			btn4 = new qradiobutton(win1) {
				setGeometry(200,150,100,30)
				settext("Four")
			}
			btn5 = new qradiobutton(win1) {
				setGeometry(200,200,100,30)
				settext("Five")
			}
			addbutton(btn4,0)
			addbutton(btn5,0)

		}

		showMaximized()

	}
	exec()
}
```

The application during the runtime

:alt:  QRadioButton and QButtonGroup classes

# Adding Hyperlink to QLabel

In this example we will learn about creating Hyperlink using the QLabel class

```ring
Load "guilib.ring"

New qApp {
	win1 = new qMainWindow() {
		setwindowtitle("QLabel - Hyperlink")
		new qlabel(win1) {
			setGeometry(100,100,100,30)
			setopenexternallinks(true)
			settext('<a href="http://google.com">Google</a>')
		}
		showMaximized()
	}
	exec()
}
```

The application during the runtime

:alt: Hyperlink

# QVideoWidget and QMediaPlayer

In this example we will learn about using the QVideoWidget and QMediaPlayer classes to play
a group of movies from different positions at the same time

```ring
Load "guilib.ring"

New qApp {

	win1 = new qMainWindow() {

		setwindowtitle("QVideoWidget")

		btn1 = new qpushbutton(win1)	{
			setGeometry(0,0,100,30)
			settext("play")
			setclickevent("player.play() player2.play()
						   player3.play() player4.play()")
		}

		videowidget = new qvideowidget(win1) {
			setGeometry(50,50,600,300)
			setstylesheet("background-color: black")
		}

		videowidget2 = new qvideowidget(win1) {
			setGeometry(700,50,600,300)
			setstylesheet("background-color: black")
		}


		videowidget3 = new qvideowidget(win1) {
			setGeometry(50,370,600,300)
			setstylesheet("background-color: black")
		}

		videowidget4 = new qvideowidget(win1) {
			setGeometry(700,370,600,300)
			setstylesheet("background-color: black")
		}

		player = new qmediaplayer() {
			setmedia(new qurl("1.mp4"))
			setvideooutput(videowidget)
			setposition(35*60*1000)

		}

		player2 = new qmediaplayer() {
			setmedia(new qurl("2.mp4"))
			setvideooutput(videowidget2)
			setposition(23*60*1000)
		}

		player3 = new qmediaplayer() {
			setmedia(new qurl("3.mp4"))
			setvideooutput(videowidget3)
			setposition(14.22*60*1000)
		}

		player4 = new qmediaplayer() {
			setmedia(new qurl("4.avi"))
			setvideooutput(videowidget4)
			setposition(8*60*1000)
		}

		showfullscreen()

	}

	exec()

}
```

The application during the runtime

:alt: QVideoWidget

# Using QFrame

In this example we will learn about using the QFrame class

```ring
Load "guilib.ring"

New qApp {
	win1 = new qMainWindow() {
		setwindowtitle("Using QFrame")
		for x = 0 to 10
			frame1 = new qframe(win1,0) {
				setGeometry(100,20+50*x,400,30)
				setframestyle(QFrame_Raised | QFrame_WinPanel)
			}
		next
		showMaximized()
	}
	exec()
}
```

The application during the runtime

:alt: QFrame

# Display Image using QLabel

In this example we will learn about displaying an image using the QLabel widget

```ring
Load "guilib.ring"

New qApp {
	win1 = new qMainWindow() {
		setwindowtitle("QLabel - Display image")
		new qlabel(win1) {
			image = new qpixmap("images/advice.jpg")
			setpixmap(image)
			setGeometry(0,0,image.width(),image.height())
		}
		showMaximized()
	}
	exec()
}
```

The application during the runtime

:alt: Display Image

# Menubar and StyleSheet Example

In this example we will learn about creating menubar and setting the window stylesheet

```ring
Load "guilib.ring"

New qApp {

	win1 = new qMainWindow() {

		setwindowtitle("Menubar")

		menu1 = new qmenubar(win1) {
			sub1 = addmenu("File")
			sub1 {
				oAction = new qAction(win1) {
					settext("New")
					setenabled(false)
				}
				addaction(oAction)
				oAction = new qAction(win1) {
					settext("Open")
					setcheckable(true)
					setchecked(true)
					setstatustip("open new file")
				}
				addaction(oAction)
				oAction = new qAction(win1) {
					settext("Save")
				}
				addaction(oAction)
				oAction = new qAction(win1) {
					settext("Save As")
				}
				addaction(oAction)

				addseparator()
				oAction = new qaction(win1)
				oAction.settext("Exit")
				oAction.setclickevent("myapp.quit()")
				addaction(oAction)
			}

		}
		status1 = new qstatusbar(win1) {
			showmessage("Ready!",0)
		}
		setmenubar(menu1)
		setmousetracking(true)
		setstatusbar(status1)
		setStyleSheet("color: black; selection-color: black;
		selection-background-color:white ;
		background: QLinearGradient(x1: 0, y1: 0, x2: 0, y2: 1,
			stop: 0 #eef, stop: 1 #ccf);")
		showmaximized()
	}
	exec()
}
```

The application during the runtime

:alt: Menubar

# QLineEdit Events and QMessageBox

In this example we will learn about using QLineEdit Events and displaying a Messagebox

```ring
Load "guilib.ring"

MyApp = New qApp {

	win1 = new qWidget() {

		setwindowtitle("Welcome")
		setGeometry(100,100,400,300)


		label1 = new qLabel(win1) {
			settext("What is your name ?")
			setGeometry(10,20,350,30)
			setalignment(Qt_AlignHCenter)
		}

		btn1 = new qpushbutton(win1) {
			setGeometry(10,200,100,30)
			settext("Say Hello")
			setclickevent("pHello()")
		}

		btn1 = new qpushbutton(win1) {
			setGeometry(150,200,100,30)
			settext("Close")
			setclickevent("pClose()")
		}

		lineedit1 = new qlineedit(win1) {
			setGeometry(10,100,350,30)
			settextchangedevent("pChange()")
			setreturnpressedevent("penter()")
		}

		show()
	}

	exec()
}

Func pHello
	lineedit1.settext( "Hello " + lineedit1.text())

Func pClose
	MyApp.quit()

Func pChange
	win1 { setwindowtitle( lineedit1.text() ) }

Func pEnter
	new qmessagebox(win1) {
		setwindowtitle("Thanks")
		settext("Hi " + lineedit1.text() )
		setstylesheet("background-color : white")
		show()
	}
```

The application during the runtime

:alt: qLineEdit events and qMessagebox

:alt: qLineEdit events and qMessagebox

# Other Widgets Events

Each Qt signal can be used in RingQt, just add Set before the signal name and add event after
the signal name to get the method that can be used to determine the event code.

For example the QProgressBar class contains a signal named valueChanged()
To use it just use the function setValueChangedEvent()

Example:

```ring
Load "guilib.ring"

New qApp {
	win1 = new qMainWindow() {

		setwindowtitle("QProgressBar valueChanged Event")

		progress1 = new qprogressbar(win1) {
			setGeometry(100,100,350,30)
			setvalue(10)
			setvaluechangedevent("pChange()")
		}

		new qpushbutton(win1) {
			setGeometry(10,10,100,30)
			settext("increase")
			setclickevent("pIncrease()")
		}

		showMaximized()

	}

	exec()
}

func pIncrease
	progress1 { setvalue(value()+1)  }

func pchange
	win1.setwindowtitle("value : " + progress1.value() )
```

The application during the runtime

:alt: qProgressBar valueChanged event

Another example for the stateChanged event of the QCheckBox class

```ring
Load "guilib.ring"

New qApp {
	win1 = new qMainWindow() {
		setwindowtitle("QCheckBox")
		new qcheckbox(win1) {
			setGeometry(100,100,150,30)
			settext("New Customer!")
			setstatechangedevent("pchange()")
		}
		showMaximized()
	}
	exec()
}

Func pChange

	new qMessageBox(Win1) {
		setWindowTitle("Checkbox")
		settext("State Changed!")
		show()
	}
```

The application during the runtime

:alt: qProgressBar valueChanged event

# Using the QTimer Class

In this example we will learn about using the QTimer class

```ring
Load "guilib.ring"

new qApp {
	win1 = new qwidget() {
		setgeometry(100,100,200,70)
		setwindowtitle("Timer")
		label1 = new qlabel(win1) {
			setgeometry(10,10,200,30)
			settext(theTime())
		}
		new qtimer(win1) {
			setinterval(1000)
			settimeoutevent("pTime()")
			start()
		}
		show()
	}
	exec()
}

func pTime
	label1.settext(thetime())

func theTime
	return "Time : " + Time()
```

The application during the runtime

:alt: QTimer Class

# Using QProgressBar and Timer

In this example we will learn about using the "animated" QProgressBar class and Timer

```ring
###------------------------------------
### ProgressBar and Timer Example

Load "guilib.ring"

new qApp
{
    win1 = new qwidget()
    {
        setgeometry(100,100,400,100)
        setwindowtitle("Timer and ProgressBar")

        LabelMan = new qlabel(win1)
        {
            setgeometry(10,10,200,30)
            settext(theTime())          ### ==>> func
        }

        TimerMan = new qtimer(win1)
        {
            setinterval(1000)
            settimeoutevent("pTime()")  ### ==>> func
            start()
        }

        BarMan = new qprogressbar(win1)
        {
            setGeometry(100,50,300,10)  ###  Position X y, Length, Thickness
            setvalue(0)                 ###  Percent filled
        }

        show()
    }
    exec()
}

func pTime
        LabelMan.settext(theTime())     ### ==>> func

        Increment = 10
        if BarMan.value() >= 100        ### ProgressBar start over.
            BarMan.setvalue(0)
        ok
        BarMan{ setvalue(value() + Increment) }

Func theTime
	return "Time : " + Time()
```

:alt: QProgressBar

# Display Scaled Image using QLabel

In this example we will learn about displaying and scaling an image so that it looks "animated" using the QLabel widget

```ring
Load "guilib.ring"

#----------------------------------------------------
# REQUIRES: image = "C:\RING\bin\stock.jpg"

# imageStock: start dimensions for growing image

imageW = 200 ;  imageH = 200 ; GrowBy = 4

###----------------------------------------------------
### Window and Box Size dimensions

WinWidth = 1280 ; WinHeight = 960
BoxWidth = WinWidth -80 ; BoxHeight = WinHeight -80

###----------------------------------------------------

New qapp {

	win1 = new qwidget() {

		setgeometry(50,50, WinWidth,WinHeight)
		setwindowtitle("Animated Image - Display Image Scaled and Resized")

		imageStock = new qlabel(win1) {

			image = new qpixmap("C:\RING\bin\stock.jpg")
			AspectRatio = image.width() / image.height()

			imageW = 200
			imageH = imageH / AspectRatio

			### Size-H, Size-V, Aspect, Transform
			setpixmap(image.scaled(imageW , imageH ,0,0))

			PosLeft = (BoxWidth  - imageW ) / 2
			PosTop  = (BoxHeight - imageH ) / 2
			setGeometry(PosLeft,PosTop,imageW,imageH)

		}

		TimerMan = new qtimer(win1) {
			setinterval(100)            ### interval 100 millisecs.
			settimeoutevent("pTime()")  ### ==>> func
			start()
		}

		show()
	}
exec()
}


###------------------------------------------------------
### Function TimerMan: calling interval 100 milliseconds

func pTime

	### Stop Timer when image is size of Window area
	if imageW > BoxWidth
		TimerMan.stop()
		imageStock.clear()      ### Will clear the image
	ok

	### Grow image
	imageW += GrowBy
	imageH  = imageW / AspectRatio

	### Scaled Image: Size-H, Size-V, Aspect, Transform
	imageStock.setpixmap(image.scaled(imageW , imageH ,0,0))

	### Center the image
	PosLeft = (WinWidth  - imageW ) / 2
	PosTop  = (WinHeight - imageH ) / 2
	imageStock.setGeometry(PosLeft,PosTop,imageW,imageH)
```


# Using the QFileDialog Class

Example

```ring
Load "guilib.ring"

New qapp {
	win1 = new qwidget() {
		setwindowtitle("open file")
		setgeometry(100,100,400,400)
		new qpushbutton(win1) {
			setgeometry(10,10,200,30)
			settext("open file")
			setclickevent("pOpen()")
		}
		show()
	}
	exec()
}

Func pOpen
	new qfiledialog(win1) {
		cName = getopenfilename(win1,"open file","c:\","source files(*.ring)")
		win1.setwindowtitle(cName)
	}
```

The application during the runtime

:alt: QFileDialog Class

# Drawing using QPainter

In this example we will learn about drawing using the QPainter class

```ring
Load "guilib.ring"
New qapp {
	win1 = new qwidget() {
		setwindowtitle("Drawing using QPainter")
		setgeometry(100,100,500,500)
		label1 = new qlabel(win1) {
			setgeometry(10,10,400,400)
			settext("")
		}
		new qpushbutton(win1) {
			setgeometry(200,400,100,30)
			settext("draw")
			setclickevent("draw()")
		}

		show()
	}
	exec()
}

Func draw
		p1 = new qpicture()
		color = new qcolor() {
			setrgb(0,0,255,255)
		}
		pen = new qpen() {
			setcolor(color)
			setwidth(10)
		}
		new qpainter() {
			begin(p1)
			setpen(pen)
			drawline(500,150,950,450)
			drawline(950,550,500,150)
			endpaint()
		}
		label1 { setpicture(p1) show() }
```

The application during the runtime

:alt: QPainter Class

# Printing using QPrinter

In this example we will learn how to print to PDF file using QPrinter

```ring
Load "guilib.ring"
new qApp {
	win1 = new qwidget() {
		setwindowtitle("Printer")
		setgeometry(100,100,500,500)
		myweb = new qwebview(win1) {
			setgeometry(100,100,1000,500)
			loadpage(new qurl("http://google.com"))
		}
		new qpushbutton(win1) {
			setGeometry(20,20,100,30)
			settext("Print")
			setclickevent("print()")
		}
		showmaximized()
	}
	exec()
}

func print
	printer1 = new qPrinter(0) {
		setoutputformat(1)	# 1 = pdf
		setoutputfilename("test.pdf")
		painter = new qpainter() {
			begin(printer1)
			myfont = new qfont("Times",50,-1,0)
			setfont(myfont)
			drawtext(100,100,"test")
			printer1.newpage()
			drawtext(100,100,"test2")
			endpaint()
		}
	}

	printer1 = new qPrinter(0) {
		setoutputformat(1)
		setoutputfilename("test2.pdf")
		myweb.print(printer1,' system("test2.pdf") ')
		myweb.show()
	}

	system ("test.pdf")
```


# Using QPrintPreviewDialog

In this example we will learn how to use the QPrintPreviewDialog class.

Example:

```ring
load "guilib.ring"

new qApp {
	win1 = new qwidget() {
		setwindowtitle("Printer Preview Dialog")
		setgeometry(100,100,800,880)
		printer1 = new qPrinter(0)
		show()
		oPreview = new qPrintPreviewDialog(printer1) {
			setParent(win1)
			move(10,10)
			setPaintrequestedevent("printPreview()")
			exec()
		}
	}
	exec()
}

func printPreview
	printer1  {
		painter = new qpainter() {
			begin(printer1)
			myfont = new qfont("Times",50,-1,0)
			setfont(myfont)
			drawtext(100,100,"Test - Page (1)")
			printer1.newpage()
			drawtext(100,100,"Test - Page (2)")
			printer1.newpage()
			myfont2 = new qfont("Times",14,-1,0)
			setfont(myfont2)
			for x = 1 to 30
				drawtext(100,100+(20*x),"Number : " + x)
			next
			endpaint()
		}
	}
```

Screen Shot:

:alt: Print Preview Dialog

# Creating More than one Window

The next example demonstrates how to create more than one window

```ring
Load "guilib.ring"
app1 = new qapp {
	win1 = new qwidget() {
		setwindowtitle("First")
		setgeometry(100,100,500,500)

		new qpushbutton(win1) {
			setgeometry(100,100,100,30)
			settext("close")
			setclickevent("app1.quit()")
		}

		new qpushbutton(win1) {
			setgeometry(250,100,100,30)
			settext("Second")
			setclickevent("second()")
		}

		showmaximized()
	}
	exec()
}

func second
	win2 = new qwidget() {
		setwindowtitle("Second")
		setgeometry(100,100,500,500)
		setwindowflags(Qt_dialog)
		show()
	}
```

The application during the runtime

:alt: More than one window

# Playing Sound

Example:

```ring
Load "guilib.ring"
new qapp {
	win1 = new qwidget() {
		setwindowtitle("play sound!") show()
	}
	new qmediaplayer()	{
		setmedia(new qurl("footstep.wav"))
		setvolume(50) play()
	}
	exec()
}
```


# Using the QColorDialog Class

Example:

```ring
Load "guilib.ring"

oApp = new myapp { start() }

Class MyApp

	oColor  win1

	Func start

		myapp = new qapp

		win1 = new qMainWindow() {
			setwindowtitle("Color Dialog")
			setgeometry(100,100,400,400)
		}

		new qpushbutton(win1) {
			setgeometry(10,10,100,30)
			settext("Get Color")
			setclickevent("oApp.pColor()")
		}

		win1.show()
		myapp.exec()


	Func pColor
		myobj = new qcolordialog()
		aColor = myobj.GetColor()
		r=acolor[1] g=acolor[2] b=acolor[3]
		win1.setstylesheet("background-color: rgb("+r+", " + g+ "," + b + ")")
```

The application during the runtime

:alt: QColorDialog Class

# Using qLCDNumber Class

In this example we will learn about using the qLCDNumber class

```ring
Load "guilib.ring"

New qApp
{
	win1 = new qWidget()
	{
		setwindowtitle("LCD Number")
		setgeometry(100,100,250,120)

		new qLCDNumber(win1)
		{
			setgeometry(10,10,100,40)
			display(100)

		}

		new qLCDNumber(win1)
		{
			setgeometry(10,60,100,40)
			display(80)

		}

		show()
	}

	exec()
}
```

The application during the runtime

:alt: QLCDNumber Class

# Movable Label Example

```ring
Load "guilib.ring"

new qApp {

	win1 = new qWidget()
	{

		label1 = new qLabel(win1)
		{
			setText("Welcome")
			setgeometry(10,10,200,50)
			setstylesheet("color: purple ; font-size: 30pt;")
		}

		new qTimer(win1)
		{
			setInterVal(10)
			setTimeOutEvent("pMove()")
			start()
		}

		setWindowTitle("Movable Label")
		setgeometry(100,100,600,80)
		setStyleSheet("background-color: white;")
		show()

	}

	exec()
}

Func pMove
	label1
	{
		move(x()+1,y())
		if x() > 600
			move(10,y())
		ok
	}
```

The application during the runtime

:alt: Movable label

# QMessagebox Example

In this section we will learn how to check the output of the Message box

```ring
Load "guilib.ring"

new qApp {
	win1 = new qWidget()
	{
		label1 = new qpushbutton(win1)
		{
			setText("Test")
			setgeometry(10,10,200,50)
			setstylesheet("color: purple ; font-size: 30pt;")
			setclickevent("pWork()")
		}
		setWindowTitle("Messagebox")
		setgeometry(100,100,600,80)
		setStyleSheet("background-color: white;")
		show()
	}
	exec()
}

func pWork
	new qmessagebox(win1)
	{
		setwindowtitle("messagebox title")
		settext("messagebox text")
		setInformativeText("Do you want to save your changes?")
		setstandardbuttons(QMessageBox_Yes | QMessageBox_No | QMessageBox_Close)
		result = exec()
		win1 {
			if result = QMessageBox_Yes
				setwindowtitle("Yes")
			but result = QMessageBox_No
				setwindowtitle("No")
			but result = QMessageBox_Close
				setwindowtitle("Close")
			ok
		}
	}
```

The application during the runtime

:alt: QMessageBox output

# Using QInputDialog Class

In the next example we will learn about using the QInputDialog class

```ring
Load "guilib.ring"

New QApp {

	Win1 = New QWidget () {

		SetGeometry(100,100,400,400)
		SetWindowTitle("Input Dialog")

		New QPushButton(win1)
		{

			SetText ("Input Dialog")
			SetGeometry(100,100,100,30)
			SetClickEvent("pWork()")
		}

		Show()
	}

	exec()
}

Func pWork
	oInput = New QInputDialog(win1)
	{
		setwindowtitle("What is your name?")
		setgeometry(100,100,400,50)
		setlabeltext("User Name")
		settextvalue("Mahmoud")
		lcheck = exec()
		if lCheck win1.setwindowtitle(oInput.textvalue()) ok
	}
```

The application during the runtime

:alt: QInputDialog

# Dialog Functions

We have the next functions

```ring
SetDialogIcon(cIconFile)
MsgInfo(cTitle,cMessage)
ConfirmMsg(cTitle,cMessage) --> lResult
InputBox(cTitle,cMessage) --> cValue
InputBoxInt(cTitle,cMessage) --> nValue
InputBoxNum(cTitle,cMessage) --> nValue
InputBoxPass(cTitle,cMessage) --> cValue
```

Example

```ring
load "guilib.ring"

new qApp
{
	SetDialogIcon("notepad.png")
	msginfo(:Ring,:Welcome)
	see confirmMsg(:Ring,"Are you sure?") + nl
	see InputBoxNum(:Ring,"Enter Number(double) :") + nl
	see InputBox(:Ring,"Enter Value :") + nl
	see InputBoxInt(:Ring,"Enter Number(int)") + nl
	see InputBoxPass(:Ring,"Enter Password") +nl
}
```


# KeyPress and Mouse Move Events

In this example we will learn how to use the Events Filter to know about KeyPress and Mouse Move
Events

```ring
Load "guilib.ring"

new qApp {

	win1 = new qWidget()
	{
		setWindowTitle("Test using Event Filter!")
		setGeometry(100,100,400,400)
		setmousetracking(true)
		myfilter = new qallevents(win1)
		myfilter.setKeyPressEvent("pWork()")
		myfilter.setMouseButtonPressevent("pClick()")
		myfilter.setmousemoveevent("pMove()")

		installeventfilter(myfilter)

		show()
	}

	exec()
}

func pWork
	win1.setwindowtitle('KeyPress! : ' + myfilter.getkeycode())

func pClick
	new qmessagebox(win1) {
		setgeometry(100,100,400,100)
		setwindowtitle("click event!")
		settext("x : " + myfilter.getx() +
			" y : " + myfilter.gety() + " button : " +
			 myfilter.getbutton() )
		show()
	}

func pMove
	win1.setwindowtitle("Mouse Move , X : " + myfilter.getx() +
			    " Y : " + myfilter.gety() )
```

The application during the runtime

:alt: KeyPress and Mouse Move Events

# Moving Objects using the Mouse

In the next example we will learn how to program movable objects where the user can move a label

```ring
Load "guilib.ring"

lPress = false
nX = 0
nY = 0

new qApp {

	win1 = new qWidget()
	{

		setWindowTitle("Move this label!")
		setGeometry(100,100,400,400)
		setstylesheet("background-color:white;")

		Label1 = new qLabel(Win1){
			setGeometry(100,100,200,50)
			setText("Welcome")
			setstylesheet("font-size: 30pt")
			myfilter = new qallevents(label1)
			myfilter.setEnterevent("pEnter()")
			myfilter.setLeaveevent("pLeave()")
			myfilter.setMouseButtonPressEvent("pPress()")
			myfilter.setMouseButtonReleaseEvent("pRelease()")
			myfilter.setMouseMoveEvent("pMove()")
			installeventfilter(myfilter)
		}

		show()
	}

	exec()
}

Func pEnter
	Label1.setStyleSheet("background-color: purple; color:white;font-size: 30pt;")

Func pLeave
	Label1.setStyleSheet("background-color: white; color:black;font-size: 30pt;")

Func pPress
	lPress = True
	nX = myfilter.getglobalx()
	ny = myfilter.getglobaly()

Func pRelease
	lPress = False
	pEnter()

Func pMove
	nX2 = myfilter.getglobalx()
	ny2 = myfilter.getglobaly()
	ndiffx = nX2 - nX
	ndiffy = nY2 - nY
	if lPress
		Label1 {
			move(x()+ndiffx,y()+ndiffy)
			setStyleSheet("background-color: Green;
				 color:white;font-size: 30pt;")
			nX = nX2
			ny = nY2
		}

	ok
```

The application during the runtime

:alt: Moving object using the mouse

:alt: Moving object using the mouse

:alt: Moving object using the mouse

# Inheritance from GUI Classes

Example :

```ring
Load "guilib.ring"

New MyWindow()

new qApp { exec() }

class mywindow from qwidget
	Func init
		super.init()
		setwindowtitle("First Window")
		setgeometry(100,100,400,400)
		setstylesheet("background-color: purple;")
		settooltip("my first window!")
		show()
```

The application during the runtime

:alt: Inheritance from GUI Classes

# Using QDesktopWidget Class

In the next example we will learn about using the QDesktopWidget class

```ring
Load "guilib.ring"

New qApp {
	win1 = New qWidget()
	{
		resize(400,400)
		btn1 = new qPushbutton(win1)
		{
			setText("Center")
			move(100,100)
			resize(100,30)
			setClickEvent("pCenter()")
		}

		Show()
	}

	exec()
}

Func pCenter
	oDesktop  = new qDesktopWidget()
	win1.move((oDesktop.width()-win1.width()) /2 , (oDesktop.Height()-win1.Height())/2 )
	win1.show()
```

The application during the runtime

:alt: Using QDesktopWidget Class

# Rotate Text

The next example rotate text using a Timer.

```ring
Load "guilib.ring"

nAngle  = 0

New qapp {
	win1 = new qwidget() {
		setwindowtitle("Rotate Text")
		resize(800,600)
		label1 = new qlabel(win1) {
			settext("")
			myfilter = new qallevents(win1)
			myfilter.setMouseButtonPressevent("pClick()")
			installeventfilter(myfilter)
		}
		new qtimer(win1) {
			setinterval(50)
			settimeoutevent("pTime()")
			start()
		}
		pDraw()
		L1 = new qVBoxLayout() { AddWidget(Label1) } SetLayout(L1)
		showMaximized()
	}
	exec()
}

Func pDraw
	p1 = new qpicture()
	color = new qcolor() {
		setrgb(0,0,255,255)
	}
	pen = new qpen() {
		setcolor(color)
		setwidth(50)
	}
	painter = new qpainter() {
		begin(p1)
			setpen(pen)
			myfont = font()
			myfont.setpointsize(50)
			setfont(myfont)
			rotate(nAngle)
			drawtext(350,0*nAngle,"welcome")
			drawtext(0,0*nAngle,"welcome")
		endpaint()
		  }
	label1 {
		setpicture(p1)
		show()
	}

Func pClick
	win1 { setwindowtitle("Click Event") }

Func pTime
	nAngle++
	if nAngle = 90
		nAngle = 10
	ok
	pDraw()
```

The application during the runtime

:alt: Rotate Text Example

# Change Focus

The next example change the focus using the ENTER key.

```ring
load "guilib.ring"

new qApp {
	win = new qWidget() {
		resize(600,600)
		SetWindowTitle("Change Focus")
		text1 = new qLineEdit(win)
		text2 = new qLineEdit(win)
		text3 = new qLineEdit(win)
		text4 = new qLineEdit(win)
		layout1 = new qVBoxLayout() {
			AddWidget(text1)
			AddWidget(text2)
			AddWidget(text3)
			AddWidget(text4)

		}
		setLayout(Layout1)
		aList = [text1,text2,text3,text4]
		oFilter = new qallevents(win)
		oFilter.setKeyPressEvent("pWork()")
		installeventfilter(oFilter)
		show()
	}
	exec()
}

func pWork
	nCode =  oFilter.getkeycode()
	if nCode = 16777220 	# ENTER Key
		for x=1 to len(aList)
			if aList[x].HasFocus()
				t = x+1
				if t > len(aList) t=1 ok
				aList[t].SetFocus(0)
				exit
			ok
		next
	ok
```


# Regular Expressions

The next example uses the Regular Expressions classes.

```ring
load "guilib.ring"

new qApp
{
	see "Using Regular Expressions" + nl

	exp = new qregularexpression() {
		setPattern("\d\d \w+")
		see pattern() + nl
		match = match("33 one",0,0,0)
		see match.hasmatch() + nl
		match = match("3 one",0,0,0)
		see match.hasmatch() + nl
		match = match("welcome 11 one",0,0,0)
		see match.hasmatch() + nl
		matched = match.captured(0)
		see matched + nl
	}
	exp = new qregularexpression() {
		setPattern("^(\d\d)/(\d\d)/(\d\d\d\d)$")
		see pattern() + nl
		match = match("08/12/1985",0,0,0)
		see match.hasmatch() + nl
		day = match.captured(1)
		month = match.captured(2)
		year = match.captured(3)
		see day + nl + month + nl + year + nl
		see  "(" + match.capturedStart(1) + "," + match.capturedEnd(1)+ ")" + nl
		see  "(" + match.capturedStart(2) + "," + match.capturedEnd(2)+ ")" + nl
		see  "(" + match.capturedStart(3) + "," + match.capturedEnd(3)+ ")" + nl
	}

}
```

Output

```ring
Using Regular Expressions
\d\d \w+
1
0
1
11 one
^(\d\d)/(\d\d)/(\d\d\d\d)$
1
08
12
1985
(0,2)
(3,5)
(6,10)
```


# Simple Client and Server Example

In this section we will learn about creating simple Client and Server Application

```ring
Load "guilib.ring"

new qApp {
	oClient = new Client { client() }
	oServer = new Server { server() }
	exec()
}

Class Client

	win1 lineedit1  cOutput=""
	oTcpSocket

	func client

		win1 = new qwidget()

		new qpushbutton(win1) {
			setgeometry(50,50,100,30)
			settext("connect")
			setclickevent("oClient.Connect()")
		}

		lineedit1 = new qtextedit(win1) {
			setGeometry(150,50,200,300)
		}

		win1 {
			setwindowtitle("client")
			setgeometry(10,100,400,400)
			show()
		}

	func connect
		cOutput = "Connect to host 127.0.0.1 port 9999" + nl
		lineedit1.settext(cOutput)
		oTcpSocket = new qTcpSocket(win1) {
			setconnectedevent("oClient.pConnected()")
			setreadyreadevent("oClient.pRead()")
			connecttohost("127.0.0.1",9999,3,0)
			waitforconnected(5000)
		}

	func pConnected

		cOutput += "Connected!" + nl
		lineedit1.settext(cOutput)

	func pRead

		cOutput += "Ready Read!" + nl
		lineedit1.settext(cOutput)
		cOutput += oTcpSocket.readall().data() + nl
		lineedit1.settext(cOutput)

Class Server

	win1 lineedit1
	oTcpServer oTcpClient
	cOutput = ""

	func server

		win1 = new qwidget()

		lineedit1 = new qtextedit(win1) {
			setGeometry(150,50,200,300)
		}

		win1 {
			setwindowtitle("Server")
			setgeometry(450,100,400,400)
			show()
		}

		oTcpServer = new qTcpServer(win1) {
			setNewConnectionEvent("oServer.pNewConnection()")
			oHostAddress = new qHostAddress()
			oHostAddress.SetAddress("127.0.0.1")
			listen(oHostAddress,9999)
		}
		cOutput = "Server Started" + nl +
			   "listen to port 9999" + nl

		lineedit1.settext(cOutput)

	Func pNewConnection

		oTcpClient = oTcpServer.nextPendingConnection()
		cOutput += "Accept Connection" + nl
		lineedit1.settext(cOutput)
		oTcpClient {
			cStr ="Hello from server to client!"+char(13)+char(10)
			write(cStr,len(cStr))
			flush()
			waitforbyteswritten(300000)
			close()
		}
```

The application during the runtime

:alt: Client and Server Example

# Dynamic Objects

We may create objects in the runtime and add them to windows.

Example:

```ring
load "guilib.ring"

oFormDesigner = new FormDesigner { start("oFormDesigner") }

Class FormDesigner

	winToolBox  winForm

	aObjects = []

	func start cObjectName

		oApp = new qApp

		winToolBox = new qWidget()
		winToolBox.setWindowTitle("ToolBox")
		winToolBox.move(10,10)
		winToolBox.resize(300,600)

		btn = new qPushButton(winToolBox)
		btn.resize(300,30)
		btn.setText("Create Button")
		btn.setClickEvent(cObjectName+".pCreateButton()")
		btn.show()

		winToolBox.show()

		winForm = new qWidget() {
			move(400,50)
			setWindowTitle("Form Designer")
			resize(600,600)
			show()
		}

		oApp.exec()


	func pCreateButton

		nCount = len(aObjects)

		aObjects + new MyButton(winForm)
		{
			nIndex = nCount + 1
			setText("Button"+ nIndex)
			Move(30*nIndex,30*nIndex)
			resize(100,30)
			show()
		}


Class MyButton from qPushButton
	nIndex = 0
```


# Weight History Application

The next sample help in recording (Date, Time and Weight).

```ring
Load "guilib.ring"

MyApp = new qApp
{
  $ApplicationObject = "oApp"   # To be used when calling events
  oApp = new App
  exec()
  oApp.CloseDatabase()
}

class App

  cDir = currentdir() + "/"
  oCon
  aIDs = []

  win1 = new qWidget()
  {
	setWindowTitle("Weight History")
	resize(600,600)
	layoutButtons = new qhboxlayout()
	{
	  label1 = new qLabel(win1) { setText("Weight") }
	  text1 = new qlineedit(win1)
	  btnAdd = new qpushbutton(win1) {
		  setText("Add")
		  setClickEvent($ApplicationObject+".AddWeight()")
	  }
	  btnDelete = new qpushbutton(win1) {
		  setText("Delete")
		  setClickEvent($ApplicationObject+".Deleteweight()")
	  }
	  addwidget(label1)
	  addwidget(text1)
	  addwidget(btnAdd)
	  addwidget(btnDelete)
	}
	layoutData  = new qhboxlayout()
	{
	  Table1 = new qTableWidget(win1) {
		setrowcount(0)
		setcolumncount(3)
		setselectionbehavior(QAbstractItemView_SelectRows)
		setHorizontalHeaderItem(0, new QTableWidgetItem("Date"))
		setHorizontalHeaderItem(1, new QTableWidgetItem("Time"))
		setHorizontalHeaderItem(2, new QTableWidgetItem("Weight"))
		setitemChangedEvent($ApplicationObject+".ItemChanged()")
				   setAlternatingRowColors(true)
				   horizontalHeader().setStyleSheet("color: blue")
				   verticalHeader().setStyleSheet("color: red")
	  }
	  addWidget(Table1)
	}
	layoutClose = new qhboxlayout()
	{
	  btnclose = new qpushbutton(win1) {
	    setText("Close")
	    setClickEvent("MyApp.Quit()")
	  }
	  addwidget(btnClose)
	}
	layoutMain = new qvboxlayout()
	{
	  addlayout(layoutButtons)
	  addLayout(LayoutData)
	  addLayout(layoutClose)
	}
	setlayout(layoutMain)
	self.OpenDatabase()
	self.ShowRecords()
	show()
  }

  Func OpenDatabase
	lCreate = False
	if not fexists(cDir + "weighthistory.db")
	  lCreate = True
	ok
	new QSqlDatabase() {
	  this.oCon = addDatabase("QSQLITE") {
		setDatabaseName("weighthistory.db")
		Open()
	  }
	}
	if lCreate
	  new QSqlQuery( ) {
		exec("create table weighthistory (id integer primary key,"+
                            " f_date varchar(10),"+
		     " f_time varchar(8), f_weight varchar(8) );")
		delete()
	  }
	ok


  Func CloseDatabase
	oCon.Close()

  Func AddWeight
	cWeight = text1.text()
	AddRecord(cWeight)

  Func DeleteWeight
	Table1 {
	   nRow = CurrentRow()
	  if nRow >= 0
		nID = this.aIDs[nROW+1]
		new QSqlQuery( ) {
		  exec("delete from weighthistory where id = " + nID )
		}
		Del(this.aIDs,nRow+1)
		removerow(nRow)
		selectrow(nRow)
	  ok
	}


  Func AddRecord cWeight
	new QSqlQuery( ) {
	  cStr = "insert into weighthistory (f_date,f_time,f_weight) values"+
	  " ('%f1','%f2','%f3')"
	  cDate = Date()
	  cTime = Time()
	  cStr = substr(cStr,"%f1",cDate)
	  cStr = substr(cStr,"%f2",cTime)
	  cStr = substr(cStr,"%f3",cWeight)
	  exec(cStr)
	  delete()
	}
	ShowRecords()
	Table1.selectrow(table1.rowcount()-1)


  Func ShowRecords
	table1.setitemChangedEvent("")
	aIDs = []
	query = new QSqlQuery() {
	  exec("select * from weighthistory")
	  nRows = 0
	  this.Table1.setrowcount(0)
	  while movenext()
		this.table1 {
		  insertRow(nRows)
		  this.aIDs + query.value(0).tostring()
		  for x = 1 to 3
			cStr = query.value(x).tostring()
			item = new qTableWidgetItem(cStr)
			setItem(nRows,x-1,item)
		  next
		}
		nRows++
	  end
	  delete()
	}
	table1.setitemChangedEvent($ApplicationObject+".ItemChanged()")

  Func ItemChanged
	nRow =  table1.currentrow()
	if nRow >= 0
	  myitem = Table1.item(table1.currentrow(),0)
	  cDate = myitem.text()
	  myitem = Table1.item(table1.currentrow(),1)
	  cTime = myitem.text()
	  myitem = Table1.item(table1.currentrow(),2)
	  cWeight = myitem.text()
	  new QSqlQuery( ) {
		cStr = "update weighthistory set f_date ='%f1' , f_time = '%f2' , "+
		"f_weight ='%f3' where id = " +  this.aIDs[nROW+1]
		cStr = substr(cStr,"%f1",cDate)
		cStr = substr(cStr,"%f2",cTime)
		cStr = substr(cStr,"%f3",cWeight)
		exec(cStr)
		delete()
	  }
	ok
```

The next screen shot for the application during the runtime

:alt: Weight History Application

# Notepad Application

In the next example we will see simple Notepad developed using the RingQt

```ring
Load "guilib.ring"

cActiveFileName = ""
aTextColor = [0,0,0]
aBackColor = [255,255,255]
cFont = "MS Shell Dlg 2,14,-1,5,50,0,0,0,0,0"
cWebsite = "http://www.google.com"

oSearch = NULL
oSearchValue = NULL
oSearchCase = NULL
oSearchFilter = NULL
oReplaceValue = NULL

lAskToSave = false

MyApp = New qApp {
	win1 = new qMainWindow() {

		setwindowtitle("Ring Notepad")
		setGeometry(100,100,400,400)
		aBtns = [
				new qpushbutton(win1) {
					setbtnimage(self,"image/new.png")
					setclickevent("pNew()")
					settooltip("New File")
				} ,
				new qpushbutton(win1) {
					setbtnimage(self,"image/open.png")
					setclickevent("pOpen()")
					settooltip("Open File")
				} ,
				new qpushbutton(win1) {
					setbtnimage(self,"image/save.png")
					setclickevent("pSave()")
					settooltip("Save")
				 } ,
				new qpushbutton(win1) {
					setbtnimage(self,"image/saveas.png")
					setclickevent("pSaveAs()")
					settooltip("Save As")
				 } ,
				new qpushbutton(win1) {
					setbtnimage(self,"image/cut.png")
					setclickevent("pCut()")
					settooltip("Cut")
				 } ,
				new qpushbutton(win1) {
					setbtnimage(self,"image/copy.png")
					setclickevent("pCopy()")
					settooltip("Copy")
				} ,
				new qpushbutton(win1) {
					setbtnimage(self,"image/paste.png")
					setclickevent("pPaste()")
					settooltip("Paste")
				} ,
				new qpushbutton(win1) {
					setbtnimage(self,"image/font.png")
					setclickevent("pFont()")
					settooltip("Font")
				} ,
				new qpushbutton(win1) {
					setbtnimage(self,"image/colors.jpg")
					setclickevent("pColor()")
					settooltip("Text Color")
				} ,
				new qpushbutton(win1) {
					setbtnimage(self,"image/search.png")
					setclickevent("pFind()")
					settooltip("Find and Replace")
				} ,
				new qpushbutton(win1) {
					setbtnimage(self,"image/print.png")
					setclickevent("pPrint()")
					settooltip("Print")
				} ,
				new qpushbutton(win1) {
					setbtnimage(self,"image/debug.png")
					setclickevent("pDebug()")
					settooltip("Debug (Run then wait!)")
				} ,
				new qpushbutton(win1) {
					setbtnimage(self,"image/run.png")
					setclickevent("pRun()")
					settooltip("Run the program")
				} ,
				new qpushbutton(win1) {
					setbtnimage(self,"image/close.png")
					setclickevent("pQuit()")
					settooltip("Quit")
				}
			]

		tool1 = addtoolbar("files")  {
			for x in aBtns addwidget(x) addseparator() next
		}

		menu1 = new qmenubar(win1) {
			sub1 = addmenu("File")
			sub2 = addmenu("Edit")
			sub3 = addmenu("View")
			sub4 = addmenu("Help")
			sub1 {
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+n"))
					setbtnimage(self,"image/new.png")
					settext("New")
					setclickevent("pNew()")
				}
				addaction(oAction)
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+o"))
					setbtnimage(self,"image/open.png")
					settext("Open")
					setclickevent("pOpen()")
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+s"))
					setbtnimage(self,"image/save.png")
					settext("Save")
					setclickevent("pSave()")
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+e"))
					setbtnimage(self,"image/saveas.png")
					settext("Save As")
					setclickevent("pSaveAs()")
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+p"))
					setbtnimage(self,"image/print.png")
					settext("Print to PDF")
					setclickevent("pPrint()")
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+d"))
					setbtnimage(self,"image/debug.png")
					settext("Debug (Run then wait!)")
					setclickevent("pDebug()")
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+r"))
					setbtnimage(self,"image/run.png")
					settext("Run")
					setclickevent("pRun()")
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+F5"))
					setbtnimage(self,"image/run.png")
					settext("Run GUI Application (No Console)")
					setclickevent("pRunNoConsole()")
				}
				addaction(oAction)
				addseparator()
				oAction = new qaction(win1) {
					setShortcut(new QKeySequence("Ctrl+q"))
					setbtnimage(self,"image/close.png")
					settext("Exit")
					setstatustip("Exit")
					setclickevent("pQuit()")
				}
				addaction(oAction)
			}
			sub2 {
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+x"))
					setbtnimage(self,"image/cut.png")
					settext("Cut")
					setclickevent("pCut()")
				}
				addaction(oAction)
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+c"))
					setbtnimage(self,"image/copy.png")
					settext("Copy")
					setclickevent("pCopy()")
				}
				addaction(oAction)
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+v"))
					setbtnimage(self,"image/paste.png")
					settext("Paste")
					setclickevent("pPaste()")
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+i"))
					setbtnimage(self,"image/font.png")
					settext("Font")
					setclickevent("pFont()")
				}
				addseparator()
				addaction(oAction)
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+t"))
					setbtnimage(self,"image/colors.jpg")
					settext("Text Color")
					setclickevent("pColor()")
				}
				addaction(oAction)
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+b"))
					setbtnimage(self,"image/colors.jpg")
					settext("Back Color")
					setclickevent("pColor2()")
				}
				addaction(oAction)
				addseparator()
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+g"))
					settext("Go to line")
					setclickevent("pGoto()")
				}
				addaction(oAction)
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+f"))
					setbtnimage(self,"image/search.png")
					settext("Find and Replace")
					setclickevent("pFind()")
				}
				addaction(oAction)
			}
			sub3 {
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+p"))
					setbtnimage(self,"image/project.png")
					settext("Project Files")
					setclickevent("pProject()")
				}
				addaction(oAction)
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+u"))
					setbtnimage(self,"image/source.png")
					setclickevent("pSourceCode()")
					settext("Source Code")
				}
				addaction(oAction)
				oAction = new qAction(win1) {
					setShortcut(new QKeySequence("Ctrl+w"))
					setbtnimage(self,"image/richtext.png")
					setclickevent("pWebBrowser()")
					settext("Web Browser")
				}
				addaction(oAction)
			}
			sub4 {
				sub5 = addmenu("Development Tools")
				sub5 {

					oAction = new qAction(win1) {
						settext("Programming Language")
						setclickevent("pLang()")
					}
					addaction(oAction)
					oAction = new qAction(win1) {
						settext("GUI Library")
						setclickevent("pGUI()")
					}
					addaction(oAction)
				}
				addseparator()
					oAction = new qAction(win1) {
						settext("About")
						setclickevent("pAbout()")
					}
					addaction(oAction)
			}
		}

		setmenubar(menu1)

		status1 = new qstatusbar(win1) {
			showmessage("Ready!",0)
		}

		setstatusbar(status1)

		tree1 = new qtreeview(win1) {
			setclickedevent("pChangeFile()")
			setGeometry(00,00,200,400)
			oDir = new QDir()
			ofile = new QFileSystemModel() {
				setrootpath(oDir.currentpath())
				myfiles = new qstringlist()
				myfiles.append("*.ring")
				myfiles.append("*.rh")
				setnamefilters(myfiles)
				setNameFilterDisables(false)
			}
			setmodel(ofile)
			myindex = ofile.index(oDir.currentpath(),0)
			for x = 1 to ofile.columncount()
				hidecolumn(x)
			next
			setcurrentindex(myindex)
			setexpanded(myindex,true)
			header().hide()
		}

		oDock1 = new qdockwidget(win1,0) {
			setGeometry(00,00,200,200)
			setwindowtitle("Project Files")
			setwidget(tree1)
		}

		textedit1 = new qtextedit(win1) {
			setCursorPositionChangedevent("pCursorPositionChanged()")
			setLineWrapMode(QTextEdit_NoWrap)
			setAcceptRichText(false)
			setTextChangedEvent("lAskToSave = true")
		}


		oDock2 = new qdockwidget(win1,0) {
			setwidget(textedit1)
			setwindowtitle("Source Code")
		}

		oWebBrowser = new qWidget() {
			setWindowFlags(Qt_SubWindow)
			oWBLabel = new qLabel(win1) {
				setText("Website: ")
			}
			oWBText = new qLineEdit(win1) {
				setText(cWebSite)
				setReturnPressedEvent("pWebGo()")
			}
			oWBGo = new qPushButton(win1) {
				setText("Go")
				setClickEvent("pWebGo()")
			}
			oWBBack = new qPushButton(win1) {
				setText("Back")
				setClickEvent("pWebBack()")
			}
			oWBLayout1 = new qHBoxLayout() {
				addWidget(oWBLabel)
				addWidget(oWBText)
				addWidget(oWBGo)
				addWidget(oWBBack)
			}
			oWebView = new qWebView(win1) {
				loadpage(new qurl(cWebSite))
			}
			oWBlayout2 = new qVBoxLayout() {
				addLayout(oWBLayout1)
				addWidget(oWebView)
			}
			setLayout(oWBLayout2)
		}

		oDock3 = new qdockwidget(win1,0) {
			setwidget(oWebBrowser)
			setwindowtitle("Web Browser")
			setFeatures(QDockWidget_DocWidgetClosable)
		}

		adddockwidget(1,oDock1,1)
		adddockwidget(2,oDock2,2)
		adddockwidget(2,oDock3,1)

		setwinicon(self,"image/notepad.png")

		showmaximized()
	}
	RestoreSettings()
	exec()
}

func pWebGo
	cWebsite = oWBText.text()
	oWebView.LoadPage( new qurl( cWebSite ) )

func pWebBack
	oWebView.Back()

func pProject
	oDock1.Show()

func pSourceCode
	oDock2.Show()

func pWebBrowser
	oDock3.Show()

func pChangeFile
	myitem = tree1.currentindex()
	if ofile.isdir(myitem)
		return
	ok
	cActiveFileName = ofile.filepath(myitem)
	textedit1.settext(read(cActiveFileName))
	textedit1.setfocus(0)
	pCursorPositionChanged()
	pSetActiveFileName()

func pSetActiveFileName
	oDock2.setWindowTitle("Source Code : " + cActiveFileName)

func pCursorPositionChanged
	status1.showmessage(" Line : "+(textedit1.textcursor().blocknumber()+1)+
			" Column : " +(textedit1.textcursor().columnnumber()+1) +
			" Total Lines : " + textedit1.document().linecount() ,0)

func pGoto
	oInput = New QInputDialog(win1)
	{
		setwindowtitle("Enter the line number?")
		setgeometry(100,100,400,50)
		setlabeltext("Line")
		settextvalue("1")
		exec()
		nLine = 0 + oInput.textvalue()
		oBlock = textedit1.document().findBlockByLineNumber(nLine-1)
		oCursor = textedit1.textcursor()
		oCursor.setposition(oBlock.position(),0)
		textedit1.settextcursor(oCursor)
	}

func pFind
	if isobject(oSearch)
		oSearch.activatewindow()
		return
	ok
	oSearch = new qWidget()
	{
		new qLabel(oSearch)
		{
			setText("Find What : ")
			setgeometry(10,10,50,30)
		}
		oSearchValue = new qlineedit(oSearch)
		{
			setgeometry(80,10,460,30)
			setReturnPressedEvent("pFindValue()")
		}
		new qLabel(oSearch)
		{
			setText("Replace with ")
			setgeometry(10,45,80,30)
		}
		oReplaceValue = new qlineedit(oSearch)
		{
			setgeometry(80,45,460,30)
		}
		oSearchCase = new qCheckbox(oSearch)
		{
			setText("Case Sensitive")
			setgeometry(80,85,100,30)
		}
		new qPushButton(oSearch)
		{
			setText("Find/Find Next")
			setgeometry(80,120,100,30)
			setclickevent("pFindValue()")
		}
		new qPushButton(oSearch)
		{
			setText("Replace")
			setgeometry(200,120,100,30)
			setclickevent("pReplace()")
		}
		new qPushButton(oSearch)
		{
			setText("Replace All")
			setgeometry(320,120,100,30)
			setclickevent("pReplaceAll()")
		}
		new qPushButton(oSearch)
		{
			setText("Close")
			setgeometry(440,120,100,30)
			setclickevent("pSearchClose()")
		}

		setwinicon(oSearch,"image/notepad.png")
		setWindowTitle("Find/Replace")
		setStyleSheet("background-color:white;")
		setFixedsize(550,160)
		setwindowflags( Qt_CustomizeWindowHint |
				Qt_WindowTitleHint | Qt_WindowStaysOnTopHint)

		oSearchFilter = new qallevents(oSearch)
		oSearchFilter.setKeyPressEvent("pSearchKeyPress()")
		installeventfilter(oSearchFilter)

		show()
	}

Func pReplace
	oCursor = textedit1.textCursor()
	if oCursor.HasSelection() = false
		new qMessagebox(oSearch)
		{
			SetWindowTitle("Replace")
			SetText("No Selection")
			show()
		}
		return false
	ok
	cValue = oSearchValue.text()
	cSelected = oCursor.SelectedText()
	if oSearchCase.checkState() = Qt_Unchecked
		cValue = lower(cValue)
		cSelected = lower(cSelected)
	ok
	if cSelected != cValue
		new qMessagebox(oSearch)
		{
			SetWindowTitle("Replace")
			SetText("No Match")
			show()
		}
		return false
	ok
	cValue = oReplaceValue.text()
	nStart = oCursor.SelectionStart()
	nEnd = oCursor.SelectionEnd()
	cStr = textedit1.toPlainText()
	cStr = left(cStr,nStart)+cValue+substr(cStr,nEnd+1)
	textedit1.setText(cStr)
	return pFindValue()

Func pReplaceAll
	cStr = textedit1.toPlainText()
	cOldValue = oSearchValue.text()
	cNewValue = oReplaceValue.text()
	if oSearchCase.checkState() = Qt_Unchecked
		# Not Case Sensitive
		cStr = SubStr(cStr,cOldValue,cNewValue,true)
	else
		# Case Sensitive
		cStr = SubStr(cStr,cOldValue,cNewValue)
	ok
	textedit1.setText(cStr)
	new qMessagebox(oSearch)
	{
		SetWindowTitle("Replace All")
		SetText("Operation Done")
		show()
	}

Func pSearchClose
	oSearch.close()
	oSearch = NULL

func pSearchKeyPress
	if oSearchFilter.getKeyCode() = Qt_Key_Escape
		pSearchClose()
	ok

func pFindValue
	oCursor = textedit1.textcursor()
	nPosStart = oCursor.Position() + 1
	cValue = oSearchValue.text()
	cStr = textedit1.toplaintext()
	cStr = substr(cStr,nPosStart)
	if oSearchCase.checkState() = Qt_Unchecked
		cStr = lower(cStr)  cValue = lower(cValue)
	ok
	nPos = substr(cStr,cValue)
	if nPos > 0
		nPos += nPosStart - 2
		oCursor = textedit1.textcursor()
		oCursor.setposition(nPos,0)
		textedit1.settextcursor(oCursor)
		oCursor = textedit1.textcursor()
		oCursor.setposition(nPos+len(cValue),1)
		textedit1.settextcursor(oCursor)
		return true
	else
		new qMessagebox(oSearch)
		{
			SetWindowTitle("Search")
			SetText("Cannot find :" + cValue)
			show()
		}
		return false
	ok

func pNofileopened
	New qMessageBox(win1) {
		setWindowTitle("Sorry")
		setText("Save the file first!")
		show()
	}

func pDebug
	if cActiveFileName = Null return pNofileopened() ok
	cCode = "start run " + cActiveFileName + nl
	system(cCode)

func pRun
	if cActiveFileName = Null return pNofileopened() ok
	cCode = "start ring " + cActiveFileName + nl
	system(cCode)

func pRunNoConsole
	if cActiveFileName = Null return pNofileopened() ok
	cCode = "start /b ring " + cActiveFileName + nl
	system(cCode)

func pSave
	if cActiveFileName = NULL return pSaveAs() ok
	writefile(cActiveFileName,textedit1.toplaintext())
	status1.showmessage("File : " + cActiveFileName + " saved!",0)
	lAskToSave = false

func pSaveAs
	new qfiledialog(win1) {
		cName = getsavefilename(win1,"Save As","","source files(*.ring)")
		if cName != NULL
			cActiveFileName = cName
			writefile(cActiveFileName,textedit1.toplaintext())
			status1.showmessage("File : " + cActiveFileName + " saved!",0)
			pSetActiveFileName()
			lAskToSave = false
		ok
	}

func pPrint
	status1.showmessage("Printing to File : RingDoc.pdf",0)
	printer1 = new qPrinter(0) {
		setoutputformat(1)	# 1 = pdf
		setoutputfilename("RingDoc.pdf")
		textedit1.print(printer1)
	}
	status1.showmessage("Done!",0)
	system("RingDoc.pdf")

func pCut
	textedit1.cut()
	status1.showmessage("Cut!",0)

func pCopy
	textedit1.copy()
	status1.showmessage("Copy!",0)

func pPaste
	textedit1.paste()
	status1.showmessage("Paste!",0)

func pFont
	oFontDialog = new qfontdialog() {
		aFont = getfont()
	}
	textedit1.selectall()
	cFont = aFont[1]
	pSetFont()

Func pSetFont
	myfont = new qfont("",0,0,0)
	myfont.fromstring(cFont)
	textedit1.setcurrentfont(myfont)

Func pColor
	new qcolordialog() { aTextColor = GetColor() }
	pSetColors()

Func pColor2
	new qcolordialog() { aBackColor = GetColor() }
	pSetColors()

Func pSetColors
	textedit1.setstylesheet("color: rgb(" + aTextColor[1] + "," + aTextColor[2] +
				"," + aTextColor[3] + ");" + "background-color: rgb(" +
				aBackColor[1] + "," + aBackColor[2] + "," +
				aBackColor[3] + ")")

func pOpen
	new qfiledialog(win1) {
		cName = getopenfilename(win1,"open file","c:\","source files(*.ring)")
		if cName != NULL
			cActiveFileName = cName
			textedit1.settext(read(cActiveFileName))
		ok
	}

func pNew
	new qfiledialog(win1) {
		cName = getsavefilename(win1,"New file","","source files(*.ring)")
		if cName != NULL
			write(cName,"")
			cActiveFileName = cName
			textedit1.settext(read(cActiveFileName))

		ok
	}

Func WriteFile cFileName,cCode
	aCode = str2list(cCode)
	fp = fopen(cFileName,"wb")
	for cLine in aCode
		fwrite(fp,cLine+char(13)+char(10))
	next
	fclose(fp)

Func MsgBox cTitle,cMessage
	new qMessagebox(win1) {
		setwindowtitle(cTitle)
		setText(cMessage)
		show()
	}


Func pLang
	MsgBox("Programming Language",
		"This application developed using the Ring programming language")

Func pGUI
	MsgBox("GUI Library",
		"This application uses the Qt GUI Library through RingQt")

Func pAbout
	MsgBox("About",
		"2016, Mahmoud Fayed <msfclipper@yahoo.com>")

Func pSaveSettings
	cSettings = "aTextColor = ["+aTextColor[1]+","+aTextColor[2]+
			","+aTextColor[3]+"]" + nl +
			"aBackColor = ["+aBackColor[1]+","+aBackColor[2]+
			","+aBackColor[3]+"]" + nl +
			"cFont = '" + cFont + "'" + nl +
			"cWebSite = '" + cWebsite + "'" + nl
	cSettings = substr(cSettings,nl,char(13)+char(10))
	write("ringnotepad.ini",cSettings)
	if lAsktoSave
		new qmessagebox(win1)
		{
			setwindowtitle("Save Changes?")
			settext("Some changes are not saved!")
			setInformativeText("Do you want to save your changes?")
			setstandardbuttons(QMessageBox_Yes |
					   QMessageBox_No | QMessageBox_Cancel)
			result = exec()
			win1 {
			if result = QMessageBox_Yes
				pSave()
			but result = QMessageBox_Cancel
				return false
			ok
		}
	}
	ok
	return true

Func pSetWebsite
	oWebView { loadpage(new qurl(cWebSite)) }
	oWBText  { setText(cWebSite) }

Func RestoreSettings
	eval(read("ringnotepad.ini"))
	pSetColors()
	pSetFont()
	pSetWebsite()

Func pQuit
	if pSaveSettings()
		myapp.quit()
	ok
```

The application during the runtime

The next screen shot demonstrates the "File" menu

:alt: Ring Notepad - File Menu

The next window for "search and replace"

:alt: Ring Notepad - Search and replace

The next screen shot demonstrates the application main window

:alt: Ring Notepad - The Main Window

They are written in this sample for MS-Windows and we can update them for other operating systems.

# The Cards Game

In the next example we will see a simple Cards game developed using RingQt

Each player get 5 cards, the cards are unknown to any one. each time one player click on one card
to see it. if the card is identical to another card the play get point for each card.
if the card value is "5" the player get points for all visible cards.

```ring
Load "guilib.ring"

nScale = 1

app1 = new qApp

mypic = new QPixmap("cards.jpg")

mypic2 = mypic.copy(0,(124*4)+1,79,124)
Player1EatPic = mypic.copy(80,(124*4)+1,79,124)
Player2EatPic= mypic.copy(160,(124*4)+1,79,124)

aMyCards = []
aMyValues = []
for x1 = 0 to 3
	for y1 = 0 to 12
	  temppic = mypic.copy((79*y1)+1,(124*x1)+1,79,124)
		  aMyCards + temppic
		  aMyValues + (y1+1)
	next
next

nPlayer1Score = 0   nPlayer2Score=0

do
	Page1 = new Game
	Page1.Start()
again Page1.lnewgame

mypic.delete()
mypic2.delete()
Player1EatPic.delete()
Player2EatPic.delete()

for t in aMyCards
	  t.delete()
next

func gui_setbtnpixmap pBtn,pPixmap
	pBtn {
		setIcon(new qicon(pPixmap.scaled(width(),height(),0,0)))
		setIconSize(new QSize(width(),height()))
	}

Class Game

	nCardsCount = 10
	win1 layout1 label1 label2 layout2 layout3 aBtns aBtns2
	aCards nRole=1 aStatus = list(nCardsCount) aStatus2 = aStatus
	aValues        aStatusValues = aStatus  aStatusValues2 = aStatus
	Player1EatPic   Player2EatPic
	lnewgame = false
	nDelayEat = 0.5
	nDelayNewGame = 1

	func start

		win1 = new qWidget() {
			setwindowtitle("Five")
			setstylesheet("background-color: White")
			showfullscreen()
		}

		layout1 = new qvboxlayout()

		label1 = new qlabel(win1) {
			settext("Player (1) - Score : " + nPlayer1Score)
			setalignment(Qt_AlignHCenter | Qt_AlignVCenter)
			setstylesheet("color: White; background-color: Purple;
					 font-size:20pt")
			setfixedheight(200)
		}

		closebtn = new qpushbutton(win1)  {
			settext("Close Application")
			setstylesheet("font-size: 18px ; color : white ;
					 background-color: black ;")
			setclickevent("Page1.win1.close()")
		}

		aCards = aMyCards
		aValues = aMyValues

		layout2 = new qhboxlayout()

		aBtns = []

		for x = 1 to nCardsCount
			aBtns + new qpushbutton(win1)
			aBtns[x].setfixedwidth(79*nScale)
			aBtns[x].setfixedheight(124*nScale)
			gui_setbtnpixmap(aBtns[x],mypic2)
			layout2.addwidget(aBtns[x])
			aBtns[x].setclickevent("Page1.Player1click("+x+")")
		next

		layout1.addwidget(label1)
		layout1.addlayout(layout2)

		label2 = new qlabel(win1) {
			settext("Player (2) - Score : " + nPlayer2Score)
			setalignment(Qt_AlignHCenter | Qt_AlignVCenter)
			setstylesheet("color: white; background-color: red;
					 font-size:20pt")
			setfixedheight(200)
		}

		layout3 = new qhboxlayout()

		aBtns2 = []
		for x = 1 to nCardsCount
			aBtns2 + new qpushbutton(win1)
			aBtns2[x].setfixedwidth(79*nScale)
			aBtns2[x].setfixedheight(124*nScale)
			gui_setbtnpixmap(aBtns2[x],mypic2)
			layout3.addwidget(aBtns2[x])
			aBtns2[x].setclickevent("Page1.Player2click("+x+")")
		next

		layout1.addwidget(label2)
		layout1.addlayout(layout3)
		layout1.addwidget(closebtn)

		win1.setlayout(layout1)

		app1.exec()

	Func Player1Click x
		if nRole = 1 and aStatus[x] = 0
			nPos = ((random(100)+clock())%(len(aCards)-1)) + 1
			gui_setbtnpixmap(aBtns[x],aCards[nPos])
			del(aCards,nPos)
			nRole = 2
			aStatus[x] = 1
			aStatusValues[x] = aValues[nPos]
			del(aValues,nPos)
			Player1Eat(x,aStatusValues[x])
			checknewgame()
		ok

	Func Player2Click x
		if nRole = 2 and aStatus2[x] = 0
			nPos = ((random(100)+clock())%(len(aCards)-1)) + 1
			gui_setbtnpixmap(aBtns2[x],aCards[nPos])
			del(aCards,nPos)
			nRole = 1
			aStatus2[x] = 1
			aStatusValues2[x] = aValues[nPos]
			del(aValues,nPos)
			Player2Eat(x,aStatusValues2[x])
			checknewgame()
		ok

	Func Player1Eat nPos,nValue

		 app1.processEvents()

		 delay(nDelayEat)
		 lEat = false
		 for x = 1 to nCardsCount
			 if aStatus2[x] = 1 and (aStatusValues2[x] = nValue or nValue=5)
				aStatus2[x] = 2
				gui_setbtnpixmap(aBtns2[x],Player1EatPic)
				lEat = True
				nPlayer1Score++
			 ok
			 if (x != nPos) and (aStatus[x] = 1) and
				(aStatusValues[x] = nValue or nValue=5)
				aStatus[x] = 2
				gui_setbtnpixmap(aBtns[x],Player1EatPic)
				lEat = True
				nPlayer1Score++
			 ok
		 next
		 if lEat
				nPlayer1Score++
				gui_setbtnpixmap(aBtns[nPos],Player1EatPic)
				aStatus[nPos] = 2
				label1.settext("Player (1) - Score : " + nPlayer1Score)
		 ok

	Func Player2Eat nPos,nValue

		 app1.processEvents()

		 delay(nDelayEat)
		 lEat = false
		 for x = 1 to  nCardsCount
			 if aStatus[x] = 1 and (aStatusValues[x] = nValue or nValue = 5)
				aStatus[x] = 2
				gui_setbtnpixmap(aBtns[x],Player2EatPic)
				lEat = True
				nPlayer2Score++
			 ok

			 if (x != nPos) and (aStatus2[x] = 1) and
				(aStatusValues2[x] = nValue or nValue=5 )
				aStatus2[x] = 2
				gui_setbtnpixmap(aBtns2[x],Player2EatPic)
				lEat = True
				nPlayer2Score++
			 ok
		 next
		 if lEat
				nPlayer2Score++
				gui_setbtnpixmap(aBtns2[nPos],Player2EatPic)
				aStatus2[nPos] = 2
				label2.settext("Player (2) - Score : " + nPlayer2Score)
		 ok

	Func checknewgame
		if isnewgame()
				  lnewgame = true

				  if nPlayer1Score > nPlayer2Score
					 label1.settext("Player (1) Wins!!!")
				  ok
				  if nPlayer2Score > nPlayer1Score
					 label2.settext("Player (2) Wins!!!")
				  ok

				  app1.processEvents()
				  delay(nDelayNewGame)

				  win1.delete()
				  app1.quit()
		ok

	Func isnewgame
		for t in aStatus
			if t = 0
				return false
			ok
		next
		for t in aStatus2
			if t = 0
				return false
			ok
		next
		return true

	Func delay x
	nTime = x * 1000
	oTest = new qTest
	oTest.qsleep(nTime)
```

The application during the runtime

:alt: The Cards Game

> **Note:**
> is not increased because he opened this card while no other cards are visible!

The next screen shot while running the game using a Mobile (Android)

:alt: The Cards Game

> **Note:**

# Classes and their Methods to use the default events

The next table present the class name and the methods that we have to use the default events.

# =
Class Name			Methods to use the default Events
# =
QPushButton			SetClickEvent()
QAction				SetClickEvent()
QLineEdit			SetTextChangedEvent()
QTextEdit			SetCopyAvailableEvent()
QListWidget			SetCurrentItemChangedEvent()
QTreeView			SetCollapseEvent()
QTreeWidget			SetCollapsedEvent()
QComboBox 			SetActivatedEvent()
QTabWidget 			SetCurrentChangedEvent()
QTableWidget 			SetCellActivatedEvent()
QProgressBar 			SetValueChangedEvent()
QSpinBox 			SetValueChangedEvent()
QSlider 			SetActionTriggeredEvent()
QDial 				SetActionTriggeredEvent()
QWebView 			SetLoadFinishedEvent()
QCheckBox 			SetStateChangedEvent()
QRadioButton 			SetClickedEvent()
QButtonGroup 			SetButtonClickedEvent()
QVideoWidget 			SetBrightnessChangedEvent()
QTimer 				SetTimeoutEvent()
QTcpServer 			SetAcceptErrorEvent()
QIODevice 			SetAboutToCloseEvent()
QAbstractSocket 		SetConnectedEvent()
QTcpSocket 			SetConnectedEvent()
QColorDialog 			SetColorSelectedEvent()
QNetworkAccessManager 		SetFinishedEvent()
QThread				SetStartedEvent()
# =

# Methods to use Events with Events Filter

RingQt define a new class called QAllEvents that help you in using Events Filter

The next table presents the methods that we have

# =
Methods to get parameters		Class Name
# =
getKeyCode() 	--> Number		QAllEvents
getx()		--> Number
gety()		--> Number
getglobalx()	--> Number
getglobaly()	--> Number
getbutton()	--> Number
getbuttons()	--> Number
# =

The next table presents the methods that we have to use events.

# =
Method Name						Class Name
# =
setKeyPressEvent(cEvent)				QAllEvents
setMouseButtonPressEvent(cEvent)
setMouseButtonReleaseEvent(cEvent)
setMouseButtonDblClickEvent(cEvent)
setMouseMoveEvent(cEvent)
setCloseEvent(cEvent)
setContextMenuEvent(cEvent)
setDragEnterEvent(cEvent)
setDragLeaveEvent(cEvent)
setDragMoveEvent(cEvent)
setDropEvent(cEvent)
setEnterEvent(cEvent)
setFocusInEvent(cEvent)
setFocusOutEvent(cEvent)
setKeyReleaseEvent(cEvent)
setLeaveEvent(cEvent)
setNonClientAreaMouseButtonDblClickEvent(cEvent)
setNonClientAreaMouseButtonPressEvent(cEvent)
setNonClientAreaMouseButtonReleaseEvent(cEvent)
setNonClientAreaMouseMoveEvent(cEvent)
setMoveEvent(cEvent)
setResizeEvent(cEvent)
setWindowActivateEvent(cEvent)
setWindowBlockedEvent(cEvent)
setWindowDeactivateEvent(cEvent)
setWindowStateChangeEvent(cEvent)
setWindowUnblockedEvent(cEvent)
# =

# The Difference between Qt and RingQt

(1) RingQt use simple methods to set the code that will be executed for events.

Syntax:

```ring
Set<Event_Name>Event(cEventCode)
```

(2) RingQt change the name of some methods to avoid conflict with Ring Keywords.

The next table present these little changes

# ======================
Class Name				Qt Method Name			RingQt Method Name
# ======================
QWebView				load				loadpage
QMediaPlaylist				load				loadfile
QMediaPlaylist				next				movenext
QPainter				end				endpaint
QPicture				load				loadfile
QLineEdit				end				endtext
QDialog					done				donedialog
QTextDocument				end				enddoc
QTextBlock				next				nextblock
QSqlQuery				next				movenext
QImage					load				loadimage
QNetworkAccessManager			get				getvalue
QNetworkAccessManager			put				putvalue
QThread					exit				exitfromthread
QRegularExpressionMatchIterator		next				nextitem
QCamera					load				loadcamera
# ======================

# RingQt Classes and their Qt Documentation

Qt Documentation : http://doc.qt.io/qt-5/classes.html

See the "RingQt Classes and Methods Reference" chapter for supported classes and methods.

# New Classes names - Index Start from 1

We added new classes to RingQt - another version of classes where the class names doesn't start with the "q" letter
Also updated methods so the index start from 1 when we deal with the GUI controls like

- ComboBox
- ListWidget
- TableWidget
- TreeWidget

These classes are inside guilib.ring under the package name : System.GUI

To use it

```ring
load "guilib.ring"

import System.GUI
```

This doesn't have any effect on our previous code, It's just another choice for better code that is consistent with Ring rules.

Also the form designer is updated to provide us the choice between using classes where (index start from 0) or (index start from 1)

Example  (Uses the Form Designer)

(1) https://github.com/ring-lang/ring/blob/master/samples/UsingFormDesigner/indexstart/indexstartView.ring

(2) https://github.com/ring-lang/ring/blob/master/samples/UsingFormDesigner/indexstart/indexstartController.ring

# TableWidget - AddList() Method

Using this method we can add Ring List to the TableWidget

> **Tip:**

> **Note:**

Example:

Source code: https://github.com/ring-lang/ring/tree/master/samples/UsingQt/TableWidget/AddRingList

```ring
class addRingListController from windowsControllerParent

	oView = new addRingListView

	aList = [["one","two"],
		 ["three","four"],
		 ["five","six"],
		 [7,8],
		 ["I","Love","Ring","Programming"]]

	oView.tablewidget1.addList(aList)

	aList = [["Number","Square"]]
	for t = 1 to 10
		aList + [ t, t*t]
	next

	oView.tablewidget1.addList(aList)
```

Screen Shot:

:alt: addlisttotablewidget

# Creating Reports using the WebLib and the GUILib

The WebLib comes with a class called HtmlPage

Using this class we can create reports quickly using WebLib & GUILib together

Example:

```ring
load "stdlib.ring"
load "weblib.ring"
load "guilib.ring"

import System.Web
import System.GUI

new qApp {
	open_window(:CustomersReportController)
	exec()
}

class CustomersReportController from WindowsControllerParent

	oView = new CustomersReportView

	func Start
		CreateReport()

	func CreateReport
		mypage = new HtmlPage {
			h1 { text("Customers Report") }
			Table
			{
				style = stylewidth("100%") + stylegradient(4)
				TR
				{
					TD { WIDTH="10%"
						text("Customers Count : " )  }
					TD { text (100) }
				}
			}
			Table
			{
				style = stylewidth("100%") + stylegradient(26)
				TR
				{
					style = stylewidth("100%") +
						stylegradient(24)
					TD { text("Name " )  }
					TD { text("Age" ) }
					TD { text("Country" ) }
					TD { text("Job" ) }
					TD { text("Company" ) }
				}
				for x =  1 to 100
					TR
					{
						TD { text("Test" )  }
						TD { text("30" ) }
						TD { text("Egypt" ) }
						TD { text("Sales" ) }
						TD { text("Future" ) }
					}
				next
			}
		}
		write("report.html",mypage.output())

	func PrintEvent
		printer1 = new qPrinter(0) {
			setoutputformat(1)
			setoutputfilename("report.pdf")
		}
		oView {
			web.print(printer1, Method( :OpenPDF ) )
			web.show()
		}

	func OpenPDF
		new QDesktopServices {
			OpenURL(new qURL("report.pdf") )
		}

class CustomersReportView

		win = new window() {
				setwindowtitle("Report Window")
				setgeometry(100,100,500,500)
				web = new webview(win) {
					setgeometry(100,100,1000,500)
					loadpage(new qurl("file:///"+
					currentdir()+"/report.html"))
				}
				new pushbutton(win) {
						setGeometry(100,20,100,30)
						settext("Print")
						setclickevent(Method(:PrintEvent))
				}
				showMaximized()
			}
```

Screen Shot:

:alt: Customers Report


## qt3d

Single: Using Qt3D; Using Qt3D

# =
# Graphics Programming using RingQt3D

In this chapter we will learn how to use Qt3D through many samples.

# Drawing Cube

```ring
load "guilib.ring"

new qApp {

	oView = new Qt3dwindow()

	oWidget = new QWidget()
	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer)

	oInput = new QInputAspect(oRootEntity)
		oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000.0)
		oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
		oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
		oCameraEntity.setViewCenter(new QVector3D(0, 0, 0))

	oLightEntity = new QEntity(oRootEntity)
		oLight = new QPointLight(oLightEntity)
	oLight.setColor(new QColor() { setRGB(255,255,255,255) })
	oLight.setIntensity(1)
	oLightEntity.addComponent(oLight)

	oLightTransform = new QTransform(oLightEntity)
	oLightTransform.setTranslation(oCameraEntity.position())
	oLightEntity.addComponent(oLightTransform)

	oCamController = new  QFirstPersonCameraController(oRootEntity)
		oCamController.setCamera(oCameraEntity)

	oCube = new  QCuboidMesh(oRootEntity) {
		setXextent(2)
		setYextent(2)
		setZextent(3)
	}

	oCubeTransform = new  QTransform(oCube)
	oCubeTransform.setScale(2)
	oCubeTransform.setTranslation(new QVector3D(3, 3, 3))

	oCubeMaterial = new QPhongMaterial(oCube)
	oCubeMaterial.setDiffuse(new QColor() {setRGB(200,100,100,100)})

	oCubeEntity = new QEntity(oRootEntity)
	oCubeEntity.addComponent(oCube)
	oCubeEntity.addComponent(oCubeMaterial)
	oCubeEntity.addComponent(oCubeTransform)

	oView.setRootEntity(oRootEntity)

	oLayout = new QVBoxLayout()
	oLayout.AddWidget(oContainer)

	oWidget {
		setwindowtitle("Using Qt3D - Cube")
		resize(800,600)
		setLayout(oLayout)
		showMaximized()
	}

	exec()
}
```

:alt: Qt3D Example - Drawing Cube

# Drawing Torus

```ring
load "guilib.ring"

new qApp {

	oView = new Qt3dwindow()

	oWidget = new QWidget()
	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer)

	oInput = new QInputAspect(oRootEntity)
		oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000.0)
		oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
		oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
		oCameraEntity.setViewCenter(new QVector3D(0, 0, 0))

	oLightEntity = new QEntity(oRootEntity)
		oLight = new QPointLight(oLightEntity)
	oLight.setColor(new QColor() { setRGB(255,255,255,255) })
	oLight.setIntensity(1)
	oLightEntity.addComponent(oLight)

	oLightTransform = new QTransform(oLightEntity)
	oLightTransform.setTranslation(oCameraEntity.position())
	oLightEntity.addComponent(oLightTransform)

	oCamController = new  QFirstPersonCameraController(oRootEntity)
		oCamController.setCamera(oCameraEntity)

	oTorus = new  QTorusMesh(oRootEntity)
		oTorus.setRadius(1.0)
		oTorus.setMinorRadius(0.4)
		oTorus.setRings(100)
		oTorus.setSlices(20)

	oTorusTransform = new  QTransform(oTorus)
	oTorusTransform.setScale(2)
	oTorusTransform.setTranslation(new QVector3D(3, 3, 3))

	oTorusMaterial = new QPhongMaterial(oTorus)
	oTorusMaterial.setDiffuse(new QColor() {setRGB(200,100,100,100)})

	oTorusEntity = new QEntity(oRootEntity)
	oTorusEntity.addComponent(oTorus)
	oTorusEntity.addComponent(oTorusMaterial)
	oTorusEntity.addComponent(oTorusTransform)

	oView.setRootEntity(oRootEntity)

	oLayout = new QVBoxLayout()
	oLayout.AddWidget(oContainer)

	oWidget {
		setwindowtitle("Using Qt3D - Torus")
		resize(800,600)
		setLayout(oLayout)
		showMaximized()
	}

	exec()
}
```

:alt: Qt3D Example - Drawing Torus

# Drawing Sphere

```ring
load "guilib.ring"

new qApp {

	oView = new Qt3dwindow()

	oWidget = new QWidget()
	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer)

	oInput = new QInputAspect(oRootEntity)
		oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000.0)
		oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
		oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
		oCameraEntity.setViewCenter(new QVector3D(0, 0, 0))

	oLightEntity = new QEntity(oRootEntity)
		oLight = new QPointLight(oLightEntity)
	oLight.setColor(new QColor() { setRGB(255,255,255,255) })
	oLight.setIntensity(1)
	oLightEntity.addComponent(oLight)

	oLightTransform = new QTransform(oLightEntity)
	oLightTransform.setTranslation(oCameraEntity.position())
	oLightEntity.addComponent(oLightTransform)

	oCamController = new  QFirstPersonCameraController(oRootEntity)
		oCamController.setCamera(oCameraEntity)

	oSphere = new  QSphereMesh(oRootEntity)
		oSphere.setRadius(1.0)
		oSphere.setRings(100)
		oSphere.setSlices(20)

	oSphereTransform = new  QTransform(oSphere)
	oSphereTransform.setScale(2)
	oSphereTransform.setTranslation(new QVector3D(3, 3, 3))

	oSphereMaterial = new QPhongMaterial(oSphere)
	oSphereMaterial.setDiffuse(new QColor() {setRGB(200,100,100,100)})

	oSphereEntity = new QEntity(oRootEntity)
	oSphereEntity.addComponent(oSphere)
	oSphereEntity.addComponent(oSphereMaterial)
	oSphereEntity.addComponent(oSphereTransform)

	oView.setRootEntity(oRootEntity)

	oLayout = new QVBoxLayout()
	oLayout.AddWidget(oContainer)

	oWidget {
		setwindowtitle("Using Qt3D - Sphere")
		resize(800,600)
		setLayout(oLayout)
		showMaximized()
	}

	exec()
}
```

:alt: Qt3D Example - Drawing Sphere

# Drawing Cylinder

```ring
load "guilib.ring"

new qApp {

	oView = new Qt3dwindow()

	oWidget = new QWidget()
	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer)

	oInput = new QInputAspect(oRootEntity)
		oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000.0)
		oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
		oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
		oCameraEntity.setViewCenter(new QVector3D(0, 0, 0))

	oLightEntity = new QEntity(oRootEntity)
		oLight = new QPointLight(oLightEntity)
	oLight.setColor(new QColor() { setRGB(255,255,255,255) })
	oLight.setIntensity(1)
	oLightEntity.addComponent(oLight)

	oLightTransform = new QTransform(oLightEntity)
	oLightTransform.setTranslation(oCameraEntity.position())
	oLightEntity.addComponent(oLightTransform)

	oCamController = new  QFirstPersonCameraController(oRootEntity)
		oCamController.setCamera(oCameraEntity)


	oCylinder = new  QCylinderMesh(oRootEntity)
		oCylinder.setRadius(1)
		oCylinder.setRings(100)
		oCylinder.setSlices(20)
	oCylinder.setLength(5)

	oCylinderTransform = new  QTransform(oCylinder)
	oCylinderTransform.setScale(2)
	oCylinderTransform.setTranslation(new QVector3D(1, 0, 3))

	oCylinderMaterial = new QPhongMaterial(oCylinder)
	oCylinderMaterial.setDiffuse(new QColor() {setRGB(200,100,100,100)})

	oCylinderEntity = new QEntity(oRootEntity)
	oCylinderEntity.addComponent(oCylinder)
	oCylinderEntity.addComponent(oCylinderMaterial)
	oCylinderEntity.addComponent(oCylinderTransform)

	oView.setRootEntity(oRootEntity)

	oLayout = new QVBoxLayout()
	oLayout.AddWidget(oContainer)

	oWidget {
		setwindowtitle("Using Qt3D - Cylinder")
		resize(800,600)
		setLayout(oLayout)
		showMaximized()
	}

	exec()
}
```

:alt: Qt3D Example - Drawing Cylinder

# Drawing Cone

```ring
load "guilib.ring"

new qApp {

	oView = new Qt3dwindow()

	oWidget = new QWidget()
	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer)

	oInput = new QInputAspect(oRootEntity)
		oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000.0)
		oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
		oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
		oCameraEntity.setViewCenter(new QVector3D(0, 0, 0))

	oLightEntity = new QEntity(oRootEntity)
		oLight = new QPointLight(oLightEntity)
	oLight.setColor(new QColor() { setRGB(255,255,255,255) })
	oLight.setIntensity(1)
	oLightEntity.addComponent(oLight)

	oLightTransform = new QTransform(oLightEntity)
	oLightTransform.setTranslation(oCameraEntity.position())
	oLightEntity.addComponent(oLightTransform)

	oCamController = new  QFirstPersonCameraController(oRootEntity)
		oCamController.setCamera(oCameraEntity)


	oCone = new  QConeMesh(oRootEntity)
		oCone.setRings(100)
		oCone.setSlices(20)
	oCone.setLength(5)

	oConeTransform = new  QTransform(oCone)
	oConeTransform.setScale(2)
	oConeTransform.setTranslation(new QVector3D(1, 0, 3))

	oConeMaterial = new QPhongMaterial(oCone)
	oConeMaterial.setDiffuse(new QColor() {setRGB(200,100,100,100)})

	oConeEntity = new QEntity(oRootEntity)
	oConeEntity.addComponent(oCone)
	oConeEntity.addComponent(oConeMaterial)
	oConeEntity.addComponent(oConeTransform)

	oView.setRootEntity(oRootEntity)

	oLayout = new QVBoxLayout()
	oLayout.AddWidget(oContainer)

	oWidget {
		setwindowtitle("Using Qt3D - Cone")
		resize(800,600)
		setLayout(oLayout)
		showMaximized()
	}

	exec()
}
```

:alt: Qt3D Example - Drawing Cone

# Drawing Plane

```ring
load "guilib.ring"

new qApp {

	oView = new Qt3dwindow()

	oWidget = new QWidget()
	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer)

	oInput = new QInputAspect(oRootEntity)
		oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000.0)
		oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
		oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
		oCameraEntity.setViewCenter(new QVector3D(0, 0, 0))

	oLightEntity = new QEntity(oRootEntity)
		oLight = new QPointLight(oLightEntity)
	oLight.setColor(new QColor() { setRGB(255,255,255,255) })
	oLight.setIntensity(1)
	oLightEntity.addComponent(oLight)

	oLightTransform = new QTransform(oLightEntity)
	oLightTransform.setTranslation(oCameraEntity.position())
	oLightEntity.addComponent(oLightTransform)

	oCamController = new  QFirstPersonCameraController(oRootEntity)
		oCamController.setCamera(oCameraEntity)


	oPlane = new  QPlaneMesh(oRootEntity)
	oPlane.setHeight(5)
	oPlane.setWidth(5)
	oPlane.setmeshresolution(new qSize(10,10))

	oPlaneTransform = new  QTransform(oPlane)
	oPlaneTransform.setScale(2)
	oPlaneTransform.setTranslation(new QVector3D(0, -4, 4))

	oPlaneMaterial = new QPhongMaterial(oPlane)
	oPlaneMaterial.setDiffuse(new QColor() {setRGB(200,100,100,100)})

	oPlaneEntity = new QEntity(oRootEntity)
	oPlaneEntity.addComponent(oPlane)
	oPlaneEntity.addComponent(oPlaneMaterial)
	oPlaneEntity.addComponent(oPlaneTransform)

	oView.setRootEntity(oRootEntity)

	oLayout = new QVBoxLayout()
	oLayout.AddWidget(oContainer)

	oWidget {
		setwindowtitle("Using Qt3D - Plane")
		resize(800,600)
		setLayout(oLayout)
		showMaximized()
	}

	exec()
}
```

:alt: Qt3D Example - Drawing Plane

# Texture

```ring
load "guilib.ring"

new qApp {

	oView = new Qt3dwindow()

	oWidget = new QWidget()
	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer)

	oInput = new QInputAspect(oRootEntity)
		oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000.0)
		oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
		oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
		oCameraEntity.setViewCenter(new QVector3D(0, 0, 0))

	oLightEntity = new QEntity(oRootEntity)
		oLight = new QPointLight(oLightEntity)
	oLight.setColor(new QColor() { setRGB(255,255,255,255) })
	oLight.setIntensity(1)
	oLightEntity.addComponent(oLight)

	oLightTransform = new QTransform(oLightEntity)
	oLightTransform.setTranslation(oCameraEntity.position())
	oLightEntity.addComponent(oLightTransform)

	oCamController = new  QFirstPersonCameraController(oRootEntity)
		oCamController.setCamera(oCameraEntity)

	oCube = new  QCuboidMesh(oRootEntity) {
		setXextent(2)
		setYextent(2)
		setZextent(3)
	}

	oCubeTransform = new  QTransform(oCube)
	oCubeTransform.setScale(2)
	oCubeTransform.setTranslation(new QVector3D(3, 3, 3))

	oTextureLoader = new  QTextureLoader(oCube);
	oTextureLoader.setSource(
		new QUrl("file:///"+currentdir()+"/assets/texture/gold.jpg") )
	oCubeMaterial = new QTextureMaterial(oCube)
	oCubeMaterial.setTexture(oTextureLoader)

	oCubeEntity = new QEntity(oRootEntity)
	oCubeEntity.addComponent(oCube)
	oCubeEntity.addComponent(oCubeMaterial)
	oCubeEntity.addComponent(oCubeTransform)

	oView.setRootEntity(oRootEntity)

	oLayout = new QVBoxLayout()
	oLayout.AddWidget(oContainer)

	oWidget {
		setwindowtitle("Using Qt3D - Adding Texture")
		resize(800,600)
		setLayout(oLayout)
		showMaximized()
	}

	exec()
}
```

:alt: Qt3D Example - Texture

# Key Press

```ring
load "guilib.ring"

new qApp {

	oView = new Qt3dwindow()

	oWidget = new QWidget()
	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer)

		oFilter = new qallevents(oView)
		oFilter.setKeyPressEvent("pKeyPress()")
		oView.installeventfilter(oFilter)

	oInput = new QInputAspect(oRootEntity)
		oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000.0)
		oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
		oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
		oCameraEntity.setViewCenter(new QVector3D(0, 0, 0))

	oLightEntity = new QEntity(oRootEntity)
		oLight = new QPointLight(oLightEntity)
	oLight.setColor(new QColor() { setRGB(255,255,255,255) })
	oLight.setIntensity(1)
	oLightEntity.addComponent(oLight)

	oLightTransform = new QTransform(oLightEntity)
	oLightTransform.setTranslation(oCameraEntity.position())
	oLightEntity.addComponent(oLightTransform)

	oCamController = new  QFirstPersonCameraController(oRootEntity)
		oCamController.setCamera(oCameraEntity)
	oCamController.setEnabled(False)

	oCube = new  QCuboidMesh(oRootEntity) {
		setXextent(2)
		setYextent(2)
		setZextent(3)
	}

	oCubeTransform = new  QTransform(oCube)
	oCubeTransform.setScale(2)
	oCubeTransform.setTranslation(new QVector3D(3, 3, 3))

	oTextureLoader = new  QTextureLoader(oCube);
	oTextureLoader.setSource(
		new QUrl("file:///"+currentdir()+"/assets/texture/gold.jpg") )
	oCubeMaterial = new QTextureMaterial(oCube)
	oCubeMaterial.setTexture(oTextureLoader)

	oCubeEntity = new QEntity(oRootEntity)
	oCubeEntity.addComponent(oCube)
	oCubeEntity.addComponent(oCubeMaterial)
	oCubeEntity.addComponent(oCubeTransform)

	oView.setRootEntity(oRootEntity)

	oLayout = new QVBoxLayout()
	oLayout.AddWidget(oContainer)

	oWidget {
		setwindowtitle("Using Qt3D - Moving Cube using the Keyboard")
		resize(800,600)
		setLayout(oLayout)
		showMaximized()
	}

	oContainer.setfocus(0)

	exec()
}

func pKeyPress
	nKey = oFilter.getkeycode()
	oX = oCubeTransform.translation().x()
	oY = oCubeTransform.translation().y()
	oZ = oCubeTransform.translation().z()
	switch nKey
		on Qt_Key_Right
			oX++
		on Qt_Key_Left
			oX--
		on Qt_Key_Up
			oY++
		on Qt_Key_Down
			oY--
	off
	oCubeTransform.setTranslation(new QVector3D(oX, oY, oZ))
```

:alt: Qt3D Example - Key Press

# Object Picker

```ring
load "guilib.ring"

new qApp {

	oView = new Qt3dwindow()

	oWidget = new QWidget()
	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer)

		oFilter = new qallevents(oView)
		oFilter.setKeyPressEvent("pKeyPress()")
		oView.installeventfilter(oFilter)

	oInput = new QInputAspect(oRootEntity)
		oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000.0)
		oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
		oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
		oCameraEntity.setViewCenter(new QVector3D(0, 0, 0))

	oLightEntity = new QEntity(oRootEntity)
		oLight = new QPointLight(oLightEntity)
	oLight.setColor(new QColor() { setRGB(255,255,255,255) })
	oLight.setIntensity(1)
	oLightEntity.addComponent(oLight)

	oLightTransform = new QTransform(oLightEntity)
	oLightTransform.setTranslation(oCameraEntity.position())
	oLightEntity.addComponent(oLightTransform)

	oCamController = new  QFirstPersonCameraController(oRootEntity)
		oCamController.setCamera(oCameraEntity)
	oCamController.setEnabled(False)

	oCube = new  QCuboidMesh(oRootEntity) {
		setXextent(2)
		setYextent(2)
		setZextent(3)
	}

	oCubeTransform = new  QTransform(oCube)
	oCubeTransform.setScale(2)
	oCubeTransform.setTranslation(new QVector3D(3, 3, 3))

	oTextureLoader = new  QTextureLoader(oCube);
	oTextureLoader.setSource(
		new QUrl("file:///"+currentdir()+"/assets/texture/gold.jpg") )
	oCubeMaterial = new QTextureMaterial(oCube)
	oCubeMaterial.setTexture(oTextureLoader)

	oCubeEntity = new QEntity(oRootEntity)
	oCubeEntity.addComponent(oCube)
	oCubeEntity.addComponent(oCubeMaterial)
	oCubeEntity.addComponent(oCubeTransform)

	oPicker = new qObjectPicker(oCube) {
		setclickedevent("pClick()")
	}
	oCubeEntity.addComponent(oPicker)

	oView.setRootEntity(oRootEntity)

	oLayout = new QVBoxLayout()
	oLayout.AddWidget(oContainer)

	oWidget {
		setwindowtitle("Using Qt3D - Object Picker - Click on the Cube")
		resize(800,600)
		setLayout(oLayout)
		showMaximized()
	}

	oContainer.setfocus(0)

	exec()
}

func pKeyPress
	nKey = oFilter.getkeycode()
	oX = oCubeTransform.translation().x()
	oY = oCubeTransform.translation().y()
	oZ = oCubeTransform.translation().z()
	switch nKey
		on Qt_Key_Right
			oX++
		on Qt_Key_Left
			oX--
		on Qt_Key_Up
			oY++
		on Qt_Key_Down
			oY--
	off
	oCubeTransform.setTranslation(new QVector3D(oX, oY, oZ))

func pClick
	msginfo("Event","Click")
	oContainer.setfocus(0)
```

:alt: Qt3D Example - Object Picker

# Frame Action

```ring
load "guilib.ring"

new qApp {

	oView = new Qt3dwindow()

	oWidget = new QWidget()
	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer)

	oInput = new QInputAspect(oRootEntity)
		oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000.0)
		oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
		oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
		oCameraEntity.setViewCenter(new QVector3D(0, 0, 0))

	oLightEntity = new QEntity(oRootEntity)
		oLight = new QPointLight(oLightEntity)
	oLight.setColor(new QColor() { setRGB(255,255,255,255) })
	oLight.setIntensity(1)
	oLightEntity.addComponent(oLight)

	oLightTransform = new QTransform(oLightEntity)
	oLightTransform.setTranslation(oCameraEntity.position())
	oLightEntity.addComponent(oLightTransform)

	oCamController = new  QFirstPersonCameraController(oRootEntity)
		oCamController.setCamera(oCameraEntity)
	oCamController.setEnabled(False)

	oCube = new  QCuboidMesh(oRootEntity) {
		setXextent(1)
		setYextent(1)
		setZextent(1)
	}

	oCubeTransform = new  QTransform(oCube)
	oCubeTransform.setScale(2)
	oCubeTransform.setTranslation(new QVector3D(-5, -5, -5))

	oTextureLoader = new  QTextureLoader(oCube);
	oTextureLoader.setSource(
		new QUrl("file:///"+currentdir()+"/assets/texture/gold.jpg") )
	oCubeMaterial = new QTextureMaterial(oCube)
	oCubeMaterial.setTexture(oTextureLoader)

	oCubeEntity = new QEntity(oRootEntity)
	oCubeEntity.addComponent(oCube)
	oCubeEntity.addComponent(oCubeMaterial)
	oCubeEntity.addComponent(oCubeTransform)

	nAngle=0	nSpeed=0.1
	oFrameAction = new qFrameAction(oRootEntity) {
		settriggeredevent("pEvent()")
	}

	oView.setRootEntity(oRootEntity)

	oLayout = new QVBoxLayout()
	oLayout.AddWidget(oContainer)

	oWidget {
		setwindowtitle("Using Qt3D - Frame Action")
		resize(800,600)
		setLayout(oLayout)
		showMaximized()
	}

	exec()
}

func pEvent

	# Move the Cube
		oX = oCubeTransform.translation().x()
		oY = oCubeTransform.translation().y()
		oZ = oCubeTransform.translation().z()
		if oX >= 4
			nSpeed=-0.1
		but oX <= -10
			nSpeed=0.1
		ok
		oCubeTransform.setTranslation(
			new QVector3D(oX+nSpeed, oY+nSpeed, oZ+nSpeed))

	# Rotate the Cube
		nAngle+=5  if nAngle=360  nAngle=0 ok
		oQ = new QQuaternion(0,0,0,0)
		oCubeTransform.setRotation(
			oQ.fromAxisAndAngle(new QVector3D(0, 1, 0), nAngle))
```

:alt: Qt3D Example - Frame Action

# Text 2D

```ring
load "guilib.ring"

new qApp {

	oView = new Qt3dwindow()

	oWidget = new QWidget()
	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer)

	oView.defaultframegraph().setclearcolor(new QColor() {setRGB(100,250,150,255)})

	oInput = new QInputAspect(oRootEntity)
		oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000.0)
		oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
		oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
		oCameraEntity.setViewCenter(new QVector3D(0, 0, 0))

	oLightEntity = new QEntity(oRootEntity)
		oLight = new QPointLight(oLightEntity)
	oLight.setColor(new QColor() { setRGB(255,255,255,255) })
	oLight.setIntensity(1)
	oLightEntity.addComponent(oLight)

	oLightTransform = new QTransform(oLightEntity)
	oLightTransform.setTranslation(oCameraEntity.position())
	oLightEntity.addComponent(oLightTransform)

	oCamController = new  QFirstPersonCameraController(oRootEntity)
		oCamController.setCamera(oCameraEntity)

	oCube = new  QCuboidMesh(oRootEntity) {
		setXextent(2)
		setYextent(2)
		setZextent(3)
	}

	oCubeTransform = new  QTransform(oCube)
	oCubeTransform.setScale(2)
	oCubeTransform.setTranslation(new QVector3D(0, 3, 4))

	oTextureLoader = new  QTextureLoader(oCube);
	oTextureLoader.setSource(
		new QUrl("file:///"+currentdir()+"/assets/texture/ring.bmp") )
	oCubeMaterial = new QTextureMaterial(oCube)
	oCubeMaterial.setTexture(oTextureLoader)

	oCubeEntity = new QEntity(oRootEntity)
	oCubeEntity.addComponent(oCube)
	oCubeEntity.addComponent(oCubeMaterial)
	oCubeEntity.addComponent(oCubeTransform)


	oText2DEntity = new  QText2DEntity(oRootEntity) {
		setText("Ring programming language")
		setWidth(400) setHeight(40)
		setColor(new QColor() {setRGB(128,128,128,255)})
	}

	oText2DTransform = new  QTransform(oText2DEntity)
	oText2DTransform.setScale(0.1)
	oText2DTransform.setTranslation(new QVector3D(-10.5, -5, 0))

	oText2DEntity.addComponent(oText2DTransform)

	oView.setRootEntity(oRootEntity)

	oLayout = new QVBoxLayout()
	oLayout.AddWidget(oContainer)

	oWidget {
		setwindowtitle("Using Qt3D - Text2D")
		resize(800,600)
		setLayout(oLayout)
		showMaximized()
	}

	exec()
}
```

:alt: Qt3D Example - Text 2D

# Extruded Text

```ring
load "guilib.ring"

new qApp {

	oView = new Qt3dwindow()

	oWidget = new QWidget()
	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer)

	oView.defaultframegraph().setclearcolor(new QColor() {setRGB(100,250,150,255)})

	oInput = new QInputAspect(oRootEntity)
		oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000.0)
		oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
		oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
		oCameraEntity.setViewCenter(new QVector3D(0, 0, 0))

	oLightEntity = new QEntity(oRootEntity)
		oLight = new QPointLight(oLightEntity)
	oLight.setColor(new QColor() { setRGB(255,255,255,255) })
	oLight.setIntensity(1)
	oLightEntity.addComponent(oLight)

	oLightTransform = new QTransform(oLightEntity)
	oLightTransform.setTranslation(oCameraEntity.position())
	oLightEntity.addComponent(oLightTransform)

	oCamController = new  QFirstPersonCameraController(oRootEntity)
		oCamController.setCamera(oCameraEntity)

	oCube = new  QCuboidMesh(oRootEntity) {
		setXextent(2)
		setYextent(2)
		setZextent(3)
	}

	oCubeTransform = new  QTransform(oCube)
	oCubeTransform.setScale(2)
	oCubeTransform.setTranslation(new QVector3D(0, 3, 4))

	oTextureLoader = new  QTextureLoader(oCube);
	oTextureLoader.setSource(
		new QUrl("file:///"+currentdir()+"/assets/texture/ring.bmp") )
	oCubeMaterial = new QTextureMaterial(oCube)
	oCubeMaterial.setTexture(oTextureLoader)

	oCubeEntity = new QEntity(oRootEntity)
	oCubeEntity.addComponent(oCube)
	oCubeEntity.addComponent(oCubeMaterial)
	oCubeEntity.addComponent(oCubeTransform)

	oTextEntity = new QEntity(oRootEntity)

	oTextMesh = new  QExtrudedTextMesh(oTextEntity) {
		setText("Ring")
	}

	oTextTransform = new  QTransform(oTextEntity)
	oTextTransform.setScale(3)
	oTextTransform.setTranslation(new QVector3D(-5.5, -4, 3))

	oTextMaterial = new QPhongMaterial(oTextEntity);
	oTextMaterial.setDiffuse(new QColor() {setRGB(0,0,255,255)})

	oTextEntity.addComponent(oTextMesh)
	oTextEntity.addComponent(oTextTransform)
	oTextEntity.addComponent(oTextMaterial)

	oView.setRootEntity(oRootEntity)

	oLayout = new QVBoxLayout()
	oLayout.AddWidget(oContainer)

	oWidget {
		setwindowtitle("Using Qt3D - Extruded Text")
		resize(800,600)
		setLayout(oLayout)
		showMaximized()
	}

	exec()
}
```

:alt: Qt3D Example - Extruded Text

# Model

```ring
load "guilib.ring"

new qApp {

	oView = new Qt3dwindow()

	oWidget = new QWidget()
	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer)

	oInput = new QInputAspect(oRootEntity)
		oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000.0)
		oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
		oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
		oCameraEntity.setViewCenter(new QVector3D(0, 0, 0))

	oLightEntity = new QEntity(oRootEntity)
		oLight = new QPointLight(oLightEntity)
	oLight.setColor(new QColor() { setRGB(255,255,255,255) })
	oLight.setIntensity(1)
	oLightEntity.addComponent(oLight)

	oLightTransform = new QTransform(oLightEntity)
	oLightTransform.setTranslation(oCameraEntity.position())
	oLightEntity.addComponent(oLightTransform)

	oCamController = new  QFirstPersonCameraController(oRootEntity)
		oCamController.setCamera(oCameraEntity)

	oModel = new qmesh(oRootEntity)

	oModel.setsource(
		new qURL("file:///"+currentdir()+"/assets/model/lucky_cat.obj") )

	oModelTransform = new  QTransform(oModel)
	oModelTransform.setScale(0.1)
	oModelTransform.setTranslation(new QVector3D(0, 0, 0))
	oQ = new QQuaternion(0,0,0,0)
	oModelTransform.setRotation(oQ.fromAxisAndAngle(new QVector3D(0, 1, 0), 180))

	oModelMaterial = new QPhongMaterial(oModel)
	oModelMaterial.setDiffuse(new QColor() {setRGB(0,255,128,255)})

	oModelEntity = new QEntity(oRootEntity)
	oModelEntity.addComponent(oModel)
	oModelEntity.addComponent(oModelmaterial)
	oModelEntity.addComponent(oModelTransform)

	oView.setRootEntity(oRootEntity)

	oLayout = new QVBoxLayout()
	oLayout.AddWidget(oContainer)

	oWidget {
		setwindowtitle("Using Qt3D - Model (Obj File)")
		resize(800,600)
		setLayout(oLayout)
		showMaximized()
	}

	exec()
}
```

:alt: Qt3D Example - Model

# Model Texture

```ring
load "guilib.ring"

new qApp {

	oView = new Qt3dwindow()

	oWidget = new QWidget()
	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer)

	oInput = new QInputAspect(oRootEntity)
		oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000.0)
		oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
		oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
		oCameraEntity.setViewCenter(new QVector3D(0, 25, 0))

	oLightEntity = new QEntity(oRootEntity)
		oLight = new QPointLight(oLightEntity)
	oLight.setColor(new QColor() { setRGB(255,255,255,255) })
	oLight.setIntensity(1)
	oLightEntity.addComponent(oLight)

	oLightTransform = new QTransform(oLightEntity)
	oLightTransform.setTranslation(oCameraEntity.position())
	oLightEntity.addComponent(oLightTransform)

	oCamController = new  QFirstPersonCameraController(oRootEntity)
		oCamController.setCamera(oCameraEntity)

	oModel = new qmesh(oRootEntity)

	oModel.setsource(
		new qURL("file:///"+currentdir()+"/assets/model/Robot.obj") )

	oModelTransform = new  QTransform(oModel)
	oModelTransform.setScale(0.5)
	oModelTransform.setTranslation(new QVector3D(0, 12, 4))

	oLoader = new  QTextureLoader(oModel)
	oModelMaterial = new QTextureMaterial(oModel)
	oLoader.setSource(
		new QUrl("file:///"+currentdir()+"/assets/texture/Robot.jpg") )
	oModelMaterial.setTexture(oLoader)

	oModelEntity = new QEntity(oRootEntity)
	oModelEntity.addComponent(oModel)
	oModelEntity.addComponent(oModelMaterial)
	oModelEntity.addComponent(oModelTransform)

	oView.setRootEntity(oRootEntity)

	oLayout = new QVBoxLayout()
	oLayout.AddWidget(oContainer)

	oWidget {
		setwindowtitle("Using Qt3D - Model Texture")
		resize(800,600)
		setLayout(oLayout)
		showMaximized()
	}

	exec()
}
```

:alt: Qt3D Example - Model Texture

# Draw Office

```ring
load "guilib.ring"

new qApp {

	oView = new Qt3dwindow()

	oWidget = new QWidget()
	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer)

	oInput = new QInputAspect(oRootEntity)
		oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000.0)
		oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
		oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
		oCameraEntity.setViewCenter(new QVector3D(0, 0, 0))

	oLightEntity = new QEntity(oRootEntity)
		oLight = new QPointLight(oLightEntity)
	oLight.setColor(new QColor() { setRGB(255,255,255,255) })
	oLight.setIntensity(1)
	oLightEntity.addComponent(oLight)

	oLightTransform = new QTransform(oLightEntity)
	oLightTransform.setTranslation(oCameraEntity.position())
	oLightEntity.addComponent(oLightTransform)

	oCamController = new  QFirstPersonCameraController(oRootEntity)
		oCamController.setCamera(oCameraEntity)

	oModel = new qmesh(oRootEntity)

	oModel.setsource(
		new qURL("file:///"+currentdir()+"/assets/model/Reception_Table.obj") )

	oModelTransform = new  QTransform(oModel)
	oModelTransform.setScale(1)
	oModelTransform.setTranslation(new QVector3D(0, -2.5, 16))

	oModelMaterial = new QPhongMaterial(oModel)
	oModelMaterial.setDiffuse(new QColor() {setRGB(0,255,128,255)})

	oModelEntity = new QEntity(oRootEntity)
	oModelEntity.addComponent(oModel)
	oModelEntity.addComponent(oModelmaterial)
	oModelEntity.addComponent(oModelTransform)

	oView.setRootEntity(oRootEntity)

	oLayout = new QVBoxLayout()
	oLayout.AddWidget(oContainer)

	oWidget {
		setwindowtitle("Using Qt3D - Model (Obj File) - Office")
		resize(800,600)
		setLayout(oLayout)
		showMaximized()
	}

	exec()
}
```

:alt: Qt3D Example - Draw Office

# Many Objects

```ring
load "guilib.ring"

new qApp {

	oView = new Qt3dwindow()

	oWidget = new QWidget()
	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer)

	oInput = new QInputAspect(oRootEntity)
		oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000.0)
		oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
		oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
		oCameraEntity.setViewCenter(new QVector3D(0, 20, 0))

	oLightEntity = new QEntity(oRootEntity)
		oLight = new QPointLight(oLightEntity)
	oLight.setColor(new QColor() { setRGB(255,255,255,255) })
	oLight.setIntensity(1)
	oLightEntity.addComponent(oLight)

	oLightTransform = new QTransform(oLightEntity)
	oLightTransform.setTranslation(oCameraEntity.position())
	oLightEntity.addComponent(oLightTransform)

	oCamController = new  QFirstPersonCameraController(oRootEntity)
		oCamController.setCamera(oCameraEntity)

	oModel = new qmesh(oRootEntity)
	oModel.setsource(
		new qURL("file:///"+currentdir()+"/assets/model/Robot.obj") )

	oModelTransform = new  QTransform(oModel)
	oModelTransform.setScale(0.2)
	oModelTransform.setTranslation(new QVector3D(0, 10, 10))

	oModelMaterial = new QPhongMaterial(oModel)
	oModelMaterial.setDiffuse(new QColor() {setRGB(0,100,0,0)})

	oModelEntity = new QEntity(oRootEntity)
	oModelEntity.addComponent(oModel)

	oLoader = new  QTextureLoader(oModel);
	oModelMaterial = new QTextureMaterial(oModel)
	oLoader.setSource(
		new QUrl("file:///"+currentdir()+"/assets/texture/gold.jpg") )
	oModelMaterial.setTexture(oLoader)

	oModelEntity.addComponent(oModelMaterial)
	oModelEntity.addComponent(oModelTransform)

	for n = 1 to 10

		oTorus = new  QTorusMesh(oRootEntity)
			oTorus.setRadius(1.0*n)
			oTorus.setMinorRadius(0.4*n)
			oTorus.setRings(100)
			oTorus.setSlices(20)

		oTorusTransform = new  QTransform(null)
		oTorusTransform.setScale(2)
		oTorusTransform.setTranslation(new QVector3D(5.0*n, 4.0*n, 0.0))

		oTorusMaterial = new QPhongMaterial(null);
		oTorusMaterial.setDiffuse(new QColor() {setRGB(200,100,100,100)})

		oTorusEntity = new QEntity(oRootEntity)
		oTorusEntity.addComponent(oTorus)

		oLoader = new  QTextureLoader(oTorus);
		oTorusMaterial = new QTextureMaterial(oTorus)
		oLoader.setSource(
			new QUrl("file:///"+currentdir()+"/assets/texture/gold.jpg") )
		oTorusMaterial.setTexture(oLoader)

		oTorusEntity.addComponent(oTorusMaterial)
		oTorusEntity.addComponent(oTorusTransform)
	next

	oView.setRootEntity(oRootEntity)

	oLayout = new QVBoxLayout()
	oLayout.AddWidget(oContainer)

	oWidget {
		setwindowtitle("Using Qt3D - Many Objects")
		resize(800,600)
		setLayout(oLayout)
		showMaximized()
	}

	exec()
}
```

:alt: Qt3D Example - Many Objects

# Camera

```ring
load "guilib.ring"

new qApp {

	oView = new Qt3dwindow()

	oWidget = new QWidget()
	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer)

	oInput = new QInputAspect(oRootEntity)
		oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000.0)
		oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
		oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
		oCameraEntity.setViewCenter(new QVector3D(0, 20, 0))

	oLightEntity = new QEntity(oRootEntity)
		oLight = new QPointLight(oLightEntity)
	oLight.setColor(new QColor() { setRGB(255,255,255,255) })
	oLight.setIntensity(1)
	oLightEntity.addComponent(oLight)

	oLightTransform = new QTransform(oLightEntity)
	oLightTransform.setTranslation(oCameraEntity.position())
	oLightEntity.addComponent(oLightTransform)

	oCamController = new  QFirstPersonCameraController(oRootEntity)
		oCamController.setCamera(oCameraEntity)

	oModel = new qmesh(oRootEntity)
	oModel.setsource(
		new qURL("file:///"+currentdir()+"/assets/model/Robot.obj") )

	oModelTransform = new  QTransform(oModel)
	oModelTransform.setScale(0.2)
	oModelTransform.setTranslation(new QVector3D(0, 10, 10))

	oModelMaterial = new QPhongMaterial(oModel)
	oModelMaterial.setDiffuse(new QColor() {setRGB(0,100,0,0)})

	oModelEntity = new QEntity(oRootEntity)
	oModelEntity.addComponent(oModel)

	oLoader = new  QTextureLoader(oModel);
	oModelMaterial = new QTextureMaterial(oModel)
	oLoader.setSource(
		new QUrl("file:///"+currentdir()+"/assets/texture/gold.jpg") )
	oModelMaterial.setTexture(oLoader)

	oModelEntity.addComponent(oModelMaterial)
	oModelEntity.addComponent(oModelTransform)

	for n = 1 to 10

		oTorus = new  QTorusMesh(oRootEntity)
			oTorus.setRadius(1.0*n)
			oTorus.setMinorRadius(0.4*n)
			oTorus.setRings(100)
			oTorus.setSlices(20)

		oTorusTransform = new  QTransform(null)
		oTorusTransform.setScale(2)
		oTorusTransform.setTranslation(new QVector3D(5.0*n, 4.0*n, 0.0))

		oTorusMaterial = new QPhongMaterial(null);
		oTorusMaterial.setDiffuse(new QColor() {setRGB(200,100,100,100)})

		oTorusEntity = new QEntity(oRootEntity)
		oTorusEntity.addComponent(oTorus)

		oLoader = new  QTextureLoader(oTorus);
		oTorusMaterial = new QTextureMaterial(oTorus)
		oLoader.setSource(
			new QUrl("file:///"+currentdir()+"/assets/texture/gold.jpg") )
		oTorusMaterial.setTexture(oLoader)

		oTorusEntity.addComponent(oTorusMaterial)
		oTorusEntity.addComponent(oTorusTransform)
	next

	oView.setRootEntity(oRootEntity)


	btn1 = new qPushButton(oWidget) {
		setText("Move the Camera and the Robot") setClickEvent("pMove()")
	}

	oLayout = new QVBoxLayout()
	oLayout.AddWidget(oContainer)
	oLayout.AddWidget(btn1)

	oWidget {
		setwindowtitle("Using Qt3D - Camera")
		resize(800,600)
		setLayout(oLayout)
		showMaximized()
	}

	exec()
}

func pMove

	oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
		oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
		oCameraEntity.setViewCenter(new QVector3D(20, 15, 20))

	oModelTransform.setTranslation(new QVector3D(20, 15, 20))
	oQ = new QQuaternion(0,0,0,0)
	oModelTransform.setRotation(oQ.fromAxisAndAngle(new QVector3D(1, 1, 0), 270))
```

:alt: Qt3D Example - Camera

# Scence

```ring
load "guilib.ring"

new qApp {

	oWidget = new QWidget()

	oView = new Qt3DWindow()
	oView.defaultFrameGraph().setClearColor(new QColor() {setRGB(0,0,0,255)})

	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer)

	oInput = new QInputAspect(oRootEntity)
		oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000)
	oCameraEntity.setPosition(new QVector3D(-13.34, -6.43, 16.47))
		oCameraEntity.setUpVector(new QVector3D(0.02, 0, 1))
		oCameraEntity.setViewCenter(new QVector3D(-13.34, 17.05, 15.42))

	oCameraController = new  QFirstPersonCameraController(oRootEntity)
	oCameraController.setCamera(oCameraEntity)
	oCameraController.setEnabled(False)

	oLongRoomEntity = new QEntity(oRootEntity)

	oLongRoomModel = new QMesh(oLongRoomEntity)

	oLongRoomModel.setSource(
		new qURL("file:///"+CurrentDir()+"/assets/model/Long_Room.obj") )

	oLongRoomTransform = new  QTransform(oLongRoomEntity)
	oLongRoomTransform.setScale(1)
	oLongRoomTransform.setTranslation(new QVector3D(5, 0, 15))

	oLongRoomLoader = new  QTextureLoader(oLongRoomModel)
	oLongRoomMaterial = new QTextureMaterial(oLongRoomModel)
	oLongRoomLoader.setSource(
		new QUrl("file:///"+currentdir()+"/assets/texture/croc.jpg") )
	oLongRoomMaterial.setTexture(oLongRoomLoader)

	oLongRoomEntity.addComponent(oLongRoomModel)
	oLongRoomEntity.addComponent(oLongRoomMaterial)
	oLongRoomEntity.addComponent(oLongRoomTransform)

	oTableEntity = new QEntity(oRootEntity)

	oTableModel = new QMesh(oTableEntity)
	oTableModel.setSource(
		new qURL("file:///"+CurrentDir()+"/assets/model/Reception_Table.obj") )

	oTableTransform = new  QTransform(oTableEntity)
	oTableTransform.setScale(0.3)
	oTableTransform.setTranslation(new QVector3D(5, 0, 15))
	oQ = new QQuaternion(0,0,0,0)
	oTableTransform.setRotation(oQ.fromAxisAndAngle(new QVector3D(0, 1, 1), -180))

	oTableModelMaterial = new QPhongMaterial(oTableEntity)
	oTableModelMaterial.setDiffuse(new QColor() {setRGB(255,255,255,255)})

	oTableEntity.addComponent(oTableModel)
	oTableEntity.addComponent(oTableModelmaterial)
	oTableEntity.addComponent(oTableTransform)

	oFirstLightEntity = new QEntity(oRootEntity)

		oFirstLight = new QPointLight(oFirstLightEntity)
	oFirstLight.setColor(new qColor() { setRGB(128,128,128,128) })
	oFirstLight.setIntensity(1)

	oFirstLightTransform = new QTransform(oFirstLightEntity)
	oFirstLightTransform.setTranslation(new QVector3D(5, 0, 20))

	oFirstLightEntity.addComponent(oFirstLight)
	oFirstLightEntity.addComponent(oFirstLightTransform)

	aCats = list(5)
	for n = 1 to 5
	v = n * 0.1
	aCats[n] = []
	aCats[n][:oCatModelEntity] = new QEntity(oRootEntity)
	aCats[n][:oCatModel] = new QMesh(aCats[n][:oCatModelEntity])
	aCats[n][:oCatModel].setSource(
		new qURL("file:///"+CurrentDir()+"/assets/model/Lucky_Cat.obj") )
	aCats[n][:oCatModelMaterial] = new QPhongMaterial(aCats[n][:oCatModel])
	aCats[n][:oCatModelMaterial].setDiffuse(
		new QColor() {setRGB(255,255,255,255)})
	aCats[n][:oCatModelTransform] = new  QTransform(aCats[n][:oCatModelEntity])
	aCats[n][:oCatModelTransform].setScale(0.01)
	aCats[n][:oCatModelTransform].setTranslation(
		new QVector3D(-5*(v+v), 1, 15.2))
	oQ = new QQuaternion(0,0,0,0)
	aCats[n][:oCatModelTransform].setRotation(
		oQ.fromAxisAndAngle(
			new QVector3D(0, 1, 1), 180))
	aCats[n][:oCatModelEntity].addComponent(aCats[n][:oCatModel])
	aCats[n][:oCatModelEntity].addComponent(aCats[n][:oCatModelmaterial])
	aCats[n][:oCatModelEntity].addComponent(aCats[n][:oCatModelTransform])
	next

	oSecondLightEntity = new QEntity(oRootEntity)

	oSecondLight = new QPointLight(oSecondLightEntity)
	oSecondLight.setColor(new qColor() { setRGB(255,255,255,255) })
	oSecondLight.setIntensity(1)

	oSecondLightTransform = new QTransform(oSecondLightEntity)
	oSecondLightTransform.setTranslation(new QVector3D(-5, 1, 15.5))

	oSecondLightEntity.addComponent(oSecondLight)
	oSecondLightEntity.addComponent(oSecondLightTransform)

	oRobotEntity = new QEntity(oRootEntity)

	oRobotModel = new QMesh(oRobotEntity)
	oRobotModel.setSource(
		new qURL("file:///"+CurrentDir()+"/assets/model/Fat_Robot.obj") )
	oRobotTransform = new  QTransform(oRobotEntity)
	oRobotTransform.setScale(0.006)

	robotX = -15
	robotY = -2
	robotZ = 15

	oRobotTransform.setTranslation(new QVector3D(-15, -2, 15))
	oQ = new QQuaternion(0,0,0,0)
	oRobotTransform.setRotation(
		oQ.fromAxisAndAngle(new QVector3D(0, 1, 1), 170))

	oRobotMaterial = new QPhongMaterial(oRobotEntity)
	oRobotMaterial.setDiffuse(new QColor() {setRGB(128,128,128,255)})

	oRobotEntity.addComponent(oRobotModel)
	oRobotEntity.addComponent(oRobotTransform)
	oRobotEntity.addComponent(oRobotMaterial)

	oView.setRootEntity(oRootEntity)

	oWidget {
		setwindowtitle("Using Qt3D - Scene")
		showfullscreen()
	}

	oContainer.resize(oWidget.width(),oWidget.height())

		oFilter = new QAllEvents(oView)
		oFilter.setKeyPressEvent("pKeyPress()")
		oView.installeventfilter(oFilter)
	oContainer.setfocus(0)

	exec()

}

func pKeyPress

	nKey 	= oFilter.getKeyCode()
	nSpeed 	= 0.1
	cX 	= oCameraEntity.position().x()
	CY 	= oCameraEntity.position().y()
	cZ 	= oCameraEntity.position().z()
	cVCx 	= oCameraEntity.viewCenter().x()
	cVCy 	= oCameraEntity.viewCenter().y()
	cVCz 	= oCameraEntity.viewCenter().z()

	switch nKey
		on Qt_Key_Right
			if cX < 4.8
				robotX+= nSpeed
				oCameraEntity.setPosition(
					new QVector3D(cX+0.1, cY, cZ))
				oCameraEntity.setViewCenter(
					new QVector3D(cVCx+nSpeed, cVCy, cVCz))
				oRobotTransform.setRotation(
					oQ.fromAxisAndAngle(new QVector3D(0, 1, 1), 170))
			ok
		on Qt_Key_Left
			if cX > - 13.8
				robotX-= nSpeed
				oCameraEntity.setPosition(
				  new QVector3D(cX-0.1, cY, cZ))
				oCameraEntity.setViewCenter(
				  new QVector3D(cVCx-nSpeed, cVCy, cVCz))
				oRobotTransform.setRotation(
				  oQ.fromAxisAndAngle(new QVector3D(0, 1, 1), 160))
			ok
		on Qt_Key_Down
			if robotY > -3.5
				robotY-= nSpeed
				oCameraEntity.setPosition(
				  new QVector3D(cX, cY, cZ))
				oRobotTransform.setRotation(
				  oQ.fromAxisAndAngle(new QVector3D(0, 1, 1), 190))
			ok
		on Qt_Key_Up
			if robotY < 2
				robotY+= nSpeed
				oCameraEntity.setPosition(
				  new QVector3D(cX, cY, cZ))
				oRobotTransform.setRotation(
				  oQ.fromAxisAndAngle(new QVector3D(0, 1, 1), 180))
			ok
		on Qt_Key_Escape
			oWidget.close()
	off

	oRobotTransform.setTranslation(new QVector3D(robotX, robotY, robotZ))
```

:alt: Qt3D Example - Scene


## qtclassesdoc

# =
# RingQt Classes Reference

# AbstractAxis Class

Parameters : void

- Qt::Alignment alignment(void)
- QColor gridLineColor(void)
- QPen gridLinePen(void)
- void hide(void)
- bool isGridLineVisible(void)
- bool isLineVisible(void)
- bool isMinorGridLineVisible(void)
- bool isReverse(void)
- bool isTitleVisible(void)
- bool isVisible(void)
- int labelsAngle(void)
- QBrush labelsBrush(void)
- QColor labelsColor(void)
- QFont labelsFont(void)
- bool labelsVisible(void)
- QPen linePen(void)
- QColor linePenColor(void)
- QColor minorGridLineColor(void)
- QPen minorGridLinePen(void)
- Qt::Orientation orientation(void)
- void setGridLineColor(QColor color)
- void setGridLinePen(QPen pen)
- void setGridLineVisible(bool visible)
- void setLabelsAngle(int angle)
- void setLabelsBrush(QBrush brush)
- void setLabelsColor(QColor color)
- void setLabelsFont(QFont font)
- void setLabelsVisible(bool visible)
- void setLinePen(QPen pen)
- void setLinePenColor(QColor color)
- void setLineVisible(bool visible)
- void setMax(QVariant max)
- void setMin(QVariant min)
- void setMinorGridLineColor(QColor color)
- void setMinorGridLinePen(QPen pen)
- void setMinorGridLineVisible(bool visible)
- void setRange(QVariant min, QVariant max)
- void setReverse(bool reverse)
- void setShadesBorderColor(QColor color)
- void setShadesBrush(QBrush brush)
- void setShadesColor(QColor color)
- void setShadesPen(QPen pen)
- void setShadesVisible(bool visible)
- void setTitleBrush(QBrush brush)
- void setTitleFont(QFont font)
- void setTitleText(QString title)
- void setTitleVisible(bool visible)
- void setVisible(bool visible)
- QColor shadesBorderColor(void)
- QBrush shadesBrush(void)
- QColor shadesColor(void)
- QPen shadesPen(void)
- bool shadesVisible(void)
- void show(void)
- QBrush titleBrush(void)
- QFont titleFont(void)
- QString titleText(void)
- void setcolorChangedEvent(const char *)
- void setgridLineColorChangedEvent(const char *)
- void setgridLinePenChangedEvent(const char *)
- void setgridVisibleChangedEvent(const char *)
- void setlabelsAngleChangedEvent(const char *)
- void setlabelsBrushChangedEvent(const char *)
- void setlabelsColorChangedEvent(const char *)
- void setlabelsEditableChangedEvent(const char *)
- void setlabelsFontChangedEvent(const char *)
- void setlabelsVisibleChangedEvent(const char *)
- void setlinePenChangedEvent(const char *)
- void setlineVisibleChangedEvent(const char *)
- void setminorGridLineColorChangedEvent(const char *)
- void setminorGridLinePenChangedEvent(const char *)
- void setminorGridVisibleChangedEvent(const char *)
- void setreverseChangedEvent(const char *)
- void setshadesBorderColorChangedEvent(const char *)
- void setshadesBrushChangedEvent(const char *)
- void setshadesColorChangedEvent(const char *)
- void setshadesPenChangedEvent(const char *)
- void setshadesVisibleChangedEvent(const char *)
- void settitleBrushChangedEvent(const char *)
- void settitleFontChangedEvent(const char *)
- void settitleTextChangedEvent(const char *)
- void settitleVisibleChangedEvent(const char *)
- void setvisibleChangedEvent(const char *)
- const char *getcolorChangedEvent(void)
- const char *getgridLineColorChangedEvent(void)
- const char *getgridLinePenChangedEvent(void)
- const char *getgridVisibleChangedEvent(void)
- const char *getlabelsAngleChangedEvent(void)
- const char *getlabelsBrushChangedEvent(void)
- const char *getlabelsColorChangedEvent(void)
- const char *getlabelsEditableChangedEvent(void)
- const char *getlabelsFontChangedEvent(void)
- const char *getlabelsVisibleChangedEvent(void)
- const char *getlinePenChangedEvent(void)
- const char *getlineVisibleChangedEvent(void)
- const char *getminorGridLineColorChangedEvent(void)
- const char *getminorGridLinePenChangedEvent(void)
- const char *getminorGridVisibleChangedEvent(void)
- const char *getreverseChangedEvent(void)
- const char *getshadesBorderColorChangedEvent(void)
- const char *getshadesBrushChangedEvent(void)
- const char *getshadesColorChangedEvent(void)
- const char *getshadesPenChangedEvent(void)
- const char *getshadesVisibleChangedEvent(void)
- const char *gettitleBrushChangedEvent(void)
- const char *gettitleFontChangedEvent(void)
- const char *gettitleTextChangedEvent(void)
- const char *gettitleVisibleChangedEvent(void)
- const char *getvisibleChangedEvent(void)

# AbstractBarSeries Class

Parameters : void

Parent Class : AbstractSeries

- bool append(QBarSet *set)
- qreal barWidth(void)
- void clear(void)
- int count(void)
- bool insert(int index, QBarSet *set)
- bool isLabelsVisible(void)
- qreal labelsAngle(void)
- QString labelsFormat(void)
- QAbstractBarSeries::LabelsPosition labelsPosition(void)
- int labelsPrecision(void)
- bool remove(QBarSet *set)
- void setBarWidth(qreal width)
- void setLabelsAngle(qreal angle)
- void setLabelsFormat(QString format)
- void setLabelsPosition(QAbstractBarSeries::LabelsPosition position)
- void setLabelsPrecision(int precision)
- void setLabelsVisible(bool visible)
- bool take(QBarSet *set)
- void setbarsetsAddedEvent(const char *)
- void setbarsetsRemovedEvent(const char *)
- void setclickedEvent(const char *)
- void setcountChangedEvent(const char *)
- void setdoubleClickedEvent(const char *)
- void sethoveredEvent(const char *)
- void setlabelsAngleChangedEvent(const char *)
- void setlabelsFormatChangedEvent(const char *)
- void setlabelsPositionChangedEvent(const char *)
- void setlabelsPrecisionChangedEvent(const char *)
- void setlabelsVisibleChangedEvent(const char *)
- void setpressedEvent(const char *)
- void setreleasedEvent(const char *)
- const char *getbarsetsAddedEvent(void)
- const char *getbarsetsRemovedEvent(void)
- const char *getclickedEvent(void)
- const char *getcountChangedEvent(void)
- const char *getdoubleClickedEvent(void)
- const char *gethoveredEvent(void)
- const char *getlabelsAngleChangedEvent(void)
- const char *getlabelsFormatChangedEvent(void)
- const char *getlabelsPositionChangedEvent(void)
- const char *getlabelsPrecisionChangedEvent(void)
- const char *getlabelsVisibleChangedEvent(void)
- const char *getpressedEvent(void)
- const char *getreleasedEvent(void)

# CodeEditor Class

Parameters : QWidget *

Parent Class : QPlainTextEdit

- void setCompleter(QCompleter *c)
- QCompleter *completer(void)
- void setLineNumbersAreaColor(QColor oColor)
- void setLineNumbersAreaBackColor(QColor oColor)

# QAbstractAspect Class

C++ Reference : http://doc.qt.io/qt-5/qt3dcore-qabstractaspect.html

Parameters : QObject *

Parent Class : QObject

- void scheduleSingleShotJob(Qt3DCore::QAspectJobPtr job)

# QAbstractButton Class

C++ Reference : http://doc.qt.io/qt-5/qabstractbutton.html

Parameters : QWidget *parent

Parent Class : QWidget

- bool autoExclusive(void)
- bool autoRepeat(void)
- int autoRepeatDelay(void)
- int autoRepeatInterval(void)
- QButtonGroup *group(void)
- QIcon icon(void)
- QSize iconSize(void)
- bool isCheckable(void)
- bool isChecked(void)
- bool isDown(void)
- void setAutoExclusive(bool)
- void setAutoRepeat(bool)
- void setAutoRepeatDelay(int)
- void setAutoRepeatInterval(int)
- void setCheckable(bool)
- void setDown(bool)
- void setIcon(QIcon)
- void setShortcut(QKeySequence)
- void setText(QString)
- QKeySequence shortcut(void)
- QString text(void)
- void animateClick(int msec)
- void click(void)
- void setChecked(bool)
- void setIconSize(QSize)
- void toggle(void)

# QAbstractCameraController Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qabstractcameracontroller.html

Parent Class : QEntity

- float acceleration(void)
- Qt3DRender::QCamera * camera(void)
- float deceleration(void)
- float linearSpeed(void)
- float lookSpeed(void)
- void setAcceleration(float acceleration)
- void setCamera(Qt3DRender::QCamera *camera)
- void setDeceleration(float deceleration)
- void setLinearSpeed(float linearSpeed)
- void setLookSpeed(float lookSpeed)

# QAbstractGraphicsShapeItem Class

C++ Reference : http://doc.qt.io/qt-5/qabstractgraphicsshapeitem.html

Parameters : QGraphicsItem *

Parent Class : QGraphicsItem

- QBrush brush(void)
- QPen pen(void)
- void setBrush(QBrush brush)
- void setPen(QPen pen)

# QAbstractItemView Class

C++ Reference : http://doc.qt.io/qt-5/qabstractitemview.html

Parameters : QWidget *parent

Parent Class : QAbstractScrollArea

- bool alternatingRowColors(void)
- int autoScrollMargin(void)
- void closePersistentEditor(QModelIndex)
- QModelIndex currentIndex(void)
- int defaultDropAction(void)
- int dragDropMode(void)
- bool dragDropOverwriteMode(void)
- bool dragEnabled(void)
- int editTriggers(void)
- bool hasAutoScroll(void)
- int horizontalScrollMode(void)
- QSize iconSize(void)
- QModelIndex indexAt(QPoint)
- QWidget *indexWidget(QModelIndex)
- QAbstractItemDelegate *itemDelegate(QModelIndex)
- QAbstractItemDelegate *itemDelegateForColumn(int column)
- QAbstractItemDelegate *itemDelegateForRow(int row)
- void keyboardSearch(QString)
- QAbstractItemModel *model(void)
- void openPersistentEditor(QModelIndex)
- QModelIndex rootIndex(void)
- void scrollTo(QModelIndex,QAbstractItemView::ScrollHint)
- int selectionBehavior(void)
- int selectionMode(void)
- QItemSelectionModel *selectionModel(void)
- void setAlternatingRowColors(bool enable)
- void setAutoScroll(bool enable)
- void setAutoScrollMargin(int margin)
- void setDefaultDropAction(Qt::DropAction dropAction)
- void setDragDropMode(QAbstractItemView::DragDropMode behavior)
- void setDragDropOverwriteMode(bool overwrite)
- void setDragEnabled(bool enable)
- void setDropIndicatorShown(bool enable)
- void setEditTriggers(QAbstractItemView::EditTrigger triggers)
- void setHorizontalScrollMode(QAbstractItemView::ScrollMode mode)
- void setIconSize(QSize)
- void setIndexWidget(QModelIndex, QWidget *widget)
- void setItemDelegate(QAbstractItemDelegate *delegate)
- void setItemDelegateForColumn(int column, QAbstractItemDelegate *delegate)
- void setItemDelegateForRow(int row, QAbstractItemDelegate *delegate)
- void setModel(QAbstractItemModel *model)
- void setSelectionBehavior(QAbstractItemView::SelectionBehavior behavior)
- void setSelectionMode(QAbstractItemView::SelectionMode mode)
- void setSelectionModel(QItemSelectionModel *selectionModel)
- void setTabKeyNavigation(bool enable)
- void setTextElideMode(Qt::TextElideMode mode)
- void setVerticalScrollMode(QAbstractItemView::ScrollMode mode)
- bool showDropIndicator(void)
- int sizeHintForColumn(int column)
- QSize sizeHintForIndex(QModelIndex)
- int sizeHintForRow(int row)
- bool tabKeyNavigation(void)
- int textElideMode(void)
- int verticalScrollMode(void)
- QRect visualRect(QModelIndex)
- void clearSelection(void)
- void edit(QModelIndex)
- void scrollToBottom(void)
- void scrollToTop(void)
- void setCurrentIndex(QModelIndex)
- void update(QModelIndex)

# QAbstractPrintDialog Class

C++ Reference : http://doc.qt.io/qt-5/qabstractprintdialog.html

Parameters : QPrinter *,QWidget *

Parent Class : QDialog

- int fromPage(void)
- int maxPage(void)
- int minPage(void)
- QAbstractPrintDialog::PrintRange printRange(void)
- QPrinter * printer(void)
- void setFromTo(int from, int to)
- void setMinMax(int min, int max)
- void setOptionTabs(QList<QWidget *> tabs)
- void setPrintRange(QAbstractPrintDialog::PrintRange range)
- int toPage(void)

# QAbstractScrollArea Class

C++ Reference : http://doc.qt.io/qt-5/qabstractscrollarea.html

Parameters : QWidget *parent

Parent Class : QFrame

- void addScrollBarWidget(QWidget *widget, Qt::AlignmentFlag alignment)
- QWidget *cornerWidget(void)
- QScrollBar *horizontalScrollBar(void)
- int horizontalScrollBarPolicy(void)
- QSize maximumViewportSize(void)
- QWidgetList scrollBarWidgets(Qt::AlignmentFlag)
- void setCornerWidget(QWidget *widget)
- void setHorizontalScrollBar(QScrollBar *scrollBar)
- void setHorizontalScrollBarPolicy(Qt::ScrollBarPolicy)
- void setVerticalScrollBar(QScrollBar *scrollBar)
- void setVerticalScrollBarPolicy(Qt::ScrollBarPolicy)
- void setViewport(QWidget *widget)
- QScrollBar *verticalScrollBar(void)
- int verticalScrollBarPolicy(void)
- QWidget *viewport(void)

# QAbstractSeries Class

C++ Reference : http://doc.qt.io/qt-5/qabstractseries.html

Parameters : void

Parent Class : QObject

- bool attachAxis(QAbstractAxis *axis)
- QList<QAbstractAxis *> attachedAxes(void)
- QChart *chart(void)
- bool detachAxis(QAbstractAxis *axis)
- void hide(void)
- bool isVisible(void)
- QString name(void)
- qreal opacity(void)
- void setName(QString name)
- void setOpacity(qreal opacity)
- void setUseOpenGL(bool enable)
- void setVisible(bool visible)
- void show(void)
- bool useOpenGL(void)
- void setnameChangedEvent(const char *)
- void setopacityChangedEvent(const char *)
- void setuseOpenGLChangedEvent(const char *)
- void setvisibleChangedEvent(const char *)
- const char *getnameChangedEvent(void)
- const char *getopacityChangedEvent(void)
- const char *getuseOpenGLChangedEvent(void)
- const char *getvisibleChangedEvent(void)

# QAbstractSlider Class

C++ Reference : http://doc.qt.io/qt-5/qabstractslider.html

Parameters : QWidget *parent

Parent Class : QWidget

- bool hasTracking(void)
- bool invertedAppearance(void)
- bool invertedControls(void)
- bool isSliderDown(void)
- int maximum(void)
- int minimum(void)
- int orientation(void)
- int pageStep(void)
- void setInvertedAppearance(bool)
- void setInvertedControls(bool)
- void setMaximum(int)
- void setMinimum(int)
- void setPageStep(int)
- void setSingleStep(int)
- void setSliderDown(bool)
- void setSliderPosition(int)
- void setTracking(bool enable)
- int singleStep(void)
- int sliderPosition(void)
- void triggerAction(QAbstractSlider::SliderAction action)
- int value(void)
- void setOrientation(Qt::Orientation)
- void setRange(int min, int max)
- void setValue(int)

# QAbstractSocket Class

C++ Reference : http://doc.qt.io/qt-5/qabstractsocket.html

Parameters : void

Parent Class : QIODevice

- void abort(void)
- bool bind(QHostAddress address, int port, QAbstractSocket::BindFlag mode)
- void connectToHost(QString  hostName, int port, QIODevice::OpenModeFlag openMode, QAbstractSocket::NetworkLayerProtocol protocol)
- void disconnectFromHost(void)
- int error(void)
- bool flush(void)
- bool isValid(void)
- QHostAddress localAddress(void)
- int localPort(void)
- int pauseMode(void)
- QHostAddress peerAddress(void)
- QString peerName(void)
- int peerPort(void)
- QNetworkProxy proxy(void)
- int readBufferSize(void)
- void resume(void)
- void setPauseMode(QAbstractSocket::PauseMode pauseMode)
- void setProxy(QNetworkProxy  networkProxy)
- void setReadBufferSize(int size)
- bool setSocketDescriptor(qintptr socketDescriptor, QAbstractSocket::SocketState socketState, QIODevice::OpenModeFlag openMode)
- void setSocketOption(QAbstractSocket::SocketOption option,  QVariant  value)
- int *socketDescriptor(void)
- QVariant socketOption(QAbstractSocket::SocketOption option)
- int socketType(void)
- int state(void)
- bool waitForConnected(int msecs)
- bool waitForDisconnected(int msecs)
- bool atEnd(void)
- int bytesAvailable(void)
- int bytesToWrite(void)
- bool canReadLine(void)
- void close(void)
- bool isSequential(void)
- bool waitForBytesWritten(int msecs)
- bool waitForReadyRead(int msecs)
- void setconnectedEvent(const char *)
- void setdisconnectedEvent(const char *)
- void seterrorEvent(const char *)
- void sethostFoundEvent(const char *)
- void setproxyAuthenticationRequiredEvent(const char *)
- void setstateChangedEvent(const char *)
- const char *getconnectedEvent(void)
- const char *getdisconnectedEvent(void)
- const char *geterrorEvent(void)
- const char *gethostFoundEvent(void)
- const char *getproxyAuthenticationRequiredEvent(void)
- const char *getstateChangedEvent(void)

# QAbstractSpinBox Class

C++ Reference : http://doc.qt.io/qt-5/qabstractspinbox.html

Parameters : QWidget *parent

Parent Class : QWidget

- int alignment(void)
- int buttonSymbols(void)
- int correctionMode(void)
- bool hasAcceptableInput(void)
- bool hasFrame(void)
- void interpretText(void)
- bool isAccelerated(void)
- bool isReadOnly(void)
- bool keyboardTracking(void)
- void setAccelerated(bool on)
- void setAlignment(Qt::AlignmentFlag flag)
- void setButtonSymbols(QAbstractSpinBox::ButtonSymbols bs)
- void setCorrectionMode(QAbstractSpinBox::CorrectionMode cm)
- void setFrame(bool)
- void setKeyboardTracking(bool kt)
- void setReadOnly(bool r)
- void setSpecialValueText(QString)
- void setWrapping(bool w)
- QString specialValueText(void)
- void stepBy(int steps)
- QString text(void)
- bool wrapping(void)
- void clear(void)
- void selectAll(void)
- void stepDown(void)
- void stepUp(void)

# QAction Class

C++ Reference : http://doc.qt.io/qt-5/qaction.html

Parameters : QWidget *parent

- QActionGroup *actionGroup(void)
- void activate(QAction::ActionEvent event)
- bool autoRepeat(void)
- QVariant data(void)
- QFont font(void)
- QIcon icon(void)
- QString iconText(void)
- bool isCheckable(void)
- bool isChecked(void)
- bool isEnabled(void)
- bool isIconVisibleInMenu(void)
- bool isSeparator(void)
- bool isVisible(void)
- QMenu *menu(void)
- int menuRole(void)
- QWidget *parentWidget(void)
- int priority(void)
- void setActionGroup(QActionGroup *group)
- void setAutoRepeat(bool)
- void setCheckable(bool)
- void setData(QVariant)
- void setFont(QFont)
- void setIcon(QIcon)
- void setIconText(QString)
- void setIconVisibleInMenu(bool visible)
- void setMenu(QMenu *menu)
- void setMenuRole(QAction::MenuRole menuRole)
- void setPriority(QAction::Priority priority)
- void setSeparator(bool b)
- void setShortcut(QKeySequence)
- void setShortcutContext(Qt::ShortcutContext context)
- void setShortcuts(QKeySequence::StandardKey key)
- void setStatusTip(QString)
- void setText(QString)
- void setToolTip(QString)
- void setWhatsThis(QString)
- QKeySequence shortcut(void)
- int shortcutContext(void)
- bool showStatusText(QWidget *widget)
- QString statusTip(void)
- QString text(void)
- QString toolTip(void)
- QString whatsThis(void)
- void hover(void)
- void setChecked(bool)
- void setDisabled(bool)
- void setEnabled(bool)
- void setVisible(bool)
- void toggle(void)
- void trigger(void)
- void setClickEvent(const char *)
- const char *getClickEvent(void)

# QAllEvents Class

Parameters : QWidget *

Parent Class : QWidget

- void accept(void)
- void ignore(void)
- int getKeyCode(void)
- QString getKeyText(void)
- int getModifiers(void)
- int getx(void)
- int gety(void)
- int getglobalx(void)
- int getglobaly(void)
- int getbutton(void)
- int getbuttons(void)
- void setKeyPressEvent(const char *cStr)
- void setMouseButtonPressEvent(const char *cStr)
- void setMouseButtonReleaseEvent(const char *cStr)
- void setMouseButtonDblClickEvent(const char *cStr)
- void setMouseMoveEvent(const char *cStr)
- void setCloseEvent(const char *cStr)
- void setContextMenuEvent(const char *cStr)
- void setDragEnterEvent(const char *cStr)
- void setDragLeaveEvent(const char *cStr)
- void setDragMoveEvent(const char *cStr)
- void setDropEvent(const char *cStr)
- void setEnterEvent(const char *cStr)
- void setFocusInEvent(const char *cStr)
- void setFocusOutEvent(const char *cStr)
- void setKeyReleaseEvent(const char *cStr)
- void setLeaveEvent(const char *cStr)
- void setNonClientAreaMouseButtonDblClickEvent(const char *cStr)
- void setNonClientAreaMouseButtonPressEvent(const char *cStr)
- void setNonClientAreaMouseButtonReleaseEvent(const char *cStr)
- void setNonClientAreaMouseMoveEvent(const char *cStr)
- void setMoveEvent(const char *cStr)
- void setResizeEvent(const char *cStr)
- void setWindowActivateEvent(const char *cStr)
- void setWindowBlockedEvent(const char *cStr)
- void setWindowDeactivateEvent(const char *cStr)
- void setWindowStateChangeEvent(const char *cStr)
- void setWindowUnblockedEvent(const char *cStr)
- void setPaintEvent(const char *cStr)
- void setChildAddedEvent(const char *cStr)
- void setChildPolishedEvent(const char *cStr)
- void setChildRemovedEvent(const char *cStr)
- const char *getKeyPressEvent(void)
- const char *getMouseButtonPressEvent(void)
- const char *getMouseButtonReleaseEvent(void)
- const char *getMouseButtonDblClickEvent(void)
- const char *getMouseMoveEvent(void)
- const char *getCloseEvent(void)
- const char *getContextMenuEvent(void)
- const char *getDragEnterEvent(void)
- const char *getDragLeaveEvent(void)
- const char *getDragMoveEvent(void)
- const char *getDropEvent(void)
- const char *getEnterEvent(void)
- const char *getFocusInEvent(void)
- const char *getFocusOutEvent(void)
- const char *getKeyReleaseEvent(void)
- const char *getLeaveEvent(void)
- const char *getNonClientAreaMouseButtonDblClickEvent(void)
- const char *getNonClientAreaMouseButtonPressEvent(void)
- const char *getNonClientAreaMouseButtonReleaseEvent(void)
- const char *getNonClientAreaMouseMoveEvent(void)
- const char *getMoveEvent(void)
- const char *getResizeEvent(void)
- const char *getWindowActivateEvent(void)
- const char *getWindowBlockedEvent(void)
- const char *getWindowDeactivateEvent(void)
- const char *getWindowStateChangeEvent(void)
- const char *getWindowUnblockedEvent(void)
- const char *getPaintEvent(void)
- const char *getChildAddedEvent(void)
- const char *getChildPolishedEvent(void)
- const char *getChildRemovedEvent(void)
- void setEventOutput(bool x)
- QObject *getParentObject(void)
- QWidget *getParentWidget(void)
- void setKeyPressFunc(const char *cStr)
- void setMouseButtonPressFunc(const char *cStr)
- void setMouseButtonReleaseFunc(const char *cStr)
- void setMouseButtonDblClickFunc(const char *cStr)
- void setMouseMoveFunc(const char *cStr)
- void setCloseFunc(const char *cStr)
- void setContextMenuFunc(const char *cStr)
- void setDragEnterFunc(const char *cStr)
- void setDragLeaveFunc(const char *cStr)
- void setDragMoveFunc(const char *cStr)
- void setDropFunc(const char *cStr)
- void setEnterFunc(const char *cStr)
- void setFocusInFunc(const char *cStr)
- void setFocusOutFunc(const char *cStr)
- void setKeyReleaseFunc(const char *cStr)
- void setLeaveFunc(const char *cStr)
- void setNonClientAreaMouseButtonDblClickFunc(const char *cStr)
- void setNonClientAreaMouseButtonPressFunc(const char *cStr)
- void setNonClientAreaMouseButtonReleaseFunc(const char *cStr)
- void setNonClientAreaMouseMoveFunc(const char *cStr)
- void setMoveFunc(const char *cStr)
- void setResizeFunc(const char *cStr)
- void setWindowActivateFunc(const char *cStr)
- void setWindowBlockedFunc(const char *cStr)
- void setWindowDeactivateFunc(const char *cStr)
- void setWindowStateChangeFunc(const char *cStr)
- void setWindowUnblockedFunc(const char *cStr)
- void setPaintFunc(const char *cStr)
- void setChildAddedFunc(const char *cStr)
- void setChildPolishedFunc(const char *cStr)
- void setChildRemovedFunc(const char *cStr)
- const char *getKeyPressFunc(void)
- const char *getMouseButtonPressFunc(void)
- const char *getMouseButtonReleaseFunc(void)
- const char *getMouseButtonDblClickFunc(void)
- const char *getMouseMoveFunc(void)
- const char *getCloseFunc(void)
- const char *getContextMenuFunc(void)
- const char *getDragEnterFunc(void)
- const char *getDragLeaveFunc(void)
- const char *getDragMoveFunc(void)
- const char *getDropFunc(void)
- const char *getEnterFunc(void)
- const char *getFocusInFunc(void)
- const char *getFocusOutFunc(void)
- const char *getKeyReleaseFunc(void)
- const char *getLeaveFunc(void)
- const char *getNonClientAreaMouseButtonDblClickFunc(void)
- const char *getNonClientAreaMouseButtonPressFunc(void)
- const char *getNonClientAreaMouseButtonReleaseFunc(void)
- const char *getNonClientAreaMouseMoveFunc(void)
- const char *getMoveFunc(void)
- const char *getResizeFunc(void)
- const char *getWindowActivateFunc(void)
- const char *getWindowBlockedFunc(void)
- const char *getWindowDeactivateFunc(void)
- const char *getWindowStateChangeFunc(void)
- const char *getWindowUnblockedFunc(void)
- const char *getPaintFunc(void)
- const char *getChildAddedFunc(void)
- const char *getChildPolishedFunc(void)
- const char *getChildRemovedFunc(void)
- QDropEvent *getDropEventObject(void)
- QDragMoveEvent *getDragMoveEventObject(void)
- QDragEnterEvent *getDragEnterEventObject(void)
- QDragLeaveEvent *getDragLeaveEventObject(void)
- QChildEvent *getChildEventObject(void)

# QApp Class

C++ Reference : http://doc.qt.io/qt-5/qapplication.html

Parent Class : QGuiApplication

- void exec(void)
- void quit(void)
- void processEvents(void)
- void styleWindows(void)
- void styleWindowsVista(void)
- void styleFusion(void)
- void styleFusionBlack(void)
- void styleFusionCustom(QColor,QColor,QColor,QColor,QColor,QColor,QColor,QColor,QColor,QColor,QColor,QColor)
- void closeAllWindows(void)
- Qt::KeyboardModifiers keyboardModifiers(void)
- QClipboard *clipboard(void)
- QStyle *style(void)
- void aboutQt(void)
- QWidget *activeModalWidget(void)
- QWidget *activePopupWidget(void)
- QWidget *activeWindow(void)
- QWidget *focusWidget(void)
- double titlebarHeight(void)

# QAreaLegendMarker Class

C++ Reference : http://doc.qt.io/qt-5/qarealegendmarker.html

Parent Class : QLegendMarker

- QAreaSeries * series(void)
- QLegendMarker::LegendMarkerType type(void)

# QAreaSeries Class

C++ Reference : http://doc.qt.io/qt-5/qareaseries.html

Parameters : QObject *

Parent Class : QAbstractSeries

- QColor borderColor(void)
- QBrush brush(void)
- QColor color(void)
- QLineSeries * lowerSeries(void)
- QPen pen(void)
- bool pointLabelsClipping(void)
- QColor pointLabelsColor(void)
- QFont pointLabelsFont(void)
- QString pointLabelsFormat(void)
- bool pointLabelsVisible(void)
- bool pointsVisible(void)
- void setBorderColor(QColor color)
- void setBrush(QBrush brush)
- void setColor(QColor color)
- void setLowerSeries(QLineSeries *series)
- void setPen(QPen pen)
- void setPointLabelsClipping(bool enabled)
- void setPointLabelsColor(QColor color)
- void setPointLabelsFont(QFont font)
- void setPointLabelsFormat(QString format)
- void setPointLabelsVisible(bool visible)
- void setPointsVisible(bool visible)
- void setUpperSeries(QLineSeries *series)
- QLineSeries * upperSeries(void)
- void setborderColorChangedEvent(const char *)
- void setclickedEvent(const char *)
- void setcolorChangedEvent(const char *)
- void setdoubleClickedEvent(const char *)
- void sethoveredEvent(const char *)
- void setpointLabelsClippingChangedEvent(const char *)
- void setpointLabelsColorChangedEvent(const char *)
- void setpointLabelsFontChangedEvent(const char *)
- void setpointLabelsFormatChangedEvent(const char *)
- void setpointLabelsVisibilityChangedEvent(const char *)
- void setpressedEvent(const char *)
- void setreleasedEvent(const char *)
- const char *getborderColorChangedEvent(void)
- const char *getclickedEvent(void)
- const char *getcolorChangedEvent(void)
- const char *getdoubleClickedEvent(void)
- const char *gethoveredEvent(void)
- const char *getpointLabelsClippingChangedEvent(void)
- const char *getpointLabelsColorChangedEvent(void)
- const char *getpointLabelsFontChangedEvent(void)
- const char *getpointLabelsFormatChangedEvent(void)
- const char *getpointLabelsVisibilityChangedEvent(void)
- const char *getpressedEvent(void)
- const char *getreleasedEvent(void)

# QAspectEngine Class

C++ Reference : http://doc.qt.io/qt-5/qt3dcore-qaspectengine.html

Parameters : QObject *

Parent Class : QObject

- QVector<Qt3DCore::QAbstractAspect *> aspects(void)
- QVariant executeCommand(QString command)
- void registerAspect(Qt3DCore::QAbstractAspect *aspect)
- void registerAspect_2(QString name)
- Qt3DCore::QEntityPtr rootEntity(void)
- void setRootEntity(Qt3DCore::QEntityPtr root)
- void unregisterAspect(Qt3DCore::QAbstractAspect *aspect)
- void unregisterAspect_2(QString name)

# QAudioDeviceInfo Class

C++ Reference : http://doc.qt.io/qt-5/qaudiodeviceinfo.html

Parameters : void

- QString deviceName(void)
- bool isFormatSupported(QAudioFormat settings)
- bool isNull(void)
- QAudioFormat nearestFormat(QAudioFormat settings)
- QAudioFormat preferredFormat(void)
- QList<int> supportedChannelCounts(void)
- QStringList supportedCodecs(void)
- QList<int> supportedSampleRates(void)
- QList<int> supportedSampleSizes(void)
- QList<QAudioFormat::SampleType> supportedSampleTypes(void)
- QList<QAudioFormat::Endian> supportedByteOrders(void)

# QAudioFormat Class

C++ Reference : http://doc.qt.io/qt-5/qaudioformat.html

Parameters : void

- QAudioFormat::Endian byteOrder(void)
- int channelCount(void)
- QString codec(void)
- bool isValid(void)
- int sampleRate(void)
- int sampleSize(void)
- QAudioFormat::SampleType sampleType(void)
- void setByteOrder(QAudioFormat::Endian byteOrder)
- void setChannelCount(int channels)
- void setCodec(QString codec)
- void setSampleRate(int samplerate)
- void setSampleSize(int sampleSize)
- void setSampleType(QAudioFormat::SampleType sampleType)

# QAudioInput Class

C++ Reference : http://doc.qt.io/qt-5/qaudioinput.html

Parameters : const QAudioFormat &

Parent Class : QObject

- int bufferSize(void)
- int bytesReady(void)
- qint64 elapsedUSecs(void)
- QAudio::Error error(void)
- QAudioFormat format(void)
- int notifyInterval(void)
- int periodSize(void)
- qint64 processedUSecs(void)
- void reset(void)
- void resume(void)
- void setBufferSize(int value)
- void setNotifyInterval(int ms)
- void setVolume(qreal volume)
- void start(QIODevice *device)
- QIODevice *start_2(void)
- QAudio::State state(void)
- void stop(void)
- void suspend(void)
- qreal volume(void)
- void setstateChangedEvent(const char *)
- void setnotifyEvent(const char *)
- const char *getstateChangedEvent(void)
- const char *getnotifyEvent(void)

# QAudioOutput Class

C++ Reference : http://doc.qt.io/qt-5/qaudiooutput.html

Parameters : void

- void setVolume(float volume)

# QAudioProbe Class

C++ Reference : http://doc.qt.io/qt-5/qaudioprobe.html

Parameters : QObject *

Parent Class : QObject

- bool isActive(void)
- bool setSource(QMediaObject *source)
- bool setSource_2(QMediaRecorder *source)
- void setaudioBufferProbedEvent(const char *)
- void setflushEvent(const char *)
- const char *getaudioBufferProbedEvent(void)
- const char *getflushEvent(void)

# QAudioRecorder Class

C++ Reference : http://doc.qt.io/qt-5/qaudiorecorder.html

Parameters : QObject *

Parent Class : QMediaRecorder

- QString audioInput(void)
- QString audioInputDescription(QString name)
- QStringList audioInputs(void)
- QString defaultAudioInput(void)
- void setAudioInput(QString name)
- void setaudioInputChangedEvent(const char *)
- void setavailableAudioInputsChangedEvent(const char *)
- const char *getaudioInputChangedEvent(void)
- const char *getavailableAudioInputsChangedEvent(void)

# QAxBase Class

C++ Reference : http://doc.qt.io/qt-5/qaxbase.html

Parameters : QWidget *

Parent Class : QObject

- QVariant asVariant(void)
- QString control(void)
- void disableClassInfo(void)
- void disableEventSink(void)
- void disableMetaObject(void)
- QVariant dynamicCall(char *function)
- QVariant dynamicCall_2(char *function,QVariant)
- QVariant dynamicCall_3(char *function,QVariant,QVariant)
- QVariant dynamicCall_4(char *function,QVariant,QVariant,QVariant)
- QVariant dynamicCall_5(char *function,QVariant,QVariant,QVariant,QVariant)
- QVariant dynamicCall_6(char *function,QVariant,QVariant,QVariant,QVariant,QVariant)
- QVariant dynamicCall_7(char *function,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant)
- QVariant dynamicCall_8(char *function,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant)
- QVariant dynamicCall_9(char *function,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant)
- QVariant dynamicCall_10(const char *function, QList<QVariant> )
- QString generateDocumentation(void)
- bool isNull(void)
- QAxObject *querySubObject(const char *name)
- QAxObject *querySubObject_2(const char *name,QVariant)
- QAxObject *querySubObject_3(const char *name,QVariant,QVariant)
- QAxObject *querySubObject_4(const char *name,QVariant,QVariant,QVariant)
- QAxObject *querySubObject_5(const char *name,QVariant,QVariant,QVariant,QVariant)
- QAxObject *querySubObject_6(const char *name,QVariant,QVariant,QVariant,QVariant,QVariant)
- QAxObject *querySubObject_7(const char *name,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant)
- QAxObject *querySubObject_8(const char *name,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant)
- QAxObject *querySubObject_9(const char *name,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant)
- bool setControl( QString  )
- QStringList verbs(void)

# QAxObject Class

C++ Reference : http://doc.qt.io/qt-5/qaxobject.html

Parameters : QString

Parent Class : QAxBase

- bool doVerb(QString)

# QAxWidget Class

C++ Reference : http://doc.qt.io/qt-5/qaxwidget.html

Parameters : QWidget *parent, Qt::WindowFlags f

Parent Class : QAxBase

- bool doVerb(QString)

# QAxWidget2 Class

Parameters : QString c, QWidget *parent, Qt::WindowFlags f

Parent Class : QAxWidget

# QBarCategoryAxis Class

C++ Reference : http://doc.qt.io/qt-5/qbarcategoryaxis.html

Parameters : QObject *

Parent Class : QAbstractAxis

- void append(QStringList categories)
- void append_2(QString category)
- QString at(int index)
- QStringList categories(void)
- void clear(void)
- int count(void)
- void insert(int index, QString category)
- QString max(void)
- QString min(void)
- void remove(QString category)
- void replace(QString oldCategory, QString newCategory)
- void setCategories(QStringList categories)
- void setMax(QString max)
- void setMin(QString min)
- void setRange(QString minCategory, QString maxCategory)
- void setcategoriesChangedEvent(const char *)
- void setcountChangedEvent(const char *)
- void setmaxChangedEvent(const char *)
- void setminChangedEvent(const char *)
- void setrangeChangedEvent(const char *)
- const char *getcategoriesChangedEvent(void)
- const char *getcountChangedEvent(void)
- const char *getmaxChangedEvent(void)
- const char *getminChangedEvent(void)
- const char *getrangeChangedEvent(void)

# QBarLegendMarker Class

C++ Reference : http://doc.qt.io/qt-5/qbarlegendmarker.html

Parent Class : QLegendMarker

- QBarSet * barset(void)
- QAbstractBarSeries * series(void)

# QBarSeries Class

C++ Reference : http://doc.qt.io/qt-5/qbarseries.html

Parameters : QObject *

Parent Class : QAbstractBarSeries

- QAbstractSeries::SeriesType type(void)

# QBarSet Class

C++ Reference : http://doc.qt.io/qt-5/qbarset.html

Parameters : QString,QObject *

Parent Class : QObject

- void append(qreal value)
- void append_2(QList<qreal> values)
- qreal at(int index)
- QColor borderColor(void)
- QBrush brush(void)
- QColor color(void)
- int count(void)
- void insert(int index, qreal value)
- QString label(void)
- QBrush labelBrush(void)
- QColor labelColor(void)
- QFont labelFont(void)
- QPen pen(void)
- void remove(int index, int count)
- void replace(int index, qreal value)
- void setBorderColor(QColor color)
- void setBrush(QBrush brush)
- void setColor(QColor color)
- void setLabel(QString label)
- void setLabelBrush(QBrush brush)
- void setLabelColor(QColor color)
- void setLabelFont(QFont font)
- void setPen(QPen pen)
- qreal sum(void)
- void setborderColorChangedEvent(const char *)
- void setbrushChangedEvent(const char *)
- void setclickedEvent(const char *)
- void setcolorChangedEvent(const char *)
- void setdoubleClickedEvent(const char *)
- void sethoveredEvent(const char *)
- void setlabelBrushChangedEvent(const char *)
- void setlabelChangedEvent(const char *)
- void setlabelColorChangedEvent(const char *)
- void setlabelFontChangedEvent(const char *)
- void setpenChangedEvent(const char *)
- void setpressedEvent(const char *)
- void setreleasedEvent(const char *)
- void setvalueChangedEvent(const char *)
- void setvaluesAddedEvent(const char *)
- void setvaluesRemovedEvent(const char *)
- const char *getborderColorChangedEvent(void)
- const char *getbrushChangedEvent(void)
- const char *getclickedEvent(void)
- const char *getcolorChangedEvent(void)
- const char *getdoubleClickedEvent(void)
- const char *gethoveredEvent(void)
- const char *getlabelBrushChangedEvent(void)
- const char *getlabelChangedEvent(void)
- const char *getlabelColorChangedEvent(void)
- const char *getlabelFontChangedEvent(void)
- const char *getpenChangedEvent(void)
- const char *getpressedEvent(void)
- const char *getreleasedEvent(void)
- const char *getvalueChangedEvent(void)
- const char *getvaluesAddedEvent(void)
- const char *getvaluesRemovedEvent(void)

# QBitmap Class

C++ Reference : http://doc.qt.io/qt-5/qbitmap.html

Parameters : void

Parent Class : QPixmap

- void clear(void)
- void swap(QBitmap)
- QBitmap transformed(QTransform)
- QBitmap fromData(QSize, const uchar * bits, QImage::Format monoFormat)
- QBitmap fromImage(QImage, Qt::ImageConversionFlags flags)

# QBluetoothAddress Class

C++ Reference : http://doc.qt.io/qt-5/qbluetoothaddress.html

Parameters : void

- void clear(void)
- bool isNull(void)
- QString toString(void)
- quint64 toUInt64(void)

# QBluetoothDeviceDiscoveryAgent Class

C++ Reference : http://doc.qt.io/qt-5/qbluetoothdevicediscoveryagent.html

Parameters : QObject *

- QList<QBluetoothDeviceInfo> discoveredDevices(void)
- QBluetoothDeviceDiscoveryAgent::Error error(void)
- QString errorString(void)
- QBluetoothDeviceDiscoveryAgent::InquiryType inquiryType(void)
- bool isActive(void)
- void setInquiryType(QBluetoothDeviceDiscoveryAgent::InquiryType type)
- void start(void)
- void stop(void)
- void setcanceledEvent(const char *)
- void setdeviceDiscoveredEvent(const char *)
- void seterrorEvent(const char *)
- void setfinishedEvent(const char *)
- const char *getcanceledEvent(void)
- const char *getdeviceDiscoveredEvent(void)
- const char *geterrorEvent(void)
- const char *getfinishedEvent(void)

# QBluetoothDeviceInfo Class

C++ Reference : http://doc.qt.io/qt-5/qbluetoothdeviceinfo.html

Parameters : void

- QBluetoothAddress address(void)
- bool isCached(void)
- bool isValid(void)
- QBluetoothDeviceInfo::MajorDeviceClass majorDeviceClass(void)
- quint8 minorDeviceClass(void)
- QString name(void)
- qint16 rssi(void)
- QBluetoothDeviceInfo::ServiceClasses serviceClasses(void)
- QList<QBluetoothUuid> serviceUuids(QBluetoothDeviceInfo::DataCompleteness *completeness)
- QBluetoothDeviceInfo::DataCompleteness serviceUuidsCompleteness(void)
- void setCached(bool cached)
- void setRssi(qint16 signal)
- void setServiceUuids(QList<QBluetoothUuid> uuids, QBluetoothDeviceInfo::DataCompleteness completeness)

# QBluetoothHostInfo Class

C++ Reference : http://doc.qt.io/qt-5/qbluetoothhostinfo.html

Parameters : void

- QBluetoothAddress address(void)
- QString name(void)
- void setAddress(QBluetoothAddress address)
- void setName(QString name)

# QBluetoothLocalDevice Class

C++ Reference : http://doc.qt.io/qt-5/qbluetoothlocaldevice.html

Parameters : QObject *

- QBluetoothAddress address(void)
- QBluetoothLocalDevice::HostMode hostMode(void)
- bool isValid(void)
- QString name(void)
- QBluetoothLocalDevice::Pairing pairingStatus(QBluetoothAddress address)
- void powerOn(void)
- void requestPairing(QBluetoothAddress address, QBluetoothLocalDevice::Pairing pairing)
- void setHostMode(QBluetoothLocalDevice::HostMode mode)
- void pairingConfirmation(bool accept)
- QList<QBluetoothHostInfo> allDevices(void)
- void setdeviceConnectedEvent(const char *)
- void setdeviceDisconnectedEvent(const char *)
- void seterrorEvent(const char *)
- void sethostModeStateChangedEvent(const char *)
- void setpairingDisplayConfirmationEvent(const char *)
- void setpairingDisplayPinCodeEvent(const char *)
- void setpairingFinishedEvent(const char *)
- const char *getdeviceConnectedEvent(void)
- const char *getdeviceDisconnectedEvent(void)
- const char *geterrorEvent(void)
- const char *gethostModeStateChangedEvent(void)
- const char *getpairingDisplayConfirmationEvent(void)
- const char *getpairingDisplayPinCodeEvent(void)
- const char *getpairingFinishedEvent(void)

# QBluetoothServer Class

C++ Reference : http://doc.qt.io/qt-5/qbluetoothserver.html

Parameters : QBluetoothServiceInfo::Protocol,QObject *

Parent Class : QObject

- void close(void)
- QBluetoothServer::Error error(void)
- bool hasPendingConnections(void)
- bool isListening(void)
- bool listen(QBluetoothAddress address, quint16 port)
- QBluetoothServiceInfo listen_2(QBluetoothUuid uuid, QString serviceName))
- int maxPendingConnections(void)
- QBluetoothSocket * nextPendingConnection(void)
- QBluetooth::SecurityFlags securityFlags(void)
- QBluetoothAddress serverAddress(void)
- quint16 serverPort(void)
- QBluetoothServiceInfo::Protocol serverType(void)
- void setMaxPendingConnections(int numConnections)
- void setSecurityFlags(QBluetooth::SecurityFlags security)
- void seterrorEvent(const char *)
- void setnewConnectionEvent(const char *)
- const char *geterrorEvent(void)
- const char *getnewConnectionEvent(void)

# QBluetoothServiceDiscoveryAgent Class

C++ Reference : http://doc.qt.io/qt-5/qbluetoothservicediscoveryagent.html

Parameters : QObject *

Parent Class : QObject

- QList<QBluetoothServiceInfo> discoveredServices(void)
- QBluetoothServiceDiscoveryAgent::Error error(void)
- QString errorString(void)
- bool isActive(void)
- QBluetoothAddress remoteAddress(void)
- bool setRemoteAddress(QBluetoothAddress address)
- void setUuidFilter(QList<QBluetoothUuid> uuids)
- void setUuidFilter_2(QBluetoothUuid uuid)
- QList<QBluetoothUuid> uuidFilter(void)
- void clear(void)
- void start(QBluetoothServiceDiscoveryAgent::DiscoveryMode mode)
- void stop(void)
- void setcanceledEvent(const char *)
- void seterrorEvent(const char *)
- void setfinishedEvent(const char *)
- void setserviceDiscoveredEvent(const char *)
- const char *getcanceledEvent(void)
- const char *geterrorEvent(void)
- const char *getfinishedEvent(void)
- const char *getserviceDiscoveredEvent(void)

# QBluetoothServiceInfo Class

C++ Reference : http://doc.qt.io/qt-5/qbluetoothserviceinfo.html

Parameters : void

- QVariant attribute(quint16 attributeId)
- QList<quint16> attributes(void)
- bool contains(quint16 attributeId)
- QBluetoothDeviceInfo device(void)
- bool isComplete(void)
- bool isRegistered(void)
- bool isValid(void)
- QBluetoothServiceInfo::Sequence protocolDescriptor(QBluetoothUuid::ProtocolUuid protocol)
- int protocolServiceMultiplexer(void)
- bool registerService(QBluetoothAddress localAdapter))
- void removeAttribute(quint16 attributeId)
- int serverChannel(void)
- quint8 serviceAvailability(void)
- QList<QBluetoothUuid> serviceClassUuids(void)
- QString serviceDescription(void)
- QString serviceName(void)
- QString serviceProvider(void)
- QBluetoothUuid serviceUuid(void)
- void setAttribute(quint16 attributeId, QVariant value)
- void setAttribute_2(quint16 attributeId, QBluetoothUuid value)
- void setAttribute_3(quint16 attributeId, QBluetoothServiceInfo::Sequence value)
- void setDevice(QBluetoothDeviceInfo device)
- void setServiceAvailability(quint8 availability)
- void setServiceDescription(QString description)
- void setServiceName(QString name)
- void setServiceProvider(QString provider)
- void setServiceUuid(QBluetoothUuid uuid)
- bool unregisterService(void)

# QBluetoothSocket Class

C++ Reference : http://doc.qt.io/qt-5/qbluetoothsocket.html

Parameters : QBluetoothServiceInfo::Protocol,QObject *

Parent Class : QIODevice

- void abort(void)
- void connectToService(QBluetoothServiceInfo service, QIODevice::OpenMode openMode)
- void connectToService_2(QBluetoothAddress address, QBluetoothUuid uuid, QIODevice::OpenMode openMode)
- void connectToService_3(QBluetoothAddress address, quint16 port, QIODevice::OpenMode openMode)
- void disconnectFromService(void)
- QBluetoothSocket::SocketError error(void)
- QString errorString(void)
- QBluetoothAddress localAddress(void)
- QString localName(void)
- quint16 localPort(void)
- QBluetoothAddress peerAddress(void)
- QString peerName(void)
- quint16 peerPort(void)
- bool setSocketDescriptor(int socketDescriptor, QBluetoothServiceInfo::Protocol socketType, QBluetoothSocket::SocketState socketState, QIODevice::OpenMode openMode)
- int socketDescriptor(void)
- QBluetoothServiceInfo::Protocol socketType(void)
- QBluetoothSocket::SocketState state(void)
- void setconnectedEvent(const char *)
- void setdisconnectedEvent(const char *)
- void seterrorEvent(const char *)
- void setstateChangedEvent(const char *)
- const char *getconnectedEvent(void)
- const char *getdisconnectedEvent(void)
- const char *geterrorEvent(void)
- const char *getstateChangedEvent(void)

# QBluetoothTransferManager Class

C++ Reference : http://doc.qt.io/qt-5/qbluetoothtransfermanager.html

Parameters : QObject *

Parent Class : QObject

- QBluetoothTransferReply * put(QBluetoothTransferRequest request, QIODevice *data)
- void setfinishedEvent(const char *)
- const char *getfinishedEvent(void)

# QBluetoothTransferReply Class

C++ Reference : http://doc.qt.io/qt-5/qbluetoothtransferreply.html

Parameters : QObject *

Parent Class : QObject

- QBluetoothTransferManager * manager(void)
- QBluetoothTransferRequest request(void)
- void abort(void)
- void seterrorEvent(const char *)
- void setfinishedEvent(const char *)
- void settransferProgressEvent(const char *)
- const char *geterrorEvent(void)
- const char *getfinishedEvent(void)
- const char *gettransferProgressEvent(void)

# QBluetoothTransferRequest Class

C++ Reference : http://doc.qt.io/qt-5/qbluetoothtransferrequest.html

Parameters : QBluetoothAddress

- QBluetoothAddress address(void)
- QVariant attribute(QBluetoothTransferRequest::Attribute code, QVariant defaultValue))
- void setAttribute(QBluetoothTransferRequest::Attribute code, QVariant value)

# QBluetoothUuid Class

C++ Reference : http://doc.qt.io/qt-5/qbluetoothuuid.html

Parameters : void

Parent Class : QUuid

- int minimumSize(void)
- quint16 toUInt16(bool *ok)
- quint32 toUInt32(bool *ok)
- quint128 toUInt128(void)

# QBoxLayout Class

C++ Reference : http://doc.qt.io/qt-5/qboxlayout.html

Parameters : QBoxLayout::Direction dir, QWidget *parent

Parent Class : QLayout

- void  addLayout(QLayout * layout, int stretch )
- void  addSpacerItem(QSpacerItem * spacerItem)
- void  addSpacing(int size)
- void  addStretch(int stretch )
- void  addStrut(int size)
- void  addWidget(QWidget * widget, int stretch , Qt::Alignment alignment )
- QBoxLayout::Direction  direction(void)
- void  insertLayout(int index, QLayout * layout, int stretch )
- void  insertSpacerItem(int index, QSpacerItem * spacerItem)
- void  insertSpacing(int index, int size)
- void  insertStretch(int index, int stretch )
- void  insertWidget(int index, QWidget * widget, int stretch , Qt::Alignment alignment )
- void  setDirection(QBoxLayout::Direction direction)
- void  setSpacing(int spacing)
- void  setStretch(int index, int stretch)
- bool  setStretchFactor(QWidget * widget, int stretch)
- bool  setStretchFactor_2(QLayout * layout, int stretch)
- int  spacing(void)
- int  stretch(int index)

# QBoxPlotLegendMarker Class

C++ Reference : http://doc.qt.io/qt-5/qboxplotlegendmarker.html

Parent Class : QLegendMarker

- QBoxPlotSeries * series(void)
- QLegendMarker::LegendMarkerType type(void)

# QBoxPlotSeries Class

C++ Reference : http://doc.qt.io/qt-5/qboxplotseries.html

Parameters : QObject *

Parent Class : QAbstractSeries

- bool append(QBoxSet *set)
- bool append_2(QList<QBoxSet *> sets)
- bool boxOutlineVisible(void)
- QList<QBoxSet *> boxSets(void)
- qreal boxWidth(void)
- QBrush brush(void)
- void clear(void)
- int count(void)
- bool insert(int index, QBoxSet *set)
- QPen pen(void)
- bool remove(QBoxSet *set)
- void setBoxOutlineVisible(bool visible)
- void setBoxWidth(qreal width)
- void setBrush(QBrush brush)
- void setPen(QPen pen)
- bool take(QBoxSet *set)
- QAbstractSeries::SeriesType type(void)
- void setboxOutlineVisibilityChangedEvent(const char *)
- void setboxWidthChangedEvent(const char *)
- void setboxsetsAddedEvent(const char *)
- void setboxsetsRemovedEvent(const char *)
- void setbrushChangedEvent(const char *)
- void setclickedEvent(const char *)
- void setcountChangedEvent(const char *)
- void setdoubleClickedEvent(const char *)
- void sethoveredEvent(const char *)
- void setpenChangedEvent(const char *)
- void setpressedEvent(const char *)
- void setreleasedEvent(const char *)
- const char *getboxOutlineVisibilityChangedEvent(void)
- const char *getboxWidthChangedEvent(void)
- const char *getboxsetsAddedEvent(void)
- const char *getboxsetsRemovedEvent(void)
- const char *getbrushChangedEvent(void)
- const char *getclickedEvent(void)
- const char *getcountChangedEvent(void)
- const char *getdoubleClickedEvent(void)
- const char *gethoveredEvent(void)
- const char *getpenChangedEvent(void)
- const char *getpressedEvent(void)
- const char *getreleasedEvent(void)

# QBoxSet Class

C++ Reference : http://doc.qt.io/qt-5/qboxset.html

Parameters : QString,QObject *

Parent Class : QObject

- void append(qreal value)
- void append_2(QList<qreal> values)
- qreal at(int index)
- QBrush brush(void)
- void clear(void)
- int count(void)
- QString label(void)
- QPen pen(void)
- void setBrush(QBrush brush)
- void setLabel(QString label)
- void setPen(QPen pen)
- void setValue(int index, qreal value)
- void setbrushChangedEvent(const char *)
- void setclearedEvent(const char *)
- void setclickedEvent(const char *)
- void setdoubleClickedEvent(const char *)
- void sethoveredEvent(const char *)
- void setpenChangedEvent(const char *)
- void setpressedEvent(const char *)
- void setreleasedEvent(const char *)
- void setvalueChangedEvent(const char *)
- void setvaluesChangedEvent(const char *)
- const char *getbrushChangedEvent(void)
- const char *getclearedEvent(void)
- const char *getclickedEvent(void)
- const char *getdoubleClickedEvent(void)
- const char *gethoveredEvent(void)
- const char *getpenChangedEvent(void)
- const char *getpressedEvent(void)
- const char *getreleasedEvent(void)
- const char *getvalueChangedEvent(void)
- const char *getvaluesChangedEvent(void)

# QBrush Class

C++ Reference : http://doc.qt.io/qt-5/qbrush.html

Parameters : void

- QColor color(void)
- QGradient *gradient(void)
- bool isOpaque(void)
- void setColor(QColor)
- void setStyle(Qt::BrushStyle style)
- void setTexture(QPixmap)
- void setTextureImage(QImage)
- void setTransform(QTransform)
- int style(void)
- void swap(QBrush)
- QPixmap texture(void)
- QImage textureImage(void)
- QTransform transform(void)

# QBuffer Class

C++ Reference : http://doc.qt.io/qt-5/qbuffer.html

Parameters : QObject *

Parent Class : QIODevice

- QByteArray buffer(void)
- QByteArray data(void)
- void setBuffer(QByteArray *byteArray)
- void setData(QByteArray data)
- void setData_2(char *data, int size)

# QButtonGroup Class

C++ Reference : http://doc.qt.io/qt-5/qbuttongroup.html

Parameters : QObject *parent

- void addButton(QAbstractButton *button, int id)
- QAbstractButton *button(int id)
- QAbstractButton *checkedButton(void)
- int checkedId(void)
- bool exclusive(void)
- int id(QAbstractButton *button)
- void removeButton(QAbstractButton *button)
- void setExclusive(bool)
- void setId(QAbstractButton *button, int id)
- void setbuttonClickedEvent(const char *)
- void setbuttonPressedEvent(const char *)
- void setbuttonReleasedEvent(const char *)
- const char *getbuttonClickedEvent(void)
- const char *getbuttonPressedEvent(void)
- const char *getbuttonReleasedEvent(void)

# QByteArray Class

C++ Reference : http://doc.qt.io/qt-5/qbytearray.html

Parameters : void

- QByteArray append(const char *str)
- QByteArray append_2(const char *str,int size)
- char at(int i)
- int capacity(void)
- void chop(int n)
- void clear(void)
- const char *constData(void)
- bool contains(const char *str)
- int count(const char *str)
- const char *data(void)
- bool endsWith(const char *str)
- QByteArray fill(char ch, int size)
- int indexOf(const char *str, int from)
- QByteArray insert(int i, const char *str, int len)
- bool isEmpty(void)
- bool isNull(void)
- int lastIndexOf(const char *str, int from)
- QByteArray left(int len)
- QByteArray leftJustified(int width, char fill, bool truncate)
- int length(void)
- QByteArray mid(int pos, int len)
- QByteArray prepend(const char *str, int len)
- void push_back(const char *str)
- void push_front(const char *str)
- QByteArray remove(int pos, int len)
- QByteArray repeated(int times)
- QByteArray replace(int pos, int len, const char *after, int alen)
- QByteArray replace_2(int pos, int len, QByteArray after)
- QByteArray replace_3(int pos, int len, const char *after)
- QByteArray replace_4(char before, const char *after)
- QByteArray replace_5(char before, QByteArray after)
- QByteArray replace_6(const char *before, const char *after)
- QByteArray replace_7(const char *before, int bsize, const char *after, int asize)
- QByteArray replace_8(const QByteArray before, QByteArray after)
- QByteArray replace_9(const QByteArray before, const char *after)
- QByteArray replace_10(const char *before, QByteArray after)
- QByteArray replace_11(char before, char after)
- void reserve(int size)
- void resize(int size)
- QByteArray right(int len)
- QByteArray rightJustified(int width, char fill, bool truncate)
- QByteArray setNum(int n, int base)
- QByteArray setRawData(const char *data, uint size)
- QByteArray simplified(void)
- int size(void)
- void squeeze(void)
- bool startsWith(const char *str)
- void swap(QByteArray other)
- QByteArray toBase64(void)
- double toDouble(bool * ok)
- float toFloat(bool * ok)
- QByteArray toHex(void)
- int toInt(bool *ok, int base)
- long toLong(bool *ok, int base)
- qlonglong toLongLong(bool *ok, int base)
- QByteArray toLower(void)
- QByteArray toPercentEncoding(QByteArray,QByteArray, char percent)
- short toShort(bool *ok, int base)
- int toUInt(bool *ok, int base)
- int toULong(bool *ok, int base)
- int toULongLong(bool * ok, int base)
- int toUShort(bool * ok, int base)
- QByteArray toUpper(void)
- QByteArray trimmed(void)
- void truncate(int pos)
- QByteArray fromBase64(QByteArray)
- QByteArray fromHex(QByteArray)
- QByteArray fromPercentEncoding(QByteArray, char percent)
- QByteArray fromRawData(const char *data, int size)
- QByteArray number(int n, int base)

# QCalendarWidget Class

C++ Reference : http://doc.qt.io/qt-5/qcalendarwidget.html

Parameters : QWidget *

Parent Class : QWidget

- int dateEditAcceptDelay(void)
- QMap<QDate, QTextCharFormat> dateTextFormat(void)
- QTextCharFormat dateTextFormat_2(QDate date)
- Qt::DayOfWeek firstDayOfWeek(void)
- QTextCharFormat headerTextFormat(void)
- QCalendarWidget::HorizontalHeaderFormat horizontalHeaderFormat(void)
- bool isDateEditEnabled(void)
- bool isGridVisible(void)
- bool isNavigationBarVisible(void)
- QDate maximumDate(void)
- QDate minimumDate(void)
- int monthShown(void)
- QDate selectedDate(void)
- QCalendarWidget::SelectionMode selectionMode(void)
- void setDateEditAcceptDelay(int delay)
- void setDateEditEnabled(bool enable)
- void setDateTextFormat(QDate date, QTextCharFormat format)
- void setFirstDayOfWeek(Qt::DayOfWeek dayOfWeek)
- void setHeaderTextFormat(QTextCharFormat format)
- void setHorizontalHeaderFormat(QCalendarWidget::HorizontalHeaderFormat format)
- void setMaximumDate(QDate date)
- void setMinimumDate(QDate date)
- void setSelectionMode(QCalendarWidget::SelectionMode mode)
- void setVerticalHeaderFormat(QCalendarWidget::VerticalHeaderFormat format)
- void setWeekdayTextFormat(Qt::DayOfWeek dayOfWeek, QTextCharFormat format)
- QCalendarWidget::VerticalHeaderFormat verticalHeaderFormat(void)
- QTextCharFormat weekdayTextFormat(Qt::DayOfWeek dayOfWeek)
- int yearShown(void)
- void setCurrentPage(int year, int month)
- void setDateRange(QDate min, QDate max)
- void setGridVisible(bool show)
- void setNavigationBarVisible(bool visible)
- void setSelectedDate(QDate date)
- void showNextMonth(void)
- void showNextYear(void)
- void showPreviousMonth(void)
- void showPreviousYear(void)
- void showSelectedDate(void)
- void showToday(void)
- void setactivatedEvent(const char *)
- void setclickedEvent(const char *)
- void setcurrentPageChangedEvent(const char *)
- void setselectionChangedEvent(const char *)
- const char *getactivatedEvent(void)
- const char *getclickedEvent(void)
- const char *getcurrentPageChangedEvent(void)
- const char *getselectionChangedEvent(void)

# QCamera Class

C++ Reference : http://doc.qt.io/qt-5/qt3drender-qcamera.html

Parameters : void

Parent Class : QMediaObject

- QCamera::CaptureModes captureMode(void)
- QCamera::Error error(void)
- QString errorString(void)
- QCameraExposure * exposure(void)
- QCameraFocus * focus(void)
- QCameraImageProcessing * imageProcessing(void)
- bool isCaptureModeSupported(QCamera::CaptureModes mode)
- QCamera::LockStatus lockStatus(void)
- QCamera::LockStatus lockStatus_2(QCamera::LockType lockType)
- QCamera::LockTypes requestedLocks(void)
- void setViewfinder(QVideoWidget * viewfinder)
- void setViewfinder_2(QGraphicsVideoItem * viewfinder)
- void setViewfinder_3(QAbstractVideoSurface * surface)
- QCamera::State state(void)
- QCamera::Status status(void)
- QCamera::LockTypes supportedLocks(void)
- void load(void)
- void searchAndLock(void)
- void searchAndLock_2(QCamera::LockTypes locks)
- void setCaptureMode(QCamera::CaptureModes mode)
- void start(void)
- void stop(void)
- void unload(void)
- void unlock(void)
- void unlock_2(QCamera::LockTypes locks)

# QCameraImageCapture Class

C++ Reference : http://doc.qt.io/qt-5/qcameraimagecapture.html

Parameters : QMediaObject * mediaObject

- QMultimedia::AvailabilityStatus availability(void)
- QVideoFrame::PixelFormat bufferFormat(void)
- QCameraImageCapture::CaptureDestinations captureDestination(void)
- QImageEncoderSettings encodingSettings(void)
- QCameraImageCapture::Error error(void)
- QString errorString(void)
- QString imageCodecDescription( QString   codec)
- bool isAvailable(void)
- bool isCaptureDestinationSupported(QCameraImageCapture::CaptureDestinations destination)
- bool isReadyForCapture(void)
- void setBufferFormat( QVideoFrame::PixelFormat format)
- void setCaptureDestination(QCameraImageCapture::CaptureDestinations destination)
- void setEncodingSettings( QImageEncoderSettings   settings)
- QList<QVideoFrame::PixelFormat> supportedBufferFormats(void)
- QStringList supportedImageCodecs(void)
- QList<QSize> supportedResolutions( QImageEncoderSettings   settings , bool * continuous )
- void cancelCapture(void)
- int capture( QString   file )

# QCameraLens Class

C++ Reference : http://doc.qt.io/qt-5/qt3drender-qcameralens.html

Parameters : Qt3DCore::QNode *

- float aspectRatio(void)
- float bottom(void)
- float exposure(void)
- float farPlane(void)
- float fieldOfView(void)
- float left(void)
- float nearPlane(void)
- QMatrix4x4 projectionMatrix(void)
- Qt3DRender::QCameraLens::ProjectionType projectionType(void)
- float right(void)
- void setFrustumProjection(float left, float right, float bottom, float top, float nearPlane, float farPlane)
- void setOrthographicProjection(float left, float right, float bottom, float top, float nearPlane, float farPlane)
- void setPerspectiveProjection(float fieldOfView, float aspectRatio, float nearPlane, float farPlane)
- float top(void)
- void setAspectRatio(float aspectRatio)
- void setBottom(float bottom)
- void setExposure(float exposure)
- void setFarPlane(float farPlane)
- void setFieldOfView(float fieldOfView)
- void setLeft(float left)
- void setNearPlane(float nearPlane)
- void setProjectionMatrix(QMatrix4x4 projectionMatrix)
- void setProjectionType(Qt3DRender::QCameraLens::ProjectionType projectionType)
- void setRight(float right)
- void setTop(float top)

# QCameraSelector Class

C++ Reference : http://doc.qt.io/qt-5/qt3drender-qcameraselector .html

Parameters : Qt3DCore::QNode *

- Qt3DCore::QEntity * camera(void)
- void setCamera(Qt3DCore::QEntity *camera)

# QCameraViewfinder Class

C++ Reference : http://doc.qt.io/qt-5/qcameraviewfinder.html

Parameters : QWidget *

Parent Class : QVideoWidget

# QCandlestickLegendMarker Class

C++ Reference : http://doc.qt.io/qt-5/qcandlesticklegendmarker.html

Parent Class : QLegendMarker

- QCandlestickSeries * series(void)
- QLegendMarker::LegendMarkerType type(void)

# QCandlestickModelMapper Class

C++ Reference : http://doc.qt.io/qt-5/qcandlestickmodelmapper.html

Parameters : QObject *

Parent Class : QObject

- QAbstractItemModel * model(void)
- Qt::Orientation orientation(void)
- QCandlestickSeries * series(void)
- void setModel(QAbstractItemModel *model)
- void setSeries(QCandlestickSeries *series)
- void setmodelReplacedEvent(const char *)
- void setseriesReplacedEvent(const char *)
- const char *getmodelReplacedEvent(void)
- const char *getseriesReplacedEvent(void)

# QCandlestickSeries Class

C++ Reference : http://doc.qt.io/qt-5/qcandlestickseries.html

Parameters : QObject *

Parent Class : QAbstractSeries

- bool append(QCandlestickSet *set)
- bool append_2(QList<QCandlestickSet *> sets)
- bool bodyOutlineVisible(void)
- qreal bodyWidth(void)
- QBrush brush(void)
- bool capsVisible(void)
- qreal capsWidth(void)
- void clear(void)
- int count(void)
- QColor decreasingColor(void)
- QColor increasingColor(void)
- bool insert(int index, QCandlestickSet *set)
- qreal maximumColumnWidth(void)
- qreal minimumColumnWidth(void)
- QPen pen(void)
- bool remove(QCandlestickSet *set)
- bool remove_2(QList<QCandlestickSet *> sets)
- void setBodyOutlineVisible(bool bodyOutlineVisible)
- void setBodyWidth(qreal bodyWidth)
- void setBrush(QBrush brush)
- void setCapsVisible(bool capsVisible)
- void setCapsWidth(qreal capsWidth)
- void setDecreasingColor(QColor decreasingColor)
- void setIncreasingColor(QColor increasingColor)
- void setMaximumColumnWidth(qreal maximumColumnWidth)
- void setMinimumColumnWidth(qreal minimumColumnWidth)
- void setPen(QPen pen)
- QList<QCandlestickSet *> sets(void)
- bool take(QCandlestickSet *set)
- void setbodyOutlineVisibilityChangedEvent(const char *)
- void setbodyWidthChangedEvent(const char *)
- void setbrushChangedEvent(const char *)
- void setcandlestickSetsAddedEvent(const char *)
- void setcandlestickSetsRemovedEvent(const char *)
- void setcapsVisibilityChangedEvent(const char *)
- void setcapsWidthChangedEvent(const char *)
- void setclickedEvent(const char *)
- void setcountChangedEvent(const char *)
- void setdecreasingColorChangedEvent(const char *)
- void setdoubleClickedEvent(const char *)
- void sethoveredEvent(const char *)
- void setincreasingColorChangedEvent(const char *)
- void setmaximumColumnWidthChangedEvent(const char *)
- void setminimumColumnWidthChangedEvent(const char *)
- void setpenChangedEvent(const char *)
- void setpressedEvent(const char *)
- void setreleasedEvent(const char *)
- const char *getbodyOutlineVisibilityChangedEvent(void)
- const char *getbodyWidthChangedEvent(void)
- const char *getbrushChangedEvent(void)
- const char *getcandlestickSetsAddedEvent(void)
- const char *getcandlestickSetsRemovedEvent(void)
- const char *getcapsVisibilityChangedEvent(void)
- const char *getcapsWidthChangedEvent(void)
- const char *getclickedEvent(void)
- const char *getcountChangedEvent(void)
- const char *getdecreasingColorChangedEvent(void)
- const char *getdoubleClickedEvent(void)
- const char *gethoveredEvent(void)
- const char *getincreasingColorChangedEvent(void)
- const char *getmaximumColumnWidthChangedEvent(void)
- const char *getminimumColumnWidthChangedEvent(void)
- const char *getpenChangedEvent(void)
- const char *getpressedEvent(void)
- const char *getreleasedEvent(void)

# QCandlestickSet Class

C++ Reference : http://doc.qt.io/qt-5/qcandlestickset.html

Parameters : qreal,QObject *

Parent Class : QObject

- QBrush brush(void)
- qreal close(void)
- qreal high(void)
- qreal low(void)
- qreal open(void)
- QPen pen(void)
- void setBrush(QBrush brush)
- void setClose(qreal close)
- void setHigh(qreal high)
- void setLow(qreal low)
- void setOpen(qreal open)
- void setPen(QPen pen)
- void setTimestamp(qreal timestamp)
- qreal timestamp(void)
- void setbrushChangedEvent(const char *)
- void setclickedEvent(const char *)
- void setcloseChangedEvent(const char *)
- void setdoubleClickedEvent(const char *)
- void sethighChangedEvent(const char *)
- void sethoveredEvent(const char *)
- void setlowChangedEvent(const char *)
- void setopenChangedEvent(const char *)
- void setpenChangedEvent(const char *)
- void setpressedEvent(const char *)
- void setreleasedEvent(const char *)
- void settimestampChangedEvent(const char *)
- const char *getbrushChangedEvent(void)
- const char *getclickedEvent(void)
- const char *getcloseChangedEvent(void)
- const char *getdoubleClickedEvent(void)
- const char *gethighChangedEvent(void)
- const char *gethoveredEvent(void)
- const char *getlowChangedEvent(void)
- const char *getopenChangedEvent(void)
- const char *getpenChangedEvent(void)
- const char *getpressedEvent(void)
- const char *getreleasedEvent(void)
- const char *gettimestampChangedEvent(void)

# QCategoryAxis Class

C++ Reference : http://doc.qt.io/qt-5/qcategoryaxis.html

Parameters : QObject *

Parent Class : QValueAxis

- void append(QString categoryLabel, qreal categoryEndValue)
- QStringList categoriesLabels(void)
- int count(void)
- qreal endValue(QString categoryLabel)
- QCategoryAxis::AxisLabelsPosition labelsPosition(void)
- void remove(QString categoryLabel)
- void replaceLabel(QString oldLabel, QString newLabel)
- void setLabelsPosition(QCategoryAxis::AxisLabelsPosition position)
- void setStartValue(qreal min)
- qreal startValue(QString categoryLabel)
- void setcategoriesChangedEvent(const char *)
- void setlabelsPositionChangedEvent(const char *)
- const char *getcategoriesChangedEvent(void)
- const char *getlabelsPositionChangedEvent(void)

# QChar Class

C++ Reference : http://doc.qt.io/qt-5/qchar.html

Parameters : int

- QChar::Category category(void)
- uchar cell(void)
- unsigned char combiningClass(void)
- QString decomposition(void)
- QChar::Decomposition decompositionTag(void)
- int digitValue(void)
- QChar::Direction direction(void)
- bool hasMirrored(void)
- bool isDigit(void)
- bool isHighSurrogate(void)
- bool isLetter(void)
- bool isLetterOrNumber(void)
- bool isLowSurrogate(void)
- bool isLower(void)
- bool isMark(void)
- bool isNonCharacter(void)
- bool isNull(void)
- bool isNumber(void)
- bool isPrint(void)
- bool isPunct(void)
- bool isSpace(void)
- bool isSurrogate(void)
- bool isSymbol(void)
- bool isTitleCase(void)
- bool isUpper(void)
- QChar mirroredChar(void)
- uchar row(void)
- QChar::Script script(void)
- QChar toCaseFolded(void)
- char toLatin1(void)
- QChar toLower(void)
- QChar toTitleCase(void)
- QChar toUpper(void)
- ushort unicode(void)
- ushort unicode_2(void)
- QChar::UnicodeVersion unicodeVersion(void)
- QChar::Category category_2(uint ucs4)
- unsigned char combiningClass_2(uint ucs4)
- QChar::UnicodeVersion currentUnicodeVersion(void)
- QString decomposition_2(uint ucs4)
- QChar::Decomposition decompositionTag_2(uint ucs4)
- int digitValue_2(uint ucs4)
- QChar::Direction direction_2(uint ucs4)
- QChar fromLatin1(char c)
- bool hasMirrored_2(uint ucs4)
- ushort highSurrogate(uint ucs4)
- bool isDigit_2(uint ucs4)
- bool isHighSurrogate_2(uint ucs4)
- bool isLetter_2(uint ucs4)
- bool isLetterOrNumber_2(uint ucs4)
- bool isLowSurrogate_2(uint ucs4)
- bool isLower_2(uint ucs4)
- bool isMark_2(uint ucs4)
- bool isNonCharacter_2(uint ucs4)
- bool isNumber_2(uint ucs4)
- bool isPrint_2(uint ucs4)
- bool isPunct_2(uint ucs4)
- bool isSpace_2(uint ucs4)
- bool isSurrogate_2(uint ucs4)
- bool isSymbol_2(uint ucs4)
- bool isTitleCase_2(uint ucs4)
- bool isUpper_2(uint ucs4)
- ushort lowSurrogate(uint ucs4)
- uint mirroredChar_2(uint ucs4)
- bool requiresSurrogates(uint ucs4)
- QChar::Script script_2(uint ucs4)
- uint surrogateToUcs4(ushort high, ushort low)
- uint surrogateToUcs4_2(QChar high, QChar low)
- uint toCaseFolded_2(uint ucs4)
- uint toLower_2(uint ucs4)
- uint toTitleCase_2(uint ucs4)
- uint toUpper_2(uint ucs4)
- QChar::UnicodeVersion unicodeVersion_2(uint ucs4)

# QChart Class

C++ Reference : http://doc.qt.io/qt-5/qchart.html

Parameters : QGraphicsItem *,Qt::WindowFlags

Parent Class : QGraphicsWidget

- void addAxis(QAbstractAxis *axis, Qt::Alignment alignment)
- void addSeries(QAbstractSeries *series)
- int animationDuration(void)
- QEasingCurve animationEasingCurve(void)
- QChart::AnimationOptions animationOptions(void)
- QList<QAbstractAxis *> axes(Qt::Orientations orientation, QAbstractSeries *series)
- QBrush backgroundBrush(void)
- QPen backgroundPen(void)
- qreal backgroundRoundness(void)
- QChart::ChartType chartType(void)
- void createDefaultAxes(void)
- bool isBackgroundVisible(void)
- bool isDropShadowEnabled(void)
- bool isPlotAreaBackgroundVisible(void)
- bool isZoomed(void)
- QLegend *legend(void)
- QLocale locale(void)
- bool localizeNumbers(void)
- QPointF mapToPosition(QPointF value, QAbstractSeries *series)
- QPointF mapToValue(QPointF position, QAbstractSeries *series)
- QMargins margins(void)
- QRectF plotArea(void)
- QBrush plotAreaBackgroundBrush(void)
- QPen plotAreaBackgroundPen(void)
- void removeAllSeries(void)
- void removeAxis(QAbstractAxis *axis)
- void removeSeries(QAbstractSeries *series)
- void scroll(qreal dx, qreal dy)
- QList<QAbstractSeries *> series(void)
- void setAnimationDuration(int msecs)
- void setAnimationEasingCurve(QEasingCurve curve)
- void setAnimationOptions(QChart::AnimationOptions options)
- void setBackgroundBrush(QBrush brush)
- void setBackgroundPen(QPen pen)
- void setBackgroundRoundness(qreal diameter)
- void setBackgroundVisible(bool visible)
- void setDropShadowEnabled(bool enabled)
- void setLocale(QLocale locale)
- void setLocalizeNumbers(bool localize)
- void setMargins(QMargins margins)
- void setPlotArea(QRectF rect)
- void setPlotAreaBackgroundBrush(QBrush brush)
- void setPlotAreaBackgroundPen(QPen pen)
- void setPlotAreaBackgroundVisible(bool visible)
- void setTheme(QChart::ChartTheme theme)
- void setTitle(QString title)
- void setTitleBrush(QBrush brush)
- void setTitleFont(QFont font)
- QChart::ChartTheme theme(void)
- QString title(void)
- QBrush titleBrush(void)
- QFont titleFont(void)
- void zoom(qreal factor)
- void zoomIn(void)
- void zoomIn_2(QRectF rect)
- void zoomOut(void)
- void zoomReset(void)
- void setplotAreaChangedEvent(const char *)
- const char *getplotAreaChangedEvent(void)

# QChartView Class

C++ Reference : http://doc.qt.io/qt-5/qchartview.html

Parameters : QWidget *

Parent Class : QGraphicsView

- QChart * chart(void)
- QChartView::RubberBands rubberBand(void)
- void setChart(QChart *chart)
- void setRubberBand(QChartView::RubberBands rubberBand)

# QCheckBox Class

C++ Reference : http://doc.qt.io/qt-5/qcheckbox.html

Parameters : QWidget *parent

Parent Class : QAbstractButton

- int checkState(void)
- bool isTristate(void)
- void setCheckState(Qt::CheckState state)
- void setTristate(bool y)
- QSize minimumSizeHint(void)
- QSize sizeHint(void)
- void setstateChangedEvent(const char *)
- void setclickedEvent(const char *)
- void setpressedEvent(const char *)
- void setreleasedEvent(const char *)
- void settoggledEvent(const char *)
- const char *getstateChangedEvent(void)
- const char *getclickedEvent(void)
- const char *getpressedEvent(void)
- const char *getreleasedEvent(void)
- const char *gettoggledEvent(void)

# QChildEvent Class

C++ Reference : http://doc.qt.io/qt-5/qchildevent.html

Parameters : QEvent::Type,QObject *

Parent Class : QEvent

- bool added(void)
- QObject *child(void)
- bool polished(void)
- bool removed(void)

# QClipboard Class

C++ Reference : http://doc.qt.io/qt-5/qclipboard.html

- void clear(QClipboard::Mode mode)
- QImage image(QClipboard::Mode mode)
- QMimeData * mimeData(QClipboard::Mode mode)
- bool ownsClipboard(void)
- bool ownsFindBuffer(void)
- bool ownsSelection(void)
- QPixmap pixmap(QClipboard::Mode mode)
- void setImage(QImage image, QClipboard::Mode mode)
- void setMimeData(QMimeData * src, QClipboard::Mode mode)
- void setPixmap(QPixmap pixmap, QClipboard::Mode mode)
- void setText(QString text, QClipboard::Mode mode)
- bool supportsFindBuffer(void)
- bool supportsSelection(void)
- QString text(QClipboard::Mode mode)

# QColor Class

C++ Reference : http://doc.qt.io/qt-5/qcolor.html

Parameters : void

- int alpha(void)
- double alphaF(void)
- int black(void)
- double blackF(void)
- int blue(void)
- double blueF(void)
- QColor convertTo(QColor::Spec colorSpec)
- int cyan(void)
- double cyanF(void)
- QColor darker(int factor)
- void getCmyk(int *c, int *m, int *y, int *k, int *a)
- void getCmykF(qreal *c, qreal *m, qreal *y, qreal *k, qreal *a)
- void getHsl(int *h, int *s, int *l, int *a)
- void getHslF(qreal *h, qreal *s, qreal *l, qreal *a)
- void getHsv(int *h, int *s, int *v, int *a)
- void getHsvF(qreal *h, qreal *s, qreal *v, qreal *a)
- void getRgb(int *r, int *g, int *b, int *a)
- void getRgbF(qreal *r, qreal *g, qreal *b, qreal *a)
- int green(void)
- double greenF(void)
- int hslHue(void)
- double hslHueF(void)
- int hslSaturation(void)
- double hslSaturationF(void)
- int hsvHue(void)
- double hsvHueF(void)
- int hsvSaturation(void)
- double hsvSaturationF(void)
- int hue(void)
- double hueF(void)
- bool isValid(void)
- QColor lighter(int factor)
- int lightness(void)
- double lightnessF(void)
- int magenta(void)
- double magentaF(void)
- QString name(void)
- int red(void)
- double redF(void)
- QRgb rgb(void)
- QRgb rgba(void)
- int saturation(void)
- double saturationF(void)
- void setAlpha(int alpha)
- void setAlphaF(double alpha)
- void setBlue(int blue)
- void setBlueF(double blue)
- void setCmyk(int c, int m, int y, int k, int a)
- void setCmykF(double c, double m, double y, double k, double a)
- void setGreen(int green)
- void setGreenF(double green)
- void setHsl(int h, int s, int l, int a)
- void setHslF(double h, double s, double l, double a)
- void setHsv(int h, int s, int v, int a)
- void setHsvF(double h, double s, double v, double a)
- void setNamedColor(QString)
- void setRed(int red)
- void setRedF(double red)
- void setRgb(int r, int g, int b, int a)
- void setRgbF(double r, double g, double b, double a)
- void setRgba(QRgb rgba)
- int spec(void)
- QColor toCmyk(void)
- QColor toHsl(void)
- QColor toHsv(void)
- QColor toRgb(void)
- int value(void)
- double valueF(void)
- int yellow(void)
- double yellowF(void)
- QStringList colorNames(void)
- QColor fromCmyk(int c, int m, int y, int k, int a)
- QColor fromCmykF(double c, double m, double y, double k, double a)
- QColor fromHsl(int h, int s, int l, int a)
- QColor fromHslF(double h, double s, double l, double a)
- QColor fromHsv(int h, int s, int v, int a)
- QColor fromHsvF(double h, double s, double v, double a)
- QColor fromRgb(int r, int g, int b, int a)
- QColor fromRgbF(double r, double g, double b, double a)
- QColor fromRgba(QRgb rgba)
- bool isValidColor(QString)

# QColorDialog Class

C++ Reference : http://doc.qt.io/qt-5/qcolordialog.html

Parameters : void

Parent Class : QDialog

- QColor currentColor(void)
- void open(QObject * receiver, char * member)
- QColorDialog::ColorDialogOptions options(void)
- QColor selectedColor(void)
- void setCurrentColor(QColor color)
- void setOption(QColorDialog::ColorDialogOption option, bool on)
- void setOptions(QColorDialog::ColorDialogOptions options)
- bool testOption(QColorDialog::ColorDialogOption option)
- QColor customColor(int index)
- int customCount(void)
- QColor getColor_2(QColor initial, QWidget * parent, QString title, QColorDialog::ColorDialogOptions options)
- void setCustomColor(int index, QColor color)
- void setStandardColor(int index, QColor color)
- QColor standardColor(int index)
- void setcolorSelectedEvent(const char *)
- void setcurrentColorChangedEvent(const char *)
- const char *getcolorSelectedEvent(void)
- const char *getcurrentColorChangedEvent(void)
- int getcolor(void)

# QColumnView Class

C++ Reference : http://doc.qt.io/qt-5/qcolumnview.html

Parameters : QWidget *parent

Parent Class : QAbstractItemView

- QList<int> columnWidths(void)
- QWidget *previewWidget(void)
- bool resizeGripsVisible(void)
- void setColumnWidths(QList<int> list)
- void setPreviewWidget(QWidget *widget)
- void setResizeGripsVisible(bool visible)
- void setModel(QAbstractItemModel *model)
- void setRootIndex(QModelIndex index)
- void setSelectionModel(QItemSelectionModel *newSelectionModel)
- QModelIndex indexAt(QPoint point)
- void scrollTo(QModelIndex index, QAbstractItemView::ScrollHint hint)
- QRect visualRect(QModelIndex index)
- void setupdatePreviewWidgetEvent(const char *)
- const char *getupdatePreviewWidgetEvent(void)

# QComboBox Class

C++ Reference : http://doc.qt.io/qt-5/qcombobox.html

Parameters : QWidget *

Parent Class : QWidget

- void addItem(QString,int)
- void addItem_2(QString)
- void addItems(QStringList)
- QCompleter *completer(void)
- int count(void)
- int currentIndex(void)
- QString currentText(void)
- bool duplicatesEnabled(void)
- int findData(QVariant, int role, Qt::MatchFlag flags)
- int findText(QString, Qt::MatchFlag flags)
- bool hasFrame(void)
- void hidePopup(void)
- QSize iconSize(void)
- void insertItem(int index, QString, QVariant)
- void insertSeparator(int index)
- bool isEditable(void)
- QVariant itemData(int index, int role)
- QAbstractItemDelegate *itemDelegate(void)
- QIcon itemIcon(int index)
- QString itemText(int index)
- QLineEdit *lineEdit(void)
- int maxCount(void)
- int maxVisibleItems(void)
- int minimumContentsLength(void)
- QAbstractItemModel *model(void)
- int modelColumn(void)
- void removeItem(int index)
- QModelIndex rootModelIndex(void)
- void setCompleter(QCompleter *completer)
- void setDuplicatesEnabled(bool enable)
- void setEditable(bool editable)
- void setFrame(bool)
- void setIconSize(QSize)
- void setItemData(int index, QVariant , int role)
- void setItemDelegate(QAbstractItemDelegate *delegate)
- void setItemIcon(int index, QIcon)
- void setItemText(int index, QString)
- void setLineEdit(QLineEdit *edit)
- void setMaxCount(int max)
- void setMaxVisibleItems(int maxItems)
- void setMinimumContentsLength(int characters)
- void setModel(QAbstractItemModel *model)
- void setModelColumn(int visibleColumn)
- void setRootModelIndex(QModelIndex)
- void setValidator(QValidator *validator)
- void setView(QAbstractItemView *itemView)
- void showPopup(void)
- QValidator *validator(void)
- QAbstractItemView *view(void)
- void clear(void)
- void clearEditText(void)
- void setCurrentIndex(int index)
- void setCurrentText(QString)
- void setEditText(QString)
- void setactivatedEvent(const char *)
- void setcurrentIndexChangedEvent(const char *)
- void seteditTextChangedEvent(const char *)
- void sethighlightedEvent(const char *)
- const char *getactivatedEvent(void)
- const char *getcurrentIndexChangedEvent(void)
- const char *geteditTextChangedEvent(void)
- const char *gethighlightedEvent(void)

# QCommandLinkButton Class

C++ Reference : http://doc.qt.io/qt-5/qcommandlinkbutton.html

Parameters : QWidget *parent

Parent Class : QPushButton

- QString description(void)
- bool isFlat(void)
- void setDescription(QString description)
- void setFlat(bool flat)

# QCompleter Class

C++ Reference : http://doc.qt.io/qt-5/qcompleter.html

Parameters : QObject *parent

Parent Class : QObject

- Qt::CaseSensitivity caseSensitivity(void)
- int completionColumn(void)
- int completionCount(void)
- QCompleter::CompletionMode completionMode(void)
- QAbstractItemModel *completionModel(void)
- QString completionPrefix(void)
- int completionRole(void)
- QString currentCompletion(void)
- QModelIndex currentIndex(void)
- int currentRow(void)
- Qt::MatchFlags filterMode(void)
- int maxVisibleItems(void)
- QAbstractItemModel * model(void)
- QCompleter::ModelSorting modelSorting(void)
- QAbstractItemView * popup(void)
- void setCaseSensitivity(Qt::CaseSensitivity caseSensitivity)
- void setCompletionColumn(int column)
- void setCompletionMode(QCompleter::CompletionMode mode)
- void setCompletionRole(int role)
- bool setCurrentRow(int row)
- void setFilterMode(Qt::MatchFlags filterMode)
- void setMaxVisibleItems(int maxItems)
- void setModel(QAbstractItemModel *model)
- void setModelSorting(QCompleter::ModelSorting sorting)
- void setPopup(QAbstractItemView *popup)
- void setWidget(QWidget *widget)
- QWidget * widget(void)
- bool wrapAround(void)
- void complete(QRect  rect)
- void setCompletionPrefix(QString prefix)
- void setWrapAround(bool wrap)

# QCompleter2 Class

Parameters : QAbstractItemModel *model, QObject *parent

Parent Class : QCompleter

# QCompleter3 Class

Parameters : QStringList list, QObject *parent

Parent Class : QCompleter

# QCompleter4 Class

Parameters : QStringList list, QObject *parent

Parent Class : QCompleter

# QComponent Class

C++ Reference : http://doc.qt.io/qt-5/qcomponent.html

Parameters : Qt3DCore::QNode *

Parent Class : QNode

- bool isShareable(void)
- void setShareable(bool isShareable)

# QConeGeometry Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qconegeometry.html

Parameters : Qt3DCore::QNode *

- float bottomRadius(void)
- bool hasBottomEndcap(void)
- bool hasTopEndcap(void)
- Qt3DRender::QAttribute * indexAttribute(void)
- float length(void)
- Qt3DRender::QAttribute * normalAttribute(void)
- Qt3DRender::QAttribute * positionAttribute(void)
- int rings(void)
- int slices(void)
- Qt3DRender::QAttribute * texCoordAttribute(void)
- float topRadius(void)
- void updateIndices(void)
- void updateVertices(void)
- void setBottomRadius(float bottomRadius)
- void setHasBottomEndcap(bool hasBottomEndcap)
- void setHasTopEndcap(bool hasTopEndcap)
- void setLength(float length)
- void setRings(int rings)
- void setSlices(int slices)
- void setTopRadius(float topRadius)

# QConeMesh Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qconemesh.html

Parameters : Qt3DCore::QNode *

- float bottomRadius(void)
- bool hasBottomEndcap(void)
- bool hasTopEndcap(void)
- float length(void)
- int rings(void)
- int slices(void)
- float topRadius(void)
- void setBottomRadius(float bottomRadius)
- void setHasBottomEndcap(bool hasBottomEndcap)
- void setHasTopEndcap(bool hasTopEndcap)
- void setLength(float length)
- void setRings(int rings)
- void setSlices(int slices)
- void setTopRadius(float topRadius)

# QConicalGradient Class

C++ Reference : http://doc.qt.io/qt-5/qconicalgradient.html

Parameters : void

Parent Class : QGradient

- qreal angle(void)
- QPointF center(void)
- void setAngle(qreal angle)
- void setCenter(QPointF center)
- void setCenter_2(qreal x, qreal y)

# QCoreApplication Class

C++ Reference : http://doc.qt.io/qt-5/qcoreapplication.html

Parent Class : QObject

- void installNativeEventFilter(QAbstractNativeEventFilter *filterObj)
- void removeNativeEventFilter(QAbstractNativeEventFilter *filterObject)
- void quit(void)
- void addLibraryPath(QString path)
- QString applicationDirPath(void)
- QString applicationFilePath(void)
- QString applicationName(void)
- qint64 applicationPid(void)
- QString applicationVersion(void)
- QStringList arguments(void)
- bool closingDown(void)
- QAbstractEventDispatcher * eventDispatcher(void)
- int exec(void)
- void exit(int returnCode)
- bool installTranslator(QTranslator *translationFile)
- QCoreApplication * instance(void)
- bool isQuitLockEnabled(void)
- QStringList libraryPaths(void)
- QString organizationDomain(void)
- QString organizationName(void)
- void postEvent(QObject *receiver, QEvent *event, int priority)
- void processEvents(QEventLoop::ProcessEventsFlags flags)
- void processEvents_2(QEventLoop::ProcessEventsFlags flags, int maxtime)
- void removeLibraryPath(QString path)
- void removePostedEvents(QObject *receiver, int eventType)
- bool removeTranslator(QTranslator *translationFile)
- bool sendEvent(QObject *receiver, QEvent *event)
- void sendPostedEvents(QObject *receiver, int event_type)
- void setApplicationName(QString application)
- void setApplicationVersion(QString version)
- void setAttribute(Qt::ApplicationAttribute attribute, bool on)
- void setEventDispatcher(QAbstractEventDispatcher *eventDispatcher)
- void setLibraryPaths(QStringList paths)
- void setOrganizationDomain(QString orgDomain)
- void setOrganizationName(QString orgName)
- void setQuitLockEnabled(bool enabled)
- bool startingUp(void)
- bool testAttribute(Qt::ApplicationAttribute attribute)
- QString translate(char *context, char *sourceText, char *disambiguation, int n)

# QCuboidMesh Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qcuboidmesh.html

Parameters : Qt3DCore::QNode *

- float xExtent(void)
- QSize xyMeshResolution(void)
- QSize xzMeshResolution(void)
- float yExtent(void)
- QSize yzMeshResolution(void)
- float zExtent(void)
- void setXExtent(float xExtent)
- void setXYMeshResolution(QSize resolution)
- void setXZMeshResolution(QSize resolution)
- void setYExtent(float yExtent)
- void setYZMeshResolution(QSize resolution)
- void setZExtent(float zExtent)

# QCullFace Class

C++ Reference : http://doc.qt.io/qt-5/qt3drender-qcullface.html

Parameters : Qt3DCore::QNode *

- Qt3DRender::QCullFace::CullingMode mode(void)
- void setMode(Qt3DRender::QCullFace::CullingMode mode)

# QCursor Class

C++ Reference : http://doc.qt.io/qt-5/qcursor.html

Parameters : void

- QBitmap *bitmap(void)
- QBitmap *mask(void)
- QPoint hotSpot(void)
- QPixmap pixmap(void)
- void setShape(Qt::CursorShape shape)
- Qt::CursorShape shape(void)
- QPoint pos(void)
- QPoint pos_2(QScreen *)
- void setPos(int x, int y)
- void setPos_2(QScreen *screen, int x, int y)
- void setPos_3(QPoint)
- void setPos_4(QScreen *screen, QPoint)

# QCylinderMesh Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qcylindermesh.html

Parameters : Qt3DCore::QNode *

- float length(void)
- float radius(void)
- int rings(void)
- int slices(void)
- void setLength(float length)
- void setRadius(float radius)
- void setRings(int rings)
- void setSlices(int slices)

# QDataStream Class

C++ Reference : http://doc.qt.io/qt-5/qdatastream.html

Parameters : QIODevice *

- bool atEnd(void)
- QDataStream::ByteOrder byteOrder(void)
- QIODevice *device(void)
- QDataStream::FloatingPointPrecision floatingPointPrecision(void)
- void resetStatus(void)
- void setByteOrder(QDataStream::ByteOrder bo)
- void setDevice(QIODevice *d)
- void setFloatingPointPrecision(QDataStream::FloatingPointPrecision precision)
- void setStatus(QDataStream::Status status)
- void setVersion(int v)
- int skipRawData(int len)
- QDataStream::Status status(void)
- int version(void)

# QDataWidgetMapper Class

C++ Reference : http://doc.qt.io/qt-5/qdatawidgetmapper.html

Parameters : QObject *

Parent Class : QObject

- void addMapping(QWidget *widget, int section)
- void addMapping_2(QWidget *widget, int section, QByteArray propertyName)
- void clearMapping(void)
- int currentIndex(void)
- QAbstractItemDelegate *itemDelegate(void)
- QByteArray mappedPropertyName(QWidget *widget)
- int mappedSection(QWidget *widget)
- QWidget *mappedWidgetAt(int section)
- QAbstractItemModel *model(void)
- Qt::Orientation orientation(void)
- void removeMapping(QWidget *widget)
- QModelIndex rootIndex(void)
- void setItemDelegate(QAbstractItemDelegate *delegate)
- void setModel(QAbstractItemModel *model)
- void setOrientation(Qt::Orientation aOrientation)
- void setRootIndex(QModelIndex index)
- void setSubmitPolicy(QDataWidgetMapper::SubmitPolicy policy)
- QDataWidgetMapper::SubmitPolicy submitPolicy(void)
- void revert(void)
- bool submit(void)
- void setCurrentIndex(int index)
- void setCurrentModelIndex(QModelIndex index)
- void toFirst(void)
- void toLast(void)
- void toNext(void)
- void toPrevious(void)
- void setcurrentIndexChangedEvent(const char *)
- const char *getcurrentIndexChangedEvent(void)

# QDate Class

C++ Reference : http://doc.qt.io/qt-5/qdate.html

Parameters : void

- QDate addDays(int ndays)
- QDate addMonths(int nmonths)
- QDate addYears(int nyears)
- int day(void)
- int dayOfWeek(void)
- int dayOfYear(void)
- int daysInMonth(void)
- int daysInYear(void)
- int daysTo(QDate)
- void getDate(int * year, int * month, int * day)
- bool isNull(void)
- bool isValid(void)
- int month(void)
- bool setDate(int year, int month, int day)
- int toJulianDay(void)
- QString toString(QString)
- int weekNumber(int * yearNumber)
- int year(void)
- QDate currentDate(void)
- QDate fromJulianDay(int jd)
- QDate fromString(QString, QString)
- bool isLeapYear(int year)

# QDateEdit Class

C++ Reference : http://doc.qt.io/qt-5/qdateedit.html

Parameters : QWidget *parent

Parent Class : QDateTimeEdit

# QDateTime Class

C++ Reference : http://doc.qt.io/qt-5/qdatetime.html

Parameters : void

- QDateTime addDays(int ndays)
- QDateTime addMSecs(qint64 msecs)
- QDateTime addMonths(int nmonths)
- QDateTime addSecs(int s)
- QDateTime addYears(int nyears)
- QDate date(void)
- int daysTo(QDateTime other)
- bool isNull(void)
- bool isValid(void)
- qint64 msecsTo(QDateTime other)
- int secsTo(QDateTime other)
- void setDate(QDate date)
- void setMSecsSinceEpoch(qint64 msecs)
- void setTime(QTime time)
- void setTimeSpec(Qt::TimeSpec spec)
- QTime time(void)
- Qt::TimeSpec timeSpec(void)
- QDateTime toLocalTime(void)
- qint64 toMSecsSinceEpoch(void)
- QString toString(QString format)
- QString toString_2(Qt::DateFormat format)
- QDateTime toTimeSpec(Qt::TimeSpec specification)
- QDateTime toUTC(void)
- QDateTime currentDateTime(void)
- QDateTime currentDateTimeUtc(void)
- qint64 currentMSecsSinceEpoch(void)
- QDateTime fromMSecsSinceEpoch(qint64 msecs)
- QDateTime fromString(QString string, Qt::DateFormat format)
- QDateTime fromString_2(QString string, QString format)

# QDateTimeAxis Class

C++ Reference : http://doc.qt.io/qt-5/qdatetimeaxis.html

Parameters : QObject *

Parent Class : QAbstractAxis

- QString format(void)
- QDateTime max(void)
- QDateTime min(void)
- void setFormat(QString format)
- void setMax(QDateTime max)
- void setMin(QDateTime min)
- void setRange(QDateTime min, QDateTime max)
- void setTickCount(int count)
- int tickCount(void)
- void setformatChangedEvent(const char *)
- void setmaxChangedEvent(const char *)
- void setminChangedEvent(const char *)
- void setrangeChangedEvent(const char *)
- void settickCountChangedEvent(const char *)
- const char *getformatChangedEvent(void)
- const char *getmaxChangedEvent(void)
- const char *getminChangedEvent(void)
- const char *getrangeChangedEvent(void)
- const char *gettickCountChangedEvent(void)

# QDateTimeEdit Class

C++ Reference : http://doc.qt.io/qt-5/qdatetimeedit.html

Parameters : QWidget *parent

Parent Class : QAbstractSpinBox

- bool calendarPopup(void)
- QCalendarWidget *calendarWidget(void)
- void clearMaximumDate(void)
- void clearMaximumDateTime(void)
- void clearMaximumTime(void)
- void clearMinimumDate(void)
- void clearMinimumDateTime(void)
- void clearMinimumTime(void)
- int currentSection(void)
- int currentSectionIndex(void)
- QDate date(void)
- QDateTime dateTime(void)
- QString displayFormat(void)
- int displayedSections(void)
- QDate maximumDate(void)
- QDateTime maximumDateTime(void)
- QTime maximumTime(void)
- QDate minimumDate(void)
- QDateTime minimumDateTime(void)
- QTime minimumTime(void)
- int sectionAt(int index)
- int sectionCount(void)
- QString sectionText(QDateTimeEdit::Section section)
- void setCalendarPopup(bool enable)
- void setCalendarWidget(QCalendarWidget *calendarWidget)
- void setCurrentSection(QDateTimeEdit::Section section)
- void setCurrentSectionIndex(int index)
- void setDateRange(QDate,QDate)
- void setDateTimeRange(QDateTime,QDateTime)
- void setDisplayFormat(QString)
- void setMaximumDate(QDate)
- void setMaximumDateTime(QDateTime)
- void setMaximumTime(QTime)
- void setMinimumDate(QDate)
- void setMinimumDateTime(QDateTime)
- void setMinimumTime(QTime)
- void setSelectedSection(QDateTimeEdit::Section section)
- void setTimeRange(QTime,QTime)
- void setTimeSpec(Qt::TimeSpec spec)
- QTime time(void)
- Qt::TimeSpec timeSpec(void)
- void setDate(QDate)
- void setDateTime(QDateTime)
- void setTime(QTime)
- void setdateChangedEvent(const char *)
- void setdateTimeChangedEvent(const char *)
- void settimeChangedEvent(const char *)
- const char *getdateChangedEvent(void)
- const char *getdateTimeChangedEvent(void)
- const char *gettimeChangedEvent(void)

# QDepthTest Class

C++ Reference : http://doc.qt.io/qt-5/qt3drender-qdepthtest.html

Parameters : Qt3DCore::QNode *

- Qt3DRender::QDepthTest::DepthFunction depthFunction(void)
- void setDepthFunction(Qt3DRender::QDepthTest::DepthFunction depthFunction)

# QDesktopServices Class

C++ Reference : http://doc.qt.io/qt-5/qdesktopservices.html

- bool openUrl(QUrl)
- void setUrlHandler(QString, QObject *receiver, const char *method)
- void unsetUrlHandler(QString)

# QDial Class

C++ Reference : http://doc.qt.io/qt-5/qdial.html

Parameters : QWidget *parent

Parent Class : QAbstractSlider

- int notchSize(void)
- qreal notchTarget(void)
- bool notchesVisible(void)
- void setNotchTarget(double target)
- bool wrapping(void)
- QSize minimumSizeHint(void)
- QSize sizeHint(void)
- void setNotchesVisible(bool visible)
- void setWrapping(bool on)
- void setactionTriggeredEvent(const char *)
- void setrangeChangedEvent(const char *)
- void setsliderMovedEvent(const char *)
- void setsliderPressedEvent(const char *)
- void setsliderReleasedEvent(const char *)
- void setvalueChangedEvent(const char *)
- const char *getactionTriggeredEvent(void)
- const char *getrangeChangedEvent(void)
- const char *getsliderMovedEvent(void)
- const char *getsliderPressedEvent(void)
- const char *getsliderReleasedEvent(void)
- const char *getvalueChangedEvent(void)

# QDialog Class

C++ Reference : http://doc.qt.io/qt-5/qdialog.html

Parameters : QWidget *parent

Parent Class : QWidget

- bool isSizeGripEnabled(void)
- int result(void)
- void setModal(bool modal)
- void setResult(int i)
- void setSizeGripEnabled(bool)
- void accept(void)
- void done(int r) # In RingQt use : void donedialog(int r)
- int exec(void)
- void open(void)
- void reject(void)

# QDialogButtonBox Class

C++ Reference : http://doc.qt.io/qt-5/qdialogbuttonbox.html

Parameters : QWidget *parent

Parent Class : QWidget

- void addButton(QAbstractButton *button, QDialogButtonBox::ButtonRole role)
- QPushButton *addButton_2(QString text, QDialogButtonBox::ButtonRole role)
- QPushButton *addButton_3(QDialogButtonBox::StandardButton button)
- QPushButton *button(QDialogButtonBox::StandardButton which)
- QDialogButtonBox::ButtonRole buttonRole(QAbstractButton *button)
- QList<QAbstractButton *> buttons(void)
- bool centerButtons(void)
- void clear(void)
- Qt::Orientation orientation(void)
- void removeButton(QAbstractButton *button)
- void setCenterButtons(bool center)
- void setOrientation(Qt::Orientation orientation)
- void setStandardButtons(QDialogButtonBox::StandardButton buttons)
- QDialogButtonBox::StandardButton standardButton(QAbstractButton *button)
- QDialogButtonBox::StandardButton standardButtons(void)
- void setacceptedEvent(const char *)
- void setrejectedEvent(const char *)
- void setclickedEvent(const char *)
- void sethelpRequestedEvent(const char *)
- const char *getacceptedEvent(void)
- const char *getrejectedEvent(void)
- const char *getclickedEvent(void)
- const char *gethelpRequestedEvent(void)

# QDiffuseSpecularMaterial Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qdiffusespecularmaterial.html

Parameters : Qt3DCore::QNode *

- QColor ambient(void)
- QVariant diffuse(void)
- bool isAlphaBlendingEnabled(void)
- QVariant normal(void)
- float shininess(void)
- QVariant specular(void)
- float textureScale(void)
- void setAlphaBlendingEnabled(bool enabled)
- void setAmbient(QColor ambient)
- void setDiffuse(QVariant diffuse)
- void setNormal(QVariant normal)
- void setShininess(float shininess)
- void setSpecular(QVariant specular)
- void setTextureScale(float textureScale)

# QDir Class

C++ Reference : http://doc.qt.io/qt-5/qdir.html

Parameters : void

- QString absoluteFilePath(QString fileName)
- QString absolutePath(void)
- QString canonicalPath(void)
- bool cd(QString dirName)
- bool cdUp(void)
- uint count(void)
- QString dirName(void)
- QFileInfoList entryInfoList(QStringList nameFilters, QDir::Filters filters, QDir::SortFlags sort)
- QFileInfoList entryInfoList_2(QDir::Filters filters, QDir::SortFlags sort)
- QStringList entryList(QStringList nameQDir::Filters, QDir::Filters filters, QDir::SortFlags sort)
- QStringList entryList_2(QDir::Filters filters, QDir::SortFlags sort)
- bool exists(QString name)
- bool exists_2(void)
- QString filePath(QString fileName)
- QDir::Filters filter(void)
- bool isAbsolute(void)
- bool isReadable(void)
- bool isRelative(void)
- bool isRoot(void)
- bool makeAbsolute(void)
- bool mkdir(QString dirName)
- bool mkpath(QString dirPath)
- QStringList nameFilters(void)
- QString path(void)
- void refresh(void)
- QString relativeFilePath(QString fileName)
- bool remove(QString fileName)
- bool removeRecursively(void)
- bool rename(QString oldName, QString newName)
- bool rmdir(QString dirName)
- bool rmpath(QString dirPath)
- void setFilter(QDir::Filters filters)
- void setNameFilters(QStringList nameQDir::Filters)
- void setPath(QString path)
- void setSorting(QDir::SortFlags sort)
- QDir::SortFlags sorting(void)
- void swap(QDir other)
- void addSearchPath(QString prefix, QString path)
- QString cleanPath(QString path)
- QDir current(void)
- QString currentPath(void)
- QFileInfoList drives(void)
- QString fromNativeSeparators(QString pathName)
- QDir home(void)
- QString homePath(void)
- bool isAbsolutePath(QString path)
- bool isRelativePath(QString path)
- bool match(QString filter, QString fileName)
- bool match_2(QStringList filters, QString fileName)
- QDir root(void)
- QString rootPath(void)
- QStringList searchPaths(QString prefix)
- QChar separator(void)
- bool setCurrent(QString path)
- void setSearchPaths(QString prefix, QStringList searchPaths)
- QDir temp(void)
- QString tempPath(void)
- QString toNativeSeparators(QString pathName)

# QDockWidget Class

C++ Reference : http://doc.qt.io/qt-5/qdockwidget.html

Parameters : QWidget *parent,Qt::WindowType flag

Parent Class : QWidget

- int allowedAreas(void)
- int features(void)
- bool isAreaAllowed(Qt::DockWidgetArea area)
- bool isFloating(void)
- void setAllowedAreas(Qt::DockWidgetArea areas)
- void setFeatures(QDockWidget::DockWidgetFeature features)
- void setFloating(bool floating)
- void setTitleBarWidget(QWidget *widget)
- void setWidget(QWidget *widget)
- QWidget *titleBarWidget(void)
- QAction *toggleViewAction(void)
- QWidget *widget(void)
- void allowedAreasChanged(Qt::DockWidgetArea allowedAreas)
- void dockLocationChanged(Qt::DockWidgetArea area)
- void featuresChanged(QDockWidget::DockWidgetFeature features)
- void topLevelChanged(bool topLevel)
- void visibilityChanged(bool visible)
- void setallowedAreasChangedEvent(const char *)
- void setdockLocationChangedEvent(const char *)
- void setfeaturesChangedEvent(const char *)
- void settopLevelChangedEvent(const char *)
- void setvisibilityChangedEvent(const char *)
- const char *getallowedAreasChangedEvent(void)
- const char *getdockLocationChangedEvent(void)
- const char *getfeaturesChangedEvent(void)
- const char *gettopLevelChangedEvent(void)
- const char *getvisibilityChangedEvent(void)

# QDoubleSpinBox Class

C++ Reference : http://doc.qt.io/qt-5/qdoublespinbox.html

Parameters : QWidget *parent

Parent Class : QWidget

- QString cleanText(void)
- int decimals(void)
- double maximum(void)
- double minimum(void)
- QString prefix(void)
- void setDecimals(int prec)
- void setMaximum(double max)
- void setMinimum(double min)
- void setPrefix(QString prefix)
- void setRange(double minimum, double maximum)
- void setSingleStep(double val)
- void setSuffix(QString suffix)
- void setStepType(QAbstractSpinBox::StepType stepType)
- double singleStep(void)
- QString suffix(void)
- double value(void)
- void setValue(double val)
- QString textFromValue(double value)
- double valueFromText(QString text)
- void setvalueChangedEvent(const char *)
- const char *getvalueChangedEvent(void)

# QDoubleValidator Class

C++ Reference : http://doc.qt.io/qt-5/qdoublevalidator.html

Parameters : QObject *

Parent Class : QValidator

- double bottom(void)
- int decimals(void)
- QDoubleValidator::Notation notation(void)
- void setBottom(double)
- void setDecimals(int)
- void setNotation(QDoubleValidator::Notation)
- void setRange(double minimum, double maximum, int decimals)
- void setTop(double)
- double top(void)

# QDrag Class

C++ Reference : http://doc.qt.io/qt-5/qdrag.html

Parameters : QObject *

Parent Class : QObject

- Qt::DropAction defaultAction(void)
- QPixmap dragCursor(Qt::DropAction action)
- Qt::DropAction exec(Qt::DropActions supportedActions)
- Qt::DropAction exec_2(Qt::DropActions supportedActions, Qt::DropAction defaultDropAction)
- QPoint hotSpot(void)
- QMimeData *mimeData(void)
- QPixmap pixmap(void)
- void setDragCursor(QPixmap cursor, Qt::DropAction action)
- void setHotSpot(QPoint hotspot)
- void setMimeData(QMimeData * data)
- void setPixmap(QPixmap pixmap)
- QObject * source(void)
- Qt::DropActions supportedActions(void)
- QObject * target(void)
- void setactionChangedEvent(const char *)
- void settargetChangedEvent(const char *)
- const char *getactionChangedEvent(void)
- const char *gettargetChangedEvent(void)

# QDragEnterEvent Class

C++ Reference : http://doc.qt.io/qt-5/qdragenterevent.html

Parameters : QPoint,Qt::DropActions,const QMimeData *,Qt::MouseButtons,Qt::KeyboardModifiers

Parent Class : QDragMoveEvent

# QDragLeaveEvent Class

C++ Reference : http://doc.qt.io/qt-5/qdragleaveevent.html

Parameters : void

Parent Class : QEvent

# QDragMoveEvent Class

C++ Reference : http://doc.qt.io/qt-5/qdragmoveevent.html

Parameters : QPoint,Qt::DropActions,const QMimeData *,Qt::MouseButtons,Qt::KeyboardModifiers,QEvent::Type

Parent Class : QDropEvent

- void accept(QRect rectangle)
- void accept_2(void)
- QRect answerRect(void)
- void ignore(QRect rectangle)
- void ignore_2(void)

# QDropEvent Class

C++ Reference : http://doc.qt.io/qt-5/qdropevent.html

Parameters : QPointF,Qt::DropActions,const QMimeData *,Qt::MouseButtons,Qt::KeyboardModifiers,QEvent::Type

Parent Class : QEvent

- void acceptProposedAction(void)
- Qt::DropAction dropAction(void)
- Qt::KeyboardModifiers keyboardModifiers(void)
- QMimeData * mimeData(void)
- Qt::MouseButtons mouseButtons(void)
- QPoint pos(void)
- QPointF posF(void)
- Qt::DropActions possibleActions(void)
- Qt::DropAction proposedAction(void)
- void setDropAction(Qt::DropAction action)
- QObject * source(void)

# QEffect Class

C++ Reference : http://doc.qt.io/qt-5/qt3drender-qeffect.html

Parameters : Qt3DCore::QNode *

- void addParameter(Qt3DRender::QParameter *parameter)
- void addTechnique(Qt3DRender::QTechnique *t)
- QVector<Qt3DRender::QParameter *> parameters(void)
- void removeParameter(Qt3DRender::QParameter *parameter)
- void removeTechnique(Qt3DRender::QTechnique *t)
- QVector<Qt3DRender::QTechnique *> techniques(void)

# QElapsedTimer Class

C++ Reference : http://doc.qt.io/qt-5/qelapsedtimer.html

Parameters : void

- qint64 elapsed(void)
- bool hasExpired(qint64 timeout)
- void invalidate(void)
- bool isValid(void)
- qint64 nsecsElapsed(void)
- qint64 restart(void)
- void start(void)

# QEntity Class

C++ Reference : http://doc.qt.io/qt-5/qt3dcore-qentity.html

Parameters : Qt3DCore::QNode *

Parent Class : QNode

- void addComponent(Qt3DCore::QComponent *comp)
- Qt3DCore::QComponentVector components(void)
- Qt3DCore::QEntity * parentEntity(void)
- void removeComponent(Qt3DCore::QComponent *comp)

# QErrorMessage Class

C++ Reference : http://doc.qt.io/qt-5/qerrormessage.html

Parameters : QWidget *parent

Parent Class : QDialog

- void showMessage(QString message)
- void showMessage_2(QString message, QString type)

# QEvent Class

C++ Reference : http://doc.qt.io/qt-5/qevent.html

Parameters : QEvent::Type Type

- void accept(void)
- void ignore(void)
- bool isAccepted(void)
- void setAccepted(bool accepted)
- bool spontaneous(void)
- int type(void)

# QExtrudedTextMesh Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qextrudedtextmesh.html

Parameters : Qt3DCore::QNode *

- float depth(void)
- QFont font(void)
- QString text(void)
- void setDepth(float depth)
- void setFont(QFont font)
- void setText(QString text)

# QFile Class

C++ Reference : http://doc.qt.io/qt-5/qfile.html

Parameters : void

Parent Class : QFileDevice

- bool copy(QString newName)
- bool exists(void)
- bool link(QString linkName)
- bool open(FILE *fh, QIODevice::OpenMode mode, QFile::FileHandleFlags handleFlags)
- bool open_2(int fd, QIODevice::OpenMode mode, QFile::FileHandleFlags handleFlags)
- bool open_3(QIODevice::OpenMode mode)
- bool remove(void)
- bool rename(QString newName)
- void setFileName(QString name)
- QString symLinkTarget(void)
- bool copy_2(QString fileName, QString newName)
- QString decodeName(QByteArray localFileName)
- QString decodeName_2(char *localFileName)
- QByteArray encodeName(QString fileName)
- bool exists_2(QString fileName)
- bool link_2(QString fileName, QString linkName)
- QFile::Permissions permissions(QString fileName)
- bool remove_2(QString fileName)
- bool rename_2(QString oldName, QString newName)
- bool resize(QString fileName, qint64 sz)
- bool setPermissions(QString fileName, QFile::Permissions permissions)
- QString symLinkTarget_2(QString fileName)

# QFile2 Class

Parameters : QString

Parent Class : QFile

# QFileDevice Class

C++ Reference : http://doc.qt.io/qt-5/qfiledevice.html

Parent Class : QIODevice

- QFileDevice::FileError error(void)
- bool flush(void)
- int handle(void)
- uchar * map(qint64 offset, qint64 size, QFileDevice::MemoryMapFlags flags)
- QFileDevice::Permissions permissions(void)
- bool resize(qint64 sz)
- QString fileName(void)
- bool setPermissions(QFileDevice::Permissions permissions)
- bool unmap(uchar *address)
- void unsetError(void)

# QFileDialog Class

C++ Reference : http://doc.qt.io/qt-5/qfiledialog.html

Parameters : QWidget *parent

Parent Class : QDialog

- QFileDialog::AcceptMode acceptMode(void)
- QString defaultSuffix(void)
- QDir directory(void)
- QUrl directoryUrl(void)
- QFileDialog::FileMode fileMode(void)
- QDir::Filters filter(void)
- QStringList history(void)
- QFileIconProvider * iconProvider(void)
- QAbstractItemDelegate * itemDelegate(void)
- QString labelText(QFileDialog::DialogLabel label)
- QStringList mimeTypeFilters(void)
- QStringList nameFilters(void)
- void open(QObject * receiver, char * member)
- QFileDialog::Options options(void)
- QAbstractProxyModel * proxyModel(void)
- bool restoreState(QByteArray state)
- QByteArray saveState(void)
- void selectFile(QString filename)
- void selectMimeTypeFilter(QString filter)
- void selectNameFilter(QString filter)
- void selectUrl(QUrl url)
- QStringList selectedFiles(void)
- QString selectedNameFilter(void)
- QList<QUrl> selectedUrls(void)
- void setAcceptMode(QFileDialog::AcceptMode mode)
- void setDefaultSuffix(QString suffix)
- void setDirectory(QString directory)
- void setDirectory_2(QDir directory)
- void setDirectoryUrl(QUrl directory)
- void setFileMode(QFileDialog::FileMode mode)
- void setFilter(QDir::Filters filters)
- void setHistory(QStringList paths)
- void setIconProvider(QFileIconProvider * provider)
- void setItemDelegate(QAbstractItemDelegate * delegate)
- void setLabelText(QFileDialog::DialogLabel label, QString text)
- void setMimeTypeFilters(QStringList filters)
- void setNameFilter(QString filter)
- void setNameFilters(QStringList filters)
- void setOption(QFileDialog::Option option, bool on)
- void setOptions(QFileDialog::Options options)
- void setProxyModel(QAbstractProxyModel * proxyModel)
- void setSidebarUrls(QList<QUrl> urls)
- void setViewMode(QFileDialog::ViewMode mode)
- QList<QUrl> sidebarUrls(void)
- bool testOption(QFileDialog::Option option)
- QFileDialog::ViewMode viewMode(void)
- QString getExistingDirectory(QWidget * parent, QString caption, QString dir, QFileDialog::Options options)
- QUrl getExistingDirectoryUrl(QWidget * parent, QString caption, QUrl dir, QFileDialog::Options options, QStringList supportedSchemes)
- QString getOpenFileName(QWidget * parent, QString caption, QString dir, QString filter)
- QString getOpenFileName_2(QWidget * parent, QString caption, QString dir, QString filter, QString * selectedFilter, QFileDialog::Options options)
- QStringList getOpenFileNames(QWidget * parent, QString caption, QString dir, QString filter, QString * selectedFilter, QFileDialog::Options options)
- QUrl getOpenFileUrl(QWidget * parent, QString caption, QUrl dir, QString filter, QString * selectedFilter, QFileDialog::Options options, QStringList supportedSchemes)
- QList<QUrl> getOpenFileUrls(QWidget * parent, QString caption, QUrl dir, QString filter, QString * selectedFilter, QFileDialog::Options options, QStringList supportedSchemes)
- QString getSaveFileName(QWidget * parent, QString caption, QString dir, QString filter)
- QString getSaveFileName_2(QWidget * parent, QString caption, QString dir, QString filter, QString * selectedFilter, QFileDialog::Options options)
- QUrl getSaveFileUrl(QWidget * parent, QString caption, QUrl dir, QString filter, QString * selectedFilter, QFileDialog::Options options, QStringList supportedSchemes)
- void setcurrentChangedEvent(const char *)
- void setcurrentUrlChangedEvent(const char *)
- void setdirectoryEnteredEvent(const char *)
- void setdirectoryUrlEnteredEvent(const char *)
- void setfileSelectedEvent(const char *)
- void setfilesSelectedEvent(const char *)
- void setfilterSelectedEvent(const char *)
- void seturlSelectedEvent(const char *)
- void seturlsSelectedEvent(const char *)
- const char *getcurrentChangedEvent(void)
- const char *getcurrentUrlChangedEvent(void)
- const char *getdirectoryEnteredEvent(void)
- const char *getdirectoryUrlEnteredEvent(void)
- const char *getfileSelectedEvent(void)
- const char *getfilesSelectedEvent(void)
- const char *getfilterSelectedEvent(void)
- const char *geturlSelectedEvent(void)
- const char *geturlsSelectedEvent(void)
- void saveFileContent(QByteArray fileContent,QString fileNameHint)
- void getOpenFileContent(const char *cFileTypes, const char *cCode)
- List *FileContentList(void)

# QFileInfo Class

C++ Reference : http://doc.qt.io/qt-5/qfileinfo.html

Parameters : void

- QDir absoluteDir(void)
- QString absoluteFilePath(void)
- QString absolutePath(void)
- QString baseName(void)
- QString bundleName(void)
- bool caching(void)
- QString canonicalFilePath(void)
- QString canonicalPath(void)
- QString completeBaseName(void)
- QString completeSuffix(void)
- QDir dir(void)
- bool exists(void)
- QString fileName(void)
- QString filePath(void)
- QString group(void)
- int groupId(void)
- bool isAbsolute(void)
- bool isBundle(void)
- bool isDir(void)
- bool isExecutable(void)
- bool isFile(void)
- bool isHidden(void)
- bool isNativePath(void)
- bool isReadable(void)
- bool isRelative(void)
- bool isRoot(void)
- bool isSymLink(void)
- bool isWritable(void)
- QDateTime lastModified(void)
- QDateTime lastRead(void)
- bool makeAbsolute(void)
- QString owner(void)
- uint ownerId(void)
- QString path(void)
- bool permission(QFileDevice::Permission permissions)
- int permissions(void)
- void refresh(void)
- void setCaching(bool enable)
- void setFile(QString)
- int size(void)
- QString suffix(void)
- void swap(QFileInfo)
- QString symLinkTarget(void)

# QFileSystemModel Class

C++ Reference : http://doc.qt.io/qt-5/qfilesystemmodel.html

Parameters : void

- QIcon fileIcon(QModelIndex)
- QFileInfo fileInfo(QModelIndex)
- QString fileName(QModelIndex)
- QString filePath(QModelIndex)
- int filter(void)
- QFileIconProvider *iconProvider(void)
- QModelIndex index(QString, int column)
- bool isDir(QModelIndex)
- bool isReadOnly(void)
- QDateTime lastModified(QModelIndex)
- QModelIndex mkdir(QModelIndex,QString)
- QVariant myComputer(int role)
- bool nameFilterDisables(void)
- QStringList nameFilters(void)
- int permissions(QModelIndex)
- bool remove(QModelIndex)
- bool resolveSymlinks(void)
- bool rmdir(QModelIndex)
- QDir rootDirectory(void)
- QString rootPath(void)
- void setFilter(QDir::Filter filters)
- void setIconProvider(QFileIconProvider *provider)
- void setNameFilterDisables(bool enable)
- void setNameFilters(QStringList)
- void setReadOnly(bool enable)
- void setResolveSymlinks(bool enable)
- QModelIndex setRootPath(QString)
- int size(QModelIndex)
- QString type(QModelIndex)
- bool canFetchMore(QModelIndex)
- int columnCount(void)
- QVariant data( QModelIndex index, int role)
- bool dropMimeData( QMimeData *data, Qt::DropAction action, int row, int column, QModelIndex parent)
- void fetchMore( QModelIndex parent)
- int flags( QModelIndex index)
- bool hasChildren( QModelIndex parent )
- QVariant headerData(int section, Qt::Orientation orientation, int role )
- QMimeData * mimeData( QModelIndexList indexes)
- QStringList mimeTypes(void)
- QModelIndex parent( QModelIndex index)
- int rowCount( QModelIndex parent)
- bool setData( QModelIndex idx,  QVariant value, int role)
- void sort(int column, Qt::SortOrder order )
- int supportedDropActions(void)

# QFileSystemWatcher Class

C++ Reference : http://doc.qt.io/qt-5/qfilesystemwatcher.html

Parameters : QObject *

Parent Class : QObject

- bool addPath(QString path)
- QStringList addPaths(QStringList paths)
- QStringList directories(void)
- QStringList files(void)
- bool removePath(QString path)
- QStringList removePaths(QStringList paths)
- void setdirectoryChangedEvent(const char *)
- void setfileChangedEvent(const char *)
- const char *getdirectoryChangedEvent(void)
- const char *getfileChangedEvent(void)

# QFirstPersonCameraController Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qfirstpersoncameracontroller.html

Parameters : Qt3DCore::QNode *

Parent Class : QAbstractCameraController

# QFont Class

C++ Reference : http://doc.qt.io/qt-5/qfont.html

Parameters : QString, int, int, bool

- bool bold(void)
- int capitalization(void)
- QString defaultFamily(void)
- bool exactMatch(void)
- QString family(void)
- bool fixedPitch(void)
- bool fromString(QString)
- int hintingPreference(void)
- bool isCopyOf(QFont)
- bool italic(void)
- bool kerning(void)
- QString key(void)
- double letterSpacing(void)
- int letterSpacingType(void)
- bool overline(void)
- int pixelSize(void)
- int pointSize(void)
- double pointSizeF(void)
- QFont resolve(QFont)
- void setBold(bool enable)
- void setCapitalization(QFont::Capitalization caps)
- void setFamily(QString)
- void setFixedPitch(bool enable)
- void setHintingPreference(QFont::HintingPreference hintingPreference)
- void setItalic(bool enable)
- void setKerning(bool enable)
- void setLetterSpacing(QFont::SpacingType type, double spacing)
- void setOverline(bool enable)
- void setPixelSize(int pixelSize)
- void setPointSize(int pointSize)
- void setPointSizeF(double pointSize)
- void setStretch(int factor)
- void setStrikeOut(bool enable)
- void setStyle(QFont::Style style)
- void setStyleHint(QFont::StyleHint hint, QFont::StyleStrategy strategy)
- void setStyleName(QString)
- void setStyleStrategy(QFont::StyleStrategy s)
- void setUnderline(bool enable)
- void setWeight(int weight)
- void setWordSpacing(double spacing)
- int stretch(void)
- bool strikeOut(void)
- int style(void)
- int styleHint(void)
- QString styleName(void)
- int styleStrategy(void)
- QString toString(void)
- bool underline(void)
- int weight(void)
- double wordSpacing(void)
- void insertSubstitution(QString,QString)
- void insertSubstitutions(QString,QStringList)
- QString substitute(QString)
- QStringList substitutes(QString)
- QStringList substitutions(void)

# QFontDatabase Class

C++ Reference : http://doc.qt.io/qt-5/qfontdatabase.html

Parameters : void

- bool bold(QString family, QString style)
- QStringList families(QFontDatabase::WritingSystem writingSystem)
- QFont font(QString family, QString style, int pointSize)
- bool isBitmapScalable(QString family, QString style)
- bool isFixedPitch(QString family, QString style)
- bool isPrivateFamily(QString family)
- bool isScalable(QString family, QString style)
- bool isSmoothlyScalable(QString family, QString style)
- bool italic(QString family, QString style)
- QList<int> pointSizes(QString family, QString styleName)
- QList<int> smoothSizes(QString family, QString styleName)
- QString styleString(QFont font)
- QString styleString_2(QFontInfo fontInfo)
- QStringList styles(QString family)
- int weight(QString family, QString style)
- QList<QFontDatabase::WritingSystem> writingSystems(void)
- QList<QFontDatabase::WritingSystem> writingSystems_2(QString family)
- int addApplicationFont(QString fileName)
- int addApplicationFontFromData(QByteArray fontData)
- QStringList applicationFontFamilies(int id)
- bool removeAllApplicationFonts(void)
- bool removeApplicationFont(int id)
- QList<int> standardSizes(void)
- QFont systemFont(QFontDatabase::SystemFont type)
- QString writingSystemName(QFontDatabase::WritingSystem writingSystem)
- QString writingSystemSample(QFontDatabase::WritingSystem writingSystem)

# QFontDialog Class

C++ Reference : http://doc.qt.io/qt-5/qfontdialog.html

Parameters : void

Parent Class : QDialog

- QFont currentFont(void)
- void open(QObject * receiver, char * member)
- QFontDialog::FontDialogOptions options(void)
- QFont selectedFont(void)
- void setCurrentFont(QFont font)
- void setOption(QFontDialog::FontDialogOption option, bool on)
- void setOptions(QFontDialog::FontDialogOptions options)
- bool testOption(QFontDialog::FontDialogOption option)
- QFont getFont_2(bool * ok, QFont initial, QWidget * parent, QString title, QFontDialog::FontDialogOptions options)
- QFont getFont_3(bool * ok, QWidget * parent)
- void setcurrentFontChangedEvent(const char *)
- void setfontSelectedEvent(const char *)
- const char *getcurrentFontChangedEvent(void)
- const char *getfontSelectedEvent(void)
- int getfont(void)

# QFontMetrics Class

C++ Reference : http://doc.qt.io/qt-5/qfontmetrics.html

Parameters : QFont

- int ascent(void)
- int averageCharWidth(void)
- QRect boundingRect(QChar ch)
- QRect boundingRect_2( QString   text)
- QRect boundingRect_3(int x, int y, int width, int height, int flags,  QString   text, int tabStops , int * tabArray )
- QRect boundingRect_4( QRect   rect, int flags,  QString   text, int tabStops , int * tabArray )
- int descent(void)
- QString elidedText( QString   text, Qt::TextElideMode mode, int width, int flags )
- int height(void)
- bool inFont(QChar ch)
- bool inFontUcs4(uint character)
- int leading(void)
- int leftBearing(QChar ch)
- int lineSpacing(void)
- int lineWidth(void)
- int maxWidth(void)
- int minLeftBearing(void)
- int minRightBearing(void)
- int overlinePos(void)
- int rightBearing(QChar ch)
- QSize size(int flags,  QString   text, int tabStops , int * tabArray )
- int strikeOutPos(void)
- QRect tightBoundingRect( QString   text)
- int underlinePos(void)
- int xHeight(void)
- int horizontalAdvance( QString   text, int len )
- int horizontalAdvance_2(QChar ch)

# QFormLayout Class

C++ Reference : http://doc.qt.io/qt-5/qformlayout.html

Parameters : void

Parent Class : QLayout

- void addRow(QWidget *label, QWidget *field)
- void addRow_2(QWidget *label, QLayout *field)
- void addRow_3(QString, QWidget *field)
- void addRow_4(QString, QLayout *field)
- void addRow_5(QWidget *widget)
- void addRow_6(QLayout *layout)
- void insertRow(int row, QWidget *label, QWidget *field)
- void insertRow_2(int row, QWidget *label, QLayout *field)
- void insertRow_3(int row, QString, QWidget *field)
- void insertRow_4(int row, QString, QLayout *field)
- void insertRow_5(int row, QWidget *widget)
- void insertRow_6(int row, QLayout *layout)
- QFormLayout::FieldGrowthPolicy fieldGrowthPolicy(void)
- QFormLayout::RowWrapPolicy rowWrapPolicy(void)
- Qt::Alignment labelAlignment(void)
- Qt::Alignment formAlignment(void)
- int horizontalSpacing(void)
- int verticalSpacing(void)
- int rowCount(void)
- int spacing(void)
- void setFieldGrowthPolicy(QFormLayout::FieldGrowthPolicy policy)
- void setRowWrapPolicy(QFormLayout::RowWrapPolicy policy)
- void setLabelAlignment(Qt::Alignment alignment)
- void setFormAlignment(Qt::Alignment alignment)
- void setHorizontalSpacing(int spacing)
- void setVerticalSpacing(int spacing)
- void setSpacing(int spacing)
- QWidget *labelForField(QWidget *field)
- QWidget *labelForField_2(QLayout *field)

# QForwardRenderer Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qforwardrenderer.html

Parameters : Qt3DCore::QNode *

- Qt3DCore::QEntity * camera(void)
- QColor clearColor(void)
- QSize externalRenderTargetSize(void)
- float gamma(void)
- bool isFrustumCullingEnabled(void)
- QObject * surface(void)
- QRectF viewportRect(void)
- void setCamera(Qt3DCore::QEntity *camera)
- void setClearColor(QColor clearColor)
- void setExternalRenderTargetSize(QSize size)
- void setFrustumCullingEnabled(bool enabled)
- void setGamma(float gamma)
- void setSurface(QObject *surface)
- void setViewportRect(QRectF viewportRect)

# QFrame Class

C++ Reference : http://doc.qt.io/qt-5/qframe.html

Parameters : QWidget *parent, Qt::WindowType flag

Parent Class : QWidget

- QRect frameRect(void)
- int frameShadow(void)
- int frameShape(void)
- int frameStyle(void)
- int frameWidth(void)
- int lineWidth(void)
- int midLineWidth(void)
- void setFrameRect(QRect)
- void setFrameShadow(QFrame::Shadow)
- void setFrameShape(QFrame::Shape)
- void setFrameStyle(int style)
- void setLineWidth(int)
- void setMidLineWidth(int)
- QSize sizeHint(void)

# QFrame2 Class

Parameters : void

Parent Class : QFrame

# QFrame3 Class

Parameters : QWidget *parent

Parent Class : QFrame

# QFrameAction Class

C++ Reference : http://doc.qt.io/qt-5/qt3dlogic-qframeaction.html

Parameters : Qt3DCore::QNode *

- void settriggeredEvent(const char *)
- const char *gettriggeredEvent(void)

# QGeoAddress Class

C++ Reference : http://doc.qt.io/qt-5/qgeoaddress.html

Parameters : void

- QString city(void)
- void clear(void)
- QString country(void)
- QString countryCode(void)
- QString county(void)
- QString district(void)
- bool isEmpty(void)
- bool isTextGenerated(void)
- QString postalCode(void)
- void setCity(QString city)
- void setCountry(QString country)
- void setCountryCode(QString countryCode)
- void setCounty(QString county)
- void setDistrict(QString district)
- void setPostalCode(QString postalCode)
- void setState(QString state)
- void setStreet(QString street)
- void setText(QString text)
- QString state(void)
- QString street(void)
- QString text(void)

# QGeoAreaMonitorInfo Class

C++ Reference : http://doc.qt.io/qt-5/qgeoareamonitorinfo.html

Parameters : QString

- QGeoShape area(void)
- QDateTime expiration(void)
- QString identifier(void)
- bool isPersistent(void)
- bool isValid(void)
- QString name(void)
- QVariantMap notificationParameters(void)
- void setArea(QGeoShape newShape)
- void setExpiration(QDateTime expiry)
- void setName(QString name)
- void setNotificationParameters(QVariantMap parameters)
- void setPersistent(bool isPersistent)

# QGeoAreaMonitorSource Class

C++ Reference : http://doc.qt.io/qt-5/qgeoareamonitorsource.html

Parameters : QObject *

Parent Class : QObject

- QString sourceName(void)
- QStringList availableSources(void)
- QGeoAreaMonitorSource * createDefaultSource(QObject * parent)
- QGeoAreaMonitorSource * createSource(QString sourceName, QObject * parent)

# QGeoCircle Class

C++ Reference : http://doc.qt.io/qt-5/qgeocircle.html

Parameters : void

- QGeoCoordinate center(void)
- qreal radius(void)
- void setCenter(QGeoCoordinate center)
- void setRadius(qreal radius)
- void translate(double degreesLatitude, double degreesLongitude)
- QGeoCircle translated(double degreesLatitude, double degreesLongitude)

# QGeoCoordinate Class

C++ Reference : http://doc.qt.io/qt-5/qgeocoordinate.html

Parameters : void

- double altitude(void)
- QGeoCoordinate atDistanceAndAzimuth(qreal distance, qreal azimuth, qreal distanceUp)
- qreal azimuthTo(QGeoCoordinate other)
- qreal distanceTo(QGeoCoordinate other)
- bool isValid(void)
- double latitude(void)
- double longitude(void)
- void setAltitude(double altitude)
- void setLatitude(double latitude)
- void setLongitude(double longitude)
- QString toString(QGeoCoordinate::CoordinateFormat format)
- QGeoCoordinate::CoordinateType type(void)

# QGeoPositionInfo Class

C++ Reference : http://doc.qt.io/qt-5/qgeopositioninfo.html

Parameters : void

- qreal attribute(QGeoPositionInfo::Attribute attribute)
- QGeoCoordinate coordinate(void)
- bool hasAttribute(QGeoPositionInfo::Attribute attribute)
- bool isValid(void)
- void removeAttribute(QGeoPositionInfo::Attribute attribute)
- void setAttribute(QGeoPositionInfo::Attribute attribute, qreal value)
- void setCoordinate(QGeoCoordinate coordinate)
- void setTimestamp(QDateTime timestamp)
- QDateTime timestamp(void)

# QGeoPositionInfoSource Class

C++ Reference : http://doc.qt.io/qt-5/qgeopositioninfosource.html

Parent Class : QObject

- QGeoPositionInfoSource::PositioningMethods preferredPositioningMethods(void)
- QString sourceName(void)
- int updateInterval(void)
- void seterrorEvent(const char *)
- void setpositionUpdatedEvent(const char *)
- void setupdateTimeoutEvent(const char *)
- const char *geterrorEvent(void)
- const char *getpositionUpdatedEvent(void)
- const char *getupdateTimeoutEvent(void)
- QStringList availableSources(void)
- QGeoPositionInfoSource *createDefaultSource(QObject *parent)
- QGeoPositionInfoSource *createSource(QString sourceName, QObject *parent)

# QGeoRectangle Class

C++ Reference : http://doc.qt.io/qt-5/qgeorectangle.html

Parameters : void

Parent Class : QGeoShape

- QGeoCoordinate bottomLeft(void)
- QGeoCoordinate bottomRight(void)
- QGeoCoordinate center(void)
- bool contains(QGeoRectangle rectangle)
- double height(void)
- bool intersects(QGeoRectangle rectangle)
- void setBottomLeft(QGeoCoordinate bottomLeft)
- void setBottomRight(QGeoCoordinate bottomRight)
- void setCenter(QGeoCoordinate center)
- void setHeight(double degreesHeight)
- void setTopLeft(QGeoCoordinate topLeft)
- void setTopRight(QGeoCoordinate topRight)
- void setWidth(double degreesWidth)
- QGeoCoordinate topLeft(void)
- QGeoCoordinate topRight(void)
- void translate(double degreesLatitude, double degreesLongitude)
- QGeoRectangle translated(double degreesLatitude, double degreesLongitude)
- QGeoRectangle united(QGeoRectangle rectangle)
- double width(void)

# QGeoSatelliteInfo Class

C++ Reference : http://doc.qt.io/qt-5/qgeosatelliteinfo.html

Parameters : void

- qreal attribute(QGeoSatelliteInfo::Attribute attribute)
- bool hasAttribute(QGeoSatelliteInfo::Attribute attribute)
- void removeAttribute(QGeoSatelliteInfo::Attribute attribute)
- int satelliteIdentifier(void)
- QGeoSatelliteInfo::SatelliteSystem satelliteSystem(void)
- void setAttribute(QGeoSatelliteInfo::Attribute attribute, qreal value)
- void setSatelliteIdentifier(int satId)
- void setSatelliteSystem(QGeoSatelliteInfo::SatelliteSystem system)
- void setSignalStrength(int signalStrength)
- int signalStrength(void)

# QGeoSatelliteInfoSource Class

C++ Reference : http://doc.qt.io/qt-5/qgeosatelliteinfosource.html

- QString sourceName(void)
- int updateInterval(void)

# QGeoShape Class

C++ Reference : http://doc.qt.io/qt-5/qgeoshape.html

Parameters : void

- bool contains(QGeoCoordinate coordinate)
- bool isEmpty(void)
- bool isValid(void)
- QGeoShape::ShapeType type(void)

# QGoochMaterial Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qgoochmaterial.html

Parameters : Qt3DCore::QNode *

- float alpha(void)
- float beta(void)
- QColor cool(void)
- QColor diffuse(void)
- float shininess(void)
- QColor specular(void)
- QColor warm(void)
- void setAlpha(float alpha)
- void setBeta(float beta)
- void setCool(QColor cool)
- void setDiffuse(QColor diffuse)
- void setShininess(float shininess)
- void setSpecular(QColor specular)
- void setWarm(QColor warm)

# QGradient Class

C++ Reference : http://doc.qt.io/qt-5/qgradient.html

Parameters : void

- QGradient::CoordinateMode coordinateMode(void)
- void setColorAt(qreal position,  QColor   color)
- void setCoordinateMode(QGradient::CoordinateMode mode)
- void setSpread(QGradient::Spread method)
- void setStops(QGradientStops stopPoints)
- QGradient::Spread spread(void)
- QGradientStops stops(void)
- QGradient::Type type(void)

# QGraphicsAnchor Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsanchor.html

Parent Class : QObject

- void setSizePolicy(QSizePolicy::Policy policy)
- void setSpacing(qreal spacing)
- QSizePolicy::Policy sizePolicy(void)
- qreal spacing(void)
- void unsetSpacing(void)

# QGraphicsAnchorLayout Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsanchorlayout.html

Parameters : QGraphicsLayoutItem *

Parent Class : QGraphicsLayout

- QGraphicsAnchor * addAnchor(QGraphicsLayoutItem *firstItem, Qt::AnchorPoint firstEdge, QGraphicsLayoutItem *secondItem, Qt::AnchorPoint secondEdge)
- void addAnchors(QGraphicsLayoutItem *firstItem, QGraphicsLayoutItem *secondItem, Qt::Orientations orientations)
- void addCornerAnchors(QGraphicsLayoutItem *firstItem, Qt::Corner firstCorner, QGraphicsLayoutItem *secondItem, Qt::Corner secondCorner)
- QGraphicsAnchor * anchor(QGraphicsLayoutItem *firstItem, Qt::AnchorPoint firstEdge, QGraphicsLayoutItem *secondItem, Qt::AnchorPoint secondEdge)
- qreal horizontalSpacing(void)
- void setHorizontalSpacing(qreal spacing)
- void setSpacing(qreal spacing)
- void setVerticalSpacing(qreal spacing)
- qreal verticalSpacing(void)

# QGraphicsEffect Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicseffect.html

Parameters : QObject *

Parent Class : QObject

- QRectF boundingRect(void)
- QRectF boundingRectFor(QRectF rect)
- bool isEnabled(void)
- void setEnabled(bool enable)
- void update(void)
- void setenabledChangedEvent(const char *)
- const char *getenabledChangedEvent(void)

# QGraphicsEllipseItem Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsellipseitem.html

Parameters : QGraphicsItem *

Parent Class : QAbstractGraphicsShapeItem

- QRectF rect(void)
- void setRect(QRectF rect)
- void setRect_2(qreal x, qreal y, qreal width, qreal height)
- void setSpanAngle(int angle)
- void setStartAngle(int angle)
- int spanAngle(void)
- int startAngle(void)

# QGraphicsGridLayout Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsgridlayout.html

Parameters : QGraphicsLayoutItem *

Parent Class : QGraphicsLayout

- void addItem(QGraphicsLayoutItem *item, int row, int column, int rowSpan, int columnSpan, Qt::Alignment alignment)
- void addItem_2(QGraphicsLayoutItem *item, int row, int column, Qt::Alignment alignment)
- Qt::Alignment alignment(QGraphicsLayoutItem *item)
- Qt::Alignment columnAlignment(int column)
- int columnCount(void)
- qreal columnMaximumWidth(int column)
- qreal columnMinimumWidth(int column)
- qreal columnPreferredWidth(int column)
- qreal columnSpacing(int column)
- int columnStretchFactor(int column)
- qreal horizontalSpacing(void)
- QGraphicsLayoutItem * itemAt(int row, int column)
- void removeItem(QGraphicsLayoutItem *item)
- Qt::Alignment rowAlignment(int row)
- int rowCount(void)
- qreal rowMaximumHeight(int row)
- qreal rowMinimumHeight(int row)
- qreal rowPreferredHeight(int row)
- qreal rowSpacing(int row)
- int rowStretchFactor(int row)
- void setAlignment(QGraphicsLayoutItem *item, Qt::Alignment alignment)
- void setColumnAlignment(int column, Qt::Alignment alignment)
- void setColumnFixedWidth(int column, qreal width)
- void setColumnMaximumWidth(int column, qreal width)
- void setColumnMinimumWidth(int column, qreal width)
- void setColumnPreferredWidth(int column, qreal width)
- void setColumnSpacing(int column, qreal spacing)
- void setColumnStretchFactor(int column, int stretch)
- void setHorizontalSpacing(qreal spacing)
- void setRowAlignment(int row, Qt::Alignment alignment)
- void setRowFixedHeight(int row, qreal height)
- void setRowMaximumHeight(int row, qreal height)
- void setRowMinimumHeight(int row, qreal height)
- void setRowPreferredHeight(int row, qreal height)
- void setRowSpacing(int row, qreal spacing)
- void setRowStretchFactor(int row, int stretch)
- void setSpacing(qreal spacing)
- void setVerticalSpacing(qreal spacing)
- qreal verticalSpacing(void)

# QGraphicsItem Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsitem.html

Parameters : QGraphicsItem *

- bool acceptDrops(void)
- bool acceptHoverEvents(void)
- bool acceptTouchEvents(void)
- Qt::MouseButtons acceptedMouseButtons(void)
- void advance(int phase)
- QRectF boundingRect(void)
- QRegion boundingRegion(QTransform itemToDeviceTransform)
- qreal boundingRegionGranularity(void)
- QGraphicsItem::CacheMode cacheMode(void)
- QList<QGraphicsItem *> childItems(void)
- QRectF childrenBoundingRect(void)
- void clearFocus(void)
- QPainterPath clipPath(void)
- bool collidesWithItem(QGraphicsItem *other, Qt::ItemSelectionMode mode)
- bool collidesWithPath(QPainterPath path, Qt::ItemSelectionMode mode)
- QList<QGraphicsItem *> collidingItems(Qt::ItemSelectionMode mode)
- QGraphicsItem * commonAncestorItem(QGraphicsItem *other)
- bool contains(QPointF point)
- QCursor cursor(void)
- QVariant data(int key)
- QTransform deviceTransform(QTransform viewportTransform)
- qreal effectiveOpacity(void)
- void ensureVisible(QRectF rect, int xmargin, int ymargin)
- void ensureVisible_2(qreal x, qreal y, qreal w, qreal h, int xmargin, int ymargin)
- bool filtersChildEvents(void)
- QGraphicsItem::GraphicsItemFlags flags(void)
- QGraphicsItem * focusItem(void)
- QGraphicsItem * focusProxy(void)
- void grabKeyboard(void)
- void grabMouse(void)
- QGraphicsEffect * graphicsEffect(void)
- QGraphicsItemGroup * group(void)
- bool hasCursor(void)
- bool hasFocus(void)
- void hide(void)
- Qt::InputMethodHints inputMethodHints(void)
- void installSceneEventFilter(QGraphicsItem *filterItem)
- bool isActive(void)
- bool isAncestorOf(QGraphicsItem *child)
- bool isClipped(void)
- bool isEnabled(void)
- bool isObscured(QRectF rect)
- bool isObscured_2(qreal x, qreal y, qreal w, qreal h)
- bool isObscuredBy(QGraphicsItem *item)
- bool isPanel(void)
- bool isSelected(void)
- bool isUnderMouse(void)
- bool isVisible(void)
- bool isVisibleTo(QGraphicsItem *parent)
- bool isWidget(void)
- bool isWindow(void)
- QTransform itemTransform(QGraphicsItem *other, bool *ok)
- QPointF mapFromItem(QGraphicsItem *item, QPointF point)
- QPolygonF mapFromItem_2(QGraphicsItem *item, QRectF rect)
- QPolygonF mapFromItem_3(QGraphicsItem *item, QPolygonF polygon)
- QPainterPath mapFromItem_4(QGraphicsItem *item, QPainterPath path)
- QPointF mapFromItem_5(QGraphicsItem *item, qreal x, qreal y)
- QPolygonF mapFromItem_6(QGraphicsItem *item, qreal x, qreal y, qreal w, qreal h)
- QPointF mapFromParent(QPointF point)
- QPolygonF mapFromParent_2(QRectF rect)
- QPolygonF mapFromParent_3(QPolygonF polygon)
- QPainterPath mapFromParent_4(QPainterPath path)
- QPointF mapFromParent_5(qreal x, qreal y)
- QPolygonF mapFromParent_6(qreal x, qreal y, qreal w, qreal h)
- QPointF mapFromScene(QPointF point)
- QPolygonF mapFromScene_2(QRectF rect)
- QPolygonF mapFromScene_3(QPolygonF polygon)
- QPainterPath mapFromScene_4(QPainterPath path)
- QPointF mapFromScene_5(qreal x, qreal y)
- QPolygonF mapFromScene_6(qreal x, qreal y, qreal w, qreal h)
- QRectF mapRectFromItem(QGraphicsItem *item, QRectF rect)
- QRectF mapRectFromItem_2(QGraphicsItem *item, qreal x, qreal y, qreal w, qreal h)
- QRectF mapRectFromParent(QRectF rect)
- QRectF mapRectFromParent_2(qreal x, qreal y, qreal w, qreal h)
- QRectF mapRectFromScene(QRectF rect)
- QRectF mapRectFromScene_2(qreal x, qreal y, qreal w, qreal h)
- QRectF mapRectToItem(QGraphicsItem *item, QRectF rect)
- QRectF mapRectToItem_2(QGraphicsItem *item, qreal x, qreal y, qreal w, qreal h)
- QRectF mapRectToParent(QRectF rect)
- QRectF mapRectToParent_2(qreal x, qreal y, qreal w, qreal h)
- QRectF mapRectToScene(QRectF rect)
- QRectF mapRectToScene_2(qreal x, qreal y, qreal w, qreal h)
- QPointF mapToItem(QGraphicsItem *item, QPointF point)
- QPolygonF mapToItem_2(QGraphicsItem *item, QRectF rect)
- QPolygonF mapToItem_3(QGraphicsItem *item, QPolygonF polygon)
- QPainterPath mapToItem_4(QGraphicsItem *item, QPainterPath path)
- QPointF mapToItem_5(QGraphicsItem *item, qreal x, qreal y)
- QPolygonF mapToItem_6(QGraphicsItem *item, qreal x, qreal y, qreal w, qreal h)
- QPointF mapToParent(QPointF point)
- QPolygonF mapToParent_2(QRectF rect)
- QPolygonF mapToParent_3(QPolygonF polygon)
- QPainterPath mapToParent_4(QPainterPath path)
- QPointF mapToParent_5(qreal x, qreal y)
- QPolygonF mapToParent_6(qreal x, qreal y, qreal w, qreal h)
- QPointF mapToScene(QPointF point)
- QPolygonF mapToScene_2(QRectF rect)
- QPolygonF mapToScene_3(QPolygonF polygon)
- QPainterPath mapToScene_4(QPainterPath path)
- QPointF mapToScene_5(qreal x, qreal y)
- QPolygonF mapToScene_6(qreal x, qreal y, qreal w, qreal h)
- void moveBy(qreal dx, qreal dy)
- qreal opacity(void)
- QPainterPath opaqueArea(void)
- void paint(QPainter *painter, QStyleOptionGraphicsItem *option, QWidget *widget)
- QGraphicsItem * panel(void)
- QGraphicsItem::PanelModality panelModality(void)
- QGraphicsItem * parentItem(void)
- QGraphicsObject * parentObject(void)
- QGraphicsWidget * parentWidget(void)
- QPointF pos(void)
- void removeSceneEventFilter(QGraphicsItem *filterItem)
- void resetTransform(void)
- qreal rotation(void)
- qreal scale(void)
- QGraphicsScene * scene(void)
- QRectF sceneBoundingRect(void)
- QPointF scenePos(void)
- QTransform sceneTransform(void)
- void scroll(qreal dx, qreal dy, QRectF rect)
- void setAcceptDrops(bool on)
- void setAcceptHoverEvents(bool enabled)
- void setAcceptTouchEvents(bool enabled)
- void setAcceptedMouseButtons(Qt::MouseButtons buttons)
- void setActive(bool active)
- void setBoundingRegionGranularity(qreal granularity)
- void setCacheMode(QGraphicsItem::CacheMode mode, QSize logicalCacheSize)
- void setCursor(QCursor cursor)
- void setData(int key, QVariant value)
- void setEnabled(bool enabled)
- void setFiltersChildEvents(bool enabled)
- void setFlag(QGraphicsItem::GraphicsItemFlag flag, bool enabled)
- void setFlags(QGraphicsItem::GraphicsItemFlags flags)
- void setFocus(Qt::FocusReason focusReason)
- void setFocusProxy(QGraphicsItem *item)
- void setGraphicsEffect(QGraphicsEffect *effect)
- void setGroup(QGraphicsItemGroup *group)
- void setInputMethodHints(Qt::InputMethodHints hints)
- void setOpacity(qreal opacity)
- void setPanelModality(QGraphicsItem::PanelModality panelModality)
- void setParentItem(QGraphicsItem *newParent)
- void setPos(QPointF pos)
- void setPos_2(qreal x, qreal y)
- void setRotation(qreal angle)
- void setScale(qreal factor)
- void setSelected(bool selected)
- void setToolTip(QString toolTip)
- void setTransform(QTransform matrix, bool combine)
- void setTransformOriginPoint(QPointF origin)
- void setTransformOriginPoint_2(qreal x, qreal y)
- void setTransformations(QList<QGraphicsTransform *> transformations)
- void setVisible(bool visible)
- void setX(qreal x)
- void setY(qreal y)
- void setZValue(qreal z)
- QPainterPath shape(void)
- void show(void)
- void stackBefore(QGraphicsItem *sibling)
- QGraphicsObject * toGraphicsObject(void)
- QGraphicsObject * toGraphicsObject_2(void)
- QString toolTip(void)
- QGraphicsItem * topLevelItem(void)
- QGraphicsWidget * topLevelWidget(void)
- QTransform transform(void)
- QPointF transformOriginPoint(void)
- QList<QGraphicsTransform *> transformations(void)
- int type(void)
- void ungrabKeyboard(void)
- void ungrabMouse(void)
- void unsetCursor(void)
- void update(QRectF rect)
- void update_2(qreal x, qreal y, qreal width, qreal height)
- QGraphicsWidget * window(void)
- qreal x(void)
- qreal y(void)
- qreal zValue(void)

# QGraphicsItemGroup Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsitemgroup.html

Parameters : QGraphicsItem *

Parent Class : QGraphicsItem

- void addToGroup(QGraphicsItem *item)
- void removeFromGroup(QGraphicsItem *item)

# QGraphicsLayout Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicslayout.html

Parameters : QGraphicsLayoutItem *

Parent Class : QGraphicsLayoutItem

- void activate(void)
- int count(void)
- void invalidate(void)
- bool isActivated(void)
- QGraphicsLayoutItem * itemAt(int i)
- void removeAt(int index)
- void setContentsMargins(qreal left, qreal top, qreal right, qreal bottom)
- void widgetEvent(QEvent *e)

# QGraphicsLayoutItem Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicslayoutitem.html

Parameters : QGraphicsLayoutItem *,bool

- QRectF contentsRect(void)
- QSizeF effectiveSizeHint(Qt::SizeHint which, QSizeF constraint)
- QRectF geometry(void)
- void getContentsMargins(qreal *left, qreal *top, qreal *right, qreal *bottom)
- QGraphicsItem * graphicsItem(void)
- bool isLayout(void)
- qreal maximumHeight(void)
- QSizeF maximumSize(void)
- qreal maximumWidth(void)
- qreal minimumHeight(void)
- QSizeF minimumSize(void)
- qreal minimumWidth(void)
- bool ownedByLayout(void)
- QGraphicsLayoutItem * parentLayoutItem(void)
- qreal preferredHeight(void)
- QSizeF preferredSize(void)
- qreal preferredWidth(void)
- void setGeometry(QRectF rect)
- void setMaximumHeight(qreal height)
- void setMaximumSize(QSizeF size)
- void setMaximumSize_2(qreal w, qreal h)
- void setMaximumWidth(qreal width)
- void setMinimumHeight(qreal height)
- void setMinimumSize(QSizeF size)
- void setMinimumSize_2(qreal w, qreal h)
- void setMinimumWidth(qreal width)
- void setParentLayoutItem(QGraphicsLayoutItem *parent)
- void setPreferredHeight(qreal height)
- void setPreferredSize(QSizeF size)
- void setPreferredSize_2(qreal w, qreal h)
- void setPreferredWidth(qreal width)
- void setSizePolicy(QSizePolicy policy)
- void setSizePolicy_2(QSizePolicy::Policy hPolicy, QSizePolicy::Policy vPolicy, QSizePolicy::ControlType controlType)
- QSizePolicy sizePolicy(void)
- void updateGeometry(void)

# QGraphicsLineItem Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicslineitem.html

Parameters : QGraphicsItem *

Parent Class : QGraphicsItem

- QLineF line(void)
- QPen pen(void)
- void setLine(QLineF line)
- void setLine_2(qreal x1, qreal y1, qreal x2, qreal y2)
- void setPen(QPen pen)

# QGraphicsLinearLayout Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicslinearlayout.html

Parameters : QGraphicsLayoutItem *

Parent Class : QGraphicsLayout

- void addItem(QGraphicsLayoutItem *item)
- void addStretch(int stretch)
- Qt::Alignment alignment(QGraphicsLayoutItem *item)
- void insertItem(int index, QGraphicsLayoutItem *item)
- void insertStretch(int index, int stretch)
- qreal itemSpacing(int index)
- Qt::Orientation orientation(void)
- void removeItem(QGraphicsLayoutItem *item)
- void setAlignment(QGraphicsLayoutItem *item, Qt::Alignment alignment)
- void setItemSpacing(int index, qreal spacing)
- void setOrientation(Qt::Orientation orientation)
- void setSpacing(qreal spacing)
- void setStretchFactor(QGraphicsLayoutItem *item, int stretch)
- qreal spacing(void)
- int stretchFactor(QGraphicsLayoutItem *item)

# QGraphicsObject Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsobject.html

Parameters : QGraphicsItem *

Parent Class : QGraphicsItem

- void grabGesture(Qt::GestureType gesture, Qt::GestureFlags flags)
- void ungrabGesture(Qt::GestureType gesture)
- void setenabledChangedEvent(const char *)
- void setopacityChangedEvent(const char *)
- void setparentChangedEvent(const char *)
- void setrotationChangedEvent(const char *)
- void setscaleChangedEvent(const char *)
- void setvisibleChangedEvent(const char *)
- void setxChangedEvent(const char *)
- void setyChangedEvent(const char *)
- void setzChangedEvent(const char *)
- const char *getenabledChangedEvent(void)
- const char *getopacityChangedEvent(void)
- const char *getparentChangedEvent(void)
- const char *getrotationChangedEvent(void)
- const char *getscaleChangedEvent(void)
- const char *getvisibleChangedEvent(void)
- const char *getxChangedEvent(void)
- const char *getyChangedEvent(void)
- const char *getzChangedEvent(void)

# QGraphicsPathItem Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicspathitem.html

Parameters : QGraphicsItem *

Parent Class : QAbstractGraphicsShapeItem

- QPainterPath path(void)
- void setPath(QPainterPath path)

# QGraphicsPixmapItem Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicspixmapitem.html

Parameters : QGraphicsItem *

Parent Class : QGraphicsItem

- QPointF offset(void)
- QPixmap pixmap(void)
- void setOffset(QPointF offset)
- void setOffset_2(qreal x, qreal y)
- void setPixmap(QPixmap pixmap)
- void setShapeMode(QGraphicsPixmapItem::ShapeMode mode)
- void setTransformationMode(Qt::TransformationMode mode)
- QGraphicsPixmapItem::ShapeMode shapeMode(void)
- Qt::TransformationMode transformationMode(void)

# QGraphicsPolygonItem Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicspolygonitem.html

Parameters : QGraphicsItem *

Parent Class : QAbstractGraphicsShapeItem

- Qt::FillRule fillRule(void)
- QPolygonF polygon(void)
- void setFillRule(Qt::FillRule rule)
- void setPolygon(QPolygonF polygon)

# QGraphicsProxyWidget Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsproxywidget.html

Parameters : QGraphicsItem *,Qt::WindowFlags

Parent Class : QGraphicsWidget

- QGraphicsProxyWidget * createProxyForChildWidget(QWidget *child)
- void setWidget(QWidget *widget)
- QRectF subWidgetRect(QWidget *widget)
- QWidget * widget(void)

# QGraphicsRectItem Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsrectitem.html

Parameters : QGraphicsItem *

Parent Class : QAbstractGraphicsShapeItem

- QRectF rect(void)
- void setRect(QRectF rectangle)
- void setRect_2(qreal x, qreal y, qreal width, qreal height)

# QGraphicsScene Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsscene.html

Parameters : QObject *

Parent Class : QObject

- QGraphicsItem * activePanel(void)
- QGraphicsWidget * activeWindow(void)
- QGraphicsEllipseItem * addEllipse(QRectF rect, QPen pen, QBrush brush)
- QGraphicsEllipseItem * addEllipse_2(qreal x, qreal y, qreal w, qreal h, QPen pen, QBrush brush)
- void addItem(QGraphicsItem *item)
- QGraphicsLineItem * addLine(QLineF line, QPen pen)
- QGraphicsLineItem * addLine_2(qreal x1, qreal y1, qreal x2, qreal y2, QPen pen)
- QGraphicsPathItem * addPath(QPainterPath path, QPen pen, QBrush brush)
- QGraphicsPixmapItem * addPixmap(QPixmap pixmap)
- QGraphicsPolygonItem * addPolygon(QPolygonF polygon, QPen pen, QBrush brush)
- QGraphicsRectItem * addRect(QRectF rect, QPen pen, QBrush brush)
- QGraphicsRectItem * addRect_2(qreal x, qreal y, qreal w, qreal h, QPen pen, QBrush brush)
- QGraphicsSimpleTextItem * addSimpleText(QString text, QFont font)
- QGraphicsTextItem * addText(QString text, QFont font)
- QGraphicsProxyWidget * addWidget(QWidget *widget, Qt::WindowFlags wFlags)
- QBrush backgroundBrush(void)
- int bspTreeDepth(void)
- void clearFocus(void)
- QList<QGraphicsItem *> collidingItems(QGraphicsItem *item, Qt::ItemSelectionMode mode)
- QGraphicsItemGroup * createItemGroup(QList<QGraphicsItem *> items)
- void destroyItemGroup(QGraphicsItemGroup *group)
- QGraphicsItem * focusItem(void)
- QFont font(void)
- QBrush foregroundBrush(void)
- bool hasFocus(void)
- qreal height(void)
- QVariant inputMethodQuery(Qt::InputMethodQuery query)
- void invalidate(qreal x, qreal y, qreal w, qreal h, QGraphicsScene::SceneLayers layers)
- bool isActive(void)
- QGraphicsItem * itemAt(QPointF position, QTransform deviceTransform)
- QGraphicsItem * itemAt_2(qreal x, qreal y, QTransform deviceTransform)
- QGraphicsScene::ItemIndexMethod itemIndexMethod(void)
- QList<QGraphicsItem *> items(Qt::SortOrder order)
- QList<QGraphicsItem *> items_2(QPointF pos, Qt::ItemSelectionMode mode, Qt::SortOrder order, QTransform deviceTransform)
- QList<QGraphicsItem *> items_3(QRectF rect, Qt::ItemSelectionMode mode, Qt::SortOrder order, QTransform deviceTransform)
- QList<QGraphicsItem *> items_4(QPolygonF polygon, Qt::ItemSelectionMode mode, Qt::SortOrder order, QTransform deviceTransform)
- QList<QGraphicsItem *> items_5(QPainterPath path, Qt::ItemSelectionMode mode, Qt::SortOrder order, QTransform deviceTransform)
- QList<QGraphicsItem *> items_6(qreal x, qreal y, qreal w, qreal h, Qt::ItemSelectionMode mode, Qt::SortOrder order, QTransform deviceTransform)
- QRectF itemsBoundingRect(void)
- qreal minimumRenderSize(void)
- QGraphicsItem * mouseGrabberItem(void)
- QPalette palette(void)
- void removeItem(QGraphicsItem *item)
- void render(QPainter *painter, QRectF target, QRectF source, Qt::AspectRatioMode aspectRatioMode)
- QRectF sceneRect(void)
- QList<QGraphicsItem *> selectedItems(void)
- QPainterPath selectionArea(void)
- bool sendEvent(QGraphicsItem *item, QEvent *event)
- void setActivePanel(QGraphicsItem *item)
- void setActiveWindow(QGraphicsWidget *widget)
- void setBackgroundBrush(QBrush brush)
- void setBspTreeDepth(int depth)
- void setFocus(Qt::FocusReason focusReason)
- void setFocusItem(QGraphicsItem *item, Qt::FocusReason focusReason)
- void setFont(QFont font)
- void setForegroundBrush(QBrush brush)
- void setItemIndexMethod(QGraphicsScene::ItemIndexMethod method)
- void setMinimumRenderSize(qreal minSize)
- void setPalette(QPalette palette)
- void setSceneRect(QRectF rect)
- void setSceneRect_2(qreal x, qreal y, qreal w, qreal h)
- void setSelectionArea(QPainterPath path, QTransform deviceTransform)
- void setSelectionArea_2(QPainterPath path, Qt::ItemSelectionMode mode, QTransform deviceTransform)
- void setSelectionArea_3(QPainterPath path, Qt::ItemSelectionOperation selectionOperation, Qt::ItemSelectionMode mode, QTransform deviceTransform)
- void setStickyFocus(bool enabled)
- void setStyle(QStyle *style)
- bool stickyFocus(void)
- QStyle * style(void)
- void update(qreal x, qreal y, qreal w, qreal h)
- QList<QGraphicsView *> views(void)
- qreal width(void)
- void advance(void)
- void clear(void)
- void clearSelection(void)
- void invalidate_2(QRectF rect, QGraphicsScene::SceneLayers layers)
- void update_2(QRectF rect)
- void setchangedEvent(const char *)
- void setfocusItemChangedEvent(const char *)
- void setsceneRectChangedEvent(const char *)
- void setselectionChangedEvent(const char *)
- const char *getchangedEvent(void)
- const char *getfocusItemChangedEvent(void)
- const char *getsceneRectChangedEvent(void)
- const char *getselectionChangedEvent(void)

# QGraphicsSceneContextMenuEvent Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsscenecontextmenuevent.html

Parent Class : QGraphicsSceneEvent

- Qt::KeyboardModifiers modifiers(void)
- QPointF pos(void)
- QGraphicsSceneContextMenuEvent::Reason reason(void)
- QPointF scenePos(void)
- QPoint screenPos(void)

# QGraphicsSceneDragDropEvent Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsscenedragdropevent.html

Parent Class : QGraphicsSceneEvent

- void acceptProposedAction(void)
- Qt::MouseButtons buttons(void)
- Qt::DropAction dropAction(void)
- QMimeData * mimeData(void)
- Qt::KeyboardModifiers modifiers(void)
- QPointF pos(void)
- Qt::DropActions possibleActions(void)
- Qt::DropAction proposedAction(void)
- QPointF scenePos(void)
- QPoint screenPos(void)
- void setDropAction(Qt::DropAction action)
- QWidget *source(void)

# QGraphicsSceneEvent Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicssceneevent.html

Parent Class : QEvent

- QWidget * widget(void)

# QGraphicsSceneHelpEvent Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsscenehelpevent.html

Parent Class : QGraphicsSceneEvent

- QPointF scenePos(void)
- QPoint screenPos(void)

# QGraphicsSceneHoverEvent Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsscenehoverevent.html

Parent Class : QGraphicsSceneEvent

- QPointF lastPos(void)
- QPointF lastScenePos(void)
- QPoint lastScreenPos(void)
- Qt::KeyboardModifiers modifiers(void)
- QPointF pos(void)
- QPointF scenePos(void)
- QPoint screenPos(void)

# QGraphicsSceneMouseEvent Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsscenemouseevent.html

Parent Class : QGraphicsSceneEvent

- Qt::MouseButton button(void)
- QPointF buttonDownPos(Qt::MouseButton button)
- QPointF buttonDownScenePos(Qt::MouseButton button)
- QPoint buttonDownScreenPos(Qt::MouseButton button)
- Qt::MouseButtons buttons(void)
- Qt::MouseEventFlags flags(void)
- QPointF lastPos(void)
- QPointF lastScenePos(void)
- QPoint lastScreenPos(void)
- Qt::KeyboardModifiers modifiers(void)
- QPointF pos(void)
- QPointF scenePos(void)
- QPoint screenPos(void)
- Qt::MouseEventSource source(void)

# QGraphicsSceneMoveEvent Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsscenemoveevent.html

Parent Class : QGraphicsSceneEvent

- QPointF newPos(void)
- QPointF oldPos(void)

# QGraphicsSceneResizeEvent Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicssceneresizeevent.html

Parent Class : QGraphicsSceneEvent

- QSizeF newSize(void)
- QSizeF oldSize(void)

# QGraphicsSceneWheelEvent Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsscenewheelevent.html

Parent Class : QGraphicsSceneEvent

- Qt::MouseButtons buttons(void)
- int delta(void)
- Qt::KeyboardModifiers modifiers(void)
- Qt::Orientation orientation(void)
- QPointF pos(void)
- QPointF scenePos(void)
- QPoint screenPos(void)

# QGraphicsSimpleTextItem Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicssimpletextitem.html

Parameters : QGraphicsItem *

Parent Class : QAbstractGraphicsShapeItem

- QFont font(void)
- void setFont(QFont font)
- void setText(QString text)
- QString text(void)

# QGraphicsSvgItem Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicssvgitem.html

Parameters : QGraphicsItem *

Parent Class : QGraphicsObject

- QString elementId(void)
- QSize maximumCacheSize(void)
- QSvgRenderer * renderer(void)
- void setElementId(QString id)
- void setMaximumCacheSize(QSize size)
- void setSharedRenderer(QSvgRenderer *renderer)

# QGraphicsTextItem Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicstextitem.html

Parameters : QGraphicsItem *

Parent Class : QGraphicsObject

- void adjustSize(void)
- QColor defaultTextColor(void)
- QTextDocument * document(void)
- QFont font(void)
- bool openExternalLinks(void)
- void setDefaultTextColor(QColor col)
- void setDocument(QTextDocument *document)
- void setFont(QFont font)
- void setHtml(QString text)
- void setOpenExternalLinks(bool open)
- void setPlainText(QString text)
- void setTabChangesFocus(bool b)
- void setTextCursor(QTextCursor cursor)
- void setTextInteractionFlags(Qt::TextInteractionFlags flags)
- void setTextWidth(qreal width)
- bool tabChangesFocus(void)
- QTextCursor textCursor(void)
- Qt::TextInteractionFlags textInteractionFlags(void)
- qreal textWidth(void)
- QString toHtml(void)
- QString toPlainText(void)
- void setlinkActivatedEvent(const char *)
- void setlinkHoveredEvent(const char *)
- const char *getlinkActivatedEvent(void)
- const char *getlinkHoveredEvent(void)

# QGraphicsVideoItem Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsvideoitem.html

Parameters : void

- Qt::AspectRatioMode aspectRatioMode(void)
- QSizeF nativeSize(void)
- QPointF offset(void)
- void setAspectRatioMode(Qt::AspectRatioMode mode)
- void setOffset(QPointF offset)
- void setSize(QSizeF size)
- QSizeF size(void)

# QGraphicsView Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicsview.html

Parameters : QWidget *

Parent Class : QAbstractScrollArea

- Qt::Alignment alignment(void)
- QBrush backgroundBrush(void)
- QGraphicsView::CacheMode cacheMode(void)
- void centerOn(QPointF pos)
- void centerOn_2(qreal x, qreal y)
- void centerOn_3(QGraphicsItem *item)
- QGraphicsView::DragMode dragMode(void)
- void ensureVisible(QRectF rect, int xmargin, int ymargin)
- void ensureVisible_2(qreal x, qreal y, qreal w, qreal h, int xmargin, int ymargin)
- void ensureVisible_3(QGraphicsItem *item, int xmargin, int ymargin)
- void fitInView(QRectF rect, Qt::AspectRatioMode aspectRatioMode)
- void fitInView_2(qreal x, qreal y, qreal w, qreal h, Qt::AspectRatioMode aspectRatioMode)
- void fitInView_3(QGraphicsItem *item, Qt::AspectRatioMode aspectRatioMode)
- QBrush foregroundBrush(void)
- bool isInteractive(void)
- bool isTransformed(void)
- QGraphicsItem * itemAt(QPoint pos)
- QGraphicsItem * itemAt_2(int x, int y)
- QList<QGraphicsItem *> items(void)
- QList<QGraphicsItem *> items_2(QPoint pos)
- QList<QGraphicsItem *> items_3(int x, int y)
- QList<QGraphicsItem *> items_4(QRect rect, Qt::ItemSelectionMode mode)
- QList<QGraphicsItem *> items_5(int x, int y, int w, int h, Qt::ItemSelectionMode mode)
- QList<QGraphicsItem *> items_6(QPolygon polygon, Qt::ItemSelectionMode mode)
- QList<QGraphicsItem *> items_7(QPainterPath path, Qt::ItemSelectionMode mode)
- QPoint mapFromScene(QPointF point)
- QPolygon mapFromScene_2(QRectF rect)
- QPolygon mapFromScene_3(QPolygonF polygon)
- QPainterPath mapFromScene_4(QPainterPath path)
- QPoint mapFromScene_5(qreal x, qreal y)
- QPolygon mapFromScene_6(qreal x, qreal y, qreal w, qreal h)
- QPointF mapToScene(QPoint point)
- QPolygonF mapToScene_2(QRect rect)
- QPolygonF mapToScene_3(QPolygon polygon)
- QPainterPath mapToScene_4(QPainterPath path)
- QPointF mapToScene_5(int x, int y)
- QPolygonF mapToScene_6(int x, int y, int w, int h)
- QGraphicsView::OptimizationFlags optimizationFlags(void)
- void render(QPainter *painter, QRectF target, QRect source, Qt::AspectRatioMode aspectRatioMode)
- QPainter::RenderHints renderHints(void)
- void resetCachedContent(void)
- void resetTransform(void)
- QGraphicsView::ViewportAnchor resizeAnchor(void)
- void rotate(qreal angle)
- QRect rubberBandRect(void)
- Qt::ItemSelectionMode rubberBandSelectionMode(void)
- void scale(qreal sx, qreal sy)
- QGraphicsScene * scene(void)
- QRectF sceneRect(void)
- void setAlignment(Qt::Alignment alignment)
- void setBackgroundBrush(QBrush brush)
- void setCacheMode(QGraphicsView::CacheMode mode)
- void setDragMode(QGraphicsView::DragMode mode)
- void setForegroundBrush(QBrush brush)
- void setInteractive(bool allowed)
- void setOptimizationFlag(QGraphicsView::OptimizationFlag flag, bool enabled)
- void setOptimizationFlags(QGraphicsView::OptimizationFlags flags)
- void setRenderHint(QPainter::RenderHint hint, bool enabled)
- void setRenderHints(QPainter::RenderHints hints)
- void setResizeAnchor(QGraphicsView::ViewportAnchor anchor)
- void setRubberBandSelectionMode(Qt::ItemSelectionMode mode)
- void setScene(QGraphicsScene *scene)
- void setSceneRect(QRectF rect)
- void setSceneRect_2(qreal x, qreal y, qreal w, qreal h)
- void setTransform(QTransform matrix, bool combine)
- void setTransformationAnchor(QGraphicsView::ViewportAnchor anchor)
- void setViewportUpdateMode(QGraphicsView::ViewportUpdateMode mode)
- void shear(qreal sh, qreal sv)
- QTransform transform(void)
- QGraphicsView::ViewportAnchor transformationAnchor(void)
- void translate(qreal dx, qreal dy)
- QTransform viewportTransform(void)
- QGraphicsView::ViewportUpdateMode viewportUpdateMode(void)
- void invalidateScene(QRectF rect, QGraphicsScene::SceneLayers layers)
- void updateScene(QList<QRectF> rects)
- void updateSceneRect(QRectF rect)
- void setrubberBandChangedEvent(const char *)
- const char *getrubberBandChangedEvent(void)

# QGraphicsWidget Class

C++ Reference : http://doc.qt.io/qt-5/qgraphicswidget.html

Parameters : QGraphicsItem *,Qt::WindowFlags

Parent Class : QGraphicsObject

- QList<QAction *> actions(void)
- void addAction(QAction *action)
- void addActions(QList<QAction *> actions)
- void adjustSize(void)
- bool autoFillBackground(void)
- Qt::FocusPolicy focusPolicy(void)
- QGraphicsWidget * focusWidget(void)
- QFont font(void)
- void getWindowFrameMargins(qreal *left, qreal *top, qreal *right, qreal *bottom)
- int grabShortcut(QKeySequence sequence, Qt::ShortcutContext context)
- void insertAction(QAction *before, QAction *action)
- void insertActions(QAction *before, QList<QAction *> actions)
- bool isActiveWindow(void)
- QGraphicsLayout * layout(void)
- Qt::LayoutDirection layoutDirection(void)
- void paintWindowFrame(QPainter *painter, QStyleOptionGraphicsItem *option, QWidget *widget)
- QPalette palette(void)
- QRectF rect(void)
- void releaseShortcut(int id)
- void removeAction(QAction *action)
- void resize(QSizeF size)
- void resize_2(qreal w, qreal h)
- void setAttribute(Qt::WidgetAttribute attribute, bool on)
- void setAutoFillBackground(bool enabled)
- void setContentsMargins(QMarginsF margins)
- void setContentsMargins_2(qreal left, qreal top, qreal right, qreal bottom)
- void setFocusPolicy(Qt::FocusPolicy policy)
- void setFont(QFont font)
- void setGeometry(qreal x, qreal y, qreal w, qreal h)
- void setLayout(QGraphicsLayout *layout)
- void setLayoutDirection(Qt::LayoutDirection direction)
- void setPalette(QPalette palette)
- void setShortcutAutoRepeat(int id, bool enabled)
- void setShortcutEnabled(int id, bool enabled)
- void setStyle(QStyle *style)
- void setWindowFlags(Qt::WindowFlags wFlags)
- void setWindowFrameMargins(QMarginsF margins)
- void setWindowFrameMargins_2(qreal left, qreal top, qreal right, qreal bottom)
- void setWindowTitle(QString title)
- QSizeF size(void)
- QStyle * style(void)
- bool testAttribute(Qt::WidgetAttribute attribute)
- void unsetLayoutDirection(void)
- void unsetWindowFrameMargins(void)
- Qt::WindowFlags windowFlags(void)
- QRectF windowFrameGeometry(void)
- QRectF windowFrameRect(void)
- QString windowTitle(void)
- Qt::WindowType windowType(void)
- bool close(void)
- void setgeometryChangedEvent(const char *)
- void setlayoutChangedEvent(const char *)
- const char *getgeometryChangedEvent(void)
- const char *getlayoutChangedEvent(void)

# QGridLayout Class

C++ Reference : http://doc.qt.io/qt-5/qgridlayout.html

Parameters : void

- void addItem(QLayoutItem * item, int row, int column, int rowSpan , int columnSpan , Qt::Alignment alignment )
- void addLayout(QLayout * layout, int row, int column, Qt::Alignment alignment )
- void addLayout_2(QLayout * layout, int row, int column, int rowSpan, int columnSpan, Qt::Alignment alignment )
- void addWidget(QWidget * widget, int row, int column, Qt::Alignment alignment )
- void addWidget_2(QWidget * widget, int fromRow, int fromColumn, int rowSpan, int columnSpan, Qt::Alignment alignment )
- QRect cellRect(int row, int column)
- int columnCount(void)
- int columnMinimumWidth(int column)
- int columnStretch(int column)
- void getItemPosition(int index, int * row, int * column, int * rowSpan, int * columnSpan)
- int horizontalSpacing(void)
- QLayoutItem * itemAtPosition(int row, int column)
- Qt::Corner originCorner(void)
- int rowCount(void)
- int rowMinimumHeight(int row)
- int rowStretch(int row)
- void setColumnMinimumWidth(int column, int minSize)
- void setColumnStretch(int column, int stretch)
- void setHorizontalSpacing(int spacing)
- void setOriginCorner(Qt::Corner corner)
- void setRowMinimumHeight(int row, int minSize)
- void setRowStretch(int row, int stretch)
- void setSpacing(int spacing)
- void setVerticalSpacing(int spacing)
- int spacing(void)
- int verticalSpacing(void)

# QGroupBox Class

C++ Reference : http://doc.qt.io/qt-5/qgroupbox.html

Parameters : QWidget *

Parent Class : QWidget

- Qt::Alignment alignment(void)
- bool isCheckable(void)
- bool isChecked(void)
- bool isFlat(void)
- void setAlignment(int alignment)
- void setCheckable(bool checkable)
- void setFlat(bool flat)
- void setTitle(QString title)
- QString title(void)
- void setChecked(bool checked)
- void setclickedEvent(const char *)
- void settoggledEvent(const char *)
- const char *getclickedEvent(void)
- const char *gettoggledEvent(void)

# QGuiApplication Class

C++ Reference : http://doc.qt.io/qt-5/qguiapplication.html

Parent Class : QCoreApplication

Parameters : int,char **

- qreal devicePixelRatio(void)
- bool isSavingSession(void)
- bool isSessionRestored(void)
- QString sessionId(void)
- QString sessionKey(void)
- QWindowList allWindows(void)
- QString applicationDisplayName(void)
- Qt::ApplicationState applicationState(void)
- void changeOverrideCursor(QCursor cursor)
- QClipboard * clipboard(void)
- bool desktopSettingsAware(void)
- int exec(void)
- QObject * focusObject(void)
- QWindow * focusWindow(void)
- QFont font(void)
- QInputMethod * inputMethod(void)
- bool isLeftToRight(void)
- bool isRightToLeft(void)
- Qt::KeyboardModifiers keyboardModifiers(void)
- Qt::LayoutDirection layoutDirection(void)
- QWindow * modalWindow(void)
- Qt::MouseButtons mouseButtons(void)
- QCursor * overrideCursor(void)
- QPalette palette(void)
- QString platformName(void)
- QPlatformNativeInterface * platformNativeInterface(void)
- QScreen * primaryScreen(void)
- Qt::KeyboardModifiers queryKeyboardModifiers(void)
- bool quitOnLastWindowClosed(void)
- void restoreOverrideCursor(void)
- QList<QScreen *> screens(void)
- void setApplicationDisplayName(QString name)
- void setDesktopSettingsAware(bool on)
- void setFont(QFont font)
- void setLayoutDirection(Qt::LayoutDirection direction)
- void setOverrideCursor(QCursor cursor)
- void setPalette(QPalette pal)
- void setQuitOnLastWindowClosed(bool quit)
- QStyleHints * styleHints(void)
- void sync(void)
- QWindow * topLevelAt(QPoint pos)
- QWindowList topLevelWindows(void)
- void setapplicationDisplayNameChangedEvent(const char *)
- void setapplicationStateChangedEvent(const char *)
- void setcommitDataRequestEvent(const char *)
- void setfocusObjectChangedEvent(const char *)
- void setfocusWindowChangedEvent(const char *)
- void setfontDatabaseChangedEvent(const char *)
- void setlastWindowClosedEvent(const char *)
- void setlayoutDirectionChangedEvent(const char *)
- void setpaletteChangedEvent(const char *)
- void setprimaryScreenChangedEvent(const char *)
- void setsaveStateRequestEvent(const char *)
- void setscreenAddedEvent(const char *)
- void setscreenRemovedEvent(const char *)
- const char *getapplicationDisplayNameChangedEvent(void)
- const char *getapplicationStateChangedEvent(void)
- const char *getcommitDataRequestEvent(void)
- const char *getfocusObjectChangedEvent(void)
- const char *getfocusWindowChangedEvent(void)
- const char *getfontDatabaseChangedEvent(void)
- const char *getlastWindowClosedEvent(void)
- const char *getlayoutDirectionChangedEvent(void)
- const char *getpaletteChangedEvent(void)
- const char *getprimaryScreenChangedEvent(void)
- const char *getsaveStateRequestEvent(void)
- const char *getscreenAddedEvent(void)
- const char *getscreenRemovedEvent(void)

# QHBarModelMapper Class

C++ Reference : http://doc.qt.io/qt-5/qhbarmodelmapper.html

Parameters : QObject *

Parent Class : QObject

- int columnCount(void)
- int firstBarSetRow(void)
- int firstColumn(void)
- int lastBarSetRow(void)
- QAbstractItemModel * model(void)
- QAbstractBarSeries * series(void)
- void setColumnCount(int columnCount)
- void setFirstBarSetRow(int firstBarSetRow)
- void setFirstColumn(int firstColumn)
- void setLastBarSetRow(int lastBarSetRow)
- void setModel(QAbstractItemModel *model)
- void setSeries(QAbstractBarSeries *series)
- void setcolumnCountChangedEvent(const char *)
- void setfirstBarSetRowChangedEvent(const char *)
- void setfirstColumnChangedEvent(const char *)
- void setlastBarSetRowChangedEvent(const char *)
- void setmodelReplacedEvent(const char *)
- void setseriesReplacedEvent(const char *)
- const char *getcolumnCountChangedEvent(void)
- const char *getfirstBarSetRowChangedEvent(void)
- const char *getfirstColumnChangedEvent(void)
- const char *getlastBarSetRowChangedEvent(void)
- const char *getmodelReplacedEvent(void)
- const char *getseriesReplacedEvent(void)

# QHBoxLayout Class

C++ Reference : http://doc.qt.io/qt-5/qhboxlayout.html

Parameters : void

Parent Class : QBoxLayout

- void addWidget(QWidget *)
- void addLayout(QLayout *)

# QHBoxPlotModelMapper Class

C++ Reference : http://doc.qt.io/qt-5/qhboxplotmodelmapper.html

Parameters : QObject *

Parent Class : QObject

- int columnCount(void)
- int firstBoxSetRow(void)
- int firstColumn(void)
- int lastBoxSetRow(void)
- QAbstractItemModel * model(void)
- QBoxPlotSeries * series(void)
- void setColumnCount(int rowCount)
- void setFirstBoxSetRow(int firstBoxSetRow)
- void setFirstColumn(int firstColumn)
- void setLastBoxSetRow(int lastBoxSetRow)
- void setModel(QAbstractItemModel *model)
- void setSeries(QBoxPlotSeries *series)
- void setcolumnCountChangedEvent(const char *)
- void setfirstBoxSetRowChangedEvent(const char *)
- void setfirstColumnChangedEvent(const char *)
- void setlastBoxSetRowChangedEvent(const char *)
- void setmodelReplacedEvent(const char *)
- void setseriesReplacedEvent(const char *)
- const char *getcolumnCountChangedEvent(void)
- const char *getfirstBoxSetRowChangedEvent(void)
- const char *getfirstColumnChangedEvent(void)
- const char *getlastBoxSetRowChangedEvent(void)
- const char *getmodelReplacedEvent(void)
- const char *getseriesReplacedEvent(void)

# QHCandlestickModelMapper Class

C++ Reference : http://doc.qt.io/qt-5/qhcandlestickmodelmapper.html

Parameters : QObject *

Parent Class : QCandlestickModelMapper

- int closeColumn(void)
- int firstSetRow(void)
- int highColumn(void)
- int lastSetRow(void)
- int lowColumn(void)
- int openColumn(void)
- void setCloseColumn(int closeColumn)
- void setFirstSetRow(int firstSetRow)
- void setHighColumn(int highColumn)
- void setLastSetRow(int lastSetRow)
- void setLowColumn(int lowColumn)
- void setOpenColumn(int openColumn)
- void setTimestampColumn(int timestampColumn)
- int timestampColumn(void)
- void setcloseColumnChangedEvent(const char *)
- void setfirstSetRowChangedEvent(const char *)
- void sethighColumnChangedEvent(const char *)
- void setlastSetRowChangedEvent(const char *)
- void setlowColumnChangedEvent(const char *)
- void setopenColumnChangedEvent(const char *)
- void settimestampColumnChangedEvent(const char *)
- const char *getcloseColumnChangedEvent(void)
- const char *getfirstSetRowChangedEvent(void)
- const char *gethighColumnChangedEvent(void)
- const char *getlastSetRowChangedEvent(void)
- const char *getlowColumnChangedEvent(void)
- const char *getopenColumnChangedEvent(void)
- const char *gettimestampColumnChangedEvent(void)

# QHPieModelMapper Class

C++ Reference : http://doc.qt.io/qt-5/qhpiemodelmapper.html

Parameters : QObject *

Parent Class : QPieModelMapper

- int columnCount(void)
- int firstColumn(void)
- int labelsRow(void)
- QAbstractItemModel * model(void)
- QPieSeries * series(void)
- void setColumnCount(int columnCount)
- void setFirstColumn(int firstColumn)
- void setLabelsRow(int labelsRow)
- void setModel(QAbstractItemModel *model)
- void setSeries(QPieSeries *series)
- void setValuesRow(int valuesRow)
- int valuesRow(void)
- void setcolumnCountChangedEvent(const char *)
- void setfirstColumnChangedEvent(const char *)
- void setlabelsRowChangedEvent(const char *)
- void setmodelReplacedEvent(const char *)
- void setseriesReplacedEvent(const char *)
- void setvaluesRowChangedEvent(const char *)
- const char *getcolumnCountChangedEvent(void)
- const char *getfirstColumnChangedEvent(void)
- const char *getlabelsRowChangedEvent(void)
- const char *getmodelReplacedEvent(void)
- const char *getseriesReplacedEvent(void)
- const char *getvaluesRowChangedEvent(void)

# QHXYModelMapper Class

C++ Reference : http://doc.qt.io/qt-5/qhxymodelmapper.html

Parameters : QObject *

Parent Class : QXYModelMapper

- int columnCount(void)
- int firstColumn(void)
- QAbstractItemModel * model(void)
- QXYSeries * series(void)
- void setColumnCount(int columnCount)
- void setFirstColumn(int firstColumn)
- void setModel(QAbstractItemModel *model)
- void setSeries(QXYSeries *series)
- void setXRow(int xRow)
- void setYRow(int yRow)
- int xRow(void)
- int yRow(void)
- void setcolumnCountChangedEvent(const char *)
- void setfirstColumnChangedEvent(const char *)
- void setmodelReplacedEvent(const char *)
- void setseriesReplacedEvent(const char *)
- void setxRowChangedEvent(const char *)
- void setyRowChangedEvent(const char *)
- const char *getcolumnCountChangedEvent(void)
- const char *getfirstColumnChangedEvent(void)
- const char *getmodelReplacedEvent(void)
- const char *getseriesReplacedEvent(void)
- const char *getxRowChangedEvent(void)
- const char *getyRowChangedEvent(void)

# QHeaderView Class

C++ Reference : http://doc.qt.io/qt-5/qheaderview.html

Parameters : Qt::Orientation, QWidget *

Parent Class : QAbstractItemView

- bool cascadingSectionResizes(void)
- int count(void)
- Qt::Alignment defaultAlignment(void)
- int defaultSectionSize(void)
- int hiddenSectionCount(void)
- void hideSection(int logicalIndex)
- bool highlightSections(void)
- bool isSectionHidden(int logicalIndex)
- bool isSortIndicatorShown(void)
- int length(void)
- int logicalIndex(int visualIndex)
- int logicalIndexAt(int position)
- int logicalIndexAt_2(int x, int y)
- int logicalIndexAt_3( QPoint   pos)
- int maximumSectionSize(void)
- int minimumSectionSize_2(void)
- void moveSection(int from, int to)
- int offset(void)
- Qt::Orientation orientation(void)
- int resizeContentsPrecision(void)
- void resizeSection(int logicalIndex, int size)
- void resizeSections(QHeaderView::ResizeMode mode)
- bool restoreState( QByteArray   state)
- QByteArray saveState(void)
- int sectionPosition(int logicalIndex)
- QHeaderView::ResizeMode sectionResizeMode(int logicalIndex)
- int sectionSize(int logicalIndex)
- int sectionSizeHint(int logicalIndex)
- int sectionViewportPosition(int logicalIndex)
- bool sectionsClickable(void)
- bool sectionsHidden(void)
- bool sectionsMovable(void)
- bool sectionsMoved(void)
- void setCascadingSectionResizes(bool enable)
- void setDefaultAlignment(Qt::Alignment alignment)
- void setDefaultSectionSize(int size)
- void setHighlightSections(bool highlight)
- void setMaximumSectionSize(int size)
- void setMinimumSectionSize(int size)
- void setResizeContentsPrecision(int precision)
- void setSectionHidden(int logicalIndex, bool hide)
- void setSectionResizeMode(QHeaderView::ResizeMode mode)
- void setSectionResizeMode_2(int logicalIndex, QHeaderView::ResizeMode mode)
- void setSectionsClickable(bool clickable)
- void setSectionsMovable(bool movable)
- void setSortIndicator(int logicalIndex, Qt::SortOrder order)
- void setSortIndicatorShown(bool show)
- void setStretchLastSection(bool stretch)
- void showSection(int logicalIndex)
- Qt::SortOrder sortIndicatorOrder(void)
- int sortIndicatorSection(void)
- bool stretchLastSection(void)
- int stretchSectionCount(void)
- void swapSections(int first, int second)
- int visualIndex(int logicalIndex)
- int visualIndexAt(int position)
- void headerDataChanged(Qt::Orientation orientation, int logicalFirst, int logicalLast)
- void setOffset(int offset)
- void setOffsetToLastSection(void)
- void setOffsetToSectionPosition(int visualSectionNumber)
- void setgeometriesChangedEvent(const char *)
- void setsectionClickedEvent(const char *)
- void setsectionCountChangedEvent(const char *)
- void setsectionDoubleClickedEvent(const char *)
- void setsectionEnteredEvent(const char *)
- void setsectionHandleDoubleClickedEvent(const char *)
- void setsectionMovedEvent(const char *)
- void setsectionPressedEvent(const char *)
- void setsectionResizedEvent(const char *)
- void setsortIndicatorChangedEvent(const char *)
- const char *getgeometriesChangedEvent(void)
- const char *getsectionClickedEvent(void)
- const char *getsectionCountChangedEvent(void)
- const char *getsectionDoubleClickedEvent(void)
- const char *getsectionEnteredEvent(void)
- const char *getsectionHandleDoubleClickedEvent(void)
- const char *getsectionMovedEvent(void)
- const char *getsectionPressedEvent(void)
- const char *getsectionResizedEvent(void)
- const char *getsortIndicatorChangedEvent(void)
- void geteventparameters(void)

# QHorizontalBarSeries Class

C++ Reference : http://doc.qt.io/qt-5/qhorizontalbarseries.html

Parameters : QObject *

Parent Class : QAbstractBarSeries

- QAbstractSeries::SeriesType type(void)

# QHorizontalPercentBarSeries Class

C++ Reference : http://doc.qt.io/qt-5/qhorizontalpercentbarseries.html

Parameters : QObject *

Parent Class : QAbstractBarSeries

- QAbstractSeries::SeriesType type(void)

# QHorizontalStackedBarSeries Class

C++ Reference : http://doc.qt.io/qt-5/qhorizontalstackedbarseries.html

Parameters : QObject *

Parent Class : QAbstractBarSeries

- QAbstractSeries::SeriesType type(void)

# QHostAddress Class

C++ Reference : http://doc.qt.io/qt-5/qhostaddress.html

Parameters : void

- void clear(void)
- bool isInSubnet(QHostAddress, int netmask)
- bool isNull(void)
- int protocol(void)
- QString scopeId(void)
- bool setAddress(QString)
- int toIPv4Address(void)
- Q_IPV6ADDR toIPv6Address(void)
- QString toString(void)

# QHostInfo Class

C++ Reference : http://doc.qt.io/qt-5/qhostinfo.html

Parameters : void

- int error(void)
- QString errorString(void)
- QString hostName(void)
- int lookupId(void)
- void setError(QHostInfo::HostInfoError error)
- void setErrorString(QString)
- void setHostName(QString)
- void setLookupId(int id)
- void abortHostLookup(int id)
- QHostInfo fromName(QString)
- QString localDomainName(void)
- QString localHostName(void)

# QIODevice Class

C++ Reference : http://doc.qt.io/qt-5/qiodevice.html

Parameters : void

Parent Class : QObject

- QString errorString(void)
- bool getChar(char *c)
- bool isOpen(void)
- bool isReadable(void)
- bool isTextModeEnabled(void)
- bool isWritable(void)
- int openMode(void)
- int peek(char *data, int maxSize)
- bool putChar(char c)
- int read(char *data, int maxSize)
- QByteArray readAll(void)
- int readLine(char *data, int maxSize)
- void setTextModeEnabled(bool enabled)
- void ungetChar(char c)
- int write(const char *data, int maxSize)
- bool atEnd(void)
- bool canReadLine(void)
- void close(void)
- bool open(QIODevice::OpenMode flags)
- qint64 pos(void)
- bool seek(qint64 pos)
- qint64 size(void)
- void setaboutToCloseEvent(const char *)
- void setbytesWrittenEvent(const char *)
- void setreadChannelFinishedEvent(const char *)
- void setreadyReadEvent(const char *)
- const char *getaboutToCloseEvent(void)
- const char *getbytesWrittenEvent(void)
- const char *getreadChannelFinishedEvent(void)
- const char *getreadyReadEvent(void)

# QIcon Class

C++ Reference : http://doc.qt.io/qt-5/qicon.html

Parameters : QPixmap

# QImage Class

C++ Reference : http://doc.qt.io/qt-5/qimage.html

Parameters : void

- bool allGray(void)
- int bitPlaneCount(void)
- uchar *bits(void)
- int bytesPerLine(void)
- qint64 cacheKey(void)
- QRgb color(int i)
- int colorCount(void)
- const uchar *constBits(void)
- const uchar *constScanLine(int i)
- QImage convertToFormat(QImage::Format format, Qt::ImageConversionFlags flags)
- QImage copy(int x, int y, int width, int height)
- QImage createAlphaMask(Qt::ImageConversionFlags flags)
- QImage createHeuristicMask(bool clipTight)
- QImage createMaskFromColor(QRgb color, Qt::MaskMode mode)
- int depth(void)
- int dotsPerMeterX(void)
- int dotsPerMeterY(void)
- void fill(QColor)
- QImage::Format format(void)
- bool hasAlphaChannel(void)
- int height(void)
- void invertPixels(QImage::InvertMode mode)
- bool isGrayscale(void)
- bool isNull(void)
- bool load(QString, const char *format) # In RingQt use : bool loadimage(QString, const char *format)
- bool loadFromData(QByteArray, const char * format)
- QImage mirrored(bool horizontal, bool vertical)
- QPoint offset(void)
- QRgb pixel(int x, int y)
- int pixelIndex(int x, int y)
- QRect rect(void)
- QImage rgbSwapped(void)
- bool save(QString, const char * format, int quality)
- QImage scaled(int width, int height, Qt::AspectRatioMode aspectRatioMode, Qt::TransformationMode transformMode)
- QImage scaledToHeight(int height, Qt::TransformationMode mode )
- QImage scaledToWidth(int width, Qt::TransformationMode mode)
- uchar *scanLine(int i)
- void setColor(int index, QRgb colorValue)
- void setColorCount(int colorCount)
- void setDotsPerMeterX(int x)
- void setDotsPerMeterY(int y)
- void setOffset(QPoint)
- void setPixel(int x, int y, uint index_or_rgb)
- void setText(QString,QString)
- QSize size(void)
- void swap(QImage)
- QString text(QString)
- QStringList textKeys(void)
- bool valid(int x, int y)
- int width(void)

# QInputAspect Class

C++ Reference : http://doc.qt.io/qt-5/qt3dinput-qinputaspect.html

Parameters : QObject *

- QStringList availablePhysicalDevices(void)
- Qt3DInput::QAbstractPhysicalDevice * createPhysicalDevice(QString name)

# QInputDialog Class

C++ Reference : http://doc.qt.io/qt-5/qinputdialog.html

Parameters : QWidget *

Parent Class : QDialog

- QString cancelButtonText(void)
- QStringList comboBoxItems(void)
- int doubleDecimals(void)
- double doubleMaximum(void)
- double doubleMinimum(void)
- double doubleValue(void)
- int inputMode(void)
- int intMaximum(void)
- int intMinimum(void)
- int intStep(void)
- int intValue(void)
- bool isComboBoxEditable(void)
- QString labelText(void)
- QString okButtonText(void)
- void open(QObject *receiver, const char *member)
- int options(void)
- void setCancelButtonText(QString)
- void setComboBoxEditable(bool editable)
- void setComboBoxItems(QStringList)
- void setDoubleDecimals(int decimals)
- void setDoubleMaximum(double max)
- void setDoubleMinimum(double min)
- void setDoubleRange(double min, double max)
- void setDoubleValue(double value)
- void setInputMode(QInputDialog::InputMode mode)
- void setIntMaximum(int max)
- void setIntMinimum(int min)
- void setIntRange(int min, int max)
- void setIntStep(int step)
- void setIntValue(int value)
- void setLabelText(QString)
- void setOkButtonText(QString)
- void setOption(QInputDialog::InputDialogOption option, bool on)
- void setOptions(QInputDialog::InputDialogOption options)
- void setTextEchoMode(QLineEdit::EchoMode mode)
- void setTextValue(QString)
- bool testOption(QInputDialog::InputDialogOption option)
- int textEchoMode(void)
- QString textValue(void)
- double getDouble(QWidget *parent,QString,QString, double value, double min, double max , int decimals, bool *ok, Qt::WindowType flags)
- int getInt(QWidget *parent,QString,QString, int value, int min, int max, int step, bool *ok, Qt::WindowType flags)

# QIntValidator Class

C++ Reference : http://doc.qt.io/qt-5/qintvalidator.html

Parameters : QObject *

Parent Class : QValidator

- int bottom(void)
- void setBottom(int)
- void setRange(int bottom, int top)
- void setTop(int)
- int top(void)

# QItemSelectionModel Class

C++ Reference : http://doc.qt.io/qt-5/qitemselectionmodel.html

Parameters : QAbstractItemModel *

Parent Class : QObject

- int columnIntersectsSelection(int column, QModelIndex parent)
- QModelIndex currentIndex(void)
- bool hasSelection(void)
- bool isColumnSelected(int column, QModelIndex parent)
- bool isRowSelected(int row, QModelIndex parent)
- bool isSelected(QModelIndex index)
- QAbstractItemModel *model(void)
- int rowIntersectsSelection(int row, QModelIndex parent)
- QModelIndexList selectedColumns(int row)
- QModelIndexList selectedIndexes(void)
- QModelIndexList selectedRows(int column)
- void clear(void)
- void clearCurrentIndex(void)
- void clearSelection(void)
- void reset(void)
- void select(QModelIndex index, QItemSelectionModel::SelectionFlag command)
- void setCurrentIndex(QModelIndex index, QItemSelectionModel::SelectionFlag command)

# QJsonArray Class

C++ Reference : http://doc.qt.io/qt-5/qjsonarray.html

Parameters : void

- void append(QJsonValue  value)
- QJsonValue at(int i)
- bool contains(QJsonValue  value)
- int count(void)
- bool empty(void)
- QJsonValue first(void)
- void insert(int i, QJsonValue  value)
- bool isEmpty(void)
- QJsonValue last(void)
- void pop_back(void)
- void pop_front(void)
- void prepend(QJsonValue  value)
- void push_back(QJsonValue  value)
- void push_front(QJsonValue  value)
- void removeAt(int i)
- void removeFirst(void)
- void removeLast(void)
- void replace(int i, QJsonValue  value)
- int size(void)
- QJsonValue takeAt(int i)
- QVariantList toVariantList(void)
- QJsonArray fromStringList(QStringList  list)
- QJsonArray fromVariantList(QVariantList  list)

# QJsonDocument Class

C++ Reference : http://doc.qt.io/qt-5/qjsondocument.html

Parameters : void

- QJsonArray array(void)
- bool isArray(void)
- bool isEmpty(void)
- bool isNull(void)
- bool isObject(void)
- QJsonObject object(void)
- void setArray(QJsonArray  array)
- void setObject(QJsonObject  object)
- QByteArray toJson(QJsonDocument::JsonFormat format)
- QVariant toVariant(void)
- QJsonDocument fromJson( QByteArray  json, QJsonParseError * error)
- QJsonDocument fromVariant( QVariant  variant)

# QJsonObject Class

C++ Reference : http://doc.qt.io/qt-5/qjsonobject.html

Parameters : void

- bool contains(QString  key)
- int count(void)
- bool empty(void)
- bool isEmpty(void)
- QStringList keys(void)
- int length(void)
- void remove(QString  key)
- int size(void)
- QJsonValue take(QString  key)
- QVariantMap toVariantMap(void)
- QJsonValue value(QString  key)
- QJsonObject fromVariantMap(QVariantMap  map)

# QJsonParseError Class

C++ Reference : http://doc.qt.io/qt-5/qjsonparseerror.html

Parameters : void

- QString errorString(void)

# QJsonValue Class

C++ Reference : http://doc.qt.io/qt-5/qjsonvalue.html

Parameters : void

- bool isArray(void)
- bool isBool(void)
- bool isDouble(void)
- bool isNull(void)
- bool isObject(void)
- bool isString(void)
- bool isUndefined(void)
- QJsonArray toArray(QJsonArray  defaultValue)
- QJsonArray toArray_2(void)
- bool toBool(bool defaultValue  )
- double toDouble(double defaultValue )
- int toInt(int defaultValue )
- QJsonObject toObject(QJsonObject  defaultValue)
- QJsonObject toObject_2(void)
- QString toString(QString  defaultValue  )
- QVariant toVariant(void)
- QJsonValue::Type type(void)
- QJsonValue fromVariant(QVariant  variant)

# QKeyEvent Class

C++ Reference : http://doc.qt.io/qt-5/qkeyevent.html

Parameters : void

- int count(void)
- bool isAutoRepeat(void)
- int key(void)
- Qt::KeyboardModifiers modifiers(void)
- quint32 nativeModifiers(void)
- quint32 nativeScanCode(void)
- quint32 nativeVirtualKey(void)
- QString text(void)
- bool matches(QKeySequence::StandardKey key)

# QKeySequence Class

C++ Reference : http://doc.qt.io/qt-5/qkeysequence.html

Parameters : QString

# QKeySequenceEdit Class

C++ Reference : http://doc.qt.io/qt-5/qkeysequenceedit.html

Parameters : QWidget *parent

Parent Class : QWidget

- QKeySequence keySequence(void)
- void clear(void)
- void setKeySequence(QKeySequence keySequence)
- void seteditingFinishedEvent(const char *)
- void setkeySequenceChangedEvent(const char *)
- const char *geteditingFinishedEvent(void)
- const char *getkeySequenceChangedEvent(void)

# QLCDNumber Class

C++ Reference : http://doc.qt.io/qt-5/qlcdnumber.html

Parameters : QWidget *

Parent Class : QFrame

- bool checkOverflow(double num)
- int digitCount(void)
- int intValue(void)
- int mode(void)
- int segmentStyle(void)
- void setDigitCount(int numDigits)
- void setMode(QLCDNumber::Mode)
- void setSegmentStyle(QLCDNumber::SegmentStyle)
- bool smallDecimalPoint(void)
- double value(void)
- void display(double)
- void setBinMode(void)
- void setDecMode(void)
- void setHexMode(void)
- void setOctMode(void)
- void setSmallDecimalPoint(bool)

# QLabel Class

C++ Reference : http://doc.qt.io/qt-5/qlabel.html

Parameters : QWidget *

Parent Class : QFrame

- QPicture *picture(void)
- QPixmap *pixmap(void)
- int alignment(void)
- QWidget *buddy(void)
- bool hasScaledContents(void)
- bool hasSelectedText(void)
- int indent(void)
- int margin(void)
- QMovie *movie(void)
- bool openExternalLinks(void)
- QString selectedText(void)
- int selectionStart(void)
- void setAlignment(Qt::AlignmentFlag)
- void setBuddy(QWidget *buddy)
- void setIndent(int)
- void setMargin(int)
- void setOpenExternalLinks(bool open)
- void setScaledContents(bool)
- void setSelection(int start, int length)
- void setTextFormat(Qt::TextFormat)
- void setTextInteractionFlags(Qt::TextInteractionFlag flags)
- void setWordWrap(bool on)
- QString text(void)
- int textFormat(void)
- int textInteractionFlags(void)
- bool wordWrap(void)
- void clear(void)
- void setMovie(QMovie *movie)
- void setNum(double num)
- void setPicture(QPicture)
- void setPixmap(QPixmap)
- void setText(QString)

# QLayout Class

C++ Reference : http://doc.qt.io/qt-5/qlayout.html

Parameters : QWidget *

Parent Class : QObject

- bool activate(void)
- void addWidget(QWidget *w)
- QMargins contentsMargins(void)
- QRect contentsRect(void)
- void getContentsMargins(int *left, int *top, int *right, int *bottom)
- bool isEnabled(void)
- QWidget *menuBar(void)
- QWidget *parentWidget(void)
- void removeItem(QLayoutItem *item)
- void removeWidget(QWidget *widget)
- bool setAlignment(QWidget *w, Qt::Alignment alignment)
- void setAlignment_2(Qt::Alignment alignment)
- bool setAlignment_3(QLayout *l, Qt::Alignment alignment)
- void setContentsMargins(int left, int top, int right, int bottom)
- void setContentsMargins_2(QMargins margins)
- void setEnabled(bool enable)
- void setMenuBar(QWidget *widget)
- void setSizeConstraint(QLayout::SizeConstraint)
- void setSpacing(int)
- QLayout::SizeConstraint sizeConstraint(void)
- int spacing(void)
- void update(void)
- QSize  closestAcceptableSize( QWidget * widget,  QSize   size)

# QLegend Class

C++ Reference : http://doc.qt.io/qt-5/qlegend.html

Parent Class : QGraphicsWidget

- Qt::Alignment alignment(void)
- void attachToChart(void)
- QColor borderColor(void)
- QBrush brush(void)
- QColor color(void)
- void detachFromChart(void)
- QFont font(void)
- bool isAttachedToChart(void)
- bool isBackgroundVisible(void)
- QBrush labelBrush(void)
- QColor labelColor(void)
- QLegend::MarkerShape markerShape(void)
- QList<QLegendMarker *> markers(QAbstractSeries *series)
- QPen pen(void)
- bool reverseMarkers(void)
- void setAlignment(Qt::Alignment alignment)
- void setBackgroundVisible(bool visible)
- void setBorderColor(QColor color)
- void setBrush(QBrush brush)
- void setColor(QColor color)
- void setFont(QFont font)
- void setLabelBrush(QBrush brush)
- void setLabelColor(QColor color)
- void setMarkerShape(QLegend::MarkerShape shape)
- void setPen(QPen pen)
- void setReverseMarkers(bool reverseMarkers)
- void setShowToolTips(bool show)
- bool showToolTips(void)

# QLegendMarker Class

C++ Reference : http://doc.qt.io/qt-5/qlegendmarker.html

Parameters : void

Parent Class : QObject

- QBrush brush(void)
- QFont font(void)
- bool isVisible(void)
- QString label(void)
- QBrush labelBrush(void)
- QPen pen(void)
- QAbstractSeries * series(void)
- void setBrush(QBrush brush)
- void setFont(QFont font)
- void setLabel(QString label)
- void setLabelBrush(QBrush brush)
- void setPen(QPen pen)
- void setShape(QLegend::MarkerShape shape)
- void setVisible(bool visible)
- QLegend::MarkerShape shape(void)
- void setbrushChangedEvent(const char *)
- void setclickedEvent(const char *)
- void setfontChangedEvent(const char *)
- void sethoveredEvent(const char *)
- void setlabelBrushChangedEvent(const char *)
- void setlabelChangedEvent(const char *)
- void setpenChangedEvent(const char *)
- void setshapeChangedEvent(const char *)
- void setvisibleChangedEvent(const char *)
- const char *getbrushChangedEvent(void)
- const char *getclickedEvent(void)
- const char *getfontChangedEvent(void)
- const char *gethoveredEvent(void)
- const char *getlabelBrushChangedEvent(void)
- const char *getlabelChangedEvent(void)
- const char *getpenChangedEvent(void)
- const char *getshapeChangedEvent(void)
- const char *getvisibleChangedEvent(void)

# QLibraryInfo Class

C++ Reference : http://doc.qt.io/qt-5/qlibraryinfo.html

Parameters : void

- bool isDebugBuild(void)
- QVersionNumber version(void)

# QLineEdit Class

C++ Reference : http://doc.qt.io/qt-5/qlineedit.html

Parameters : QWidget *

Parent Class : QWidget

- int alignment(void)
- void backspace(void)
- QCompleter *completer(void)
- QMenu *createStandardContextMenu(void)
- void cursorBackward(bool mark, int steps)
- void cursorForward(bool mark, int steps)
- int cursorMoveStyle(void)
- int cursorPosition(void)
- int cursorPositionAt(QPoint)
- void cursorWordBackward(bool mark)
- void cursorWordForward(bool mark)
- void del(void)
- void deselect(void)
- QString displayText(void)
- bool dragEnabled(void)
- int echoMode(void)
- void end(bool mark) # In RingQt use : void endtext(bool mark)
- bool hasAcceptableInput(void)
- bool hasFrame(void)
- bool hasSelectedText(void)
- void home(bool mark)
- QString inputMask(void)
- void insert(QString)
- bool isModified(void)
- bool isReadOnly(void)
- bool isRedoAvailable(void)
- bool isUndoAvailable(void)
- int maxLength(void)
- QString placeholderText(void)
- QString selectedText(void)
- int selectionStart(void)
- void setAlignment(Qt::AlignmentFlag flag)
- void setCompleter(QCompleter *c)
- void setCursorMoveStyle(Qt::CursorMoveStyle style)
- void setCursorPosition(int)
- void setDragEnabled(bool b)
- void setEchoMode(QLineEdit::EchoMode)
- void setFrame(bool)
- void setInputMask(QString)
- void setMaxLength(int)
- void setModified(bool)
- void setPlaceholderText(QString)
- void setReadOnly(bool)
- void setSelection(int start, int length)
- void setTextMargins(int left, int top, int right, int bottom)
- void setValidator(QValidator *v)
- QString text(void)
- QMargins textMargins(void)
- QValidator *validator(void)
- void clear(void)
- void copy(void)
- void cut(void)
- void paste(void)
- void redo(void)
- void selectAll(void)
- void setText(QString)
- void undo(void)
- void setTextChangedEvent(const char *)
- void setcursorPositionChangedEvent(const char *)
- void seteditingFinishedEvent(const char *)
- void setreturnPressedEvent(const char *)
- void setselectionChangedEvent(const char *)
- void settextEditedEvent(const char *)
- const char *getTextChangedEvent(void)
- const char *getcursorPositionChangedEvent(void)
- const char *geteditingFinishedEvent(void)
- const char *getreturnPressedEvent(void)
- const char *getselectionChangedEvent(void)
- const char *gettextEditedEvent(void)

# QLineF Class

C++ Reference : http://doc.qt.io/qt-5/qlinef.html

Parameters : qreal,qreal,qreal,qreal

- QPointF p1(void)
- QPointF p2(void)
- qreal x1(void)
- qreal x2(void)
- qreal y1(void)
- qreal y2(void)
- qreal angle(void)
- qreal angleTo(QLineF line)
- QPointF center(void)
- qreal dx(void)
- qreal dy(void)
- QLineF::IntersectionType intersects(QLineF line, QPointF *intersectionPoint)
- bool isNull(void)
- qreal length(void)
- QLineF normalVector(void)
- QPointF pointAt(qreal t)
- void setP1(QPointF p1)
- void setP2(QPointF p2)
- void setAngle(qreal angle)
- void setLength(qreal length)
- void setLine(qreal x1, qreal y1, qreal x2, qreal y2)
- void setPoints(QPointF p1, QPointF p2)
- QLine toLine(void)
- void translate(QPointF offset)
- void translate_2(qreal dx, qreal dy)
- QLineF translated(QPointF offset)
- QLineF translated_2(qreal dx, qreal dy)

# QLineSeries Class

C++ Reference : http://doc.qt.io/qt-5/qlineseries.html

Parameters : QObject *

Parent Class : QXYSeries

- QAbstractSeries::SeriesType type(void)

# QLinearGradient Class

C++ Reference : http://doc.qt.io/qt-5/qlineargradient.html

Parameters : void

Parent Class : QGradient

- QPointF finalStop(void)
- void setFinalStop(QPointF stop)
- void setFinalStop_2(qreal x,qreal y)
- void setStart(QPointF start)
- void setStart_2(qreal x,qreal y)
- QPointF start(void)

# QListView Class

C++ Reference : http://doc.qt.io/qt-5/qlistview.html

Parameters : QWidget *

Parent Class : QAbstractItemView

- int  batchSize(void)
- void  clearPropertyFlags(void)
- QListView::Flow  flow(void)
- QSize  gridSize(void)
- bool  isRowHidden(int row)
- bool  isSelectionRectVisible(void)
- bool  isWrapping(void)
- QListView::LayoutMode  layoutMode(void)
- int  modelColumn(void)
- QListView::Movement  movement(void)
- QListView::ResizeMode  resizeMode(void)
- void  setBatchSize(int batchSize)
- void  setFlow(QListView::Flow flow)
- void  setGridSize( QSize   size)
- void  setLayoutMode(QListView::LayoutMode mode)
- void  setModelColumn(int column)
- void  setMovement(QListView::Movement movement)
- void  setResizeMode(QListView::ResizeMode mode)
- void  setRowHidden(int row, bool hide)
- void  setSelectionRectVisible(bool show)
- void  setSpacing(int space)
- void  setUniformItemSizes(bool enable)
- void  setViewMode(QListView::ViewMode mode)
- void  setWordWrap(bool on)
- void  setWrapping(bool enable)
- int  spacing(void)
- bool  uniformItemSizes(void)
- QListView::ViewMode  viewMode(void)
- bool  wordWrap(void)

# QListWidget Class

C++ Reference : http://doc.qt.io/qt-5/qlistwidget.html

Parameters : QWidget *

Parent Class : QListView

- void addItem(QString)
- int count(void)
- int currentRow(void)
- void editItem(QListWidgetItem *item)
- void insertItem(int, QString)
- bool isSortingEnabled(void)
- QListWidgetItem *item(int row)
- QListWidgetItem *itemAt(int x, int y)
- QWidget *itemWidget(QListWidgetItem *item)
- void openPersistentEditor(QListWidgetItem *item)
- void removeItemWidget(QListWidgetItem *item)
- int row(QListWidgetItem *item)
- void setCurrentItem(QListWidgetItem *item, QItemSelectionModel::SelectionFlag command)
- void setCurrentRow(int row, QItemSelectionModel::SelectionFlag command)
- void setItemWidget(QListWidgetItem *item, QWidget *widget)
- void setSortingEnabled(bool enable)
- void sortItems(Qt::SortOrder order)
- QListWidgetItem *takeItem(int row)
- QRect visualItemRect(QListWidgetItem *item)
- void clear(void)
- void scrollToItem(QListWidgetItem *item,QAbstractItemView::ScrollHint hint)
- void setcurrentItemChangedEvent(const char *)
- void setcurrentRowChangedEvent(const char *)
- void setcurrentTextChangedEvent(const char *)
- void setitemActivatedEvent(const char *)
- void setitemChangedEvent(const char *)
- void setitemClickedEvent(const char *)
- void setitemDoubleClickedEvent(const char *)
- void setitemEnteredEvent(const char *)
- void setitemPressedEvent(const char *)
- void setitemSelectionChangedEvent(const char *)
- const char *getcurrentItemChangedEvent(void)
- const char *getcurrentRowChangedEvent(void)
- const char *getcurrentTextChangedEvent(void)
- const char *getitemActivatedEvent(void)
- const char *getitemChangedEvent(void)
- const char *getitemClickedEvent(void)
- const char *getitemDoubleClickedEvent(void)
- const char *getitemEnteredEvent(void)
- const char *getitemPressedEvent(void)
- const char *getitemSelectionChangedEvent(void)

# QListWidgetItem Class

C++ Reference : http://doc.qt.io/qt-5/qlistwidgetitem.html

Parameters : void

- QBrush background(void)
- Qt::CheckState checkState(void)
- Qt::ItemFlags flags(void)
- QFont font(void)
- QBrush foreground(void)
- QIcon icon(void)
- bool isHidden(void)
- bool isSelected(void)
- QListWidget *listWidget(void)
- void setBackground(QBrush brush)
- void setCheckState(Qt::CheckState state)
- void setFlags(Qt::ItemFlags flags)
- void setFont(QFont font)
- void setForeground(QBrush brush)
- void setHidden(bool hide)
- void setIcon(QIcon icon)
- void setSelected(bool select)
- void setSizeHint(QSize size)
- void setStatusTip(QString statusTip)
- void setText(QString text)
- void setTextAlignment(int alignment)
- void setToolTip(QString toolTip)
- void setWhatsThis(QString whatsThis)
- QSize sizeHint(void)
- QString statusTip(void)
- QString text(void)
- int textAlignment(void)
- QString toolTip(void)
- int type(void)
- QString whatsThis(void)

# QLocale Class

C++ Reference : http://doc.qt.io/qt-5/qlocale.html

Parameters : QString

- QString amText(void)
- QString bcp47Name(void)
- QLocale::Country country(void)
- QString createSeparatedList(QStringList list)
- QString currencySymbol(QLocale::CurrencySymbolFormat format)
- QString dateFormat(QLocale::FormatType format)
- QString dateTimeFormat(QLocale::FormatType format)
- QString dayName(int day, QLocale::FormatType type)
- QChar decimalPoint(void)
- QChar exponential(void)
- Qt::DayOfWeek firstDayOfWeek(void)
- QChar groupSeparator(void)
- QLocale::Language language(void)
- QLocale::MeasurementSystem measurementSystem(void)
- QString monthName(int month, QLocale::FormatType type)
- QString name(void)
- QString nativeCountryName(void)
- QString nativeLanguageName(void)
- QChar negativeSign(void)
- QLocale::NumberOptions numberOptions(void)
- QChar percent(void)
- QString pmText(void)
- QChar positiveSign(void)
- QString quoteString(QString str, QLocale::QuotationStyle style)
- QString quoteString_2(QStringRef str, QLocale::QuotationStyle style)
- QLocale::Script script(void)
- void setNumberOptions(QLocale::NumberOptions options)
- QString standaloneDayName(int day, QLocale::FormatType type)
- QString standaloneMonthName(int month, QLocale::FormatType type)
- Qt::LayoutDirection textDirection(void)
- QString timeFormat(QLocale::FormatType format)
- double toDouble(QString s, bool *ok)
- double toDouble_2(QStringRef s, bool *ok)
- float toFloat(QString s, bool *ok)
- float toFloat_2(QStringRef s, bool *ok)
- int toInt(QString s, bool *ok)
- int toInt_2(QStringRef s, bool *ok)
- qlonglong toLongLong(QString s, bool *ok)
- qlonglong toLongLong_2(QStringRef s, bool *ok)
- QString toLower(QString str)
- short toShort(QString s, bool *ok)
- short toShort_2(QStringRef s, bool *ok)
- QString toString(qlonglong i)
- QString toString_2(qulonglong i)
- QString toString_4(short i)
- QString toString_5(ushort i)
- QString toString_6(int i)
- QString toString_7(uint i)
- QString toString_8(double i, char f, int prec)
- QString toString_9(float i, char f, int prec)
- QString toString_10(QDate date, QString format)
- QString toString_11(QTime time, QString format)
- QString toString_12(QDateTime dateTime, QString format)
- QString toString_13(QDate date, QLocale::FormatType format)
- QString toString_14(QTime time, QLocale::FormatType format)
- QString toString_15(QDateTime dateTime, QLocale::FormatType format)
- QTime toTime(QString string, QLocale::FormatType format)
- QTime toTime_2(QString string, QString format)
- uint toUInt(QString s, bool *ok)
- uint toUInt_2(QStringRef s, bool *ok)
- qulonglong toULongLong(QString s, bool *ok)
- qulonglong toULongLong_2(QStringRef s, bool *ok)
- ushort toUShort(QString s, bool *ok)
- ushort toUShort_2(QStringRef s, bool *ok)
- QString toUpper(QString str)
- QStringList uiLanguages(void)
- QList<Qt::DayOfWeek> weekdays(void)
- QChar zeroDigit(void)
- QLocale c(void)
- QString countryToString(QLocale::Country country)
- QString languageToString(QLocale::Language language)
- QList<QLocale> matchingLocales(QLocale::Language language, QLocale::Script script, QLocale::Country country)
- QString scriptToString(QLocale::Script script)
- void setDefault(QLocale locale)
- QLocale system(void)

# QLogValueAxis Class

C++ Reference : http://doc.qt.io/qt-5/qlogvalueaxis.html

Parameters : QObject *

Parent Class : QAbstractAxis

- qreal base(void)
- QString labelFormat(void)
- qreal max(void)
- qreal min(void)
- int minorTickCount(void)
- void setBase(qreal base)
- void setLabelFormat(QString format)
- void setMax(qreal max)
- void setMin(qreal min)
- void setMinorTickCount(int minorTickCount)
- void setRange(qreal min, qreal max)
- int tickCount(void)
- void setbaseChangedEvent(const char *)
- void setlabelFormatChangedEvent(const char *)
- void setmaxChangedEvent(const char *)
- void setminChangedEvent(const char *)
- void setminorTickCountChangedEvent(const char *)
- void setrangeChangedEvent(const char *)
- void settickCountChangedEvent(const char *)
- const char *getbaseChangedEvent(void)
- const char *getlabelFormatChangedEvent(void)
- const char *getmaxChangedEvent(void)
- const char *getminChangedEvent(void)
- const char *getminorTickCountChangedEvent(void)
- const char *getrangeChangedEvent(void)
- const char *gettickCountChangedEvent(void)

# QLogicAspect Class

C++ Reference : http://doc.qt.io/qt-5/qt3dlogic-qlogicaspect.html

Parameters : QObject *

Parent Class : QAbstractAspect

# QMainWindow Class

C++ Reference : http://doc.qt.io/qt-5/qmainwindow.html

Parameters : void

Parent Class : QWidget

- void addDockWidget(Qt::DockWidgetArea area, QDockWidget *dockwidget, Qt::Orientation orientation)
- QToolBar *addToolBar(QString)
- void addToolBar_2(Qt::ToolBarArea area, QToolBar *toolbar)
- void addToolBarBreak(Qt::ToolBarArea)
- QWidget *centralWidget(void)
- int corner(Qt::Corner corner)
- QMenu *createPopupMenu(void)
- int dockOptions(void)
- int dockWidgetArea(QDockWidget *dockwidget)
- bool documentMode(void)
- QSize iconSize(void)
- void insertToolBar(QToolBar *before, QToolBar *toolbar)
- void insertToolBarBreak(QToolBar *before)
- bool isAnimated(void)
- bool isDockNestingEnabled(void)
- QMenuBar *menuBar(void)
- QWidget *menuWidget(void)
- void removeDockWidget(QDockWidget *dockwidget)
- void removeToolBar(QToolBar *toolbar)
- void removeToolBarBreak(QToolBar *before)
- bool restoreDockWidget(QDockWidget *dockwidget)
- bool restoreState(QByteArray state, int version)
- QByteArray saveState(int version)
- void setCentralWidget(QWidget *widget)
- void setCorner(Qt::Corner corner, Qt::DockWidgetArea area)
- void setDockOptions(QMainWindow::DockOption options)
- void setDocumentMode(bool enabled)
- void setIconSize(QSize)
- void setMenuBar(QMenuBar *menuBar)
- void setMenuWidget(QWidget *menuBar)
- void setStatusBar(QStatusBar *statusbar)
- void setTabPosition(Qt::DockWidgetArea areas, QTabWidget::TabPosition tabPosition)
- void setTabShape(QTabWidget::TabShape tabShape)
- void setToolButtonStyle(Qt::ToolButtonStyle toolButtonStyle)
- void setUnifiedTitleAndToolBarOnMac(bool set)
- void splitDockWidget(QDockWidget *first, QDockWidget *second, Qt::Orientation orientation)
- QStatusBar *statusBar(void)
- int tabPosition(Qt::DockWidgetArea area)
- int tabShape(void)
- void tabifyDockWidget(QDockWidget *first, QDockWidget *second)
- int toolBarArea(QToolBar *toolbar)
- bool toolBarBreak(QToolBar *toolbar)
- int toolButtonStyle(void)
- bool unifiedTitleAndToolBarOnMac(void)

# QMargins Class

C++ Reference : http://doc.qt.io/qt-5/qmargins.html

Parameters : void

- int bottom(void)
- bool isNull(void)
- int left(void)
- int right(void)
- int top(void)
- void setBottom(int bottom)
- void setLeft(int left)
- void setRight(int right)
- void setTop(int top)

# QMarginsF Class

C++ Reference : http://doc.qt.io/qt-5/qmarginsf.html

Parameters : void

- qreal bottom(void)
- bool isNull(void)
- qreal left(void)
- qreal right(void)
- qreal top(void)
- void setBottom(qreal bottom)
- void setLeft(qreal left)
- void setRight(qreal right)
- void setTop(qreal top)
- QMargins toMargins(void)

# QMaterial Class

C++ Reference : http://doc.qt.io/qt-5/qt3drender-qmaterial.html

Parameters : Qt3DCore::QNode *

Parent Class : QComponent

- void addParameter(Qt3DRender::QParameter *parameter)
- Qt3DRender::QEffect * effect(void)
- QVector<Qt3DRender::QParameter *> parameters(void)
- void removeParameter(Qt3DRender::QParameter *parameter)
- void setEffect(Qt3DRender::QEffect *effect)

# QMatrix4x4 Class

Parameters : qreal,qreal,qreal,qreal,qreal,qreal,qreal,qreal,qreal,qreal,qreal,qreal,qreal,qreal,qreal,qreal

- QVector4D column(int index)
- qreal * constData(void)
- qreal * data(void)
- qreal * data_2(void)
- qreal determinant(void)
- void fill(qreal value)
- void flipCoordinates(void)
- void frustum(qreal left, qreal right, qreal bottom, qreal top, qreal nearPlane, qreal farPlane)
- QMatrix4x4 inverted(bool * invertible)
- bool isIdentity(void)
- void lookAt(QVector3D eye, QVector3D center, QVector3D up)
- QPoint map(QPoint point)
- QPointF map_2(QPointF point)
- QVector3D map_3(QVector3D point)
- QVector4D map_4(QVector4D point)
- QRect mapRect(QRect rect)
- QRectF mapRect_2(QRectF rect)
- QVector3D mapVector(QVector3D vector)
- QMatrix3x3 normalMatrix(void)
- void optimize(void)
- void ortho(qreal left, qreal right, qreal bottom, qreal top, qreal nearPlane, qreal farPlane)
- void ortho_2(QRect rect)
- void ortho_3(QRectF rect)
- void perspective(qreal angle, qreal aspect, qreal nearPlane, qreal farPlane)
- void rotate(qreal angle, QVector3D vector)
- void rotate_2(QQuaternion quaternion)
- void rotate_3(qreal angle, qreal x, qreal y, qreal z)
- QVector4D row(int index)
- void scale(QVector3D vector)
- void scale_2(qreal x, qreal y)
- void scale_3(qreal x, qreal y, qreal z)
- void scale_4(qreal factor)
- void setColumn(int index, QVector4D value)
- void setRow(int index, QVector4D value)
- void setToIdentity(void)
- QTransform toTransform(void)
- QTransform toTransform_2(qreal distanceToPlane)
- void translate(QVector3D vector)
- void translate_2(qreal x, qreal y)
- void translate_3(qreal x, qreal y, qreal z)
- QMatrix4x4 transposed(void)

# QMdiArea Class

C++ Reference : http://doc.qt.io/qt-5/qmdiarea.html

Parameters : QWidget *

Parent Class : QAbstractScrollArea

- QMdiArea::WindowOrder activationOrder(void)
- QMdiSubWindow * activeSubWindow(void)
- QMdiSubWindow * addSubWindow(QWidget * widget, Qt::WindowFlags windowFlags )
- QBrush background(void)
- QMdiSubWindow * currentSubWindow(void)
- bool documentMode(void)
- void removeSubWindow(QWidget * widget)
- void setActivationOrder(QMdiArea::WindowOrder order)
- void setBackground( QBrush   background)
- void setDocumentMode(bool enabled)
- void setOption(QMdiArea::AreaOption option, bool on )
- void setTabPosition(QTabWidget::TabPosition position)
- void setTabShape(QTabWidget::TabShape shape)
- void setTabsClosable(bool closable)
- void setTabsMovable(bool movable)
- void setViewMode(QMdiArea::ViewMode mode)
- QList<QMdiSubWindow *> subWindowList(QMdiArea::WindowOrder order )
- QTabWidget::TabPosition tabPosition(void)
- QTabWidget::TabShape tabShape(void)
- bool tabsClosable(void)
- bool tabsMovable(void)
- bool testOption(QMdiArea::AreaOption option)
- QMdiArea::ViewMode viewMode(void)
- void activateNextSubWindow(void)
- void activatePreviousSubWindow(void)
- void cascadeSubWindows(void)
- void closeActiveSubWindow(void)
- void closeAllSubWindows(void)
- void setActiveSubWindow(QMdiSubWindow * window)
- void tileSubWindows(void)

# QMdiSubWindow Class

C++ Reference : http://doc.qt.io/qt-5/qmdisubwindow.html

Parameters : QWidget *

Parent Class : QWidget

- bool isShaded(void)
- int keyboardPageStep(void)
- int keyboardSingleStep(void)
- QMdiArea * mdiArea(void)
- void setKeyboardPageStep(int step)
- void setKeyboardSingleStep(int step)
- void setOption(QMdiSubWindow::SubWindowOption option, bool on )
- void setSystemMenu(QMenu * systemMenu)
- void setWidget(QWidget * widget)
- QMenu * systemMenu(void)
- bool testOption(QMdiSubWindow::SubWindowOption option)
- QWidget * widget(void)
- void showShaded(void)
- void showSystemMenu(void)

# QMediaObject Class

C++ Reference : http://doc.qt.io/qt-5/qmediaobject.html

Parameters : void

Parent Class : QWidget

- QStringList availableMetaData(void)
- bool isMetaDataAvailable(void)
- QVariant metaData( QString   key)
- int notifyInterval(void)
- void setNotifyInterval(int milliSeconds)

# QMediaPlayer Class

C++ Reference : http://doc.qt.io/qt-5/qmediaplayer.html

Parameters : void

- int bufferStatus(void)
- QMediaContent currentMedia(void)
- int duration(void)
- int error(void)
- QString errorString(void)
- bool isAudioAvailable(void)
- bool isMuted(void)
- bool isSeekable(void)
- bool isVideoAvailable(void)
- QMediaContent media(void)
- int mediaStatus(void)
- QIODevice *mediaStream(void)
- qreal playbackRate(void)
- QMediaPlaylist *playlist(void)
- int position(void)
- void setVideoOutput(QVideoWidget *output)
- int state(void)
- int volume(void)
- void pause(void)
- void play(void)
- void setMedia(QUrl)
- void setMuted(bool muted)
- void setPlaybackRate(qreal rate)
- void setPlaylist(QMediaPlaylist *playlist)
- void setPosition(int position)
- void setVolume(int volume)
- void stop(void)

# QMediaPlaylist Class

C++ Reference : http://doc.qt.io/qt-5/qmediaplaylist.html

Parameters : void

- bool addMedia(QUrl)
- bool clear(void)
- int currentIndex(void)
- QMediaContent currentMedia(void)
- int error(void)
- QString errorString(void)
- bool insertMedia(int pos, QMediaContent)
- bool isEmpty(void)
- bool isReadOnly(void)
- void load(QUrl, const char *format) # In RingQt use : void loadfile(QUrl, const char *format)
- QMediaContent media(int index)
- int mediaCount(void)
- int nextIndex(int steps)
- int playbackMode(void)
- int previousIndex(int steps)
- bool removeMedia(int start, int end)
- bool save(QUrl, const char * format)
- void setPlaybackMode(QMediaPlaylist::PlaybackMode mode)
- void next(void) # In RingQt use : void movenext(void)
- void previous(void)
- void setCurrentIndex(int playlistPosition)
- void shuffle(void)

# QMediaRecorder Class

C++ Reference : http://doc.qt.io/qt-5/qmediarecorder.html

Parameters : QMediaObject *

Parent Class : QObject

- QUrl actualLocation(void)
- QAudioEncoderSettings audioSettings(void)
- QMultimedia::AvailabilityStatus availability(void)
- QString containerDescription(QString format)
- QString containerFormat(void)
- qint64 duration(void)
- QMediaRecorder::Error error(void)
- QString errorString(void)
- bool isAvailable(void)
- bool isMetaDataAvailable(void)
- bool isMetaDataWritable(void)
- bool isMuted(void)
- QVariant metaData(QString key)
- QUrl outputLocation(void)
- bool setOutputLocation(QUrl location)
- QMediaRecorder::State state(void)
- QMediaRecorder::Status status(void)
- QStringList supportedAudioCodecs(void)
- QStringList supportedContainers(void)
- QStringList supportedVideoCodecs(void)
- QString videoCodecDescription(QString codec)
- QVideoEncoderSettings videoSettings(void)
- qreal volume(void)
- void pause(void)
- void record(void)
- void setAudioSettings(QAudioEncoderSettings settings)
- void setEncodingSettings(QAudioEncoderSettings audio, QVideoEncoderSettings video, QString container)
- void setMetaData(QString key, QVariant value)
- void setMuted(bool muted)
- void setVideoSettings(QVideoEncoderSettings settings)
- void setVolume(qreal volume)
- void stop(void)
- void setactualLocationChangedEvent(const char *)
- void setdurationChangedEvent(const char *)
- void seterrorEvent(const char *)
- void setmetaDataChangedEvent(const char *)
- void setmutedChangedEvent(const char *)
- void setstateChangedEvent(const char *)
- void setstatusChangedEvent(const char *)
- void setvolumeChangedEvent(const char *)
- const char *getactualLocationChangedEvent(void)
- const char *getdurationChangedEvent(void)
- const char *geterrorEvent(void)
- const char *getmetaDataChangedEvent(void)
- const char *getmutedChangedEvent(void)
- const char *getstateChangedEvent(void)
- const char *getstatusChangedEvent(void)
- const char *getvolumeChangedEvent(void)

# QMenu Class

C++ Reference : http://doc.qt.io/qt-5/qmenu.html

Parameters : QWidget *

Parent Class : QWidget

- QAction *actionAt(QPoint)
- QRect actionGeometry(QAction *act)
- QAction *activeAction(void)
- void addAction(QAction *)
- QMenu *addMenu(QString)
- QAction *addSeparator(void)
- void clear(void)
- QAction *defaultAction(void)
- QAction *exec(const QPoint &)
- QAction *exec_2(void)
- QAction *exec_3(const QPoint &,QAction *)
- void hideTearOffMenu(void)
- QIcon icon(void)
- QAction *insertMenu(QAction *before, QMenu *menu)
- QAction *insertSeparator(QAction *before)
- bool isEmpty(void)
- bool isTearOffEnabled(void)
- bool isTearOffMenuVisible(void)
- QAction *menuAction(void)
- void popup(QPoint, QAction *atAction)
- bool separatorsCollapsible(void)
- void setActiveAction(QAction *act)
- void setDefaultAction(QAction *act)
- void setIcon(QIcon)
- void setSeparatorsCollapsible(bool collapse)
- void setTearOffEnabled(bool)
- void setTitle(QString)
- QString title(void)

# QMenuBar Class

C++ Reference : http://doc.qt.io/qt-5/qmenubar.html

Parameters : QWidget *

Parent Class : QWidget

- QAction *actionAt(QPoint)
- QRect actionGeometry(QAction *act)
- QAction *activeAction(void)
- QAction *addAction(QString)
- QMenu *addMenu(QString)
- QAction *addSeparator(void)
- void clear(void)
- QWidget *cornerWidget(Qt::Corner)
- QAction *insertMenu(QAction *before, QMenu *menu)
- QAction *insertSeparator(QAction *before)
- bool isDefaultUp(void)
- bool isNativeMenuBar(void)
- void setActiveAction(QAction *act)
- void setCornerWidget(QWidget *widget, Qt::Corner)
- void setDefaultUp(bool)
- void setNativeMenuBar(bool nativeMenuBar)

# QMesh Class

C++ Reference : http://doc.qt.io/qt-5/qt3drender-qmesh.html

Parameters : Qt3DCore::QNode *

- QString meshName(void)
- QUrl source(void)
- Qt3DRender::QMesh::Status status(void)
- void setMeshName(QString meshName)
- void setSource(QUrl source)

# QMessageBox Class

C++ Reference : http://doc.qt.io/qt-5/qmessagebox.html

Parameters : QWidget *parent

Parent Class : QDialog

- void addButton(QAbstractButton *button, QMessageBox::ButtonRole role)
- QAbstractButton *button(QMessageBox::StandardButton which)
- int buttonRole(QAbstractButton *button)
- QAbstractButton *clickedButton(void)
- QPushButton *defaultButton(void)
- QString detailedText(void)
- QAbstractButton *escapeButton(void)
- QPixmap iconPixmap(void)
- QString informativeText(void)
- void open(QObject *receiver, const char *member)
- void removeButton(QAbstractButton *button)
- void setDefaultButton(QPushButton *button)
- void setDetailedText(QString)
- void setEscapeButton(QAbstractButton *button)
- void setIcon(QMessageBox::Icon)
- void setIconPixmap(QPixmap)
- void setInformativeText(QString)
- void setStandardButtons(QMessageBox::StandardButton buttons)
- void setText(QString)
- void setTextFormat(Qt::TextFormat format)
- void setWindowModality(Qt::WindowModality windowModality)
- void setWindowTitle(QString)
- int standardButton(QAbstractButton *button)
- int standardButtons(void)
- QString text(void)
- int textFormat(void)
- int exec(void)
- void about(QWidget *parent, QString,QString)
- void aboutQt(QWidget *parent, QString)
- int critical(QWidget * parent, QString , QString, int buttons, int defaultButton)
- int information(QWidget * parent, QString ,QString, int buttons,int defaultButton)
- int question(QWidget * parent,QString,QString, int buttons ,int  defaultButton)
- int warning(QWidget *parent, QString,QString, int buttons,int defaultButton)

# QMetalRoughMaterial Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qmetalroughmaterial.html

Parameters : Qt3DCore::QNode *

- QVariant ambientOcclusion(void)
- QVariant baseColor(void)
- QVariant metalness(void)
- QVariant normal(void)
- QVariant roughness(void)
- float textureScale(void)
- void setAmbientOcclusion(QVariant ambientOcclusion)
- void setBaseColor(QVariant baseColor)
- void setMetalness(QVariant metalness)
- void setNormal(QVariant normal)
- void setRoughness(QVariant roughness)
- void setTextureScale(float textureScale)

# QMimeData Class

C++ Reference : http://doc.qt.io/qt-5/qmimedata.html

Parameters : void

Parent Class : QObject

- void clear(void)
- QVariant colorData(void)
- QByteArray data(QString mimeType)
- QStringList formats(void)
- bool hasColor(void)
- bool hasFormat(QString mimeType)
- bool hasHtml(void)
- bool hasImage(void)
- bool hasText(void)
- bool hasUrls(void)
- QString html(void)
- QVariant imageData(void)
- void removeFormat(QString mimeType)
- void setColorData(QVariant color)
- void setData(QString mimeType, QByteArray data)
- void setHtml(QString html)
- void setImageData(QVariant image)
- void setText(QString text)
- void setUrls(QList<QUrl> urls)
- QString text(void)
- QList<QUrl> urls(void)

# QModelIndex Class

C++ Reference : http://doc.qt.io/qt-5/qmodelindex.html

Parameters : void

- int column(void)
- QVariant data(int role)
- Qt::ItemFlags flags(void)
- quintptr internalId(void)
- void * internalPointer(void)
- bool isValid(void)
- QAbstractItemModel * model(void)
- QModelIndex parent(void)
- int row(void)
- QModelIndex sibling(int row, int column)
- QModelIndex siblingAtColumn(int column)
- QModelIndex siblingAtRow(int row)

# QMorphPhongMaterial Class

C++ Reference : http://doc.qt.io/qt-5/qmorphphongmaterial.html

Parameters : Qt3DCore::QNode *

- QColor ambient(void)
- QColor diffuse(void)
- float interpolator(void)
- float shininess(void)
- QColor specular(void)
- void setAmbient(QColor ambient)
- void setDiffuse(QColor diffuse)
- void setInterpolator(float interpolator)
- void setShininess(float shininess)
- void setSpecular(QColor specular)

# QMouseEvent Class

C++ Reference : http://doc.qt.io/qt-5/qmouseevent.html

Parameters : void

- Qt::MouseButton button(void)
- Qt::MouseButtons buttons(void)
- Qt::MouseEventFlags flags(void)
- QPointF globalPos(void)
- int globalX(void)
- int globalY(void)
- QPointF localPos(void)
- QPoint pos(void)
- QPointF screenPos(void)
- QPointF windowPos(void)
- int x(void)
- int y(void)

# QMovie Class

C++ Reference : http://doc.qt.io/qt-5/qmovie.html

Parameters : QObject *

Parent Class : QObject

- QColor backgroundColor(void)
- QMovie::CacheMode cacheMode(void)
- int currentFrameNumber(void)
- QImage currentImage(void)
- QPixmap currentPixmap(void)
- QIODevice * device(void)
- QString fileName(void)
- QByteArray format(void)
- int frameCount(void)
- QRect frameRect(void)
- bool isValid(void)
- bool jumpToFrame(int frameNumber)
- int loopCount(void)
- int nextFrameDelay(void)
- QSize scaledSize(void)
- void setBackgroundColor(QColor color)
- void setCacheMode(QMovie::CacheMode mode)
- void setDevice(QIODevice *device)
- void setFileName(QString fileName)
- void setFormat(QByteArray format)
- void setScaledSize(QSize size)
- int speed(void)
- QMovie::MovieState state(void)
- bool jumpToNextFrame(void)
- void setPaused(bool paused)
- void setSpeed(int percentSpeed)
- void start(void)
- void stop(void)
- void seterrorEvent(const char *)
- void setfinishedEvent(const char *)
- void setframeChangedEvent(const char *)
- void setresizedEvent(const char *)
- void setstartedEvent(const char *)
- void setstateChangedEvent(const char *)
- void setupdatedEvent(const char *)
- const char *geterrorEvent(void)
- const char *getfinishedEvent(void)
- const char *getframeChangedEvent(void)
- const char *getresizedEvent(void)
- const char *getstartedEvent(void)
- const char *getstateChangedEvent(void)
- const char *getupdatedEvent(void)

# QMutex Class

C++ Reference : http://doc.qt.io/qt-5/qmutex.html

Parameters : QMutex::RecursionMode

- bool isRecursive(void)
- void lock(void)
- void unlock(void)

# QMutexLocker Class

C++ Reference : http://doc.qt.io/qt-5/qmutexlocker.html

Parameters : QMutex *

- QMutex * mutex(void)
- void relock(void)
- void unlock(void)

# QNetworkAccessManager Class

C++ Reference : http://doc.qt.io/qt-5/qnetworkaccessmanager.html

Parameters : QObject *

Parent Class : QObject

- void setfinishedEvent(const char *)
- const char *getfinishedEvent(void)
- QNetworkConfiguration activeConfiguration(void)
- QAbstractNetworkCache *cache(void)
- void clearAccessCache(void)
- QNetworkConfiguration configuration(void)
- void connectToHost(QString, quint16)
- QNetworkCookieJar *cookieJar(void)
- QNetworkReply *deleteResource(QNetworkRequest)
- QNetworkReply *get(QNetworkRequest) # In RingQt use : QNetworkReply *getvalue(QNetworkRequest)
- QNetworkReply *head(QNetworkRequest)
- QNetworkAccessManager::NetworkAccessibility networkAccessible(void)
- QNetworkReply *post(QNetworkRequest, QByteArray)
- QNetworkProxy proxy(void)
- QNetworkProxyFactory *proxyFactory(void)
- QNetworkReply *put(QNetworkRequest, QByteArray) # In RingQt use : QNetworkReply *putvalue(QNetworkRequest, QByteArray)
- QNetworkReply *sendCustomRequest(QNetworkRequest, QByteArray, QIODevice *)
- void setCache(QAbstractNetworkCache *cache)
- void setConfiguration(QNetworkConfiguration)
- void setCookieJar(QNetworkCookieJar *cookieJar)
- void setNetworkAccessible(QNetworkAccessManager::NetworkAccessibility accessible)
- void setProxy(QNetworkProxy)
- void setProxyFactory(QNetworkProxyFactory *factory)
- QStringList supportedSchemes(void)
- void geteventparameters(void)

# QNetworkConfigurationManager Class

C++ Reference : http://doc.qt.io/qt-5/qnetworkconfigurationmanager.html

Parameters : QObject *parent

Parent Class : QObject

- QList<QNetworkConfiguration> allConfigurations(QNetworkConfiguration::StateFlags filter)
- QNetworkConfigurationManager::Capabilities capabilities(void)
- QNetworkConfiguration configurationFromIdentifier(QString identifier)
- QNetworkConfiguration defaultConfiguration(void)
- bool isOnline(void)
- void updateConfigurations(void)
- void setconfigurationAddedEvent(const char *)
- void setconfigurationChangedEvent(const char *)
- void setconfigurationRemovedEvent(const char *)
- void setonlineStateChangedEvent(const char *)
- void setupdateCompletedEvent(const char *)
- const char *getconfigurationAddedEvent(void)
- const char *getconfigurationChangedEvent(void)
- const char *getconfigurationRemovedEvent(void)
- const char *getonlineStateChangedEvent(void)
- const char *getupdateCompletedEvent(void)

# QNetworkCookie Class

C++ Reference : http://doc.qt.io/qt-5/qnetworkcookie.html

Parameters : QByteArray name, QByteArray value

- QString domain(void)
- QDateTime expirationDate(void)
- bool hasSameIdentifier(QNetworkCookie other)
- bool isHttpOnly(void)
- bool isSecure(void)
- bool isSessionCookie(void)
- QByteArray name(void)
- void normalize(QUrl url)
- QString path(void)
- void setDomain(QString domain)
- void setExpirationDate(QDateTime date)
- void setHttpOnly(bool enable)
- void setName(QByteArray cookieName)
- void setPath(QString path)
- void setSecure(bool enable)
- void setValue(QByteArray value)
- QByteArray toRawForm(QNetworkCookie::RawForm form)
- QByteArray value(void)

# QNetworkCookieJar Class

C++ Reference : http://doc.qt.io/qt-5/qnetworkcookiejar.html

Parameters : QObject *parent

Parent Class : QObject

- QList<QNetworkCookie> cookiesForUrl(QUrl url)
- bool deleteCookie(QNetworkCookie cookie)
- bool insertCookie(QNetworkCookie cookie)
- bool setCookiesFromUrl(QList<QNetworkCookie> cookieList, QUrl url)
- bool updateCookie(QNetworkCookie cookie)

# QNetworkInterface Class

C++ Reference : http://doc.qt.io/qt-5/qnetworkinterface.html

Parameters : void

- QList<QNetworkAddressEntry> addressEntries(void)
- QNetworkInterface::InterfaceFlags flags(void)
- QString hardwareAddress(void)
- QString humanReadableName(void)
- int index(void)
- bool isValid(void)
- int maximumTransmissionUnit(void)
- QString name(void)
- QNetworkInterface::InterfaceType type(void)

# QNetworkProxy Class

C++ Reference : http://doc.qt.io/qt-5/qnetworkproxy.html

Parameters : void

- int capabilities(void)
- bool hasRawHeader(QByteArray headerName)
- QVariant header(QNetworkRequest::KnownHeaders header)
- QString hostName(void)
- bool isCachingProxy(void)
- bool isTransparentProxy(void)
- QString password(void)
- int port(void)
- QByteArray rawHeader(QByteArray headerName)
- void setCapabilities(QNetworkProxy::Capability capabilities)
- void setHeader(QNetworkRequest::KnownHeaders header,  QVariant value)
- void setHostName(QString hostName)
- void setPassword(QString password)
- void setPort(int port)
- void setRawHeader(QByteArray headerName, QByteArray headerValue)
- void setType(QNetworkProxy::ProxyType type)
- void setUser(QString user)
- void swap(QNetworkProxy  other)
- int type(void)
- QString user(void)
- QNetworkProxy applicationProxy(void)
- void setApplicationProxy(QNetworkProxy  networkProxy)

# QNetworkReply Class

C++ Reference : http://doc.qt.io/qt-5/qnetworkreply.html

Parameters : void

Parent Class : QIODevice

- QVariant attribute(QNetworkRequest::Attribute code)
- QNetworkReply::NetworkError error(void)
- bool hasRawHeader(QByteArray)
- QVariant header(QNetworkRequest::KnownHeaders header)
- bool isFinished(void)
- bool isRunning(void)
- QNetworkAccessManager *manager(void)
- QNetworkAccessManager::Operation operation(void)
- QByteArray rawHeader(QByteArray)
- qint64 readBufferSize(void)
- QNetworkRequest request(void)
- QUrl url(void)

# QNetworkRequest Class

C++ Reference : http://doc.qt.io/qt-5/qnetworkrequest.html

Parameters : QUrl

- QVariant attribute(QNetworkRequest::Attribute, QVariant)
- bool hasRawHeader(QByteArray)
- QVariant header(QNetworkRequest::KnownHeaders)
- QObject *originatingObject(void)
- QNetworkRequest::Priority priority(void)
- QByteArray rawHeader(QByteArray)
- void setAttribute(QNetworkRequest::Attribute, QVariant)
- void setHeader(QNetworkRequest::KnownHeaders, QVariant)
- void setOriginatingObject(QObject *object)
- void setPriority(QNetworkRequest::Priority priority)
- void setRawHeader(QByteArray, QByteArray)
- void setUrl(QUrl)
- void swap(QNetworkRequest)
- QUrl url(void)

# QNmeaPositionInfoSource Class

C++ Reference : http://doc.qt.io/qt-5/qnmeapositioninfosource.html

Parameters : QNmeaPositionInfoSource::UpdateMode,QObject *

Parent Class : QGeoPositionInfoSource

- QIODevice * device(void)
- void setDevice(QIODevice * device)
- QNmeaPositionInfoSource::UpdateMode updateMode(void)

# QNode Class

C++ Reference : http://doc.qt.io/qt-5/qt3dcore-qnode.html

Parameters : Qt3DCore::QNode *

Parent Class : QObject

- bool blockNotifications(bool block)
- Qt3DCore::QNodeVector childNodes(void)
- void clearPropertyTracking(QString propertyName)
- void clearPropertyTrackings(void)
- Qt3DCore::QNode::PropertyTrackingMode defaultPropertyTrackingMode(void)
- Qt3DCore::QNodeId id(void)
- bool isEnabled(void)
- bool notificationsBlocked(void)
- Qt3DCore::QNode * parentNode(void)
- Qt3DCore::QNode::PropertyTrackingMode propertyTracking(QString propertyName)
- void sendReply(Qt3DCore::QNodeCommandPtr command)
- void setPropertyTracking(QString propertyName, Qt3DCore::QNode::PropertyTrackingMode trackMode)
- void setDefaultPropertyTrackingMode(Qt3DCore::QNode::PropertyTrackingMode mode)
- void setEnabled(bool isEnabled)
- void setParent(Qt3DCore::QNode *parent)

# QObject Class

C++ Reference : http://doc.qt.io/qt-5/qobject.html

Parameters : void

- bool blockSignals(bool block)
- QObjectList children(void)
- void dumpObjectInfo(void)
- void dumpObjectTree(void)
- bool inherits(const char *className)
- void installEventFilter(QObject *filterObj)
- bool isWidgetType(void)
- void killTimer(int id)
- void moveToThread(QThread *targetThread)
- QString objectName(void)
- QObject *parent(void)
- QVariant property(const char *name)
- void removeEventFilter(QObject *obj)
- void setObjectName(QString)
- void setParent(QObject *parent)
- bool setProperty(const char *name, QVariant)
- bool setProperty_2(const char *name, int)
- bool setProperty_3(const char *name, float)
- bool setProperty_4(const char *name, double)
- bool setProperty_5(const char *name, QString)
- bool setProperty_int(const char *name, int)
- bool setProperty_float(const char *name, float)
- bool setProperty_double(const char *name, double)
- bool setProperty_string(const char *name, QString)
- bool signalsBlocked(void)
- int startTimer(int interval)
- QThread *thread(void)
- void deleteLater(void)

# QObjectPicker Class

C++ Reference : http://doc.qt.io/qt-5/qt3drender-qobjectpicker.html

Parameters : Qt3DCore::QNode *

- bool containsMouse(void)
- bool isDragEnabled(void)
- bool isHoverEnabled(void)
- bool isPressed(void)
- void setDragEnabled(bool dragEnabled)
- void setHoverEnabled(bool hoverEnabled)
- void setclickedEvent(const char *)
- void setcontainsMouseChangedEvent(const char *)
- void setdragEnabledChangedEvent(const char *)
- void setenteredEvent(const char *)
- void setexitedEvent(const char *)
- void sethoverEnabledChangedEvent(const char *)
- void setmovedEvent(const char *)
- void setpressedEvent(const char *)
- void setpressedChangedEvent(const char *)
- void setreleasedEvent(const char *)
- const char *getclickedEvent(void)
- const char *getcontainsMouseChangedEvent(void)
- const char *getdragEnabledChangedEvent(void)
- const char *getenteredEvent(void)
- const char *getexitedEvent(void)
- const char *gethoverEnabledChangedEvent(void)
- const char *getmovedEvent(void)
- const char *getpressedEvent(void)
- const char *getpressedChangedEvent(void)
- const char *getreleasedEvent(void)

# QOpenGLBuffer Class

C++ Reference : http://doc.qt.io/qt-5/qopenglbuffer.html

Parameters : void

- void allocate(void *data, int count)
- void allocate_2(int count)
- bool bind(void)
- GLuint bufferId(void)
- bool create(void)
- void destroy(void)
- bool isCreated(void)
- void * map(QOpenGLBuffer::Access access)
- bool read(int offset, void *data, int count)
- void release(void)
- void setUsagePattern(QOpenGLBuffer::UsagePattern value)
- int size(void)
- QOpenGLBuffer::Type type(void)
- bool unmap(void)
- QOpenGLBuffer::UsagePattern usagePattern(void)
- void write(int offset, void *data, int count)
- void release_2(QOpenGLBuffer::Type type)

# QOpenGLContext Class

C++ Reference : http://doc.qt.io/qt-5/qopenglcontext.html

Parameters : QObject *

Parent Class : QObject

- bool create(void)
- GLuint defaultFramebufferObject(void)
- void doneCurrent(void)
- QSet<QByteArray> extensions(void)
- QSurfaceFormat format(void)
- QOpenGLFunctions * functions(void)
- QFunctionPointer getProcAddress(QByteArray procName)
- QFunctionPointer getProcAddress_2(char *procName)
- bool hasExtension(QByteArray extension)
- bool isOpenGLES(void)
- bool isValid(void)
- bool makeCurrent(QSurface *surface)
- QVariant nativeHandle(void)
- QScreen * screen(void)
- void setFormat(QSurfaceFormat format)
- void setNativeHandle(QVariant handle)
- void setScreen(QScreen *screen)
- void setShareContext(QOpenGLContext *shareContext)
- QOpenGLContext * shareContext(void)
- QOpenGLContextGroup * shareGroup(void)
- QSurface * surface(void)
- void swapBuffers(QSurface *surface)
- QAbstractOpenGLFunctions * versionFunctions(QOpenGLVersionProfile versionProfile))
- TYPE * versionFunctions_2(void)
- bool areSharing(QOpenGLContext *first, QOpenGLContext *second)
- QOpenGLContext * currentContext(void)
- QOpenGLContext * globalShareContext(void)
- void * openGLModuleHandle(void)
- QOpenGLContext::OpenGLModuleType openGLModuleType(void)
- bool supportsThreadedOpenGL(void)
- QOpenGLFunctions_3_2_Core *opengl32(void)

# QOpenGLDebugLogger Class

C++ Reference : http://doc.qt.io/qt-5/qopengldebuglogger.html

Parameters : QObject *

- void disableMessages(QOpenGLDebugMessage::Sources sources, QOpenGLDebugMessage::Types types, QOpenGLDebugMessage::Severities severities)
- void disableMessages_2(QVector<GLuint> ids, QOpenGLDebugMessage::Sources sources, QOpenGLDebugMessage::Types types)
- void enableMessages(QOpenGLDebugMessage::Sources sources, QOpenGLDebugMessage::Types types, QOpenGLDebugMessage::Severities severities)
- void enableMessages_2(QVector<GLuint> ids, QOpenGLDebugMessage::Sources sources, QOpenGLDebugMessage::Types types)
- bool initialize(void)
- bool isLogging(void)
- QList<QOpenGLDebugMessage> loggedMessages(void)
- QOpenGLDebugLogger::LoggingMode loggingMode(void)
- qint64 maximumMessageLength(void)
- void popGroup(void)
- void pushGroup(QString name, GLuint id, QOpenGLDebugMessage::Source source)
- void logMessage(QOpenGLDebugMessage debugMessage)
- void startLogging(QOpenGLDebugLogger::LoggingMode loggingMode)
- void stopLogging(void)

# QOpenGLFramebufferObject Class

C++ Reference : http://doc.qt.io/qt-5/qopenglframebufferobject.html

Parameters : int,int,GLenum

- QOpenGLFramebufferObject::Attachment attachment(void)
- bool bind(void)
- QOpenGLFramebufferObjectFormat format(void)
- GLuint handle(void)
- int height(void)
- bool isBound(void)
- bool isValid(void)
- bool release(void)
- void setAttachment(QOpenGLFramebufferObject::Attachment attachment)
- QSize size(void)
- GLuint texture(void)
- QImage toImage_2(void)
- int width(void)
- bool bindDefault(void)
- bool hasOpenGLFramebufferBlit(void)
- bool hasOpenGLFramebufferObjects(void)

# QOpenGLFunctions Class

C++ Reference : http://doc.qt.io/qt-5/qopenglfunctions.html

Parameters : void

- void glActiveTexture(GLenum texture)
- void glAttachShader(GLuint program, GLuint shader)
- void glBindAttribLocation(GLuint program, GLuint index, char *name)
- void glBindBuffer(GLenum target, GLuint buffer)
- void glBindFramebuffer(GLenum target, GLuint framebuffer)
- void glBindRenderbuffer(GLenum target, GLuint renderbuffer)
- void glBindTexture(GLenum target, GLuint texture)
- void glBlendColor(GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha)
- void glBlendEquation(GLenum mode)
- void glBlendEquationSeparate(GLenum modeRGB, GLenum modeAlpha)
- void glBlendFunc(GLenum sfactor, GLenum dfactor)
- void glBlendFuncSeparate(GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha)
- void glBufferData(GLenum target, qopengl_GLsizeiptr size, void *data, GLenum usage)
- void glBufferSubData(GLenum target, qopengl_GLintptr offset, qopengl_GLsizeiptr size, void *data)
- GLenum glCheckFramebufferStatus(GLenum target)
- void glClear(GLbitfield mask)
- void glClearColor(GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha)
- void glClearDepthf(GLclampf depth)
- void glClearStencil(GLint s)
- void glColorMask(GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha)
- void glCompileShader(GLuint shader)
- void glCompressedTexImage2D(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, void *data)
- void glCompressedTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, void *data)
- void glCopyTexImage2D(GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border)
- void glCopyTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height)
- GLuint glCreateProgram(void)
- GLuint glCreateShader(GLenum type)
- void glCullFace(GLenum mode)
- void glDeleteBuffers(GLsizei n, GLuint *buffers)
- void glDeleteFramebuffers(GLsizei n, GLuint *framebuffers)
- void glDeleteProgram(GLuint program)
- void glDeleteRenderbuffers(GLsizei n, GLuint *renderbuffers)
- void glDeleteShader(GLuint shader)
- void glDeleteTextures(GLsizei n, GLuint *textures)
- void glDepthFunc(GLenum func)
- void glDepthMask(GLboolean flag)
- void glDepthRangef(GLclampf zNear, GLclampf zFar)
- void glDetachShader(GLuint program, GLuint shader)
- void glDisable(GLenum cap)
- void glDisableVertexAttribArray(GLuint index)
- void glDrawArrays(GLenum mode, GLint first, GLsizei count)
- void glDrawElements(GLenum mode, GLsizei count, GLenum type, GLvoid *indices)
- void glEnable(GLenum cap)
- void glEnableVertexAttribArray(GLuint index)
- void glFinish(void)
- void glFlush(void)
- void glFramebufferRenderbuffer(GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)
- void glFramebufferTexture2D(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)
- void glFrontFace(GLenum mode)
- void glGenBuffers(GLsizei n, GLuint *buffers)
- void glGenFramebuffers(GLsizei n, GLuint *framebuffers)
- void glGenRenderbuffers(GLsizei n, GLuint *renderbuffers)
- void glGenTextures(GLsizei n, GLuint *textures)
- void glGenerateMipmap(GLenum target)
- void glGetActiveAttrib(GLuint program, GLuint index, GLsizei bufsize, GLsizei *length, GLint *size, GLenum *type, char *name)
- void glGetActiveUniform(GLuint program, GLuint index, GLsizei bufsize, GLsizei *length, GLint *size, GLenum *type, char *name)
- void glGetAttachedShaders(GLuint program, GLsizei maxcount, GLsizei *count, GLuint *shaders)
- GLint glGetAttribLocation(GLuint program, char *name)
- void glGetBooleanv(GLenum pname, GLboolean *params)
- void glGetBufferParameteriv(GLenum target, GLenum pname, GLint *params)
- GLenum glGetError(void)
- void glGetFloatv(GLenum pname, GLfloat *params)
- void glGetFramebufferAttachmentParameteriv(GLenum target, GLenum attachment, GLenum pname, GLint *params)
- void glGetIntegerv(GLenum pname, GLint *params)
- void glGetProgramInfoLog(GLuint program, GLsizei bufsize, GLsizei *length, char *infolog)
- void glGetProgramiv(GLuint program, GLenum pname, GLint *params)
- void glGetRenderbufferParameteriv(GLenum target, GLenum pname, GLint *params)
- void glGetShaderInfoLog(GLuint shader, GLsizei bufsize, GLsizei *length, char *infolog)
- void glGetShaderPrecisionFormat(GLenum shadertype, GLenum precisiontype, GLint *range, GLint *precision)
- void glGetShaderSource(GLuint shader, GLsizei bufsize, GLsizei *length, char *source)
- void glGetShaderiv(GLuint shader, GLenum pname, GLint *params)
- GLubyte * glGetString(GLenum name)
- void glGetTexParameterfv(GLenum target, GLenum pname, GLfloat *params)
- void glGetTexParameteriv(GLenum target, GLenum pname, GLint *params)
- GLint glGetUniformLocation(GLuint program, char *name)
- void glGetUniformfv(GLuint program, GLint location, GLfloat *params)
- void glGetUniformiv(GLuint program, GLint location, GLint *params)
- void glGetVertexAttribfv(GLuint index, GLenum pname, GLfloat *params)
- void glGetVertexAttribiv(GLuint index, GLenum pname, GLint *params)
- void glHint(GLenum target, GLenum mode)
- GLboolean glIsBuffer(GLuint buffer)
- GLboolean glIsEnabled(GLenum cap)
- GLboolean glIsFramebuffer(GLuint framebuffer)
- GLboolean glIsProgram(GLuint program)
- GLboolean glIsRenderbuffer(GLuint renderbuffer)
- GLboolean glIsShader(GLuint shader)
- GLboolean glIsTexture(GLuint texture)
- void glLineWidth(GLfloat width)
- void glLinkProgram(GLuint program)
- void glPixelStorei(GLenum pname, GLint param)
- void glPolygonOffset(GLfloat factor, GLfloat units)
- void glReadPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels)
- void glReleaseShaderCompiler(void)
- void glRenderbufferStorage(GLenum target, GLenum internalformat, GLsizei width, GLsizei height)
- void glSampleCoverage(GLclampf value, GLboolean invert)
- void glScissor(GLint x, GLint y, GLsizei width, GLsizei height)
- void glShaderBinary(GLint n, GLuint *shaders, GLenum binaryformat, void *binary, GLint length)
- void glStencilFunc(GLenum func, GLint ref, GLuint mask)
- void glStencilFuncSeparate(GLenum face, GLenum func, GLint ref, GLuint mask)
- void glStencilMask(GLuint mask)
- void glStencilMaskSeparate(GLenum face, GLuint mask)
- void glStencilOp(GLenum fail, GLenum zfail, GLenum zpass)
- void glStencilOpSeparate(GLenum face, GLenum fail, GLenum zfail, GLenum zpass)
- void glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, GLvoid *pixels)
- void glTexParameterf(GLenum target, GLenum pname, GLfloat param)
- void glTexParameterfv(GLenum target, GLenum pname, GLfloat *params)
- void glTexParameteri(GLenum target, GLenum pname, GLint param)
- void glTexParameteriv(GLenum target, GLenum pname, GLint *params)
- void glTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels)
- void glUniform1f(GLint location, GLfloat x)
- void glUniform1fv(GLint location, GLsizei count, GLfloat *v)
- void glUniform1i(GLint location, GLint x)
- void glUniform1iv(GLint location, GLsizei count, GLint *v)
- void glUniform2f(GLint location, GLfloat x, GLfloat y)
- void glUniform2fv(GLint location, GLsizei count, GLfloat *v)
- void glUniform2i(GLint location, GLint x, GLint y)
- void glUniform2iv(GLint location, GLsizei count, GLint *v)
- void glUniform3f(GLint location, GLfloat x, GLfloat y, GLfloat z)
- void glUniform3fv(GLint location, GLsizei count, GLfloat *v)
- void glUniform3i(GLint location, GLint x, GLint y, GLint z)
- void glUniform3iv(GLint location, GLsizei count, GLint *v)
- void glUniform4f(GLint location, GLfloat x, GLfloat y, GLfloat z, GLfloat w)
- void glUniform4fv(GLint location, GLsizei count, GLfloat *v)
- void glUniform4i(GLint location, GLint x, GLint y, GLint z, GLint w)
- void glUniform4iv(GLint location, GLsizei count, GLint *v)
- void glUniformMatrix2fv(GLint location, GLsizei count, GLboolean transpose, GLfloat *value)
- void glUniformMatrix3fv(GLint location, GLsizei count, GLboolean transpose, GLfloat *value)
- void glUniformMatrix4fv(GLint location, GLsizei count, GLboolean transpose, GLfloat *value)
- void glUseProgram(GLuint program)
- void glValidateProgram(GLuint program)
- void glVertexAttrib1f(GLuint indx, GLfloat x)
- void glVertexAttrib1fv(GLuint indx, GLfloat *values)
- void glVertexAttrib2f(GLuint indx, GLfloat x, GLfloat y)
- void glVertexAttrib2fv(GLuint indx, GLfloat *values)
- void glVertexAttrib3f(GLuint indx, GLfloat x, GLfloat y, GLfloat z)
- void glVertexAttrib3fv(GLuint indx, GLfloat *values)
- void glVertexAttrib4f(GLuint indx, GLfloat x, GLfloat y, GLfloat z, GLfloat w)
- void glVertexAttrib4fv(GLuint indx, GLfloat *values)
- void glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLboolean normalized, GLsizei stride, void *ptr)
- void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
- bool hasOpenGLFeature(QOpenGLFunctions::OpenGLFeature feature)
- void initializeOpenGLFunctions(void)
- QOpenGLFunctions::OpenGLFeatures openGLFeatures(void)

# QOpenGLFunctions_3_2_Core Class

C++ Reference : http://doc.qt.io/qt-5/qopenglfunctions_3_2_core.html

Parameters : void

- void glActiveTexture(GLenum texture)
- void glAttachShader(GLuint program, GLuint shader)
- void glBeginConditionalRender(GLuint id, GLenum mode)
- void glBeginQuery(GLenum target, GLuint id)
- void glBeginTransformFeedback(GLenum primitiveMode)
- void glBindAttribLocation(GLuint program, GLuint index, GLchar *name)
- void glBindBuffer(GLenum target, GLuint buffer)
- void glBindBufferBase(GLenum target, GLuint index, GLuint buffer)
- void glBindBufferRange(GLenum target, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size)
- void glBindFragDataLocation(GLuint program, GLuint color, GLchar *name)
- void glBindFramebuffer(GLenum target, GLuint framebuffer)
- void glBindRenderbuffer(GLenum target, GLuint renderbuffer)
- void glBindTexture(GLenum target, GLuint texture)
- void glBindVertexArray(GLuint array)
- void glBlendColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
- void glBlendEquation(GLenum mode)
- void glBlendEquationSeparate(GLenum modeRGB, GLenum modeAlpha)
- void glBlendFunc(GLenum sfactor, GLenum dfactor)
- void glBlendFuncSeparate(GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha)
- void glBlitFramebuffer(GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter)
- void glBufferData(GLenum target, GLsizeiptr size, GLvoid *data, GLenum usage)
- void glBufferSubData(GLenum target, GLintptr offset, GLsizeiptr size, GLvoid *data)
- GLenum glCheckFramebufferStatus(GLenum target)
- void glClampColor(GLenum target, GLenum clamp)
- void glClear(GLbitfield mask)
- void glClearBufferfi(GLenum buffer, GLint drawbuffer, GLfloat depth, GLint stencil)
- void glClearBufferfv(GLenum buffer, GLint drawbuffer, GLfloat *value)
- void glClearBufferiv(GLenum buffer, GLint drawbuffer, GLint *value)
- void glClearBufferuiv(GLenum buffer, GLint drawbuffer, GLuint *value)
- void glClearColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
- void glClearDepth(GLdouble depth)
- void glClearStencil(GLint s)
- GLenum glClientWaitSync(GLsync sync, GLbitfield flags, GLuint64 timeout)
- void glColorMask(GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha)
- void glColorMaski(GLuint index, GLboolean r, GLboolean g, GLboolean b, GLboolean a)
- void glCompileShader(GLuint shader)
- void glCompressedTexImage1D(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, GLvoid *data)
- void glCompressedTexImage2D(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, GLvoid *data)
- void glCompressedTexImage3D(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, GLvoid *data)
- void glCompressedTexSubImage1D(GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, GLvoid *data)
- void glCompressedTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, GLvoid *data)
- void glCompressedTexSubImage3D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, GLvoid *data)
- void glCopyBufferSubData(GLenum readTarget, GLenum writeTarget, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size)
- void glCopyTexImage1D(GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border)
- void glCopyTexImage2D(GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border)
- void glCopyTexSubImage1D(GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width)
- void glCopyTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height)
- void glCopyTexSubImage3D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height)
- GLuint glCreateProgram(void)
- GLuint glCreateShader(GLenum type)
- void glCullFace(GLenum mode)
- void glDeleteBuffers(GLsizei n, GLuint *buffers)
- void glDeleteFramebuffers(GLsizei n, GLuint *framebuffers)
- void glDeleteProgram(GLuint program)
- void glDeleteQueries(GLsizei n, GLuint *ids)
- void glDeleteRenderbuffers(GLsizei n, GLuint *renderbuffers)
- void glDeleteShader(GLuint shader)
- void glDeleteSync(GLsync sync)
- void glDeleteTextures(GLsizei n, GLuint *textures)
- void glDeleteVertexArrays(GLsizei n, GLuint *arrays)
- void glDepthFunc(GLenum func)
- void glDepthMask(GLboolean flag)
- void glDepthRange(GLdouble nearVal, GLdouble farVal)
- void glDetachShader(GLuint program, GLuint shader)
- void glDisable(GLenum cap)
- void glDisableVertexAttribArray(GLuint index)
- void glDisablei(GLenum target, GLuint index)
- void glDrawArrays(GLenum mode, GLint first, GLsizei count)
- void glDrawArraysInstanced(GLenum mode, GLint first, GLsizei count, GLsizei instancecount)
- void glDrawBuffer(GLenum mode)
- void glDrawBuffers(GLsizei n, GLenum *bufs)
- void glDrawElements(GLenum mode, GLsizei count, GLenum type, GLvoid *indices)
- void glDrawElementsBaseVertex(GLenum mode, GLsizei count, GLenum type, GLvoid *indices, GLint basevertex)
- void glDrawElementsInstanced(GLenum mode, GLsizei count, GLenum type, GLvoid *indices, GLsizei instancecount)
- void glDrawElementsInstancedBaseVertex(GLenum mode, GLsizei count, GLenum type, GLvoid *indices, GLsizei instancecount, GLint basevertex)
- void glDrawRangeElements(GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, GLvoid *indices)
- void glDrawRangeElementsBaseVertex(GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, GLvoid *indices, GLint basevertex)
- void glEnable(GLenum cap)
- void glEnableVertexAttribArray(GLuint index)
- void glEnablei(GLenum target, GLuint index)
- void glEndConditionalRender(void)
- void glEndQuery(GLenum target)
- void glEndTransformFeedback(void)
- GLsync glFenceSync(GLenum condition, GLbitfield flags)
- void glFinish(void)
- void glFlush(void)
- void glFlushMappedBufferRange(GLenum target, GLintptr offset, GLsizeiptr length)
- void glFramebufferRenderbuffer(GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)
- void glFramebufferTexture(GLenum target, GLenum attachment, GLuint texture, GLint level)
- void glFramebufferTexture1D(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)
- void glFramebufferTexture2D(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)
- void glFramebufferTexture3D(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset)
- void glFramebufferTextureLayer(GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer)
- void glFrontFace(GLenum mode)
- void glGenBuffers(GLsizei n, GLuint *buffers)
- void glGenFramebuffers(GLsizei n, GLuint *framebuffers)
- void glGenQueries(GLsizei n, GLuint *ids)
- void glGenRenderbuffers(GLsizei n, GLuint *renderbuffers)
- void glGenTextures(GLsizei n, GLuint *textures)
- void glGenVertexArrays(GLsizei n, GLuint *arrays)
- void glGenerateMipmap(GLenum target)
- void glGetActiveAttrib(GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLint *size, GLenum *type, GLchar *name)
- void glGetActiveUniform(GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLint *size, GLenum *type, GLchar *name)
- void glGetActiveUniformBlockName(GLuint program, GLuint uniformBlockIndex, GLsizei bufSize, GLsizei *length, GLchar *uniformBlockName)
- void glGetActiveUniformBlockiv(GLuint program, GLuint uniformBlockIndex, GLenum pname, GLint *params)
- void glGetActiveUniformName(GLuint program, GLuint uniformIndex, GLsizei bufSize, GLsizei *length, GLchar *uniformName)
- void glGetActiveUniformsiv(GLuint program, GLsizei uniformCount, GLuint *uniformIndices, GLenum pname, GLint *params)
- void glGetAttachedShaders(GLuint program, GLsizei maxCount, GLsizei *count, GLuint *obj)
- GLint glGetAttribLocation(GLuint program, GLchar *name)
- void glGetBooleani_v(GLenum target, GLuint index, GLboolean *data)
- void glGetBooleanv(GLenum pname, GLboolean *params)
- void glGetBufferParameteri64v(GLenum target, GLenum pname, GLint64 *params)
- void glGetBufferParameteriv(GLenum target, GLenum pname, GLint *params)
- void glGetBufferSubData(GLenum target, GLintptr offset, GLsizeiptr size, GLvoid *data)
- void glGetCompressedTexImage(GLenum target, GLint level, GLvoid *img)
- void glGetDoublev(GLenum pname, GLdouble *params)
- GLenum glGetError(void)
- void glGetFloatv(GLenum pname, GLfloat *params)
- GLint glGetFragDataLocation(GLuint program, GLchar *name)
- void glGetFramebufferAttachmentParameteriv(GLenum target, GLenum attachment, GLenum pname, GLint *params)
- void glGetInteger64i_v(GLenum target, GLuint index, GLint64 *data)
- void glGetInteger64v(GLenum pname, GLint64 *params)
- void glGetIntegeri_v(GLenum target, GLuint index, GLint *data)
- void glGetIntegerv(GLenum pname, GLint *params)
- void glGetMultisamplefv(GLenum pname, GLuint index, GLfloat *val)
- void glGetProgramInfoLog(GLuint program, GLsizei bufSize, GLsizei *length, GLchar *infoLog)
- void glGetProgramiv(GLuint program, GLenum pname, GLint *params)
- void glGetQueryObjectiv(GLuint id, GLenum pname, GLint *params)
- void glGetQueryObjectuiv(GLuint id, GLenum pname, GLuint *params)
- void glGetQueryiv(GLenum target, GLenum pname, GLint *params)
- void glGetRenderbufferParameteriv(GLenum target, GLenum pname, GLint *params)
- void glGetShaderInfoLog(GLuint shader, GLsizei bufSize, GLsizei *length, GLchar *infoLog)
- void glGetShaderSource(GLuint shader, GLsizei bufSize, GLsizei *length, GLchar *source)
- void glGetShaderiv(GLuint shader, GLenum pname, GLint *params)
- GLubyte * glGetString(GLenum name)
- GLubyte * glGetStringi(GLenum name, GLuint index)
- void glGetSynciv(GLsync sync, GLenum pname, GLsizei bufSize, GLsizei *length, GLint *values)
- void glGetTexImage(GLenum target, GLint level, GLenum format, GLenum type, GLvoid *pixels)
- void glGetTexLevelParameterfv(GLenum target, GLint level, GLenum pname, GLfloat *params)
- void glGetTexLevelParameteriv(GLenum target, GLint level, GLenum pname, GLint *params)
- void glGetTexParameterIiv(GLenum target, GLenum pname, GLint *params)
- void glGetTexParameterIuiv(GLenum target, GLenum pname, GLuint *params)
- void glGetTexParameterfv(GLenum target, GLenum pname, GLfloat *params)
- void glGetTexParameteriv(GLenum target, GLenum pname, GLint *params)
- void glGetTransformFeedbackVarying(GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLsizei *size, GLenum *type, GLchar *name)
- GLuint glGetUniformBlockIndex(GLuint program, GLchar *uniformBlockName)
- GLint glGetUniformLocation(GLuint program, GLchar *name)
- void glGetUniformfv(GLuint program, GLint location, GLfloat *params)
- void glGetUniformiv(GLuint program, GLint location, GLint *params)
- void glGetUniformuiv(GLuint program, GLint location, GLuint *params)
- void glGetVertexAttribIiv(GLuint index, GLenum pname, GLint *params)
- void glGetVertexAttribIuiv(GLuint index, GLenum pname, GLuint *params)
- void glGetVertexAttribdv(GLuint index, GLenum pname, GLdouble *params)
- void glGetVertexAttribfv(GLuint index, GLenum pname, GLfloat *params)
- void glGetVertexAttribiv(GLuint index, GLenum pname, GLint *params)
- void glHint(GLenum target, GLenum mode)
- void glIndexub(GLubyte c)
- void glIndexubv(GLubyte *c)
- GLboolean glIsBuffer(GLuint buffer)
- GLboolean glIsEnabled(GLenum cap)
- GLboolean glIsEnabledi(GLenum target, GLuint index)
- GLboolean glIsFramebuffer(GLuint framebuffer)
- GLboolean glIsProgram(GLuint program)
- GLboolean glIsQuery(GLuint id)
- GLboolean glIsRenderbuffer(GLuint renderbuffer)
- GLboolean glIsShader(GLuint shader)
- GLboolean glIsSync(GLsync sync)
- GLboolean glIsTexture(GLuint texture)
- GLboolean glIsVertexArray(GLuint array)
- void glLineWidth(GLfloat width)
- void glLinkProgram(GLuint program)
- void glLogicOp(GLenum opcode)
- GLvoid * glMapBuffer(GLenum target, GLenum access)
- GLvoid * glMapBufferRange(GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access)
- void glMultiDrawArrays(GLenum mode, GLint *first, GLsizei *count, GLsizei drawcount)
- void glPixelStoref(GLenum pname, GLfloat param)
- void glPixelStorei(GLenum pname, GLint param)
- void glPointParameterf(GLenum pname, GLfloat param)
- void glPointParameterfv(GLenum pname, GLfloat *params)
- void glPointParameteri(GLenum pname, GLint param)
- void glPointParameteriv(GLenum pname, GLint *params)
- void glPointSize(GLfloat size)
- void glPolygonMode(GLenum face, GLenum mode)
- void glPolygonOffset(GLfloat factor, GLfloat units)
- void glPrimitiveRestartIndex(GLuint index)
- void glProvokingVertex(GLenum mode)
- void glReadBuffer(GLenum mode)
- void glReadPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels)
- void glRenderbufferStorage(GLenum target, GLenum internalformat, GLsizei width, GLsizei height)
- void glRenderbufferStorageMultisample(GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height)
- void glSampleCoverage(GLfloat value, GLboolean invert)
- void glSampleMaski(GLuint index, GLbitfield mask)
- void glScissor(GLint x, GLint y, GLsizei width, GLsizei height)
- void glStencilFunc(GLenum func, GLint ref, GLuint mask)
- void glStencilFuncSeparate(GLenum face, GLenum func, GLint ref, GLuint mask)
- void glStencilMask(GLuint mask)
- void glStencilMaskSeparate(GLenum face, GLuint mask)
- void glStencilOp(GLenum fail, GLenum zfail, GLenum zpass)
- void glStencilOpSeparate(GLenum face, GLenum sfail, GLenum dpfail, GLenum dppass)
- void glTexBuffer(GLenum target, GLenum internalformat, GLuint buffer)
- void glTexImage1D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLint border, GLenum format, GLenum type, GLvoid *pixels)
- void glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, GLvoid *pixels)
- void glTexImage2DMultisample(GLenum target, GLsizei samples, GLint internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations)
- void glTexImage3D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, GLvoid *pixels)
- void glTexImage3DMultisample(GLenum target, GLsizei samples, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations)
- void glTexParameterIiv(GLenum target, GLenum pname, GLint *params)
- void glTexParameterIuiv(GLenum target, GLenum pname, GLuint *params)
- void glTexParameterf(GLenum target, GLenum pname, GLfloat param)
- void glTexParameterfv(GLenum target, GLenum pname, GLfloat *params)
- void glTexParameteri(GLenum target, GLenum pname, GLint param)
- void glTexParameteriv(GLenum target, GLenum pname, GLint *params)
- void glTexSubImage1D(GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, GLvoid *pixels)
- void glTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels)
- void glTexSubImage3D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, GLvoid *pixels)
- void glUniform1f(GLint location, GLfloat v0)
- void glUniform1fv(GLint location, GLsizei count, GLfloat *value)
- void glUniform1i(GLint location, GLint v0)
- void glUniform1iv(GLint location, GLsizei count, GLint *value)
- void glUniform1ui(GLint location, GLuint v0)
- void glUniform1uiv(GLint location, GLsizei count, GLuint *value)
- void glUniform2f(GLint location, GLfloat v0, GLfloat v1)
- void glUniform2fv(GLint location, GLsizei count, GLfloat *value)
- void glUniform2i(GLint location, GLint v0, GLint v1)
- void glUniform2iv(GLint location, GLsizei count, GLint *value)
- void glUniform2ui(GLint location, GLuint v0, GLuint v1)
- void glUniform2uiv(GLint location, GLsizei count, GLuint *value)
- void glUniform3f(GLint location, GLfloat v0, GLfloat v1, GLfloat v2)
- void glUniform3fv(GLint location, GLsizei count, GLfloat *value)
- void glUniform3i(GLint location, GLint v0, GLint v1, GLint v2)
- void glUniform3iv(GLint location, GLsizei count, GLint *value)
- void glUniform3ui(GLint location, GLuint v0, GLuint v1, GLuint v2)
- void glUniform3uiv(GLint location, GLsizei count, GLuint *value)
- void glUniform4f(GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3)
- void glUniform4fv(GLint location, GLsizei count, GLfloat *value)
- void glUniform4i(GLint location, GLint v0, GLint v1, GLint v2, GLint v3)
- void glUniform4iv(GLint location, GLsizei count, GLint *value)
- void glUniform4ui(GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3)
- void glUniform4uiv(GLint location, GLsizei count, GLuint *value)
- void glUniformBlockBinding(GLuint program, GLuint uniformBlockIndex, GLuint uniformBlockBinding)
- void glUniformMatrix2fv(GLint location, GLsizei count, GLboolean transpose, GLfloat *value)
- void glUniformMatrix2x3fv(GLint location, GLsizei count, GLboolean transpose, GLfloat *value)
- void glUniformMatrix2x4fv(GLint location, GLsizei count, GLboolean transpose, GLfloat *value)
- void glUniformMatrix3fv(GLint location, GLsizei count, GLboolean transpose, GLfloat *value)
- void glUniformMatrix3x2fv(GLint location, GLsizei count, GLboolean transpose, GLfloat *value)
- void glUniformMatrix3x4fv(GLint location, GLsizei count, GLboolean transpose, GLfloat *value)
- void glUniformMatrix4fv(GLint location, GLsizei count, GLboolean transpose, GLfloat *value)
- void glUniformMatrix4x2fv(GLint location, GLsizei count, GLboolean transpose, GLfloat *value)
- void glUniformMatrix4x3fv(GLint location, GLsizei count, GLboolean transpose, GLfloat *value)
- GLboolean glUnmapBuffer(GLenum target)
- void glUseProgram(GLuint program)
- void glValidateProgram(GLuint program)
- void glVertexAttribPointer(GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, GLvoid *pointer)
- void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
- void glWaitSync(GLsync sync, GLbitfield flags, GLuint64 timeout)

# QOpenGLPaintDevice Class

C++ Reference : http://doc.qt.io/qt-5/qopenglpaintdevice.html

Parameters : void

Parent Class : QPaintDevice

- QOpenGLContext * context(void)
- qreal dotsPerMeterX(void)
- qreal dotsPerMeterY(void)
- void ensureActiveTarget(void)
- bool paintFlipped(void)
- void setDevicePixelRatio(qreal devicePixelRatio)
- void setDotsPerMeterX(qreal dpmx)
- void setDotsPerMeterY(qreal dpmy)
- void setPaintFlipped(bool flipped)
- void setSize(QSize size)
- QSize size(void)

# QOpenGLShader Class

C++ Reference : http://doc.qt.io/qt-5/qopenglshader.html

Parameters : QOpenGLShader::ShaderType,QObject *

- bool compileSourceCode(char *source)
- bool compileSourceCode_2(QByteArray source)
- bool compileSourceCode_3(QString source)
- bool compileSourceFile(QString fileName)
- bool isCompiled(void)
- QString log(void)
- GLuint shaderId(void)
- QOpenGLShader::ShaderType shaderType(void)
- QByteArray sourceCode(void)
- bool hasOpenGLShaders(QOpenGLShader::ShaderType type, QOpenGLContext *context)

# QOpenGLShaderProgram Class

C++ Reference : http://doc.qt.io/qt-5/qopenglshaderprogram.html

Parameters : QObject *

- bool addShader(QOpenGLShader *shader)
- bool addShaderFromSourceCode(QOpenGLShader::ShaderType type, char *source)
- bool addShaderFromSourceCode_2(QOpenGLShader::ShaderType type, QByteArray source)
- bool addShaderFromSourceCode_3(QOpenGLShader::ShaderType type, QString source)
- bool addShaderFromSourceFile(QOpenGLShader::ShaderType type, QString fileName)
- int attributeLocation(char *name)
- int attributeLocation_2(QByteArray name)
- int attributeLocation_3(QString name)
- bool bind(void)
- void bindAttributeLocation(char *name, int location)
- void bindAttributeLocation_2(QByteArray name, int location)
- void bindAttributeLocation_3(QString name, int location)
- QVector<float> defaultInnerTessellationLevels(void)
- QVector<float> defaultOuterTessellationLevels(void)
- void disableAttributeArray(int location)
- void disableAttributeArray_2(char *name)
- void enableAttributeArray(int location)
- void enableAttributeArray_2(char *name)
- bool isLinked(void)
- bool link(void)
- QString log(void)
- int maxGeometryOutputVertices(void)
- int patchVertexCount(void)
- GLuint programId(void)
- void release(void)
- void removeAllShaders(void)
- void removeShader(QOpenGLShader *shader)
- void setAttributeArray(int location, GLfloat *values, int tupleSize, int stride)
- void setAttributeArray_2(int location, QVector2D *values, int stride)
- void setAttributeArray_3(int location, QVector3D *values, int stride)
- void setAttributeArray_4(int location, QVector4D *values, int stride)
- void setAttributeArray_5(int location, GLenum type, void *values, int tupleSize, int stride)
- void setAttributeArray_6(char *name, GLfloat *values, int tupleSize, int stride)
- void setAttributeArray_7(char *name, QVector2D *values, int stride)
- void setAttributeArray_8(char *name, QVector3D *values, int stride)
- void setAttributeArray_9(char *name, QVector4D *values, int stride)
- void setAttributeArray_10(char *name, GLenum type, void *values, int tupleSize, int stride)
- void setAttributeBuffer(int location, GLenum type, int offset, int tupleSize, int stride)
- void setAttributeBuffer_2(char *name, GLenum type, int offset, int tupleSize, int stride)
- void setAttributeValue(int location, GLfloat value)
- void setAttributeValue_2(int location, GLfloat x, GLfloat y)
- void setAttributeValue_3(int location, GLfloat x, GLfloat y, GLfloat z)
- void setAttributeValue_4(int location, GLfloat x, GLfloat y, GLfloat z, GLfloat w)
- void setAttributeValue_5(int location, QVector2D value)
- void setAttributeValue_6(int location, QVector3D value)
- void setAttributeValue_7(int location, QVector4D value)
- void setAttributeValue_8(int location, QColor value)
- void setAttributeValue_9(int location, GLfloat *values, int columns, int rows)
- void setAttributeValue_10(char *name, GLfloat value)
- void setAttributeValue_11(char *name, GLfloat x, GLfloat y)
- void setAttributeValue_12(char *name, GLfloat x, GLfloat y, GLfloat z)
- void setAttributeValue_13(char *name, GLfloat x, GLfloat y, GLfloat z, GLfloat w)
- void setAttributeValue_14(char *name, QVector2D value)
- void setAttributeValue_15(char *name, QVector3D value)
- void setAttributeValue_16(char *name, QVector4D value)
- void setDefaultInnerTessellationLevels(QVector<float> levels)
- void setDefaultOuterTessellationLevels(QVector<float> levels)
- void setPatchVertexCount(int count)
- void setUniformValue(int location, GLfloat value)
- void setUniformValue_2(int location, GLint value)
- void setUniformValue_3(char *name, QColor color)
- void setUniformValue_4(char *name, QPoint point)
- void setUniformValue_5(char *name, QPointF point)
- void setUniformValue_6(char *name, QSize size)
- void setUniformValue_7(char *name, QSizeF size)
- void setUniformValue_8(char *name, QMatrix2x2 value)
- void setUniformValue_9(char *name, QMatrix2x3 value)
- void setUniformValue_10(char *name, QMatrix2x4 value)
- void setUniformValue_11(char *name, QMatrix3x2 value)
- void setUniformValue_12(char *name, QMatrix3x3 value)
- void setUniformValue_13(char *name, QMatrix3x4 value)
- void setUniformValue_14(char *name, QMatrix4x2 value)
- void setUniformValue_15(char *name, QMatrix4x3 value)
- void setUniformValue_16(char *name, QMatrix4x4 value)
- void setUniformValue_20(char *name, QTransform value)
- void setUniformValue_21(int location, GLuint value)
- void setUniformValue_22(int location, GLfloat x, GLfloat y)
- void setUniformValue_23(int location, GLfloat x, GLfloat y, GLfloat z)
- void setUniformValue_24(int location, GLfloat x, GLfloat y, GLfloat z, GLfloat w)
- void setUniformValue_25(int location, QVector2D value)
- void setUniformValue_26(int location, QVector3D value)
- void setUniformValue_27(int location, QVector4D value)
- void setUniformValue_28(int location, QColor color)
- void setUniformValue_29(int location, QPoint point)
- void setUniformValue_30(int location, QPointF point)
- void setUniformValue_31(int location, QSize size)
- void setUniformValue_32(int location, QSizeF size)
- void setUniformValue_33(int location, QMatrix2x2 value)
- void setUniformValue_34(int location, QMatrix2x3 value)
- void setUniformValue_35(int location, QMatrix2x4 value)
- void setUniformValue_36(int location, QMatrix3x2 value)
- void setUniformValue_37(int location, QMatrix3x3 value)
- void setUniformValue_38(int location, QMatrix3x4 value)
- void setUniformValue_39(int location, QMatrix4x2 value)
- void setUniformValue_40(int location, QMatrix4x3 value)
- void setUniformValue_41(int location, QMatrix4x4 value)
- void setUniformValue_45(int location, QTransform value)
- void setUniformValue_46(char *name, GLfloat value)
- void setUniformValue_47(char *name, GLint value)
- void setUniformValue_48(char *name, GLuint value)
- void setUniformValue_49(char *name, GLfloat x, GLfloat y)
- void setUniformValue_50(char *name, GLfloat x, GLfloat y, GLfloat z)
- void setUniformValue_51(char *name, GLfloat x, GLfloat y, GLfloat z, GLfloat w)
- void setUniformValue_52(char *name, QVector2D value)
- void setUniformValue_53(char *name, QVector3D value)
- void setUniformValue_54(char *name, QVector4D value)
- void setUniformValueArray(int location, GLfloat *values, int count, int tupleSize)
- void setUniformValueArray_2(int location, GLint *values, int count)
- void setUniformValueArray_3(int location, GLuint *values, int count)
- void setUniformValueArray_4(int location, QVector2D *values, int count)
- void setUniformValueArray_5(int location, QVector3D *values, int count)
- void setUniformValueArray_6(int location, QVector4D *values, int count)
- void setUniformValueArray_7(int location, QMatrix2x2 *values, int count)
- void setUniformValueArray_8(int location, QMatrix2x3 *values, int count)
- void setUniformValueArray_9(int location, QMatrix2x4 *values, int count)
- void setUniformValueArray_10(int location, QMatrix3x2 *values, int count)
- void setUniformValueArray_11(int location, QMatrix3x3 *values, int count)
- void setUniformValueArray_12(int location, QMatrix3x4 *values, int count)
- void setUniformValueArray_13(int location, QMatrix4x2 *values, int count)
- void setUniformValueArray_14(int location, QMatrix4x3 *values, int count)
- void setUniformValueArray_15(int location, QMatrix4x4 *values, int count)
- void setUniformValueArray_16(char *name, GLfloat *values, int count, int tupleSize)
- void setUniformValueArray_17(char *name, GLint *values, int count)
- void setUniformValueArray_18(char *name, GLuint *values, int count)
- void setUniformValueArray_19(char *name, QVector2D *values, int count)
- void setUniformValueArray_20(char *name, QVector3D *values, int count)
- void setUniformValueArray_21(char *name, QVector4D *values, int count)
- void setUniformValueArray_22(char *name, QMatrix2x2 *values, int count)
- void setUniformValueArray_23(char *name, QMatrix2x3 *values, int count)
- void setUniformValueArray_24(char *name, QMatrix2x4 *values, int count)
- void setUniformValueArray_25(char *name, QMatrix3x2 *values, int count)
- void setUniformValueArray_26(char *name, QMatrix3x3 *values, int count)
- void setUniformValueArray_27(char *name, QMatrix3x4 *values, int count)
- void setUniformValueArray_28(char *name, QMatrix4x2 *values, int count)
- void setUniformValueArray_29(char *name, QMatrix4x3 *values, int count)
- void setUniformValueArray_30(char *name, QMatrix4x4 *values, int count)
- QList<QOpenGLShader *> shaders(void)
- int uniformLocation(char *name)
- int uniformLocation_2(QByteArray name)
- int uniformLocation_3(QString name)
- bool hasOpenGLShaderPrograms(QOpenGLContext *context)

# QOpenGLTexture Class

C++ Reference : http://doc.qt.io/qt-5/qopengltexture.html

Parameters : QOpenGLTexture::Target

- void allocateStorage(void)
- void bind(void)
- void bind_2(uint unit, QOpenGLTexture::TextureUnitReset reset)
- QColor borderColor(void)
- void borderColor_2(float *border)
- void borderColor_3(int *border)
- void borderColor_4(unsigned int *border)
- bool create(void)
- QOpenGLTexture * createTextureView(QOpenGLTexture::Target target, QOpenGLTexture::TextureFormat viewFormat, int minimumMipmapLevel, int maximumMipmapLevel, int minimumLayer, int maximumLayer)
- int depth(void)
- QOpenGLTexture::DepthStencilMode depthStencilMode(void)
- void destroy(void)
- int faces(void)
- QOpenGLTexture::TextureFormat format(void)
- void generateMipMaps(void)
- void generateMipMaps_2(int baseLevel, bool resetBaseLevel)
- int height(void)
- bool isAutoMipMapGenerationEnabled(void)
- bool isBound(void)
- bool isBound_2(uint unit)
- bool isCreated(void)
- bool isStorageAllocated(void)
- bool isTextureView(void)
- int layers(void)
- QPair<float, float> levelOfDetailRange(void)
- float levelofDetailBias(void)
- QOpenGLTexture::Filter magnificationFilter(void)
- float maximumAnisotropy(void)
- float maximumLevelOfDetail(void)
- int maximumMipLevels(void)
- QOpenGLTexture::Filter minificationFilter(void)
- float minimumLevelOfDetail(void)
- int mipBaseLevel(void)
- int mipLevels(void)
- int mipMaxLevel(void)
- void release(void)
- void release_2(uint unit, QOpenGLTexture::TextureUnitReset reset)
- void setAutoMipMapGenerationEnabled(bool enabled)
- void setBorderColor(QColor color)
- void setBorderColor_3(int r, int g, int b, int a)
- void setBorderColor_4(uint r, uint g, uint b, uint a)
- void setCompressedData(int mipLevel, int layer, QOpenGLTexture::CubeMapFace cubeFace, int dataSize, void *data, QOpenGLPixelTransferOptions * options)
- void setCompressedData_3(int mipLevel, int layer, int dataSize, void *data, QOpenGLPixelTransferOptions * options)
- void setCompressedData_4(int mipLevel, int dataSize, void *data, QOpenGLPixelTransferOptions * options)
- void setCompressedData_5(int dataSize, void *data, QOpenGLPixelTransferOptions * options)
- void setData(int mipLevel, int layer, QOpenGLTexture::CubeMapFace cubeFace, QOpenGLTexture::PixelFormat sourceFormat, QOpenGLTexture::PixelType sourceType, void *data, QOpenGLPixelTransferOptions * options)
- void setData_3(int mipLevel, int layer, QOpenGLTexture::PixelFormat sourceFormat, QOpenGLTexture::PixelType sourceType, void *data, QOpenGLPixelTransferOptions * options)
- void setData_4(int mipLevel, QOpenGLTexture::PixelFormat sourceFormat, QOpenGLTexture::PixelType sourceType, void *data, QOpenGLPixelTransferOptions * options)
- void setData_5(QOpenGLTexture::PixelFormat sourceFormat, QOpenGLTexture::PixelType sourceType, void *data, QOpenGLPixelTransferOptions * options)
- void setData_6(QImage image, QOpenGLTexture::MipMapGeneration genMipMaps)
- void setDepthStencilMode(QOpenGLTexture::DepthStencilMode mode)
- void setFormat(QOpenGLTexture::TextureFormat format)
- void setLayers(int layers)
- void setLevelOfDetailRange(float min, float max)
- void setLevelofDetailBias(float bias)
- void setMagnificationFilter(QOpenGLTexture::Filter filter)
- void setMaximumAnisotropy(float anisotropy)
- void setMaximumLevelOfDetail(float value)
- void setMinMagFilters(QOpenGLTexture::Filter minificationQOpenGLTexture::Filter, QOpenGLTexture::Filter magnificationQOpenGLTexture::Filter)
- void setMinificationFilter(QOpenGLTexture::Filter filter)
- void setMinimumLevelOfDetail(float value)
- void setMipBaseLevel(int baseLevel)
- void setMipLevelRange(int baseLevel, int maxLevel)
- void setMipLevels(int levels)
- void setMipMaxLevel(int maxLevel)
- void setSize(int width, int height, int depth)
- void setSwizzleMask(QOpenGLTexture::SwizzleComponent component, QOpenGLTexture::SwizzleValue value)
- void setSwizzleMask_2(QOpenGLTexture::SwizzleValue r, QOpenGLTexture::SwizzleValue g, QOpenGLTexture::SwizzleValue b, QOpenGLTexture::SwizzleValue a)
- void setWrapMode(QOpenGLTexture::WrapMode mode)
- void setWrapMode_2(QOpenGLTexture::CoordinateDirection direction, QOpenGLTexture::WrapMode mode)
- QOpenGLTexture::SwizzleValue swizzleMask(QOpenGLTexture::SwizzleComponent component)
- GLuint textureId(void)
- int width(void)
- QOpenGLTexture::WrapMode wrapMode(QOpenGLTexture::CoordinateDirection direction)
- GLuint boundTextureId(QOpenGLTexture::BindingTarget target)
- bool hasFeature(QOpenGLTexture::Feature feature)

# QOpenGLTimerQuery Class

C++ Reference : http://doc.qt.io/qt-5/qopengltimerquery.html

Parameters : QObject *

- void begin(void)
- bool create(void)
- void destroy(void)
- void end(void)
- bool isCreated(void)
- bool isResultAvailable(void)
- GLuint objectId(void)
- void recordTimestamp(void)
- GLuint64 waitForResult(void)
- GLuint64 waitForTimestamp(void)

# QOpenGLVersionProfile Class

C++ Reference : http://doc.qt.io/qt-5/qopenglversionprofile.html

Parameters : void

- bool hasProfiles(void)
- bool isLegacyVersion(void)
- bool isValid(void)
- QSurfaceFormat::OpenGLContextProfile profile(void)
- void setProfile(QSurfaceFormat::OpenGLContextProfile profile)
- void setVersion(int majorVersion, int minorVersion)
- QPair<int, int> version(void)

# QOpenGLVertexArrayObject Class

C++ Reference : http://doc.qt.io/qt-5/qopenglvertexarrayobject.html

Parameters : QObject *

- void bind(void)
- bool create(void)
- void destroy(void)
- bool isCreated(void)
- GLuint objectId(void)
- void release(void)

# QOpenGLWidget Class

C++ Reference : http://doc.qt.io/qt-5/qopenglwidget.html

Parameters : QWidget *

Parent Class : QWidget

- void geteventparameters(void)
- void setInitEvent(const char *cStr)
- const char *getInitEvent(void)
- void setPaintEvent(const char *cStr)
- const char *getPaintEvent(void)
- void setResizeEvent(const char *cStr)
- const char *getResizeEvent(void)
- QOpenGLContext * context(void)
- GLuint defaultFramebufferObject(void)
- void doneCurrent(void)
- QSurfaceFormat format(void)
- QImage grabFramebuffer(void)
- bool isValid(void)
- void makeCurrent(void)
- void setFormat(QSurfaceFormat format)
- void setUpdateBehavior(QOpenGLWidget::UpdateBehavior updateBehavior)
- QOpenGLWidget::UpdateBehavior updateBehavior(void)

# QOrbitCameraController Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qorbitcameracontroller.html

Parameters : Qt3DCore::QNode *

Parent Class : QAbstractCameraController

- void setZoomInLimit(float zoomInLimit)
- float zoomInLimit(void)

# QPageLayout Class

C++ Reference : http://doc.qt.io/qt-5/qpagelayout.html

Parameters : void

- QRectF fullRect(QPageLayout::Unit units)
- QRectF fullRectPixels(int resolution)
- QRectF fullRectPoints(void)
- bool isEquivalentTo(QPageLayout other)
- bool isValid(void)
- QMargins marginsPixels(int resolution)
- QMargins marginsPoints(void)
- QPageLayout::Mode mode(void)
- QPageLayout::Orientation orientation(void)
- QPageSize pageSize(void)
- QRectF paintRect(QPageLayout::Unit units)
- QRectF paintRectPixels(int resolution)
- QRectF paintRectPoints(void)
- bool setBottomMargin(qreal bottomMargin)
- bool setLeftMargin(qreal leftMargin)
- void setMode(QPageLayout::Mode mode)
- void setOrientation(QPageLayout::Orientation orientation)
- bool setRightMargin(qreal rightMargin)
- bool setTopMargin(qreal topMargin)
- void setUnits(QPageLayout::Unit units)
- QPageLayout::Unit units(void)

# QPageSetupDialog Class

C++ Reference : http://doc.qt.io/qt-5/qpagesetupdialog.html

Parameters : QPrinter *,QWidget *

Parent Class : QDialog

- void open(QObject * receiver, char * member)
- QPrinter * printer(void)

# QPageSize Class

C++ Reference : http://doc.qt.io/qt-5/qpagesize.html

Parameters : void

- QSizeF definitionSize(void)
- QPageSize::Unit definitionUnits(void)
- int id(void)
- bool isEquivalentTo(QPageSize other)
- bool isValid(void)
- QString key(void)
- QString name(void)
- QRectF rect(QPageSize::Unit units)
- QSize sizePixels(int resolution)
- QSizeF size(QPageSize::Unit units)
- QSize sizePoints(void)
- int windowsId(void)

# QPaintDevice Class

C++ Reference : http://doc.qt.io/qt-5/qpaintdevice.html

- int colorCount(void)
- int depth(void)
- int devicePixelRatio(void)
- int height(void)
- int heightMM(void)
- int logicalDpiX(void)
- int logicalDpiY(void)
- QPaintEngine * paintEngine(void)
- bool paintingActive(void)
- int physicalDpiX(void)
- int physicalDpiY(void)
- int width(void)
- int widthMM(void)

# QPainter Class

C++ Reference : http://doc.qt.io/qt-5/qpainter.html

Parameters : void

- QBrush background(void)
- int backgroundMode(void)
- bool begin(QPaintDevice *device)
- void beginNativePainting(void)
- QRect boundingRect(int x, int y, int w, int h, int flags, QString text)
- QBrush brush(void)
- QPoint brushOrigin(void)
- QRectF clipBoundingRect(void)
- QPainterPath clipPath(void)
- QRegion clipRegion(void)
- QTransform combinedTransform(void)
- int compositionMode(void)
- QPaintDevice *device(void)
- QTransform deviceTransform(void)
- void drawArc(int x, int y, int width, int height, int startAngle, int spanAngle)
- void drawChord(int x, int y, int width, int height, int startAngle, int spanAngle)
- void drawEllipse(int x, int y, int width, int height)
- void drawGlyphRun(QPointF  position,  QGlyphRun  glyphs)
- void drawImage(int x, int y,  QImage image)
- void drawLine(int x1, int y1, int x2, int y2)
- void drawLines(QLine *lines, int lineCount)
- void drawPath(QPainterPath path)
- void drawPicture(int x, int y,  QPicture  picture)
- void drawPie(int x, int y, int width, int height, int startAngle, int spanAngle)
- void drawPixmap(int x, int y,  QPixmap)
- void drawPoint(int x, int y)
- void drawRect(int x, int y, int width, int height)
- void drawRects(QRectF *rectangles, int rectCount)
- void drawRoundedRect(int x, int y, int w, int h, qreal xRadius, qreal yRadius, Qt::SizeMode mode)
- void drawStaticText(int left, int top,  QStaticText  staticText)
- void drawText(int x, int y, QString  text)
- void drawTiledPixmap(int x, int y, int width, int height,  QPixmap  pixmap, int sx, int sy)
- bool end(void) # In RingQt use : bool endpaint(void)
- void endNativePainting(void)
- void eraseRect(int x, int y, int width, int height)
- void fillPath(QPainterPath  path,  QBrush  brush)
- void fillRect(int x, int y, int width, int height, QBrush)
- QFont font(void)
- QFontInfo fontInfo(void)
- bool hasClipping(void)
- bool isActive(void)
- int layoutDirection(void)
- double opacity(void)
- QPaintEngine *paintEngine(void)
- QPen pen(void)
- int renderHints(void)
- void resetTransform(void)
- void restore(void)
- void rotate(qreal angle)
- void save(void)
- void scale(double sx, double sy)
- void setBackground(QBrush  brush)
- void setBackgroundMode(Qt::BGMode mode)
- void setBrush(QBrush brush)
- void setBrushOrigin(int x, int y)
- void setClipPath(QPainterPath  path, Qt::ClipOperation operation)
- void setClipRect(int x, int y, int width, int height, Qt::ClipOperation operation)
- void setClipRegion(QRegion  region, Qt::ClipOperation operation)
- void setClipping(bool enable)
- void setCompositionMode(QPainter::CompositionMode mode)
- void setFont(QFont font)
- void setLayoutDirection(Qt::LayoutDirection direction)
- void setOpacity(qreal opacity)
- void setPen(QPen pen)
- void setRenderHint(QPainter::RenderHint hint, bool on)
- void setTransform(QTransform  transform, bool combine)
- void setViewTransformEnabled(bool enable)
- void setViewport(int x, int y, int width, int height)
- void setWindow(int x, int y, int width, int height)
- void setWorldMatrixEnabled(bool enable)
- void setWorldTransform( QTransform  matrix, bool combine)
- void shear(double sh, double sv)
- void strokePath(QPainterPath  path,  QPen  pen)
- bool testRenderHint(QPainter::RenderHint hint)
- QTransform transform(void)
- void translate(double dx, double dy)
- bool viewTransformEnabled(void)
- QRect viewport(void)
- QRect window(void)
- bool worldMatrixEnabled(void)
- QTransform  worldTransform(void)
- void drawPolygon(List *pPoints, Qt::FillRule fillRule)
- void drawConvexPolygon(List *pPoints)
- void drawPoints(List *pPoints)
- void drawPolyline(List *pPoints)
- void drawHSVFList(List *pPoints)
- void drawRGBFList(List *pPoints)
- void drawHSVFListAtXY(List *pPoints,int x,int y)
- void drawRGBFListAtXY(List *pPoints,int x,int y)
- void drawBytes(int x, int y,const char *cData,int Width,int Height,int channels)

# QPainter2 Class

Parameters : QPaintDevice *

Parent Class : QPainter

# QPainterPath Class

C++ Reference : http://doc.qt.io/qt-5/qpainterpath.html

Parameters : void

- void addEllipse(qreal x, qreal y, qreal width, qreal height)
- void addPath(QPainterPath)
- void addPolygon(QPolygonF)
- void addRect(qreal x, qreal y, qreal width, qreal height)
- void addRegion(QRegion)
- void addRoundedRect(qreal x, qreal y, qreal w, qreal h, qreal xRadius, qreal yRadius, Qt::SizeMode mode)
- void addText(qreal x, qreal y, QFont, QString)
- qreal angleAtPercent(qreal t)
- void arcMoveTo(qreal x, qreal y, qreal width, qreal height, qreal angle)
- void arcTo(qreal x, qreal y, qreal width, qreal height, qreal startAngle, qreal sweepLength)
- QRectF boundingRect(void)
- void closeSubpath(void)
- void connectPath(QPainterPath)
- bool contains(QPointF)
- QRectF controlPointRect(void)
- void cubicTo(qreal c1X, qreal c1Y, qreal c2X, qreal c2Y, qreal endPointX, qreal endPointY)
- QPointF currentPosition(void)
- QPainterPath::Element elementAt(int index)
- int elementCount(void)
- Qt::FillRule fillRule(void)
- QPainterPath intersected(QPainterPath)
- bool intersects(QRectF)
- bool isEmpty(void)
- qreal length(void)
- void lineTo(qreal x, qreal y)
- void moveTo(qreal x, qreal y)
- qreal percentAtLength(qreal len)
- QPointF pointAtPercent(qreal t)
- void quadTo(qreal cx, qreal cy, qreal endPointX, qreal endPointY)
- void setElementPositionAt(int index, qreal x, qreal y)
- void setFillRule(Qt::FillRule fillRule)
- QPainterPath simplified(void)
- qreal slopeAtPercent(qreal t)
- QPainterPath subtracted(QPainterPath)
- void swap(QPainterPath)
- QPolygonF toFillPolygon(QTransform)
- QPainterPath toReversed(void)
- void translate(qreal dx, qreal dy)
- QPainterPath translated(qreal dx, qreal dy)
- QPainterPath united(QPainterPath)

# QPalette Class

C++ Reference : http://doc.qt.io/qt-5/qpalette.html

Parameters : void

- QBrush alternateBase(void)
- QBrush base(void)
- QBrush brightText(void)
- QBrush brush(QPalette::ColorRole role)
- QBrush button(void)
- QBrush buttonText(void)
- QColor color(QPalette::ColorRole role)
- QColor color_2(QPalette::ColorGroup group, QPalette::ColorRole role)
- QPalette::ColorGroup currentColorGroup(void)
- QBrush dark(void)
- QBrush highlight(void)
- QBrush highlightedText(void)
- bool isBrushSet(QPalette::ColorGroup cg, QPalette::ColorRole cr)
- bool isCopyOf(QPalette p)
- bool isEqual(QPalette::ColorGroup cg1, QPalette::ColorGroup cg2)
- QBrush light(void)
- QBrush link(void)
- QBrush linkVisited(void)
- QBrush mid(void)
- QBrush midlight(void)
- QBrush placeholderText(void)
- void setBrush(QPalette::ColorRole role, QBrush brush)
- void setBrush_2(QPalette::ColorGroup group, QPalette::ColorRole role, QBrush brush)
- void setColor(QPalette::ColorRole role, QColor color)
- void setColor_2(QPalette::ColorGroup group, QPalette::ColorRole role, QColor color)
- void setCurrentColorGroup(QPalette::ColorGroup cg)
- QBrush shadow(void)
- QBrush text(void)
- QBrush toolTipBase(void)
- QBrush toolTipText(void)
- QBrush window(void)
- QBrush windowText(void)

# QPen Class

C++ Reference : http://doc.qt.io/qt-5/qpen.html

Parameters : void

- QBrush brush(void)
- int capStyle(void)
- QColor color(void)
- double dashOffset(void)
- bool isCosmetic(void)
- bool isSolid(void)
- int joinStyle(void)
- double miterLimit(void)
- void setBrush(QBrush)
- void setCapStyle(Qt::PenCapStyle style)
- void setColor(QColor)
- void setCosmetic(bool cosmetic)
- void setDashOffset(double offset)
- void setJoinStyle(Qt::PenJoinStyle style)
- void setMiterLimit(double limit)
- void setStyle(Qt::PenStyle style)
- void setWidth(int width)
- void setWidthF(double width)
- int style(void)
- void swap(QPen)
- int width(void)
- double widthF(void)

# QPerVertexColorMaterial Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qpervertexcolormaterial.html

Parameters : Qt3DCore::QNode *

# QPercentBarSeries Class

C++ Reference : http://doc.qt.io/qt-5/qpercentbarseries.html

Parameters : QObject *

Parent Class : QAbstractBarSeries

- QAbstractSeries::SeriesType type(void)

# QPhongMaterial Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qphongmaterial.html

Parameters : Qt3DCore::QNode *

- QColor ambient(void)
- QColor diffuse(void)
- float shininess(void)
- QColor specular(void)
- void setAmbient(QColor ambient)
- void setDiffuse(QColor diffuse)
- void setShininess(float shininess)
- void setSpecular(QColor specular)

# QPicture Class

C++ Reference : http://doc.qt.io/qt-5/qpicture.html

Parameters : void

- QRect boundingRect(void)
- const char *data(void)
- bool isNull(void)
- bool load(QString, const char *format) # In RingQt use : bool loadfile(QString, const char *format)
- bool play(QPainter *painter)
- bool save(QString , const char *format)
- void setBoundingRect(QRect)
- int size(void)
- void swap(QPicture)

# QPieLegendMarker Class

C++ Reference : http://doc.qt.io/qt-5/qpielegendmarker.html

Parent Class : QLegendMarker

- QPieSlice * slice(void)

# QPieSeries Class

C++ Reference : http://doc.qt.io/qt-5/qpieseries.html

Parameters : QObject *

Parent Class : QAbstractSeries

- bool append(QPieSlice *slice)
- bool append_2(QList<QPieSlice *> slices)
- QPieSlice * append_3(QString label, qreal value)
- void clear(void)
- int count(void)
- qreal holeSize(void)
- qreal horizontalPosition(void)
- bool insert(int index, QPieSlice *slice)
- bool isEmpty(void)
- qreal pieEndAngle(void)
- qreal pieSize(void)
- qreal pieStartAngle(void)
- bool remove(QPieSlice *slice)
- void setHoleSize(qreal holeSize)
- void setHorizontalPosition(qreal relativePosition)
- void setLabelsPosition(QPieSlice::LabelPosition position)
- void setLabelsVisible(bool visible)
- void setPieEndAngle(qreal angle)
- void setPieSize(qreal relativeSize)
- void setPieStartAngle(qreal startAngle)
- void setVerticalPosition(qreal relativePosition)
- QList<QPieSlice *> slices(void)
- qreal sum(void)
- bool take(QPieSlice *slice)
- qreal verticalPosition(void)
- void setaddedEvent(const char *)
- void setclickedEvent(const char *)
- void setcountChangedEvent(const char *)
- void setdoubleClickedEvent(const char *)
- void sethoveredEvent(const char *)
- void setpressedEvent(const char *)
- void setreleasedEvent(const char *)
- void setremovedEvent(const char *)
- void setsumChangedEvent(const char *)
- const char *getaddedEvent(void)
- const char *getclickedEvent(void)
- const char *getcountChangedEvent(void)
- const char *getdoubleClickedEvent(void)
- const char *gethoveredEvent(void)
- const char *getpressedEvent(void)
- const char *getreleasedEvent(void)
- const char *getremovedEvent(void)
- const char *getsumChangedEvent(void)

# QPieSlice Class

C++ Reference : http://doc.qt.io/qt-5/qpieslice.html

Parameters : QObject *

Parent Class : QObject

- qreal angleSpan(void)
- QColor borderColor(void)
- int borderWidth(void)
- QBrush brush(void)
- QColor color(void)
- qreal explodeDistanceFactor(void)
- bool isExploded(void)
- bool isLabelVisible(void)
- QString label(void)
- qreal labelArmLengthFactor(void)
- QBrush labelBrush(void)
- QColor labelColor(void)
- QFont labelFont(void)
- QPieSlice::LabelPosition labelPosition(void)
- QPen pen(void)
- qreal percentage(void)
- QPieSeries * series(void)
- void setBorderColor(QColor color)
- void setBorderWidth(int width)
- void setBrush(QBrush brush)
- void setColor(QColor color)
- void setExplodeDistanceFactor(qreal factor)
- void setExploded(bool exploded)
- void setLabel(QString label)
- void setLabelArmLengthFactor(qreal factor)
- void setLabelBrush(QBrush brush)
- void setLabelColor(QColor color)
- void setLabelFont(QFont font)
- void setLabelPosition(QPieSlice::LabelPosition position)
- void setLabelVisible(bool visible)
- void setPen(QPen pen)
- void setValue(qreal value)
- qreal startAngle(void)
- qreal value(void)
- void setangleSpanChangedEvent(const char *)
- void setborderColorChangedEvent(const char *)
- void setborderWidthChangedEvent(const char *)
- void setbrushChangedEvent(const char *)
- void setclickedEvent(const char *)
- void setcolorChangedEvent(const char *)
- void setdoubleClickedEvent(const char *)
- void sethoveredEvent(const char *)
- void setlabelBrushChangedEvent(const char *)
- void setlabelChangedEvent(const char *)
- void setlabelColorChangedEvent(const char *)
- void setlabelFontChangedEvent(const char *)
- void setlabelVisibleChangedEvent(const char *)
- void setpenChangedEvent(const char *)
- void setpercentageChangedEvent(const char *)
- void setpressedEvent(const char *)
- void setreleasedEvent(const char *)
- void setstartAngleChangedEvent(const char *)
- void setvalueChangedEvent(const char *)
- const char *getangleSpanChangedEvent(void)
- const char *getborderColorChangedEvent(void)
- const char *getborderWidthChangedEvent(void)
- const char *getbrushChangedEvent(void)
- const char *getclickedEvent(void)
- const char *getcolorChangedEvent(void)
- const char *getdoubleClickedEvent(void)
- const char *gethoveredEvent(void)
- const char *getlabelBrushChangedEvent(void)
- const char *getlabelChangedEvent(void)
- const char *getlabelColorChangedEvent(void)
- const char *getlabelFontChangedEvent(void)
- const char *getlabelVisibleChangedEvent(void)
- const char *getpenChangedEvent(void)
- const char *getpercentageChangedEvent(void)
- const char *getpressedEvent(void)
- const char *getreleasedEvent(void)
- const char *getstartAngleChangedEvent(void)
- const char *getvalueChangedEvent(void)

# QPixmap Class

C++ Reference : http://doc.qt.io/qt-5/qpixmap.html

Parameters : const char *

- QPixmap transformed(QTransform transform, Qt::TransformationMode mode)
- QPixmap copy(int x, int y, int width, int height)
- QPixmap scaled(int width, int height, Qt::AspectRatioMode aspectRatioMode, Qt::TransformationMode transformMode)
- int width(void)
- int height(void)
- QBitmap createMaskFromColor(QColor , Qt::MaskMode)
- QBitmap mask(void)
- void setMask(QBitmap)
- void fill(QColor)
- QPixmap fromImage(QImage,Qt::ImageConversionFlags)
- bool load(QString, const char *, Qt::ImageConversionFlags )
- qint64 cacheKey(void)
- bool convertFromImage(QImage image, Qt::ImageConversionFlags flags)
- QPixmap copy_2(QRect rectangle)
- QBitmap createHeuristicMask(bool clipTight)
- int depth(void)
- void detach(void)
- qreal devicePixelRatio(void)
- bool hasAlpha(void)
- bool hasAlphaChannel(void)
- bool isNull(void)
- bool isQBitmap(void)
- bool loadFromData(uchar *data, uint len, char *format, Qt::ImageConversionFlags flags)
- bool loadFromData_2(QByteArray data, char *format, Qt::ImageConversionFlags flags)
- QRect rect(void)
- bool save(QString fileName, char *format, int quality)
- bool save_2(QIODevice *device, char *format, int quality)
- QPixmap scaled_2(QSize size, Qt::AspectRatioMode aspectRatioMode, Qt::TransformationMode transformMode)
- QPixmap scaledToHeight(int height, Qt::TransformationMode mode)
- QPixmap scaledToWidth(int width, Qt::TransformationMode mode)
- void scroll(int dx, int dy, int x, int y, int width, int height, QRegion *exposed)
- void scroll_2(int dx, int dy, QRect rect, QRegion *exposed)
- void setDevicePixelRatio(qreal scaleFactor)
- QSize size(void)
- void swap(QPixmap other)
- QImage toImage(void)
- QPixmap transformed_2(QTransform matrix, Qt::TransformationMode mode)
- int defaultDepth(void)
- QPixmap fromImage_2(QImage image, Qt::ImageConversionFlags flags)
- QPixmap fromImageReader(QImageReader *imageReader, Qt::ImageConversionFlags flags)
- QTransform trueMatrix(QTransform matrix, int width, int height)

# QPixmap2 Class

Parameters : int width, int height

Parent Class : QPixmap

# QPlainTextEdit Class

C++ Reference : http://doc.qt.io/qt-5/qplaintextedit.html

Parameters : QWidget *

Parent Class : QAbstractScrollArea

- void setTabStopDistance(qreal width)
- qreal tabStopDistance(void)
- QString anchorAt(QPoint pos)
- bool backgroundVisible(void)
- int blockCount(void)
- bool canPaste(void)
- bool centerOnScroll(void)
- QMenu * createStandardContextMenu(void)
- QTextCharFormat currentCharFormat(void)
- QTextCursor cursorForPosition(QPoint pos)
- QRect cursorRect(QTextCursor cursor)
- QRect cursorRect_2(void)
- int cursorWidth(void)
- QTextDocument * document(void)
- QString documentTitle(void)
- void ensureCursorVisible(void)
- QList<QTextEdit::ExtraSelection> extraSelections(void)
- bool find(QString exp, QTextDocument::FindFlags options)
- bool isReadOnly(void)
- bool isUndoRedoEnabled(void)
- QPlainTextEdit::LineWrapMode lineWrapMode(void)
- int maximumBlockCount(void)
- void mergeCurrentCharFormat(QTextCharFormat modifier)
- void moveCursor(QTextCursor::MoveOperation operation, QTextCursor::MoveMode mode)
- bool overwriteMode(void)
- QString placeholderText(void)
- void print(QPagedPaintDevice *printer)
- void setBackgroundVisible(bool visible)
- void setCenterOnScroll(bool enabled)
- void setCurrentCharFormat(QTextCharFormat format)
- void setCursorWidth(int width)
- void setDocument(QTextDocument *document)
- void setDocumentTitle(QString title)
- void setExtraSelections(QList<QTextEdit::ExtraSelection> selections)
- void setLineWrapMode(QPlainTextEdit::LineWrapMode mode)
- void setMaximumBlockCount(int maximum)
- void setOverwriteMode(bool overwrite)
- void setPlaceholderText(QString placeholderText)
- void setReadOnly(bool ro)
- void setTabChangesFocus(bool b)
- void setTextCursor(QTextCursor cursor)
- void setTextInteractionFlags(Qt::TextInteractionFlags flags)
- void setUndoRedoEnabled(bool enable)
- void setWordWrapMode(QTextOption::WrapMode policy)
- bool tabChangesFocus(void)
- QTextCursor textCursor(void)
- Qt::TextInteractionFlags textInteractionFlags(void)
- QString toPlainText(void)
- QTextOption::WrapMode wordWrapMode(void)
- void appendHtml(QString html)
- void appendPlainText(QString text)
- void centerCursor(void)
- void clear(void)
- void copy(void)
- void cut(void)
- void insertPlainText(QString text)
- void paste(void)
- void redo(void)
- void selectAll(void)
- void setPlainText(QString text)
- void undo(void)
- void zoomIn(int range)
- void zoomOut(int range)
- void setblockCountChangedEvent(const char *cStr)
- void setcopyAvailableEvent(const char *cStr)
- void setcursorPositionChangedEvent(const char *cStr)
- void setmodificationChangedEvent(const char *cStr)
- void setredoAvailableEvent(const char *cStr)
- void setselectionChangedEvent(const char *cStr)
- void settextChangedEvent(const char *cStr)
- void setundoAvailableEvent(const char *cStr)
- void setupdateRequestEvent(const char *cStr)
- const char *getblockCountChangedEvent(void)
- const char *getcopyAvailableEvent(void)
- const char *getcursorPositionChangedEvent(void)
- const char *getmodificationChangedEvent(void)
- const char *getredoAvailableEvent(void)
- const char *getselectionChangedEvent(void)
- const char *gettextChangedEvent(void)
- const char *getundoAvailableEvent(void)
- const char *getupdateRequestEvent(void)
- void cyanline(void)
- void setactivelinecolor(QColor)

# QPlaneMesh Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qplanemesh.html

Parameters : Qt3DCore::QNode *

- float height(void)
- QSize meshResolution(void)
- bool mirrored(void)
- float width(void)
- void setHeight(float height)
- void setMeshResolution(QSize resolution)
- void setMirrored(bool mirrored)
- void setWidth(float width)

# QPoint Class

C++ Reference : http://doc.qt.io/qt-5/qpoint.html

Parameters : void

- bool isNull(void)
- int manhattanLength(void)
- int rx(void)
- int ry(void)
- void setX(int x)
- void setY(int y)
- int x(void)
- int y(void)

# QPointF Class

C++ Reference : http://doc.qt.io/qt-5/qpointf.html

Parameters : void

- bool isNull(void)
- qreal manhattanLength(void)
- qreal rx(void)
- qreal ry(void)
- void setX(qreal x)
- void setY(qreal y)
- QPoint toPoint(void)
- qreal x(void)
- qreal y(void)

# QPointLight Class

C++ Reference : http://doc.qt.io/qt-5/qt3drender-qpointlight.html

Parameters : Qt3DCore::QNode *

- float constantAttenuation(void)
- float linearAttenuation(void)
- float quadraticAttenuation(void)
- void setConstantAttenuation(float value)
- void setLinearAttenuation(float value)
- void setQuadraticAttenuation(float value)
- void setColor(QColor)
- void setIntensity(float intensity)

# QPolarChart Class

C++ Reference : http://doc.qt.io/qt-5/qpolarchart.html

Parameters : QGraphicsItem *,Qt::WindowFlags

Parent Class : QChart

- void addAxis(QAbstractAxis *axis, QPolarChart::PolarOrientation polarOrientation)
- QList<QAbstractAxis *> axes(QPolarChart::PolarOrientations polarOrientation, QAbstractSeries *series )

# QPolygon Class

C++ Reference : http://doc.qt.io/qt-5/qpolygon.html

Parameters : void

- QRect boundingRect(void)
- bool containsPoint(QPoint point, Qt::FillRule fillRule)
- QPolygon intersected(QPolygon r)
- bool isEmpty(void)
- QPoint point(int index)
- void putPoints(int index, int nPoints, int firstx, int firsty)
- void setPoint(int index, int x, int y)
- int size(void)
- QPolygon subtracted(QPolygon r)
- void translate(int dx, int dy)
- void translate_2(QPoint offset)
- QPolygon translated(int dx, int dy)
- QPolygon translated_2(QPoint offset)
- QPolygon united(QPolygon r)
- void append(int x, int y)

# QPolygonF Class

C++ Reference : http://doc.qt.io/qt-5/qpolygonf.html

Parameters : void

- QRectF boundingRect(void)
- bool containsPoint(QPointF point, Qt::FillRule fillRule)
- QPolygonF intersected(QPolygonF r)
- bool isClosed(void)
- bool isEmpty(void)
- int size(void)
- QPolygonF subtracted(QPolygonF r)
- QPolygon toPolygon(void)
- void translate(qreal dx, qreal dy)
- void translate_2(QPointF offset)
- QPolygonF translated(qreal dx, qreal dy)
- QPolygonF translated_2(QPointF offset)
- QPolygonF united(QPolygonF r)
- void append(qreal x, qreal y)

# QPrintDialog Class

C++ Reference : http://doc.qt.io/qt-5/qprintdialog.html

Parameters : QPrinter *,QWidget *

Parent Class : QAbstractPrintDialog

- void open(QObject * receiver, char * member)
- QAbstractPrintDialog::PrintDialogOptions options(void)
- QPrinter * printer(void)
- void setOption(QAbstractPrintDialog::PrintDialogOption option, bool on)
- void setOptions(QAbstractPrintDialog::PrintDialogOptions options)
- bool testOption(QAbstractPrintDialog::PrintDialogOption option)
- void setacceptedEvent(const char *)
- const char *getacceptedEvent(void)

# QPrintPreviewDialog Class

C++ Reference : http://doc.qt.io/qt-5/qprintpreviewdialog.html

Parameters : QPrinter *

Parent Class : QDialog

- void open(QObject * receiver, char * member)
- QPrinter * printer(void)
- void setpaintRequestedEvent(const char *)
- const char *getpaintRequestedEvent(void)

# QPrintPreviewWidget Class

C++ Reference : http://doc.qt.io/qt-5/qprintpreviewwidget.html

Parameters : QPrinter *

Parent Class : QWidget

- int currentPage(void)
- QPrinter::Orientation orientation(void)
- int pageCount(void)
- QPrintPreviewWidget::ViewMode viewMode(void)
- qreal zoomFactor(void)
- QPrintPreviewWidget::ZoomMode zoomMode(void)
- void fitInView(void)
- void fitToWidth(void)
- void print(void)
- void setAllPagesViewMode(void)
- void setCurrentPage(int page)
- void setFacingPagesViewMode(void)
- void setLandscapeOrientation(void)
- void setOrientation(QPrinter::Orientation orientation)
- void setPortraitOrientation(void)
- void setSinglePageViewMode(void)
- void setViewMode(QPrintPreviewWidget::ViewMode mode)
- void setZoomFactor(qreal factor)
- void setZoomMode(QPrintPreviewWidget::ZoomMode zoomMode)
- void updatePreview(void)
- void zoomIn(qreal factor)
- void zoomOut(qreal factor)
- void setpaintRequestedEvent(const char *)
- void setpreviewChangedEvent(const char *)
- const char *getpaintRequestedEvent(void)
- const char *getpreviewChangedEvent(void)

# QPrinter Class

C++ Reference : http://doc.qt.io/qt-5/qprinter.html

Parameters : QPrinter::PrinterMode

- bool abort(void)
- bool collateCopies(void)
- int colorMode(void)
- int copyCount(void)
- QString creator(void)
- QString docName(void)
- int duplex(void)
- bool fontEmbeddingEnabled(void)
- int fromPage(void)
- bool fullPage(void)
- bool isValid(void)
- QString outputFileName(void)
- int outputFormat(void)
- int pageOrder(void)
- QRectF pageRect(QPrinter::Unit unit)
- QRectF paperRect(QPrinter::Unit unit)
- int paperSource(void)
- QPrintEngine *printEngine(void)
- QString printProgram(void)
- int printRange(void)
- QString printerName(void)
- QString printerSelectionOption(void)
- int printerState(void)
- int resolution(void)
- void setCollateCopies(bool collate)
- void setColorMode(QPrinter::ColorMode newColorMode)
- void setCopyCount(int count)
- void setCreator(QString)
- void setDocName(QString)
- void setDuplex(QPrinter::DuplexMode duplex)
- void setFontEmbeddingEnabled(bool enable)
- void setFromTo(int from, int to)
- void setFullPage(bool fp)
- void setOutputFileName(QString)
- void setOutputFormat(QPrinter::OutputFormat format)
- void setPageOrder(QPrinter::PageOrder pageOrder)
- void setPaperSource(QPrinter::PaperSource source)
- void setPrintProgram(QString)
- void setPrintRange(QPrinter::PrintRange)
- void setPrinterName(QString)
- void setPrinterSelectionOption(QString)
- void setResolution(int dpi)
- bool supportsMultipleCopies(void)
- int toPage(void)
- bool newPage(void)
- QPaintEngine *paintEngine(void)
- void setPageSizeMM(QSizeF)

# QPrinterInfo Class

C++ Reference : http://doc.qt.io/qt-5/qprinterinfo.html

Parameters : void

- QString description(void)
- bool isDefault(void)
- bool isNull(void)
- QString location(void)
- QString makeAndModel(void)
- QString printerName(void)
- QPrinterInfo printerInfo(QString printerName

# QProcess Class

C++ Reference : http://doc.qt.io/qt-5/qprocess.html

Parameters : QObject *

Parent Class : QIODevice

- QStringList arguments(void)
- void closeReadChannel(QProcess::ProcessChannel channel)
- void closeWriteChannel(void)
- QProcess::ProcessError error(void)
- int exitCode(void)
- QProcess::ExitStatus exitStatus(void)
- QProcess::InputChannelMode inputChannelMode(void)
- QProcess::ProcessChannelMode processChannelMode(void)
- QProcessEnvironment processEnvironment(void)
- QString program(void)
- QByteArray readAllStandardError(void)
- QByteArray readAllStandardOutput(void)
- QProcess::ProcessChannel readChannel(void)
- void setArguments( QStringList  arguments)
- void setInputChannelMode(QProcess::InputChannelMode mode)
- void setProcessChannelMode(QProcess::ProcessChannelMode mode)
- void setProcessEnvironment( QProcessEnvironment  environment)
- void setProgram( QString  program)
- void setReadChannel(QProcess::ProcessChannel channel)
- void setStandardErrorFile( QString  fileName, QIODevice::OpenMode mode )
- void setStandardInputFile( QString  fileName)
- void setStandardOutputFile( QString  fileName, QIODevice::OpenMode mode )
- void setStandardOutputProcess(QProcess *destination)
- void setWorkingDirectory( QString  dir)
- void start( QString  program,  QStringList  arguments, QIODevice::OpenMode mode )
- void start_3(QIODevice::OpenMode mode )
- QProcess::ProcessState state(void)
- bool waitForFinished(int msecs )
- bool waitForStarted(int msecs )
- QString workingDirectory(void)
- void kill(void)
- void terminate(void)
- void setreadyReadStandardErrorEvent(const char *)
- void setreadyReadStandardOutputEvent(const char *)
- const char *getreadyReadStandardErrorEvent(void)
- const char *getreadyReadStandardOutputEvent(void)

# QProgressBar Class

C++ Reference : http://doc.qt.io/qt-5/qprogressbar.html

Parameters : QWidget *parent

Parent Class : QWidget

- int alignment(void)
- QString format(void)
- bool invertedAppearance(void)
- bool isTextVisible(void)
- int maximum(void)
- int minimum(void)
- int orientation(void)
- void resetFormat(void)
- void setAlignment(Qt::AlignmentFlag alignment)
- void setFormat(QString)
- void setInvertedAppearance(bool invert)
- void setTextDirection(QProgressBar::Direction textDirection)
- void setTextVisible(bool visible)
- QString text(void)
- int textDirection(void)
- int value(void)
- void reset(void)
- void setMaximum(int maximum)
- void setMinimum(int minimum)
- void setOrientation(Qt::Orientation)
- void setRange(int minimum, int maximum)
- void setValue(int value)
- void setvalueChangedEvent(const char *)
- const char *getvalueChangedEvent(void)

# QProgressDialog Class

C++ Reference : http://doc.qt.io/qt-5/qprogressdialog.html

Parameters : QWidget *parent

Parent Class : QDialog

- bool autoClose(void)
- bool autoReset(void)
- QString labelText(void)
- int maximum(void)
- int minimum(void)
- int minimumDuration(void)
- bool wasCanceled(void)
- int value(void)
- void open(void)
- void setAutoClose(bool close)
- void setAutoReset(bool reset)
- void setBar(QProgressBar *bar)
- void setCancelButton(QPushButton *cancelButton)
- void setCancelButtonText(QString cancelButtonText)
- void setLabel(QLabel *label)
- void setLabelText(QString text)
- void setMaximum(int maximum)
- void setMinimum(int minimum)
- void setMinimumDuration(int ms)
- void setRange(int minimum, int maximum)
- void setValue(int progress)
- void cancel(void)
- void reset(void)
- void setcanceledEvent(const char *)
- const char *getcanceledEvent(void)

# QPushButton Class

C++ Reference : http://doc.qt.io/qt-5/qpushbutton.html

Parameters : QWidget *

Parent Class : QAbstractButton

- void setText(const char *)
- void setClickEvent(const char *)
- void setIcon(QIcon)
- void setIconSize(QSize)
- const char *getClickEvent(void)

# QQmlEngine Class

C++ Reference : http://doc.qt.io/qt-5/qqmlengine.html

Parameters : QObject *

- void addImageProvider(QString providerId, QQmlImageProviderBase *provider)
- void addImportPath(QString path)
- void addPluginPath(QString path)
- QUrl baseUrl(void)
- void clearComponentCache(void)
- QQmlImageProviderBase *imageProvider(QString providerId)
- QStringList importPathList(void)
- bool importPlugin(QString filePath, QString uri, QList<QQmlError> *errors)
- QQmlIncubationController *incubationController(void)
- QNetworkAccessManager *networkAccessManager(void)
- QQmlNetworkAccessManagerFactory *networkAccessManagerFactory(void)
- QString offlineStorageDatabaseFilePath(QString databaseName)
- QString offlineStoragePath(void)
- bool outputWarningsToStandardError(void)
- QStringList pluginPathList(void)
- void removeImageProvider(QString providerId)
- QQmlContext *rootContext(void)
- void setBaseUrl(QUrl url)
- void setImportPathList(QStringList paths)
- void setIncubationController(QQmlIncubationController *controller)
- void setNetworkAccessManagerFactory(QQmlNetworkAccessManagerFactory *factory)
- void setOfflineStoragePath(QString dir)
- void setOutputWarningsToStandardError(bool enabled)
- void setPluginPathList(QStringList paths)
- void trimComponentCache(void)
- void retranslate(void)
- QQmlContext * contextForObject(QObject *object)
- QQmlEngine::ObjectOwnership objectOwnership(QObject *object)
- void setContextForObject(QObject *object, QQmlContext *context)
- void setObjectOwnership(QObject *object, QQmlEngine::ObjectOwnership ownership)

# QQmlError Class

C++ Reference : http://doc.qt.io/qt-5/qqmlerror.html

Parameters : void

- int column(void)
- QString description(void)
- bool isValid(void)
- int line(void)
- QObject * object(void)
- void setColumn(int column)
- void setDescription(QString description)
- void setLine(int line)
- void setObject(QObject *object)
- void setUrl(QUrl url)
- QString toString(void)
- QUrl url(void)

# QQuaternion Class

C++ Reference : http://doc.qt.io/qt-5/qquaternion.html

Parameters : float,float,float,float

- bool isIdentity(void)
- bool isNull(void)
- float length(void)
- float lengthSquared(void)
- void normalize(void)
- QQuaternion normalized(void)
- QVector3D rotatedVector(QVector3D vector)
- float scalar(void)
- void setScalar(float scalar)
- void setVector(QVector3D vector)
- void setVector_2(float x, float y, float z)
- void setX(float x)
- void setY(float y)
- void setZ(float z)
- QVector4D toVector4D(void)
- QVector3D vector(void)
- float x(void)
- float y(void)
- float z(void)
- QQuaternion fromAxisAndAngle(QVector3D axis, float angle)
- QQuaternion fromAxisAndAngle_2(float x, float y, float z, float angle)
- QQuaternion nlerp(QQuaternion q1, QQuaternion q2, float t)
- QQuaternion slerp(QQuaternion q1, QQuaternion q2, float t)

# QQuickView Class

C++ Reference : http://doc.qt.io/qt-5/qquickview.html

Parameters : void

Parent Class : QWindow

- QQmlEngine *engine(void)
- QList<QQmlError> errors(void)
- QSize initialSize(void)
- QQuickWidget::ResizeMode resizeMode(void)
- QQmlContext *rootContext(void)
- QQuickItem *rootObject(void)
- void setFormat(QSurfaceFormat format)
- void setResizeMode(QQuickView::ResizeMode)
- QUrl source(void)
- QQuickWidget::Status status(void)
- void setSource(QUrl url)

# QQuickWidget Class

C++ Reference : http://doc.qt.io/qt-5/qquickwidget.html

Parameters : QWidget *

Parent Class : QWidget

- QQmlEngine *engine(void)
- QList<QQmlError> errors(void)
- QSurfaceFormat format(void)
- QImage grabFramebuffer(void)
- QSize initialSize(void)
- QQuickWindow *quickWindow(void)
- QQuickWidget::ResizeMode resizeMode(void)
- QQmlContext *rootContext(void)
- QQuickItem *rootObject(void)
- void setClearColor(QColor color)
- void setFormat(QSurfaceFormat format)
- void setResizeMode(QQuickWidget::ResizeMode)
- QUrl source(void)
- QQuickWidget::Status status(void)
- void setSource(QUrl url)
- void setsceneGraphErrorEvent(const char *)
- void setstatusChangedEvent(const char *)
- const char *getsceneGraphErrorEvent(void)
- const char *getstatusChangedEvent(void)

# QRadialGradient Class

C++ Reference : http://doc.qt.io/qt-5/qradialgradient.html

Parameters : void

Parent Class : QGradient

- QPointF center(void)
- qreal centerRadius(void)
- qreal focalRadius(void)
- QPointF focalPoint(void)
- qreal radius(void)
- void setCenter(QPointF center)
- void setCenter_2(qreal x, qreal y)
- void setCenterRadius(qreal radius)
- void setFocalPoint(QPointF focalPoint)
- void setFocalPoint_2(qreal x, qreal y)
- void setFocalRadius(qreal radius)
- void setRadius(qreal radius)

# QRadioButton Class

C++ Reference : http://doc.qt.io/qt-5/qradiobutton.html

Parameters : QWidget *parent

Parent Class : QAbstractButton

- QSize minimumSizeHint(void)
- QSize sizeHint(void)
- void setclickedEvent(const char *)
- void setpressedEvent(const char *)
- void setreleasedEvent(const char *)
- void settoggledEvent(const char *)
- const char *getclickedEvent(void)
- const char *getpressedEvent(void)
- const char *getreleasedEvent(void)
- const char *gettoggledEvent(void)

# QRect Class

C++ Reference : http://doc.qt.io/qt-5/qrect.html

Parameters : void

- void adjust(int dx1, int dy1, int dx2, int dy2)
- QRect adjusted(int dx1, int dy1, int dx2, int dy2)
- int bottom(void)
- QPoint bottomLeft(void)
- QPoint bottomRight(void)
- QPoint center(void)
- bool contains(int x, int y, bool proper)
- void getCoords(int *x1, int *y1, int *x2, int *y2)
- void getRect(int *x, int *y, int *width, int *height)
- int  height(void)
- QRect intersected(QRect)
- bool intersects(QRect)
- bool isEmpty(void)
- bool isNull(void)
- bool isValid(void)
- int left(void)
- void moveBottom(int y)
- void moveBottomLeft(QPoint)
- void moveBottomRight(QPoint)
- void moveCenter(QPoint)
- void moveLeft(int x)
- void moveRight(int x)
- void moveTo(int x, int y)
- void moveTop(int y)
- void moveTopLeft(QPoint)
- void moveTopRight(QPoint)
- QRect normalized(void)
- int right(void)
- void setBottom(int y)
- void setBottomLeft(QPoint)
- void setBottomRight(QPoint)
- void setCoords(int x1, int y1, int x2, int y2)
- void setHeight(int height)
- void setLeft(int x)
- void setRect(int x, int y, int width, int height)
- void setRight(int x)
- void setSize(QSize)
- void setTop(int y)
- void setTopLeft(QPoint)
- void setTopRight(QPoint)
- void setWidth(int width)
- void setX(int x)
- void setY(int y)
- QSize size(void)
- int top(void)
- QPoint topLeft(void)
- QPoint topRight(void)
- void translate(int dx, int dy)
- QRect translated(int dx, int dy)
- QRect united(QRect)
- int width(void)
- int x(void)
- int y(void)

# QRectF Class

C++ Reference : http://doc.qt.io/qt-5/qrectf.html

Parameters : qreal,qreal,qreal,qreal

- void adjust(qreal dx1, qreal dy1, qreal dx2, qreal dy2)
- QRectF adjusted(qreal dx1, qreal dy1, qreal dx2, qreal dy2)
- qreal bottom(void)
- QPointF bottomLeft(void)
- QPointF bottomRight(void)
- QPointF center(void)
- bool contains(QPointF point)
- bool contains_2(QRectF rectangle)
- bool contains_3(qreal x, qreal y)
- void getCoords(qreal *x1, qreal *y1, qreal *x2, qreal *y2)
- void getRect(qreal *x, qreal *y, qreal *width, qreal *height)
- qreal height(void)
- QRectF intersected(QRectF rectangle)
- bool intersects(QRectF rectangle)
- bool isEmpty(void)
- bool isNull(void)
- bool isValid(void)
- qreal left(void)
- QRectF marginsAdded(QMarginsF margins)
- QRectF marginsRemoved(QMarginsF margins)
- void moveBottom(qreal y)
- void moveBottomLeft(QPointF position)
- void moveBottomRight(QPointF position)
- void moveCenter(QPointF position)
- void moveLeft(qreal x)
- void moveRight(qreal x)
- void moveTo(qreal x, qreal y)
- void moveTo_2(QPointF position)
- void moveTop(qreal y)
- void moveTopLeft(QPointF position)
- void moveTopRight(QPointF position)
- QRectF normalized(void)
- qreal right(void)
- void setBottom(qreal y)
- void setBottomLeft(QPointF position)
- void setBottomRight(QPointF position)
- void setCoords(qreal x1, qreal y1, qreal x2, qreal y2)
- void setHeight(qreal height)
- void setLeft(qreal x)
- void setRect(qreal x, qreal y, qreal width, qreal height)
- void setRight(qreal x)
- void setSize(QSizeF size)
- void setTop(qreal y)
- void setTopLeft(QPointF position)
- void setTopRight(QPointF position)
- void setWidth(qreal width)
- void setX(qreal x)
- void setY(qreal y)
- QSizeF size(void)
- QRect toAlignedRect(void)
- QRect toRect(void)
- qreal top(void)
- QPointF topLeft(void)
- QPointF topRight(void)
- void translate(qreal dx, qreal dy)
- void translate_2(QPointF offset)
- QRectF translated(qreal dx, qreal dy)
- QRectF translated_2(QPointF offset)
- QRectF transposed(void)
- QRectF united(QRectF rectangle)
- qreal width(void)
- qreal x(void)
- qreal y(void)

# QRegExp Class

C++ Reference : http://doc.qt.io/qt-5/qregexp.html

Parameters : void

- QString cap(int nth)
- int captureCount(void)
- QStringList capturedTexts(void)
- Qt::CaseSensitivity caseSensitivity(void)
- QString errorString(void)
- bool exactMatch(QString str)
- int indexIn(QString str, int offset, QRegExp::CaretMode caretMode)
- bool isEmpty(void)
- bool isMinimal(void)
- bool isValid(void)
- int lastIndexIn(QString str, int offset, QRegExp::CaretMode caretMode)
- int matchedLength(void)
- QString pattern(void)
- QRegExp::PatternSyntax patternSyntax(void)
- int pos(int nth)
- void setCaseSensitivity(Qt::CaseSensitivity cs)
- void setMinimal(bool minimal)
- void setPattern(QString pattern)
- void setPatternSyntax(QRegExp::PatternSyntax syntax)
- void swap(QRegExp other)

# QRegion Class

C++ Reference : http://doc.qt.io/qt-5/qregion.html

Parameters : void

- QRect boundingRect(void)
- bool contains(QPoint p)
- bool contains_2(QRect r)
- QRegion intersected(QRegion r)
- QRegion intersected_2(QRect rect)
- bool intersects(QRegion region)
- bool intersects_2(QRect rect)
- bool isEmpty(void)
- bool isNull(void)
- int rectCount(void)
- void setRects(QRect *rects, int number)
- QRegion subtracted(QRegion r)
- void swap(QRegion other)
- void translate(int dx, int dy)
- void translate_2(QPoint point)
- QRegion translated(int dx, int dy)
- QRegion translated_2(QPoint p)
- QRegion united(QRegion r)
- QRegion united_2(QRect rect)
- QRegion xored(QRegion r)

# QRegularExpression Class

C++ Reference : http://doc.qt.io/qt-5/qregularexpression.html

Parameters : void

- int captureCount(void)
- QString errorString(void)
- QRegularExpressionMatchIterator globalMatch(QString  subject, int offset, QRegularExpression::MatchType matchType, QRegularExpression::MatchOptions matchOptions)
- bool isValid(void)
- QRegularExpressionMatch match(QString  subject, int offset, QRegularExpression::MatchType matchType, QRegularExpression::MatchOptions matchOptions)
- QStringList namedCaptureGroups(void)
- QString pattern(void)
- int patternErrorOffset(void)
- QRegularExpression::PatternOptions patternOptions(void)
- void setPattern(QString  pattern)
- void setPatternOptions(QRegularExpression::PatternOptions options)
- void swap(QRegularExpression  other)

# QRegularExpressionMatch Class

C++ Reference : http://doc.qt.io/qt-5/qregularexpressionmatch.html

Parameters : void

- QString captured(int nth)
- QString captured_2(const QString  name)
- int capturedEnd(int nth)
- int capturedEnd_2(const QString  name)
- int capturedLength(int nth)
- int capturedLength_2(const QString  name)
- QStringRef capturedRef(int nth)
- QStringRef capturedRef_2(const QString  name)
- int capturedStart(int nth)
- int capturedStart_2(const QString  name)
- QStringList capturedTexts(void)
- bool hasMatch(void)
- bool hasPartialMatch(void)
- bool isValid(void)
- int lastCapturedIndex(void)
- QRegularExpression::MatchOptions matchOptions(void)
- QRegularExpression::MatchType matchType(void)
- QRegularExpression regularExpression(void)
- void swap(QRegularExpressionMatch  other)

# QRegularExpressionMatchIterator Class

C++ Reference : http://doc.qt.io/qt-5/qregularexpressionmatchiterator.html

Parameters : void

- bool hasNext(void)
- bool isValid(void)
- QRegularExpression::MatchOptions matchOptions(void)
- QRegularExpression::MatchType matchType(void)
- QRegularExpressionMatch next(void) # In RingQt use : QRegularExpressionMatch nextitem(void)
- QRegularExpressionMatch peekNext(void)
- QRegularExpression regularExpression(void)
- void swap(QRegularExpressionMatchIterator other)

# QRegularExpressionValidator Class

C++ Reference : http://doc.qt.io/qt-5/qregularexpressionvalidator.html

Parameters : QObject *

Parent Class : QValidator

- QRegularExpression regularExpression(void)
- void setRegularExpression(QRegularExpression re)

# QRenderAspect Class

C++ Reference : http://doc.qt.io/qt-5/qt3drender-qrenderaspect.html

Parameters : QObject *

# QRenderPass Class

C++ Reference : http://doc.qt.io/qt-5/qt3drender-qrenderpass.html

Parameters : Qt3DCore::QNode *

- void addFilterKey(Qt3DRender::QFilterKey *filterKey)
- void addParameter(Qt3DRender::QParameter *parameter)
- void addRenderState(Qt3DRender::QRenderState *state)
- QVector<Qt3DRender::QFilterKey *> filterKeys(void)
- QVector<Qt3DRender::QParameter *> parameters(void)
- void removeFilterKey(Qt3DRender::QFilterKey *filterKey)
- void removeParameter(Qt3DRender::QParameter *parameter)
- void removeRenderState(Qt3DRender::QRenderState *state)
- QVector<Qt3DRender::QRenderState *> renderStates(void)
- Qt3DRender::QShaderProgram * shaderProgram(void)
- void setShaderProgram(Qt3DRender::QShaderProgram *shaderProgram)

# QRubberBand Class

C++ Reference : http://doc.qt.io/qt-5/qrubberband.html

Parameters : QRubberBand::Shape, QWidget *parent

Parent Class : QWidget

- void move(int x, int y)
- void move_2(QPoint p)
- void resize(int width, int height)
- void resize_2(QSize size)
- void setGeometry(QRect rect)
- void setGeometry_2(int x, int y, int width, int height)
- QRubberBand::Shape shape(void)

# QSaveFile Class

C++ Reference : http://doc.qt.io/qt-5/qsavefile.html

Parameters : QString name

Parent Class : QFileDevice

- void cancelWriting(void)
- bool commit(void)
- bool directWriteFallback(void)
- QString fileName(void)
- void setDirectWriteFallback(bool enabled)
- void setFileName(QString name)
- bool open(QIODevice::OpenMode mode)

# QScatterSeries Class

C++ Reference : http://doc.qt.io/qt-5/qscatterseries.html

Parameters : QObject *

Parent Class : QXYSeries

- QColor borderColor(void)
- QBrush brush(void)
- QScatterSeries::MarkerShape markerShape(void)
- qreal markerSize(void)
- void setBorderColor(QColor color)
- void setMarkerShape(QScatterSeries::MarkerShape shape)
- void setMarkerSize(qreal size)
- void setborderColorChangedEvent(const char *)
- void setcolorChangedEvent(const char *)
- void setmarkerShapeChangedEvent(const char *)
- void setmarkerSizeChangedEvent(const char *)
- const char *getborderColorChangedEvent(void)
- const char *getcolorChangedEvent(void)
- const char *getmarkerShapeChangedEvent(void)
- const char *getmarkerSizeChangedEvent(void)

# QSceneLoader Class

C++ Reference : http://doc.qt.io/qt-5/qt3drender-qsceneloader.html

Parameters : Qt3DCore::QNode *

Parent Class : QComponent

- Qt3DCore::QComponent * component(QString entityName, Qt3DRender::QSceneLoader::ComponentType componentType)
- Qt3DCore::QEntity * entity(QString entityName)
- QStringList entityNames(void)
- QUrl source(void)
- Qt3DRender::QSceneLoader::Status status(void)
- void setSource(QUrl arg)

# QScreen Class

C++ Reference : http://doc.qt.io/qt-5/qscreen.html

- int angleBetween(Qt::ScreenOrientation a, Qt::ScreenOrientation b)
- QRect availableGeometry(void)
- QSize availableSize(void)
- QRect availableVirtualGeometry(void)
- QSize availableVirtualSize(void)
- int depth(void)
- qreal devicePixelRatio(void)
- QRect geometry(void)
- QPixmap grabWindow(int window, int x, int y, int width, int height)
- QPixmap grabWindow_2(int window)
- QPlatformScreen * handle(void)
- bool isLandscape(Qt::ScreenOrientation o)
- bool isPortrait(Qt::ScreenOrientation o)
- qreal logicalDotsPerInch(void)
- qreal logicalDotsPerInchX(void)
- qreal logicalDotsPerInchY(void)
- QRect mapBetween(Qt::ScreenOrientation a, Qt::ScreenOrientation b, QRect rect)
- QString name(void)
- Qt::ScreenOrientation nativeOrientation(void)
- Qt::ScreenOrientation orientation(void)
- Qt::ScreenOrientations orientationUpdateMask(void)
- qreal physicalDotsPerInch(void)
- qreal physicalDotsPerInchX(void)
- qreal physicalDotsPerInchY(void)
- QSizeF physicalSize(void)
- Qt::ScreenOrientation primaryOrientation(void)
- qreal refreshRate(void)
- void setOrientationUpdateMask(Qt::ScreenOrientations mask)
- QSize size(void)
- QTransform transformBetween(Qt::ScreenOrientation a, Qt::ScreenOrientation b, QRect target)

# QScrollArea Class

C++ Reference : http://doc.qt.io/qt-5/qscrollarea.html

Parameters : QWidget *parent

Parent Class : QAbstractScrollArea

- Qt::Alignment alignment(void)
- void ensureVisible(int x, int y, int xmargin , int ymargin )
- void ensureWidgetVisible(QWidget *childWidget, int xmargin , int ymargin )
- void setAlignment(Qt::Alignment)
- void setWidget(QWidget *widget)
- void setWidgetResizable(bool resizable)
- QWidget *takeWidget(void)
- QWidget *widget(void)
- bool widgetResizable(void)

# QScrollBar Class

C++ Reference : http://doc.qt.io/qt-5/qscrollbar.html

Parameters : QWidget *parent

Parent Class : QAbstractSlider

# QSerialPort Class

C++ Reference : http://doc.qt.io/qt-5/qserialport.html

Parameters : QObject *

Parent Class : QIODevice

- qint32 baudRate(QSerialPort::Directions directions)
- bool clear(QSerialPort::Directions directions)
- void clearError(void)
- QSerialPort::DataBits dataBits(void)
- QSerialPort::SerialPortError error(void)
- QSerialPort::FlowControl flowControl(void)
- bool flush(void)
- void *handle(void)
- bool isDataTerminalReady(void)
- bool isRequestToSend(void)
- QSerialPort::Parity parity(void)
- QSerialPort::PinoutSignals pinoutSignals(void)
- QString portName(void)
- qint64 readBufferSize(void)
- bool setBaudRate(qint32 baudRate, QSerialPort::Directions directions)
- bool setBreakEnabled(bool set)
- bool setDataBits(QSerialPort::DataBits dataBits)
- bool setDataTerminalReady(bool set)
- bool setFlowControl(QSerialPort::FlowControl flowControl)
- bool setParity(QSerialPort::Parity parity)
- void setPort(QSerialPortInfo serialPortInfo)
- void setPortName(QString name)
- void setReadBufferSize(qint64 size)
- bool setRequestToSend(bool set)
- bool setStopBits(QSerialPort::StopBits stopBits)
- QSerialPort::StopBits stopBits(void)
- void setbaudRateChangedEvent(const char *)
- void setbreakEnabledChangedEvent(const char *)
- void setdataBitsChangedEvent(const char *)
- void setdataTerminalReadyChangedEvent(const char *)
- void seterrorEvent(const char *)
- void setflowControlChangedEvent(const char *)
- void setparityChangedEvent(const char *)
- void setrequestToSendChangedEvent(const char *)
- void setstopBitsChangedEvent(const char *)
- const char *getbaudRateChangedEvent(void)
- const char *getbreakEnabledChangedEvent(void)
- const char *getdataBitsChangedEvent(void)
- const char *getdataTerminalReadyChangedEvent(void)
- const char *geterrorEvent(void)
- const char *getflowControlChangedEvent(void)
- const char *getparityChangedEvent(void)
- const char *getrequestToSendChangedEvent(void)
- const char *getstopBitsChangedEvent(void)

# QSerialPortInfo Class

C++ Reference : http://doc.qt.io/qt-5/qserialportinfo.html

Parameters : void

- QString description(void)
- bool hasProductIdentifier(void)
- bool hasVendorIdentifier(void)
- bool isNull(void)
- QString manufacturer(void)
- QString portName(void)
- quint16 productIdentifier(void)
- void swap(QSerialPortInfo other)
- QString systemLocation(void)
- quint16 vendorIdentifier(void)

# QSettings Class

C++ Reference : http://doc.qt.io/qt-5/qsettings.html

Parameters : QString, QString

Parent Class : QObject

- QStringList allKeys(void)
- QString applicationName(void)
- void beginGroup(QString prefix)
- int beginReadArray(QString prefix)
- void beginWriteArray(QString prefix, int size)
- QStringList childGroups(void)
- QStringList childKeys(void)
- void clear(void)
- bool contains(QString key)
- void endArray(void)
- void endGroup(void)
- bool fallbacksEnabled(void)
- QString fileName(void)
- QSettings::Format format(void)
- QString group(void)
- bool isWritable(void)
- QString organizationName(void)
- void remove(QString key)
- QSettings::Scope scope(void)
- void setArrayIndex(int i)
- void setFallbacksEnabled(bool b)
- void setValue(QString key, QVariant value)
- QSettings::Status status(void)
- void sync(void)
- QVariant value(QString key, QVariant defaultValue)

# QShortcut Class

C++ Reference : http://doc.qt.io/qt-5/qshortcut.html

Parameters : QWidget *parent

Parent Class : QWidget

- bool autoRepeat(void)
- Qt::ShortcutContext context(void)
- int id(void)
- bool isEnabled(void)
- QKeySequence key(void)
- void setAutoRepeat(bool on)
- void setContext(Qt::ShortcutContext context)
- void setEnabled(bool enable)
- void setKey(QKeySequence key)
- void setWhatsThis(QString text)
- QString whatsThis(void)
- void setactivatedEvent(const char *)
- void setactivatedAmbiguouslyEvent(const char *)
- const char *getactivatedEvent(void)
- const char *getactivatedAmbiguouslyEvent(void)

# QSize Class

C++ Reference : http://doc.qt.io/qt-5/qsize.html

Parameters : int width, int height

# QSizeF Class

C++ Reference : http://doc.qt.io/qt-5/qsizef.html

Parameters : void

- qreal height(void)
- bool isEmpty(void)
- bool isNull(void)
- bool isValid(void)
- qreal width(void)
- void setHeight(qreal height)
- void setWidth(qreal width)
- QSize toSize(void)
- void transpose(void)
- QSizeF transposed(void)
- QSizeF boundedTo(QSizeF otherSize)
- QSizeF expandedTo(QSizeF otherSize)
- void scale(qreal width, qreal height, Qt::AspectRatioMode mode)
- void scale_2(QSizeF size, Qt::AspectRatioMode mode)
- QSizeF scaled(qreal width, qreal height, Qt::AspectRatioMode mode)
- QSizeF scaled_2(QSizeF size, Qt::AspectRatioMode mode)

# QSizeGrip Class

C++ Reference : http://doc.qt.io/qt-5/qsizegrip.html

Parameters : QWidget *parent

Parent Class : QWidget

- void setVisible(bool visible)

# QSizePolicy Class

C++ Reference : http://doc.qt.io/qt-5/qsizepolicy.html

Parameters : void

- Qt::Orientations expandingDirections(void)
- bool hasHeightForWidth(void)
- bool hasWidthForHeight(void)
- QSizePolicy::Policy horizontalPolicy(void)
- int horizontalStretch(void)
- bool retainSizeWhenHidden(void)
- void setHeightForWidth(bool dependent)
- void setHorizontalPolicy(QSizePolicy::Policy policy)
- void setHorizontalStretch(int stretchFactor)
- void setRetainSizeWhenHidden(bool retainSize)
- void setVerticalPolicy(QSizePolicy::Policy policy)
- void setVerticalStretch(int stretchFactor)
- void setWidthForHeight(bool dependent)
- void transpose(void)
- QSizePolicy transposed(void)
- QSizePolicy::Policy verticalPolicy(void)
- int verticalStretch(void)

# QSkyboxEntity Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qskyboxentity.html

Parameters : Qt3DCore::QNode *

Parent Class : QEntity

- QString baseName(void)
- QString extension(void)
- bool isGammaCorrectEnabled(void)
- void setBaseName(QString baseName)
- void setExtension(QString extension)
- void setGammaCorrectEnabled(bool enabled)

# QSlider Class

C++ Reference : http://doc.qt.io/qt-5/qslider.html

Parameters : QWidget *parent

Parent Class : QAbstractSlider

- void setTickInterval(int ti)
- void setTickPosition(QSlider::TickPosition position)
- int tickInterval(void)
- int tickPosition(void)
- QSize minimumSizeHint(void)
- QSize sizeHint(void)
- void setactionTriggeredEvent(const char *)
- void setrangeChangedEvent(const char *)
- void setsliderMovedEvent(const char *)
- void setsliderPressedEvent(const char *)
- void setsliderReleasedEvent(const char *)
- void setvalueChangedEvent(const char *)
- const char *getactionTriggeredEvent(void)
- const char *getrangeChangedEvent(void)
- const char *getsliderMovedEvent(void)
- const char *getsliderPressedEvent(void)
- const char *getsliderReleasedEvent(void)
- const char *getvalueChangedEvent(void)

# QSortFilterProxyModel Class

C++ Reference : http://doc.qt.io/qt-5/qsortfilterproxymodel.html

Parameters : QObject *

Parent Class : QObject

- bool dynamicSortFilter(void)
- int filterCaseSensitivity(void)
- int filterKeyColumn(void)
- QRegularExpression filterRegularExpression(void)
- int filterRole(void)
- bool isRecursiveFilteringEnabled(void)
- bool isSortLocaleAware(void)
- QModelIndex mapFromSource(QModelIndex sourceIndex)
- QModelIndex mapToSource(QModelIndex proxyIndex)
- void setDynamicSortFilter(bool enable)
- void setFilterCaseSensitivity(Qt::CaseSensitivity cs)
- void setFilterKeyColumn(int column)
- void setFilterRole(int role)
- void setRecursiveFilteringEnabled(bool recursive)
- void setSortCaseSensitivity(Qt::CaseSensitivity cs)
- void setSortLocaleAware(bool on)
- void setSortRole(int role)
- int sortCaseSensitivity(void)
- int sortColumn(void)
- Qt::SortOrder sortOrder(void)
- int sortRole(void)
- QAbstractItemModel *sourceModel(void)
- void setSourceModel(QAbstractItemModel *sourceModel)
- void invalidate(void)
- void setFilterFixedString(QString pattern)
- void setFilterRegularExpression_2(QString pattern)
- void setFilterWildcard(QString pattern)
- void sort(int column, Qt::SortOrder order)
- int columnCount(QModelIndex parent)
- QVariant data(QModelIndex index, int role)
- Qt::ItemFlags flags(QModelIndex index)
- bool hasChildren(QModelIndex parent)
- QVariant headerData(int section, Qt::Orientation orientation, int role)
- QModelIndex index(int row, int column, QModelIndex parent)
- bool insertColumns(int column, int count, QModelIndex parent)
- bool insertRows(int row, int count, QModelIndex parent)
- QModelIndex parent(QModelIndex child)
- bool removeColumns(int column, int count, QModelIndex parent)
- bool removeRows(int row, int count, QModelIndex parent)
- int rowCount(QModelIndex parent)
- bool setData(QModelIndex index, QVariant value, int role)
- bool setHeaderData(int section, Qt::Orientation orientation, QVariant value, int role)
- QModelIndex sibling(int row, int column, QModelIndex index)

# QSoundEffect Class

C++ Reference : http://doc.qt.io/qt-5/qsoundeffect.html

Parameters : QObject *parent

Parent Class : QObject

- QString category(void)
- bool isLoaded(void)
- bool isMuted(void)
- bool isPlaying(void)
- int loopCount(void)
- int loopsRemaining(void)
- void setCategory(QString category)
- void setLoopCount(int loopCount)
- void setMuted(bool muted)
- void setSource(QUrl url)
- void setVolume(qreal volume)
- QUrl source(void)
- QSoundEffect::Status status(void)
- qreal volume(void)
- void play(void)
- void stop(void)
- void setcategoryChangedEvent(const char *)
- void setloadedChangedEvent(const char *)
- void setloopCountChangedEvent(const char *)
- void setloopsRemainingChangedEvent(const char *)
- void setmutedChangedEvent(const char *)
- void setplayingChangedEvent(const char *)
- void setsourceChangedEvent(const char *)
- void setstatusChangedEvent(const char *)
- void setvolumeChangedEvent(const char *)
- const char *getcategoryChangedEvent(void)
- const char *getloadedChangedEvent(void)
- const char *getloopCountChangedEvent(void)
- const char *getloopsRemainingChangedEvent(void)
- const char *getmutedChangedEvent(void)
- const char *getplayingChangedEvent(void)
- const char *getsourceChangedEvent(void)
- const char *getstatusChangedEvent(void)
- const char *getvolumeChangedEvent(void)

# QSpacerItem Class

C++ Reference : http://doc.qt.io/qt-5/qspaceritem.html

Parameters : int w, int h, QSizePolicy::Policy hPolicy, QSizePolicy::Policy vPolicy

Parent Class : QLayoutItem

- void changeSize(int w, int h, QSizePolicy::Policy hPolicy, QSizePolicy::Policy vPolicy)
- QSizePolicy sizePolicy(void)

# QSphereMesh Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qspheremesh.html

Parameters : Qt3DCore::QNode *

- bool generateTangents(void)
- float radius(void)
- int rings(void)
- int slices(void)
- void setGenerateTangents(bool gen)
- void setRadius(float radius)
- void setRings(int rings)
- void setSlices(int slices)

# QSpinBox Class

C++ Reference : http://doc.qt.io/qt-5/qspinbox.html

Parameters : QWidget *parent

Parent Class : QWidget

- QString cleanText(void)
- int displayIntegerBase(void)
- int maximum(void)
- int minimum(void)
- QString prefix(void)
- void setDisplayIntegerBase(int base)
- void setMaximum(int max)
- void setMinimum(int min)
- void setPrefix(QString)
- void setRange(int minimum, int maximum)
- void setSingleStep(int val)
- void setSuffix(QString)
- int singleStep(void)
- QString suffix(void)
- int value(void)
- void setValue(int val)
- void setvalueChangedEvent(const char *)
- const char *getvalueChangedEvent(void)

# QSplashScreen Class

C++ Reference : http://doc.qt.io/qt-5/qsplashscreen.html

Parameters : QPixmap

Parent Class : QWidget

- void  finish(QWidget *mainWin)
- QPixmap pixmap(void)
- void repaint(void)
- void setPixmap(QPixmap pixmap)
- void clearMessage(void)
- void showMessage(QString message, int alignment ,QColor color)

# QSplineSeries Class

C++ Reference : http://doc.qt.io/qt-5/qsplineseries.html

Parameters : QObject *

Parent Class : QLineSeries

- QAbstractSeries::SeriesType type(void)

# QSplitter Class

C++ Reference : http://doc.qt.io/qt-5/qsplitter.html

Parameters : QWidget *parent

Parent Class : QFrame

- void addWidget(QWidget *widget)
- bool childrenCollapsible(void)
- int count(void)
- void getRange(int index, int *min, int *max)
- QSplitterHandle * handle(int index)
- int handleWidth(void)
- int indexOf(QWidget *widget)
- void insertWidget(int index, QWidget *widget)
- bool isCollapsible(int index)
- bool opaqueResize(void)
- Qt::Orientation orientation(void)
- void refresh(void)
- bool restoreState( QByteArray  state)
- QByteArray saveState(void)
- void setChildrenCollapsible(bool)
- void setCollapsible(int index, bool collapse)
- void setHandleWidth(int)
- void setOpaqueResize(bool opaque )
- void setOrientation(Qt::Orientation)
- void setSizes( QList<int>  list)
- void setStretchFactor(int index, int stretch)
- QList<int> sizes(void)
- QWidget * widget(int index)

# QSplitterHandle Class

C++ Reference : http://doc.qt.io/qt-5/qsplitterhandle.html

Parameters : void

- bool opaqueResize(void)
- Qt::Orientation orientation(void)
- void setOrientation(Qt::Orientation orientation)
- QSplitter *splitter(void)

# QSqlDatabase Class

C++ Reference : http://doc.qt.io/qt-5/qsqldatabase.html

Parameters : void

- void close(void)
- bool commit(void)
- QString connectOptions(void)
- QString connectionName(void)
- QString databaseName(void)
- QSqlDriver *driver(void)
- QString driverName(void)
- QSqlQuery exec(QString)
- QString hostName(void)
- bool isOpen(void)
- bool isOpenError(void)
- bool isValid(void)
- QSqlError lastError(void)
- QSql::NumericalPrecisionPolicy numericalPrecisionPolicy(void)
- bool open(void)
- QString password(void)
- int port(void)
- QSqlIndex primaryIndex(QString)
- QSqlRecord record(QString)
- bool rollback(void)
- void setConnectOptions(QString)
- void setDatabaseName(QString)
- void setHostName(QString)
- void setNumericalPrecisionPolicy(QSql::NumericalPrecisionPolicy precisionPolicy)
- void setPassword(QString)
- void setPort(int port)
- void setUserName(QString)
- QStringList tables(QSql::TableType type)
- bool transaction(void)
- QString userName(void)
- QSqlDatabase addDatabase(QString)
- QSqlDatabase cloneDatabase(QSqlDatabase, QString)
- QStringList connectionNames(void)
- bool contains(QString)
- QSqlDatabase database(QString , bool)
- QStringList drivers(void)
- bool isDriverAvailable(QString)
- void registerSqlDriver(QString, QSqlDriverCreatorBase *)
- void removeDatabase(QString)

# QSqlDriver Class

C++ Reference : http://doc.qt.io/qt-5/qsqldriver.html

Parameters : void

- bool isOpenError(void)
- QSqlError lastError(void)
- QSql::NumericalPrecisionPolicy numericalPrecisionPolicy(void)
- void setNumericalPrecisionPolicy(QSql::NumericalPrecisionPolicy)

# QSqlDriverCreatorBase Class

C++ Reference : http://doc.qt.io/qt-5/qsqldrivercreatorbase.html

Parameters : void

# QSqlError Class

C++ Reference : http://doc.qt.io/qt-5/qsqlerror.html

Parameters : QString, QString, QSqlError::ErrorType

- QString databaseText(void)
- QString driverText(void)
- bool isValid(void)
- QString text(void)
- QSqlError::ErrorType type(void)

# QSqlField Class

C++ Reference : http://doc.qt.io/qt-5/qsqlfield.html

Parameters : QString,QVariant::Type

- void clear(void)
- QVariant defaultValue(void)
- bool isAutoValue(void)
- bool isGenerated(void)
- bool isNull(void)
- bool isReadOnly(void)
- bool isValid(void)
- int length(void)
- QString name(void)
- int precision(void)
- RequiredStatus requiredStatus(void)
- void setAutoValue(bool autoVal)
- void setDefaultValue(QVariant)
- void setGenerated(bool gen)
- void setLength(int fieldLength)
- void setName(QString)
- void setPrecision(int precision)
- void setReadOnly(bool readOnly)
- void setRequired(bool required)
- void setRequiredStatus(QSqlField::RequiredStatus required)
- void setType(QVariant::Type type)
- void setValue(QVariant)
- QVariant::Type type(void)
- QVariant value(void)

# QSqlIndex Class

C++ Reference : http://doc.qt.io/qt-5/qsqlindex.html

Parameters : QString, QString

Parent Class : QSqlRecord

- void append(QSqlField, bool)
- QString cursorName(void)
- bool isDescending(int i)
- QString name(void)
- void setCursorName(QString)
- void setDescending(int i, bool desc)
- void setName(QString)

# QSqlQuery Class

C++ Reference : http://doc.qt.io/qt-5/qsqlquery.html

Parameters : void

- void addBindValue(QVariant, QSql::ParamType paramType)
- int at(void)
- void bindValue(QString, QVariant, QSql::ParamType paramType)
- QVariant boundValue(QString)
- void clear(void)
- QSqlDriver * driver(void)
- bool exec(QString)
- bool exec_2(void)
- bool execBatch(QSqlQuery::BatchExecutionMode mode)
- QString executedQuery(void)
- void finish(void)
- bool first(void)
- bool isActive(void)
- bool isForwardOnly(void)
- bool isNull(int field)
- bool isSelect(void)
- bool isValid(void)
- bool last(void)
- QSqlError lastError(void)
- QVariant lastInsertId(void)
- QString lastQuery(void)
- bool next(void) # In RingQt use : bool movenext(void)
- bool nextResult(void)
- int numRowsAffected(void)
- QSql::NumericalPrecisionPolicy numericalPrecisionPolicy(void)
- bool prepare(QString)
- bool previous(void)
- QSqlRecord record(void)
- QSqlResult *result(void)
- bool seek(int index, bool relative)
- void setForwardOnly(bool forward)
- void setNumericalPrecisionPolicy(QSql::NumericalPrecisionPolicy precisionPolicy)
- int size(void)
- QVariant value(int index)

# QSqlQueryModel Class

C++ Reference : http://doc.qt.io/qt-5/qsqlquerymodel.html

Parameters : QObject *parent

Parent Class : QObject

- bool canFetchMore(QModelIndex parent)
- void clear(void)
- int columnCount(QModelIndex parent)
- QVariant data(QModelIndex item, int role)
- void fetchMore(QModelIndex parent)
- QVariant headerData(int section, Qt::Orientation orientation, int role)
- bool insertColumns(int column, int count, QModelIndex parent)
- QSqlError lastError(void)
- QSqlQuery query(void)
- QSqlRecord record(int row)
- QSqlRecord record_2(void)
- bool removeColumns(int column, int count, QModelIndex parent)
- int rowCount(QModelIndex parent)
- bool setHeaderData(int section, Qt::Orientation orientation, QVariant value, int role)
- void setQuery(QString query, QSqlDatabase db)
- void setQuery_2(QString query)

# QSqlRecord Class

C++ Reference : http://doc.qt.io/qt-5/qsqlrecord.html

Parameters : void

- void append(QSqlField)
- void clear(void)
- void clearValues(void)
- bool contains(QString)
- int count(void)
- QSqlField field(int index)
- QString fieldName(int index)
- int indexOf(QString)
- void insert(int pos, QSqlField)
- bool isEmpty(void)
- bool isGenerated(QString)
- bool isNull(QString)
- void remove(int pos)
- void replace(int pos, QSqlField)
- void setGenerated(QString, bool generated)
- void setNull(int index)
- void setValue(int index, QVariant)
- QVariant value(int index)

# QSqlRelation Class

C++ Reference : http://doc.qt.io/qt-5/qsqlrelation.html

Parameters : QString tableName, QString indexColumn, QString displayColumn

- QString displayColumn(void)
- QString indexColumn(void)
- bool isValid(void)
- QString tableName(void)

# QSqlRelationalDelegate Class

C++ Reference : http://doc.qt.io/qt-5/qsqlrelationaldelegate.html

Parameters : QObject *parent

Parent Class : QObject

- QWidget *createEditor(QWidget *parent, QStyleOptionViewItem option, QModelIndex index)
- void setModelData(QWidget *editor, QAbstractItemModel *model, QModelIndex index)

# QSqlRelationalTableModel Class

C++ Reference : http://doc.qt.io/qt-5/qsqlrelationaltablemodel.html

Parameters : QObject *parent, QSqlDatabase db

Parent Class : QObject

- QSqlDatabase database(void)
- QSqlIndex primaryKey(void)
- QVariant data(QModelIndex index, int role)
- bool setData(QModelIndex index, QVariant value, int role)
- void clear(void)
- int columnCount(QModelIndex parent)
- QVariant headerData(int section, Qt::Orientation orientation, int role)
- bool setHeaderData(int section, Qt::Orientation orientation, QVariant value, int role)
- QSqlError lastError(void)
- QSqlRecord record(int row)
- QSqlRecord record_2(void)
- int rowCount(QModelIndex parent)
- bool isDirty(QModelIndex index)
- bool isDirty_2(void)
- QSqlTableModel::EditStrategy editStrategy(void)
- int fieldIndex(QString fieldName)
- QString filter(void)
- bool insertRecord(int row, QSqlRecord record)
- bool insertRows(int row, int count, QModelIndex parent)
- bool removeRows(int row, int count, QModelIndex parent)
- void revertRow(int row)
- bool setRecord(int row, QSqlRecord values)
- void setEditStrategy(QSqlTableModel::EditStrategy strategy)
- void setFilter(QString filter)
- void setSort(int column, Qt::SortOrder order)
- void setTable(QString tableName)
- void sort(int column, Qt::SortOrder order)
- QString tableName(void)
- Qt::ItemFlags flags(QModelIndex index)
- bool removeColumns(int column, int count, QModelIndex parent)
- QSqlRelation relation(int column)
- QSqlTableModel *relationModel(int column)
- void setJoinMode(QSqlRelationalTableModel::JoinMode joinMode)
- void setRelation(int column, QSqlRelation relation)
- bool select(void)
- void revert(void)
- void revertAll(void)
- bool submit(void)
- bool submitAll(void)
- void setbeforeDeleteEvent(const char *)
- void setbeforeInsertEvent(const char *)
- void setbeforeUpdateEvent(const char *)
- void setprimeInsertEvent(const char *)
- const char *getbeforeDeleteEvent(void)
- const char *getbeforeInsertEvent(void)
- const char *getbeforeUpdateEvent(void)
- const char *getprimeInsertEvent(void)

# QSqlTableModel Class

C++ Reference : http://doc.qt.io/qt-5/qsqltablemodel.html

Parameters : QObject *parent, QSqlDatabase db

Parent Class : QObject

- QSqlDatabase database(void)
- QSqlIndex primaryKey(void)
- QVariant data(QModelIndex index, int role)
- bool setData(QModelIndex index, QVariant value, int role)
- void clear(void)
- int columnCount(QModelIndex parent)
- QVariant headerData(int section, Qt::Orientation orientation, int role)
- bool setHeaderData(int section, Qt::Orientation orientation, QVariant value, int role)
- QSqlError lastError(void)
- QSqlRecord record(int row)
- QSqlRecord record_2(void)
- int rowCount(QModelIndex parent)
- bool isDirty(QModelIndex index)
- bool isDirty_2(void)
- QSqlTableModel::EditStrategy editStrategy(void)
- int fieldIndex(QString fieldName)
- QString filter(void)
- bool insertRecord(int row, QSqlRecord record)
- bool insertRows(int row, int count, QModelIndex parent)
- bool removeRows(int row, int count, QModelIndex parent)
- void revertRow(int row)
- bool setRecord(int row, QSqlRecord values)
- void setEditStrategy(QSqlTableModel::EditStrategy strategy)
- void setFilter(QString filter)
- void setSort(int column, Qt::SortOrder order)
- void setTable(QString tableName)
- void sort(int column, Qt::SortOrder order)
- QString tableName(void)
- Qt::ItemFlags flags(QModelIndex index)
- bool removeColumns(int column, int count, QModelIndex parent)
- bool select(void)
- void revert(void)
- void revertAll(void)
- bool submit(void)
- bool submitAll(void)
- void setbeforeDeleteEvent(const char *)
- void setbeforeInsertEvent(const char *)
- void setbeforeUpdateEvent(const char *)
- void setprimeInsertEvent(const char *)
- const char *getbeforeDeleteEvent(void)
- const char *getbeforeInsertEvent(void)
- const char *getbeforeUpdateEvent(void)
- const char *getprimeInsertEvent(void)

# QSslCertificate Class

C++ Reference : http://doc.qt.io/qt-5/qsslcertificate.html

Parameters : void

- void clear(void)
- QByteArray digest(QCryptographicHash::Algorithm algorithm)
- QDateTime effectiveDate(void)
- QDateTime expiryDate(void)
- bool isBlacklisted(void)
- bool isNull(void)
- bool isSelfSigned(void)
- QStringList issuerInfo(QSslCertificate::SubjectInfo subject)
- QStringList issuerInfo_2(QByteArray attribute)
- QList<QByteArray> issuerInfoAttributes(void)
- QSslKey publicKey(void)
- QByteArray serialNumber(void)
- QStringList subjectInfo(QSslCertificate::SubjectInfo subject)
- QStringList subjectInfo_2(QByteArray attribute)
- QList<QByteArray> subjectInfoAttributes(void)
- void swap(QSslCertificate other)
- QByteArray toDer(void)
- QByteArray toPem(void)
- QString toText(void)
- QByteArray version(void)

# QSslConfiguration Class

C++ Reference : http://doc.qt.io/qt-5/qsslconfiguration.html

Parameters : void

- QList<QByteArray> allowedNextProtocols(void)
- QList<QSslCertificate> caCertificates(void)
- QList<QSslCipher> ciphers(void)
- bool isNull(void)
- QSslCertificate localCertificate(void)
- QList<QSslCertificate> localCertificateChain(void)
- QByteArray nextNegotiatedProtocol(void)
- QSslSocket::SslMode nextProtocolNegotiationStatus(void)
- bool ocspStaplingEnabled(void)
- QSslCertificate peerCertificate(void)
- QList<QSslCertificate> peerCertificateChain(void)
- int peerVerifyDepth(void)
- QSslSocket::PeerVerifyMode peerVerifyMode(void)
- QSslKey privateKey(void)
- QSsl::SslProtocol protocol(void)
- QSslCipher sessionCipher(void)
- QSsl::SslProtocol sessionProtocol(void)
- QByteArray sessionTicket(void)
- int sessionTicketLifeTimeHint(void)
- void setAllowedNextProtocols(QList<QByteArray> protocols)
- void setCaCertificates(QList<QSslCertificate> certificates)
- void setCiphers(QList<QSslCipher> ciphers)
- void setLocalCertificate(QSslCertificate certificate)
- void setLocalCertificateChain(QList<QSslCertificate> localChain)
- void setOcspStaplingEnabled(bool enabled)
- void setPeerVerifyDepth(int depth)
- void setPeerVerifyMode(QSslSocket::PeerVerifyMode mode)
- void setPrivateKey(QSslKey key)
- void setProtocol(QSsl::SslProtocol protocol)
- void setSessionTicket(QByteArray sessionTicket)
- void swap(QSslConfiguration other)

# QSslKey Class

C++ Reference : http://doc.qt.io/qt-5/qsslkey.html

Parameters : void

- QSsl::KeyAlgorithm algorithm(void)
- void clear(void)
- bool isNull(void)
- int length(void)
- QByteArray toDer(QByteArray passPhrase)
- QByteArray toPem(QByteArray passPhrase)
- QSsl::KeyType type(void)
- void swap(QSslKey other)

# QSslSocket Class

C++ Reference : http://doc.qt.io/qt-5/qsslsocket.html

Parameters : QObject *parent

Parent Class : QTcpSocket

- void abort(void)
- void connectToHostEncrypted(QString hostName, quint16 port, QIODevice::OpenMode mode, QAbstractSocket::NetworkLayerProtocol protocol)
- void connectToHostEncrypted_2(QString hostName, quint16 port, QString sslPeerName, QIODevice::OpenMode mode, QAbstractSocket::NetworkLayerProtocol protocol)
- qint64 encryptedBytesAvailable(void)
- qint64 encryptedBytesToWrite(void)
- void ignoreSslErrors(void)
- bool isEncrypted(void)
- QSslCertificate localCertificate(void)
- QSslSocket::SslMode mode(void)
- QSslCertificate peerCertificate(void)
- int peerVerifyDepth(void)
- QSslSocket::PeerVerifyMode peerVerifyMode(void)
- QString peerVerifyName(void)
- QSslKey privateKey(void)
- QSsl::SslProtocol protocol(void)
- QSslCipher sessionCipher(void)
- QSsl::SslProtocol sessionProtocol(void)
- void setLocalCertificate(QSslCertificate certificate)
- void setPeerVerifyDepth(int depth)
- void setPeerVerifyMode(QSslSocket::PeerVerifyMode mode)
- void setPeerVerifyName(QString hostName)
- void setPrivateKey(QSslKey key)
- void setProtocol(QSsl::SslProtocol protocol)
- void setSslConfiguration(QSslConfiguration configuration)
- QSslConfiguration sslConfiguration(void)
- QList<QSslError> sslHandshakeErrors(void)
- bool waitForEncrypted(int msecs)
- void startClientEncryption(void)
- void startServerEncryption(void)
- void setencryptedEvent(const char *)
- void setencryptedBytesWrittenEvent(const char *)
- void setmodeChangedEvent(const char *)
- void setpeerVerifyErrorEvent(const char *)
- void setsslErrorsEvent(const char *)
- const char *getencryptedEvent(void)
- const char *getencryptedBytesWrittenEvent(void)
- const char *getmodeChangedEvent(void)
- const char *getpeerVerifyErrorEvent(void)
- const char *getsslErrorsEvent(void)

# QStackedBarSeries Class

C++ Reference : http://doc.qt.io/qt-5/qstackedbarseries.html

Parameters : QObject *

Parent Class : QAbstractBarSeries

- QAbstractSeries::SeriesType type(void)

# QStackedLayout Class

C++ Reference : http://doc.qt.io/qt-5/qstackedlayout.html

Parameters : QWidget *

Parent Class : QLayout

- int addWidget(QWidget *widget)
- int count(void)
- int currentIndex(void)
- QWidget *currentWidget(void)
- int indexOf(QWidget *widget)
- int insertWidget(int index, QWidget *widget)
- void removeWidget(QWidget *widget)
- void setStackingMode(QStackedLayout::StackingMode stackingMode)
- QStackedLayout::StackingMode stackingMode(void)
- QWidget *widget(int index)
- void setCurrentIndex(int index)
- void setCurrentWidget(QWidget *widget)
- void setcurrentChangedEvent(const char *)
- void setwidgetRemovedEvent(const char *)
- const char *getcurrentChangedEvent(void)
- const char *getwidgetRemovedEvent(void)

# QStackedWidget Class

C++ Reference : http://doc.qt.io/qt-5/qstackedwidget.html

Parameters : QWidget *

Parent Class : QFrame

- int addWidget(QWidget *widget)
- int count(void)
- int currentIndex(void)
- QWidget * currentWidget(void)
- int indexOf(QWidget *widget)
- int insertWidget(int index, QWidget *widget)
- void removeWidget(QWidget *widget)
- QWidget * widget(int index)
- void setCurrentIndex(int index)
- void setCurrentWidget(QWidget *widget)
- void setcurrentChangedEvent(const char *)
- void setwidgetRemovedEvent(const char *)
- const char *getcurrentChangedEvent(void)
- const char *getwidgetRemovedEvent(void)

# QStandardItem Class

C++ Reference : http://doc.qt.io/qt-5/qstandarditem.html

Parameters : void

- QString accessibleDescription(void)
- QString accessibleText(void)
- void appendRow(QStandardItem *item)
- QBrush background(void)
- Qt::CheckState checkState(void)
- QStandardItem *child(int row, int column)
- int column(void)
- int columnCount(void)
- QVariant data(int role)
- Qt::ItemFlags flags(void)
- QFont font(void)
- QBrush foreground(void)
- bool hasChildren(void)
- QIcon icon(void)
- QModelIndex index(void)
- void insertRow(int row, QStandardItem *item)
- bool isAutoTristate(void)
- bool isCheckable(void)
- bool isDragEnabled(void)
- bool isDropEnabled(void)
- bool isEditable(void)
- bool isEnabled(void)
- bool isSelectable(void)
- bool isUserTristate(void)
- QStandardItemModel *model(void)
- QStandardItem *parent(void)
- void removeRow(int row)
- void removeRows(int row, int count)
- int row(void)
- int rowCount(void)
- void setAccessibleDescription(QString accessibleDescription)
- void setAccessibleText(QString accessibleText)
- void setAutoTristate(bool tristate)
- void setBackground(QBrush brush)
- void setCheckState(Qt::CheckState state)
- void setCheckable(bool checkable)
- void setChild(int row, int column, QStandardItem *item)
- void setChild_2(int row, QStandardItem *item)
- void setColumnCount(int columns)
- void setData(QVariant value, int role)
- void setDragEnabled(bool dragEnabled)
- void setDropEnabled(bool dropEnabled)
- void setEditable(bool editable)
- void setEnabled(bool enabled)
- void setFlags(Qt::ItemFlags flags)
- void setFont(QFont font)
- void setForeground(QBrush brush)
- void setIcon(QIcon icon)
- void setRowCount(int rows)
- void setSelectable(bool selectable)
- void setSizeHint(QSize size)
- void setStatusTip(QString statusTip)
- void setText(QString text)
- void setTextAlignment(Qt::Alignment alignment)
- void setToolTip(QString toolTip)
- void setUserTristate(bool tristate)
- void setWhatsThis(QString whatsThis)
- QSize sizeHint(void)
- QString statusTip(void)
- QString text(void)
- Qt::Alignment textAlignment(void)
- QString toolTip(void)
- int type(void)
- QString whatsThis(void)

# QStandardItemModel Class

C++ Reference : http://doc.qt.io/qt-5/qstandarditemmodel.html

Parameters : QObject *

Parent Class : QObject

- void appendRow(QStandardItem *item)
- void clear(void)
- int columnCount(QModelIndex parent)
- QVariant data(QModelIndex index, int role)
- Qt::ItemFlags flags(QModelIndex index)
- bool hasChildren(QModelIndex parent)
- QVariant headerData(int section, Qt::Orientation orientation, int role)
- QStandardItem *horizontalHeaderItem(int column)
- QModelIndex index(int row, int column, QModelIndex parent)
- QModelIndex indexFromItem(QStandardItem *item)
- bool insertColumns(int column, int count, QModelIndex parent)
- bool insertRows(int row, int count, QModelIndex parent)
- QStandardItem *invisibleRootItem(void)
- QStandardItem *item(int row, int column)
- QStandardItem *itemFromIndex(QModelIndex index)
- QModelIndex parent(QModelIndex child)
- bool removeColumns(int column, int count, QModelIndex parent)
- bool removeRows(int row, int count, QModelIndex parent)
- int rowCount(QModelIndex parent)
- void setColumnCount(int columns)
- bool setData(QModelIndex index, QVariant value, int role)
- bool setHeaderData(int section, Qt::Orientation orientation, QVariant value, int role)
- void setHorizontalHeaderItem(int column, QStandardItem *item)
- void setHorizontalHeaderLabels(QStringList labels)
- void setItem(int row, int column, QStandardItem *item)
- void setItem_2(int row, QStandardItem *item)
- void setRowCount(int rows)
- void setSortRole(int role)
- void setVerticalHeaderItem(int row, QStandardItem *item)
- void setVerticalHeaderLabels(QStringList labels)
- QModelIndex sibling(int row, int column, QModelIndex index)
- int sortRole(void)
- QStandardItem *takeHorizontalHeaderItem(int column)
- QStandardItem *takeItem(int row, int column)
- QStandardItem *takeVerticalHeaderItem(int row)
- QStandardItem *verticalHeaderItem(int row)
- QList<QStandardItem *> findItems(QString text, Qt::MatchFlag flags, int column)

# QStandardPaths Class

C++ Reference : http://doc.qt.io/qt-5/qstandardpaths.html

Parameters : void

- QString displayName(QStandardPaths::StandardLocation type)
- QString findExecutable(QString executableName, QStringList paths))
- QString locate(QStandardPaths::StandardLocation type, QString fileName, QStandardPaths::LocateOptions options)
- QStringList locateAll(QStandardPaths::StandardLocation type, QString fileName, QStandardPaths::LocateOptions options)
- void setTestModeEnabled(bool testMode)
- QStringList standardLocations(QStandardPaths::StandardLocation type)
- QString writableLocation(QStandardPaths::StandardLocation type)

# QStaticText Class

C++ Reference : http://doc.qt.io/qt-5/qstatictext.html

Parameters : void

- QStaticText::PerformanceHint performanceHint(void)
- void prepare(QTransform matrix, QFont font)
- void setPerformanceHint(QStaticText::PerformanceHint performanceHint)
- void setText(QString text)
- void setTextFormat(Qt::TextFormat textFormat)
- void setTextOption(QTextOption textOption)
- void setTextWidth(qreal textWidth)
- QSizeF size(void)
- QString text(void)
- Qt::TextFormat textFormat(void)
- QTextOption textOption(void)
- qreal textWidth(void)

# QStatusBar Class

C++ Reference : http://doc.qt.io/qt-5/qstatusbar.html

Parameters : QWidget *

Parent Class : QWidget

- void addPermanentWidget(QWidget * widget, int stretch)
- void addWidget(QWidget * widget, int stretch)
- QString currentMessage(void)
- int insertPermanentWidget(int index, QWidget * widget, int stretch)
- int insertWidget(int index, QWidget * widget, int stretch)
- bool isSizeGripEnabled(void)
- void removeWidget(QWidget *widget)
- void setSizeGripEnabled(bool)
- void clearMessage(void)
- void showMessage(QString , int timeout)

# QString2 Class

Parameters : void

- QStringList split( QString  sep, QString::SplitBehavior behavior , Qt::CaseSensitivity cs )
- QStringList split_2(QChar sep, QString::SplitBehavior behavior , Qt::CaseSensitivity cs )
- QStringList split_3( QRegExp  rx, QString::SplitBehavior behavior )
- QStringList split_4( QRegularExpression  re, QString::SplitBehavior behavior )
- QString append(QString  str)
- QString append_2(QChar ch)
- QByteArray toUtf8(void)
- QByteArray toLatin1(void)
- QByteArray toLocal8Bit(void)
- QChar * unicode(void)
- QString number(ulong n, int base)
- int count(void)
- QString left(int n)
- QString mid(int position, int n)
- QString right(int n)
- int compare(QString  other, Qt::CaseSensitivity cs )
- bool contains(QString  str, Qt::CaseSensitivity cs )
- int indexOf(QString str,int from,Qt::CaseSensitivity cs )
- int lastIndexOf(QString str,int from,Qt::CaseSensitivity cs )
- QString insert(int position,  QString  str)
- bool isRightToLeft(void)
- QString repeated(int times)
- QString replace(int position, int n,  QString  after)
- QString replace_2(QString before, QString after, Qt::CaseSensitivity)
- bool startsWith( QString  s, Qt::CaseSensitivity cs )
- bool endsWith( QString  s, Qt::CaseSensitivity cs )
- QString toHtmlEscaped(void)
- void clear(void)
- bool isNull(void)
- void resize(int size)
- QString fill(QChar ch, int size)
- int localeAwareCompare( QString other)
- QString leftJustified(int width, QChar fill, bool truncate)
- QString rightJustified(int width, QChar fill, bool truncate)
- QString section_1(QChar sep, int start, int end, QString::SectionFlags flags)
- QString section_2(QString sep, int start, int end, QString::SectionFlags flags)
- QString section_3(QRegExp reg, int start, int end, QString::SectionFlags flags)
- QString section_4(QRegularExpression re, int start, int end, QString::SectionFlags flags)
- QString simplified(void)
- QString toCaseFolded(void)
- QString trimmed(void)
- void truncate(int position)
- qsizetype length(void)
- qsizetype size(void)

# QStringList Class

C++ Reference : http://doc.qt.io/qt-5/qstringlist.html

Parameters : void

- QString join(QString)
- void sort(void)
- int removeDuplicates(void)
- QStringList filter(QString, Qt::CaseSensitivity)
- QStringList replaceInStrings(QString,QString, Qt::CaseSensitivity)
- void append(QString)
- QString at(int)
- QString back(void)
- void clear(void)
- bool contains(QString)
- int count(void)
- bool empty(void)
- bool endsWith(QString)
- QString first(void)
- QString front(void)
- int indexOf(QString, int)
- void insert(int, QString)
- bool isEmpty(void)
- QString last(void)
- int lastIndexOf(QString,int)
- int length(void)
- void move(int,int)
- void pop_back(void)
- void pop_front(void)
- void prepend(QString)
- void push_back(QString)
- void push_front(QString)
- int removeAll(QString)
- void removeAt(int)
- void removeFirst(void)
- void removeLast(void)
- bool removeOne(QString)
- void replace(int,QString)
- void reserve(int)
- int size(void)
- bool startsWith(QString)
- QString takeAt(int)
- QString takeFirst(void)
- QString takeLast(void)
- QString value(int)

# QStringRef Class

C++ Reference : http://doc.qt.io/qt-5/qstringref.html

Parameters : void

- QStringRef appendTo(QString * string)
- QChar at(int position)
- void clear(void)
- int compare_2(QStringRef other, Qt::CaseSensitivity cs)
- int compare_3(QLatin1String other, Qt::CaseSensitivity cs)
- QChar * constData(void)
- bool contains(QString str, Qt::CaseSensitivity cs)
- bool contains_2(QChar ch, Qt::CaseSensitivity cs)
- bool contains_3(QStringRef str, Qt::CaseSensitivity cs)
- bool contains_4(QLatin1String str, Qt::CaseSensitivity cs)
- int count(void)
- int count_2(QString str, Qt::CaseSensitivity cs)
- int count_3(QChar ch, Qt::CaseSensitivity cs)
- int count_4(QStringRef str, Qt::CaseSensitivity cs)
- QChar * data(void)
- bool endsWith(QString str, Qt::CaseSensitivity cs)
- bool endsWith_2(QChar ch, Qt::CaseSensitivity cs)
- bool endsWith_3(QLatin1String str, Qt::CaseSensitivity cs)
- bool endsWith_4(QStringRef str, Qt::CaseSensitivity cs)
- int indexOf(QString str, int from, Qt::CaseSensitivity cs)
- int indexOf_2(QLatin1String str, int from, Qt::CaseSensitivity cs)
- int indexOf_3(QChar ch, int from, Qt::CaseSensitivity cs)
- int indexOf_4(QStringRef str, int from, Qt::CaseSensitivity cs)
- bool isEmpty(void)
- bool isNull(void)
- int lastIndexOf(QString str, int from, Qt::CaseSensitivity cs)
- int lastIndexOf_2(QChar ch, int from, Qt::CaseSensitivity cs)
- int lastIndexOf_3(QLatin1String str, int from, Qt::CaseSensitivity cs)
- int lastIndexOf_4(QStringRef str, int from, Qt::CaseSensitivity cs)
- int length(void)
- int localeAwareCompare(QString other)
- int localeAwareCompare_2(QStringRef other)
- int position(void)
- int size(void)
- bool startsWith(QString str, Qt::CaseSensitivity cs)
- bool startsWith_2(QLatin1String str, Qt::CaseSensitivity cs)
- bool startsWith_3(QStringRef str, Qt::CaseSensitivity cs)
- bool startsWith_4(QChar ch, Qt::CaseSensitivity cs)
- QString * string(void)
- QByteArray toLatin1(void)
- QByteArray toLocal8Bit(void)
- QString toString(void)
- QVector<uint> toUcs4(void)
- QByteArray toUtf8(void)
- QChar * unicode(void)
- int compare_4(QStringRef s1, QString s2, Qt::CaseSensitivity cs)
- int compare_5(QStringRef s1, QStringRef s2, Qt::CaseSensitivity cs)
- int compare_6(QStringRef s1, QLatin1String s2, Qt::CaseSensitivity cs)
- int localeAwareCompare_3(QStringRef s1, QString s2)
- int localeAwareCompare_4(QStringRef s1, QStringRef s2)

# QStyle Class

C++ Reference : http://doc.qt.io/qt-5/qstyle.html

Parameters : void

Parent Class : QObject

- int combinedLayoutSpacing(QSizePolicy::ControlTypes controls1, QSizePolicy::ControlTypes controls2, Qt::Orientation orientation, QStyleOption *option, QWidget *widget)
- void drawComplexControl(QStyle::ComplexControl control, QStyleOptionComplex *option, QPainter *painter, QWidget *widget)
- void drawControl(QStyle::ControlElement element, QStyleOption *option, QPainter *painter, QWidget *widget)
- void drawItemPixmap(QPainter *painter, QRect rectangle, int alignment, QPixmap pixmap)
- void drawItemText(QPainter *painter, QRect rectangle, int alignment, QPalette palette, bool enabled, QString text, QPalette::ColorRole textRole)
- void drawPrimitive(QStyle::PrimitiveElement element, QStyleOption *option, QPainter *painter, QWidget *widget)
- QPixmap generatedIconPixmap(QIcon::Mode iconMode, QPixmap pixmap, QStyleOption *option)
- QStyle::SubControl hitTestComplexControl(QStyle::ComplexControl control, QStyleOptionComplex *option, QPoint position, QWidget *widget)
- QRect itemPixmapRect(QRect rectangle, int alignment, QPixmap pixmap)
- QRect itemTextRect(QFontMetrics metrics, QRect rectangle, int alignment, bool enabled, QString text)
- int layoutSpacing(QSizePolicy::ControlType control1, QSizePolicy::ControlType control2, Qt::Orientation orientation, QStyleOption *option, QWidget *widget)
- int pixelMetric(QStyle::PixelMetric metric)
- int pixelMetric_2(QStyle::PixelMetric metric, QStyleOption *option, QWidget *widget)
- void polish(QWidget *widget)
- void polish_2(QApplication *application)
- void polish_3(QPalette palette)
- QStyle * proxy(void)
- QSize sizeFromContents(QStyle::ContentsType type, QStyleOption *option, QSize contentsSize, QWidget *widget)
- QIcon standardIcon(QStyle::StandardPixmap standardIcon, QStyleOption *option, QWidget *widget)
- QPalette standardPalette(void)
- int styleHint(QStyle::StyleHint hint, QStyleOption *option, QWidget *widget, QStyleHintReturn *returnData)
- QRect subControlRect(QStyle::ComplexControl control, QStyleOptionComplex *option, QStyle::SubControl subControl, QWidget *widget)
- QRect subElementRect(QStyle::SubElement element, QStyleOption *option, QWidget *widget)
- void unpolish(QWidget *widget)
- void unpolish_2(QApplication *application)
- QRect alignedRect(Qt::LayoutDirection direction, Qt::Alignment alignment, QSize size, QRect rectangle)
- int sliderPositionFromValue(int min, int max, int logicalValue, int span, bool upsideDown)
- int sliderValueFromPosition(int min, int max, int position, int span, bool upsideDown)
- Qt::Alignment visualAlignment(Qt::LayoutDirection direction, Qt::Alignment alignment)
- QPoint visualPos(Qt::LayoutDirection direction, QRect boundingRectangle, QPoint logicalPosition)
- QRect visualRect(Qt::LayoutDirection direction, QRect boundingRectangle, QRect logicalRectangle)

# QStyleOptionGraphicsItem Class

C++ Reference : http://doc.qt.io/qt-5/qstyleoptiongraphicsitem.html

Parent Class : QStyleOption

Parameters : void

- qreal levelOfDetailFromTransform(QTransform worldTransform)

# QStyledItemDelegate Class

C++ Reference : http://doc.qt.io/qt-5/qstyleditemdelegate.html

Parameters : QObject *parent

Parent Class : QObject

- QString displayText(QVariant value, QLocale locale)
- QWidget *createEditor(QWidget *parent, QStyleOptionViewItem option, QModelIndex index)
- void setEditorData(QWidget *editor, QModelIndex index)
- void setModelData(QWidget *editor, QAbstractItemModel *model, QModelIndex index)
- void updateEditorGeometry(QWidget *editor, QStyleOptionViewItem option, QModelIndex index)

# QSurfaceFormat Class

C++ Reference : http://doc.qt.io/qt-5/qsurfaceformat.html

Parameters : void

- int alphaBufferSize(void)
- int blueBufferSize(void)
- int depthBufferSize(void)
- int greenBufferSize(void)
- bool hasAlpha(void)
- int majorVersion(void)
- int minorVersion(void)
- QSurfaceFormat::FormatOptions options(void)
- QSurfaceFormat::OpenGLContextProfile profile(void)
- int redBufferSize(void)
- QSurfaceFormat::RenderableType renderableType(void)
- int samples(void)
- void setAlphaBufferSize(int size)
- void setBlueBufferSize(int size)
- void setDepthBufferSize(int size)
- void setGreenBufferSize(int size)
- void setMajorVersion(int major)
- void setMinorVersion(int minor)
- void setOption(QSurfaceFormat::FormatOption option, bool on)
- void setOptions(QSurfaceFormat::FormatOptions options)
- void setProfile(QSurfaceFormat::OpenGLContextProfile profile)
- void setRedBufferSize(int size)
- void setRenderableType(QSurfaceFormat::RenderableType type)
- void setSamples(int numSamples)
- void setStencilBufferSize(int size)
- void setStereo(bool enable)
- void setSwapBehavior(QSurfaceFormat::SwapBehavior behavior)
- void setSwapInterval(int interval)
- void setVersion(int major, int minor)
- int stencilBufferSize(void)
- bool stereo(void)
- QSurfaceFormat::SwapBehavior swapBehavior(void)
- int swapInterval(void)
- bool testOption(QSurfaceFormat::FormatOption option)
- QSurfaceFormat defaultFormat(void)
- void setDefaultFormat(QSurfaceFormat format)

# QSystemTrayIcon Class

C++ Reference : http://doc.qt.io/qt-5/qsystemtrayicon.html

Parameters : void

- QMenu *contextMenu(void)
- QRect geometry(void)
- QIcon icon(void)
- bool isVisible(void)
- void setContextMenu(QMenu *menu)
- void setIcon(QIcon)
- void setToolTip(QString)
- QString toolTip(void)
- void hide(void)
- void setVisible(bool visible)
- void show(void)
- void showMessage(QString, QString, QSystemTrayIcon::MessageIcon, int millisecondsTimeoutHint)
- bool isSystemTrayAvailable(void)
- bool supportsMessages(void)

# QTabBar Class

C++ Reference : http://doc.qt.io/qt-5/qtabbar.html

Parameters : QWidget *

Parent Class : QWidget

- int addTab(QString text)
- int addTab_2(QIcon icon, QString text)
- int count(void)
- int currentIndex(void)
- bool documentMode(void)
- bool drawBase(void)
- Qt::TextElideMode elideMode(void)
- bool expanding(void)
- QSize iconSize(void)
- int insertTab(int index, QString text)
- int insertTab_2(int index, QIcon icon, QString text)
- bool isMovable(void)
- bool isTabEnabled(int index)
- void moveTab(int from, int to)
- void removeTab(int index)
- QTabBar::SelectionBehavior selectionBehaviorOnRemove(void)
- void setDocumentMode(bool set)
- void setDrawBase(bool drawTheBase)
- void setElideMode(Qt::TextElideMode)
- void setExpanding(bool enabled)
- void setIconSize(QSize size)
- void setMovable(bool movable)
- void setSelectionBehaviorOnRemove(QTabBar::SelectionBehavior behavior)
- void setShape(QTabBar::Shape shape)
- void setTabButton(int index, QTabBar::ButtonPosition position, QWidget * widget)
- void setTabData(int index, QVariant data)
- void setTabEnabled(int index, bool enabled)
- void setTabIcon(int index, QIcon icon)
- void setTabText(int index, QString text)
- void setTabTextColor(int index, QColor color)
- void setTabToolTip(int index, QString tip)
- void setTabWhatsThis(int index, QString text)
- void setTabsClosable(bool closable)
- void setUsesScrollButtons(bool useButtons)
- QTabBar::Shape shape(void)
- int tabAt(QPoint position)
- QWidget * tabButton(int index, QTabBar::ButtonPosition position)
- QVariant tabData(int index)
- QIcon tabIcon(int index)
- QRect tabRect(int index)
- QString tabText(int index)
- QColor tabTextColor(int index)
- QString tabToolTip(int index)
- QString tabWhatsThis(int index)
- bool tabsClosable(void)
- bool usesScrollButtons(void)
- void setCurrentIndex(int index)
- void setcurrentChangedEvent(const char *)
- void settabCloseRequestedEvent(const char *)
- void settabMovedEvent(const char *)
- const char *getcurrentChangedEvent(void)
- const char *gettabCloseRequestedEvent(void)
- const char *gettabMovedEvent(void)

# QTabWidget Class

C++ Reference : http://doc.qt.io/qt-5/qtabwidget.html

Parameters : QWidget *parent

Parent Class : QWidget

- QTabBar *tabBar(void)
- int addTab(QWidget *page, QString)
- void clear(void)
- QWidget *cornerWidget(Qt::Corner corner)
- int count(void)
- int currentIndex(void)
- QWidget *currentWidget(void)
- bool documentMode(void)
- int elideMode(void)
- QSize iconSize(void)
- int indexOf(QWidget *w)
- int insertTab(int index, QWidget *page,QString)
- bool isMovable(void)
- bool isTabEnabled(int index)
- void removeTab(int index)
- void setCornerWidget(QWidget *widget, Qt::Corner corner)
- void setDocumentMode(bool set)
- void setElideMode(Qt::TextElideMode)
- void setIconSize(QSize)
- void setMovable(bool movable)
- void setTabEnabled(int index, bool enable)
- void setTabIcon(int index, QIcon)
- void setTabText(int index,QString)
- void setTabToolTip(int index, QString)
- void setTabWhatsThis(int index, QString)
- void setTabsClosable(bool closeable)
- void setUsesScrollButtons(bool useButtons)
- QIcon tabIcon(int index)
- QString tabText(int index)
- QString tabToolTip(int index)
- QString tabWhatsThis(int index)
- bool tabsClosable(void)
- bool usesScrollButtons(void)
- QWidget *widget(int index)
- int heightForWidth(int width)
- QSize minimumSizeHint(void)
- QSize sizeHint(void)
- void setCurrentIndex(int index)
- void setCurrentWidget(QWidget *widget)
- void setcurrentChangedEvent(const char *)
- void settabCloseRequestedEvent(const char *)
- const char *getcurrentChangedEvent(void)
- const char *gettabCloseRequestedEvent(void)
- void geteventparameters(void)

# QTableView Class

C++ Reference : http://doc.qt.io/qt-5/qtableview.html

Parameters : QWidget *parent

Parent Class : QAbstractItemView

- void clearSpans(void)
- int columnAt(int x)
- int columnSpan(int row, int column)
- int columnViewportPosition(int column)
- int columnWidth(int column)
- Qt::PenStyle gridStyle(void)
- QHeaderView *horizontalHeader(void)
- bool isColumnHidden(int column)
- bool isCornerButtonEnabled(void)
- bool isRowHidden(int row)
- bool isSortingEnabled(void)
- int rowAt(int y)
- int rowHeight(int row)
- int rowSpan(int row, int column)
- int rowViewportPosition(int row)
- void setColumnHidden(int column, bool hide)
- void setColumnWidth(int column, int width)
- void setCornerButtonEnabled(bool enable)
- void setGridStyle(Qt::PenStyle style)
- void setHorizontalHeader(QHeaderView *header)
- void setRowHeight(int row, int height)
- void setRowHidden(int row, bool hide)
- void setSortingEnabled(bool enable)
- void setSpan(int row, int column, int rowSpanCount, int columnSpanCount)
- void setVerticalHeader(QHeaderView *header)
- void setWordWrap(bool on)
- bool showGrid(void)
- void sortByColumn(int column, Qt::SortOrder order)
- QHeaderView *verticalHeader(void)
- bool wordWrap(void)
- void hideColumn(int column)
- void hideRow(int row)
- void resizeColumnToContents(int column)
- void resizeColumnsToContents(void)
- void resizeRowToContents(int row)
- void resizeRowsToContents(void)
- void selectColumn(int column)
- void selectRow(int row)
- void setShowGrid(bool show)
- void showColumn(int column)
- void showRow(int row)

# QTableWidget Class

C++ Reference : http://doc.qt.io/qt-5/qtablewidget.html

Parameters : QWidget *parent

Parent Class : QTableView

- QWidget *cellWidget(int row, int column)
- void closePersistentEditor(QTableWidgetItem *item)
- int column(QTableWidgetItem *item)
- int columnCount(void)
- int currentColumn(void)
- QTableWidgetItem *currentItem(void)
- int currentRow(void)
- void editItem(QTableWidgetItem *item)
- QTableWidgetItem *horizontalHeaderItem(int column)
- QTableWidgetItem *item(int row, int column)
- QTableWidgetItem *itemAt(int ax, int ay)
- QTableWidgetItem *itemPrototype(void)
- void openPersistentEditor(QTableWidgetItem *item)
- void removeCellWidget(int row, int column)
- int row(const QTableWidgetItem *item)
- int rowCount(void)
- QList<QTableWidgetItem *> selectedItems(void)
- QList<QTableWidgetSelectionRange> selectedRanges(void)
- void setCellWidget(int row, int column, QWidget *widget)
- void setColumnCount(int columns)
- void setCurrentCell(int row, int column)
- void setCurrentItem(QTableWidgetItem * item)
- void setHorizontalHeaderItem(int column, QTableWidgetItem *item)
- void setHorizontalHeaderLabels(QStringList)
- void setItem(int row, int column, QTableWidgetItem *item)
- void setItemPrototype(QTableWidgetItem *item)
- void setRowCount(int rows)
- void setVerticalHeaderItem(int row, QTableWidgetItem *item)
- void sortItems(int column, Qt::SortOrder order)
- QTableWidgetItem *takeHorizontalHeaderItem(int column)
- QTableWidgetItem *takeItem(int row, int column)
- QTableWidgetItem *takeVerticalHeaderItem(int row)
- QTableWidgetItem *verticalHeaderItem(int row)
- int visualColumn(int logicalColumn)
- QRect visualItemRect(QTableWidgetItem *)
- int visualRow(int logicalRow)
- void clear(void)
- void clearContents(void)
- void insertColumn(int column)
- void insertRow(int row)
- void removeColumn(int column)
- void removeRow(int row)
- void scrollToItem(QTableWidgetItem *item, QAbstractItemView::ScrollHint hint)
- void setcellActivatedEvent(const char *)
- void setcellChangedEvent(const char *)
- void setcellClickedEvent(const char *)
- void setcellDoubleClickedEvent(const char *)
- void setcellEnteredEvent(const char *)
- void setcellPressedEvent(const char *)
- void setcurrentCellChangedEvent(const char *)
- void setcurrentItemChangedEvent(const char *)
- void setitemActivatedEvent(const char *)
- void setitemChangedEvent(const char *)
- void setitemClickedEvent(const char *)
- void setitemDoubleClickedEvent(const char *)
- void setitemEnteredEvent(const char *)
- void setitemPressedEvent(const char *)
- void setitemSelectionChangedEvent(const char *)
- const char *getcellActivatedEvent(void)
- const char *getcellChangedEvent(void)
- const char *getcellClickedEvent(void)
- const char *getcellDoubleClickedEvent(void)
- const char *getcellEnteredEvent(void)
- const char *getcellPressedEvent(void)
- const char *getcurrentCellChangedEvent(void)
- const char *getcurrentItemChangedEvent(void)
- const char *getitemActivatedEvent(void)
- const char *getitemChangedEvent(void)
- const char *getitemClickedEvent(void)
- const char *getitemDoubleClickedEvent(void)
- const char *getitemEnteredEvent(void)
- const char *getitemPressedEvent(void)
- const char *getitemSelectionChangedEvent(void)

# QTableWidgetItem Class

C++ Reference : http://doc.qt.io/qt-5/qtablewidgetitem.html

Parameters : QString

- QBrush background(void)
- int checkState(void)
- QTableWidgetItem *clone(void)
- int column(void)
- QVariant data(int role)
- int flags(void)
- QFont font(void)
- QBrush foreground(void)
- QIcon icon(void)
- bool isSelected(void)
- void read(QDataStream)
- int row(void)
- void setBackground(QBrush)
- void setCheckState(Qt::CheckState state)
- void setData(int role, QVariant)
- void setFlags(Qt::ItemFlag flags)
- void setFont(QFont)
- void setForeground(QBrush)
- void setIcon(QIcon)
- void setSelected(bool select)
- void setSizeHint(QSize)
- void setStatusTip(QString)
- void setText(QString)
- void setTextAlignment(int alignment)
- void setToolTip(QString)
- void setWhatsThis(QString)
- QSize sizeHint(void)
- QString statusTip(void)
- QTableWidget *tableWidget(void)
- QString text(void)
- int textAlignment(void)
- QString toolTip(void)
- int type(void)
- QString whatsThis(void)
- void write(QDataStream)

# QTcpServer Class

C++ Reference : http://doc.qt.io/qt-5/qtcpserver.html

Parameters : QWidget *

- void close(void)
- QString errorString(void)
- bool hasPendingConnections(void)
- bool isListening(void)
- bool listen(QHostAddress, int port)
- int maxPendingConnections(void)
- QTcpSocket *nextPendingConnection(void)
- void pauseAccepting(void)
- QNetworkProxy proxy(void)
- void resumeAccepting(void)
- QHostAddress serverAddress(void)
- int serverError(void)
- int serverPort(void)
- void setMaxPendingConnections(int numConnections)
- void setProxy(QNetworkProxy)
- bool setSocketDescriptor(qintptr socketDescriptor)
- int *socketDescriptor(void)
- bool waitForNewConnection(int msec, bool *timedOut)
- void setacceptErrorEvent(const char *)
- void setnewConnectionEvent(const char *)
- const char *getacceptErrorEvent(void)
- const char *getnewConnectionEvent(void)

# QTcpSocket Class

C++ Reference : http://doc.qt.io/qt-5/qtcpsocket.html

Parameters : QObject *

Parent Class : QAbstractSocket

- void setconnectedEvent(const char *)
- void setdisconnectedEvent(const char *)
- void seterrorEvent(const char *)
- void sethostFoundEvent(const char *)
- void setproxyAuthenticationRequiredEvent(const char *)
- void setstateChangedEvent(const char *)
- void setaboutToCloseEvent(const char *)
- void setbytesWrittenEvent(const char *)
- void setreadChannelFinishedEvent(const char *)
- void setreadyReadEvent(const char *)
- const char *getconnectedEvent(void)
- const char *getdisconnectedEvent(void)
- const char *geterrorEvent(void)
- const char *gethostFoundEvent(void)
- const char *getproxyAuthenticationRequiredEvent(void)
- const char *getstateChangedEvent(void)
- const char *getaboutToCloseEvent(void)
- const char *getbytesWrittenEvent(void)
- const char *getreadChannelFinishedEvent(void)
- const char *getreadyReadEvent(void)

# QTechnique Class

C++ Reference : http://doc.qt.io/qt-5/qt3drender-qtechnique.html

Parameters : Qt3DCore::QNode *

- void addFilterKey(Qt3DRender::QFilterKey *filterKey)
- void addParameter(Qt3DRender::QParameter *parameter)
- void addRenderPass(Qt3DRender::QRenderPass *pass)
- QVector<Qt3DRender::QFilterKey *> filterKeys(void)
- Qt3DRender::QGraphicsApiFilter * graphicsApiFilter(void)
- QVector<Qt3DRender::QParameter *> parameters(void)
- void removeFilterKey(Qt3DRender::QFilterKey *filterKey)
- void removeParameter(Qt3DRender::QParameter *parameter)
- void removeRenderPass(Qt3DRender::QRenderPass *pass)
- QVector<Qt3DRender::QRenderPass *> renderPasses(void)

# QTemporaryFile Class

C++ Reference : http://doc.qt.io/qt-5/qtemporaryfile.html

Parameters : void

Parent Class : QFile

- bool autoRemove(void)
- QString fileName(void)
- QString fileTemplate(void)
- bool open(void)
- void setAutoRemove(bool b)
- void setFileTemplate(QString name)

# QTest Class

C++ Reference : http://doc.qt.io/qt-5/qtest.html

- void qsleep(int)

# QText2DEntity Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qtext2dentity.html

Parameters : Qt3DCore::QNode *

Parent Class : QEntity

- QColor color(void)
- QFont font(void)
- float height(void)
- void setColor(QColor color)
- void setFont(QFont font)
- void setHeight(float height)
- void setText(QString text)
- void setWidth(float width)
- QString text(void)
- float width(void)

# QTextBlock Class

C++ Reference : http://doc.qt.io/qt-5/qtextblock.html

Parameters : void

- QTextBlockFormat blockFormat(void)
- int blockFormatIndex(void)
- int blockNumber(void)
- QTextCharFormat charFormat(void)
- int charFormatIndex(void)
- void clearLayout(void)
- bool contains(int position)
- QTextDocument *document(void)
- int firstLineNumber(void)
- bool isValid(void)
- bool isVisible(void)
- QTextLayout * layout(void)
- int length(void)
- int lineCount(void)
- QTextBlock next(void) # In RingQt use :  QTextBlock nextblock(void)
- int position(void)
- QTextBlock previous(void)
- int revision(void)
- void setLineCount(int count)
- void setRevision(int rev)
- void setUserData(QTextBlockUserData * data)
- void setUserState(int state)
- void setVisible(bool visible)
- QString text(void)
- int textDirection(void)
- QTextList * textList(void)
- QTextBlockUserData * userData(void)
- int userState(void)

# QTextBlockFormat Class

C++ Reference : http://doc.qt.io/qt-5/qtextblockformat.html

Parameters : void

- Qt::Alignment alignment(void)
- qreal bottomMargin(void)
- int indent(void)
- qreal leftMargin(void)
- qreal lineHeight(int scriptLineHeight, int scaling)
- qreal lineHeight_2(void)
- int lineHeightType(void)
- bool nonBreakableLines(void)
- QTextFormat::PageBreakFlags pageBreakPolicy(void)
- qreal rightMargin(void)
- void setAlignment(Qt::Alignment alignment)
- void setBottomMargin(qreal margin)
- void setIndent(int indentation)
- void setLeftMargin(qreal margin)
- void setLineHeight(qreal height, int heightType)
- void setNonBreakableLines(bool b)
- void setPageBreakPolicy(QTextFormat::PageBreakFlags policy)
- void setRightMargin(qreal margin)
- void setTextIndent(qreal indent)
- void setTopMargin(qreal margin)
- qreal textIndent(void)
- qreal topMargin(void)

# QTextBrowser Class

C++ Reference : http://doc.qt.io/qt-5/qtextbrowser.html

Parameters : QWidget *

Parent Class : QTextEdit

- int backwardHistoryCount(void)
- void clearHistory(void)
- int forwardHistoryCount(void)
- QString historyTitle(int i)
- QUrl historyUrl(int i)
- bool isBackwardAvailable(void)
- bool isForwardAvailable(void)
- bool openExternalLinks(void)
- bool openLinks(void)
- QStringList searchPaths(void)
- void setOpenExternalLinks(bool open)
- void setOpenLinks(bool open)
- void setSearchPaths(QStringList paths)
- QUrl source(void)
- void setanchorClickedEvent(const char *)
- void setbackwardAvailableEvent(const char *)
- void setforwardAvailableEvent(const char *)
- void sethighlightedEvent(const char *)
- void sethistoryChangedEvent(const char *)
- void setsourceChangedEvent(const char *)
- const char *getanchorClickedEvent(void)
- const char *getbackwardAvailableEvent(void)
- const char *getforwardAvailableEvent(void)
- const char *gethighlightedEvent(void)
- const char *gethistoryChangedEvent(void)
- const char *getsourceChangedEvent(void)

# QTextCharFormat Class

C++ Reference : http://doc.qt.io/qt-5/qtextcharformat.html

Parameters : void

- QString anchorHref(void)
- QStringList anchorNames(void)
- QFont font(void)
- QFont::Capitalization fontCapitalization(void)
- QString fontFamily(void)
- bool fontFixedPitch(void)
- QFont::HintingPreference fontHintingPreference(void)
- bool fontItalic(void)
- bool fontKerning(void)
- qreal fontLetterSpacing(void)
- QFont::SpacingType fontLetterSpacingType(void)
- bool fontOverline(void)
- qreal fontPointSize(void)
- int fontStretch(void)
- bool fontStrikeOut(void)
- QFont::StyleHint fontStyleHint(void)
- QFont::StyleStrategy fontStyleStrategy(void)
- bool fontUnderline(void)
- int fontWeight(void)
- qreal fontWordSpacing(void)
- bool isAnchor(void)
- bool isValid(void)
- void setAnchor(bool anchor)
- void setAnchorHref( QString   value)
- void setAnchorNames( QStringList   names)
- void setFont_2( QFont   font)
- void setFontCapitalization(QFont::Capitalization capitalization)
- void setFontFamily( QString   family)
- void setFontFixedPitch(bool fixedPitch)
- void setFontHintingPreference(QFont::HintingPreference hintingPreference)
- void setFontItalic(bool italic)
- void setFontKerning(bool enable)
- void setFontLetterSpacing(qreal spacing)
- void setFontLetterSpacingType(QFont::SpacingType letterSpacingType)
- void setFontOverline(bool overline)
- void setFontPointSize(qreal size)
- void setFontStretch(int factor)
- void setFontStrikeOut(bool strikeOut)
- void setFontStyleHint(QFont::StyleHint hint, QFont::StyleStrategy strategy )
- void setFontStyleStrategy(QFont::StyleStrategy strategy)
- void setFontUnderline(bool underline)
- void setFontWeight(int weight)
- void setFontWordSpacing(qreal spacing)
- void setTextOutline( QPen   pen)
- void setToolTip( QString   text)
- void setUnderlineColor( QColor   color)
- void setUnderlineStyle(QTextCharFormat::UnderlineStyle style)
- void setVerticalAlignment(QTextCharFormat::VerticalAlignment alignment)
- QPen textOutline(void)
- QString toolTip(void)
- QColor underlineColor(void)
- QTextCharFormat::UnderlineStyle underlineStyle(void)
- QTextCharFormat::VerticalAlignment verticalAlignment(void)

# QTextCodec Class

C++ Reference : http://doc.qt.io/qt-5/qtextcodec.html

- QTextCodec *codecForName(const char *name)
- void setCodecForLocale(QTextCodec *c)

# QTextCursor Class

C++ Reference : http://doc.qt.io/qt-5/qtextcursor.html

Parameters : void

- int anchor(void)
- bool atBlockEnd(void)
- bool atBlockStart(void)
- bool atEnd(void)
- bool atStart(void)
- void beginEditBlock(void)
- QTextBlock block(void)
- QTextCharFormat blockCharFormat(void)
- QTextBlockFormat blockFormat(void)
- int blockNumber(void)
- QTextCharFormat charFormat(void)
- void clearSelection(void)
- int columnNumber(void)
- QTextList *createList(QTextListFormat)
- QTextFrame *currentFrame(void)
- QTextList *currentList(void)
- QTextTable *currentTable(void)
- void deleteChar(void)
- void deletePreviousChar(void)
- QTextDocument *document(void)
- void endEditBlock(void)
- bool hasComplexSelection(void)
- bool hasSelection(void)
- void insertBlock(void)
- void insertFragment(QTextDocumentFragment)
- QTextFrame *insertFrame(QTextFrameFormat)
- void insertHtml(QString)
- void insertImage(QTextImageFormat)
- QTextList *insertList(QTextListFormat)
- QTextTable * insertTable(int rows, int columns, QTextTableFormat)
- void insertText(QString)
- void insertText_2(QString,QTextCharFormat)
- bool isCopyOf(QTextCursor)
- bool isNull(void)
- void joinPreviousEditBlock(void)
- bool keepPositionOnInsert(void)
- void mergeBlockCharFormat(QTextCharFormat)
- void mergeBlockFormat(QTextBlockFormat)
- void mergeCharFormat(QTextCharFormat)
- bool movePosition(QTextCursor::MoveOperation operation, QTextCursor::MoveMode mode, int n)
- int position(void)
- int positionInBlock(void)
- void removeSelectedText(void)
- void select(QTextCursor::SelectionType selection)
- void selectedTableCells(int *firstRow, int *numRows, int *firstColumn, int *numColumns)
- QString selectedText(void)
- QTextDocumentFragment selection(void)
- int selectionEnd(void)
- int selectionStart(void)
- void setBlockCharFormat(QTextCharFormat)
- void setBlockFormat(QTextBlockFormat)
- void setCharFormat(QTextCharFormat)
- void setKeepPositionOnInsert(bool b)
- void setPosition(int pos, QTextCursor::MoveMode m)
- void setVerticalMovementX(int x)
- void setVisualNavigation(bool b)
- int verticalMovementX(void)
- bool visualNavigation(void)

# QTextDocument Class

C++ Reference : http://doc.qt.io/qt-5/qtextdocument.html

Parameters : void

Parent Class : QObject

- void addResource(int type,QUrl name, QVariant resource)
- void adjustSize(void)
- QVector<QTextFormat> allFormats(void)
- int availableRedoSteps(void)
- int availableUndoSteps(void)
- QTextBlock begin(void)
- int blockCount(void)
- QChar characterAt(int pos)
- int characterCount(void)
- void clearUndoRedoStacks(QTextDocument::Stacks stacksToClear )
- QTextDocument *clone(QObject *parent )
- int defaultCursorMoveStyle(void)
- QFont defaultFont(void)
- QString defaultStyleSheet(void)
- QTextOption defaultTextOption(void)
- QAbstractTextDocumentLayout *documentLayout(void)
- double documentMargin(void)
- void drawContents(QPainter *p, QRectF rect)
- QTextBlock end(void) # In RingQt use : QTextBlock enddoc(void)
- QTextCursor find(QString subString, QTextCursor cursor, QTextDocument::FindFlag options )
- QTextBlock findBlock(int pos)
- QTextBlock findBlockByLineNumber(int lineNumber)
- QTextBlock findBlockByNumber(int blockNumber)
- QTextBlock firstBlock(void)
- double idealWidth(void)
- double indentWidth(void)
- bool isEmpty(void)
- bool isModified(void)
- bool isRedoAvailable(void)
- bool isUndoAvailable(void)
- bool isUndoRedoEnabled(void)
- QTextBlock lastBlock(void)
- int lineCount(void)
- void markContentsDirty(int position, int length)
- int maximumBlockCount(void)
- QString metaInformation(QTextDocument::MetaInformation info)
- QTextObject *object(int objectIndex)
- QTextObject *objectForFormat(QTextFormat f)
- int pageCount(void)
- QSizeF pageSize(void)
- void print(QPrinter *printer)
- void redo(QTextCursor *cursor)
- QVariant resource(int type, QUrl name)
- int revision(void)
- QTextFrame *rootFrame(void)
- void setDefaultCursorMoveStyle(Qt::CursorMoveStyle style)
- void setDefaultFont(QFont font)
- void setDefaultStyleSheet(QString sheet)
- void setDefaultTextOption(QTextOption option)
- void setDocumentLayout(QAbstractTextDocumentLayout * layout)
- void setDocumentMargin(double margin)
- void setHtml(QString html)
- void setIndentWidth(double width)
- void setMaximumBlockCount(int maximum)
- void setMetaInformation(QTextDocument::MetaInformation info, QString string)
- void setPageSize(QSizeF size)
- void setPlainText(QString text)
- void setTextWidth(double width)
- void setUndoRedoEnabled(bool enable)
- void setUseDesignMetrics(bool b)
- QSizeF size(void)
- qreal textWidth(void)
- QString toHtml(QByteArray encoding)
- QString toPlainText(void)
- void undo(QTextCursor *cursor)
- bool useDesignMetrics(void)
- void setModified(bool m)

# QTextEdit Class

C++ Reference : http://doc.qt.io/qt-5/qtextedit.html

Parameters : QWidget *

Parent Class : QAbstractScrollArea

- void setTabStopDistance(qreal width)
- qreal tabStopDistance(void)
- bool acceptRichText(void)
- int alignment(void)
- QString anchorAt(QPoint)
- bool canPaste(void)
- QTextCharFormat currentCharFormat(void)
- QFont currentFont(void)
- QTextCursor cursorForPosition(QPoint)
- QRect cursorRect(void)
- int cursorWidth(void)
- QTextDocument *document(void)
- QString documentTitle(void)
- void ensureCursorVisible(void)
- bool find(QString, QTextDocument::FindFlag)
- QString fontFamily(void)
- bool fontItalic(void)
- double fontPointSize(void)
- bool fontUnderline(void)
- int fontWeight(void)
- bool isReadOnly(void)
- bool isUndoRedoEnabled(void)
- int lineWrapColumnOrWidth(void)
- QVariant loadResource(int, QUrl)
- void mergeCurrentCharFormat(QTextCharFormat)
- void moveCursor(QTextCursor::MoveOperation operation, QTextCursor::MoveMode mode)
- bool overwriteMode(void)
- void print(QPrinter * printer)
- QString placeholderText(void)
- void setPlaceholderText(QString placeholderText)
- void setAcceptRichText(bool accept)
- void setCurrentCharFormat(QTextCharFormat)
- void setCursorWidth(int width)
- void setDocument(QTextDocument *document)
- void setDocumentTitle(QString)
- void setLineWrapColumnOrWidth(int w)
- void setLineWrapMode(QTextEdit::LineWrapMode)
- void setOverwriteMode(bool overwrite)
- void setReadOnly(bool)
- void setTabChangesFocus(bool)
- void setTextCursor(QTextCursor)
- void setTextInteractionFlags(Qt::TextInteractionFlag flags)
- void setUndoRedoEnabled(bool enable)
- void setWordWrapMode(QTextOption::WrapMode policy)
- bool tabChangesFocus(void)
- QColor textBackgroundColor(void)
- QColor textColor(void)
- QTextCursor textCursor(void)
- int textInteractionFlags(void)
- QString toHtml(void)
- QString toPlainText(void)
- int wordWrapMode(void)
- void append(QString)
- void clear(void)
- void copy(void)
- void cut(void)
- void insertHtml(QString)
- void insertPlainText(QString)
- void paste(void)
- void redo(void)
- void scrollToAnchor(QString)
- void selectAll(void)
- void setAlignment(Qt::AlignmentFlag a)
- void setCurrentFont(QFont)
- void setFontFamily(QString)
- void setFontItalic(bool italic)
- void setFontPointSize(double s)
- void setFontUnderline(bool underline)
- void setFontWeight(int weight)
- void setHtml(QString)
- void setPlainText(QString)
- void setText(QString)
- void setTextBackgroundColor(QColor)
- void setTextColor(QColor)
- void undo(void)
- void zoomIn(int range)
- void zoomOut(int range)
- void setcopyAvailableEvent(const char *)
- void setcurrentCharFormatChangedEvent(const char *)
- void setcursorPositionChangedEvent(const char *)
- void setredoAvailableEvent(const char *)
- void setselectionChangedEvent(const char *)
- void settextChangedEvent(const char *)
- void setundoAvailableEvent(const char *)
- const char *getcopyAvailableEvent(void)
- const char *getcurrentCharFormatChangedEvent(void)
- const char *getcursorPositionChangedEvent(void)
- const char *getredoAvailableEvent(void)
- const char *getselectionChangedEvent(void)
- const char *gettextChangedEvent(void)
- const char *getundoAvailableEvent(void)
- void cyanline(void)
- void setactivelinecolor(QColor)

# QTextFrame Class

C++ Reference : http://doc.qt.io/qt-5/qtextframe.html

Parameters : void

- QTextCursor firstCursorPosition(void)
- QTextFrameFormat frameFormat(void)
- QTextCursor lastCursorPosition(void)
- QTextFrame *parentFrame(void)
- void setFrameFormat(QTextFrameFormat format)

# QTextFrameFormat Class

C++ Reference : http://doc.qt.io/qt-5/qtextframeformat.html

Parameters : void

- qreal border(void)
- QBrush borderBrush(void)
- QTextFrameFormat::BorderStyle borderStyle(void)
- qreal bottomMargin(void)
- QTextLength height(void)
- qreal leftMargin(void)
- qreal margin(void)
- qreal padding(void)
- QTextFormat::PageBreakFlags pageBreakPolicy(void)
- QTextFrameFormat::Position position(void)
- qreal rightMargin(void)
- void setBorder(qreal width)
- void setBorderBrush(QBrush brush)
- void setBorderStyle(QTextFrameFormat::BorderStyle style)
- void setBottomMargin(qreal margin)
- void setHeight(qreal height)
- void setHeight_2(QTextLength height)
- void setLeftMargin(qreal margin)
- void setMargin(qreal margin)
- void setPadding(qreal width)
- void setPageBreakPolicy(QTextFormat::PageBreakFlags policy)
- void setPosition(QTextFrameFormat::Position policy)
- void setRightMargin(qreal margin)
- void setTopMargin(qreal margin)
- void setWidth(qreal width)
- void setWidth_2(QTextLength width)
- qreal topMargin(void)
- QTextLength width(void)

# QTextList Class

C++ Reference : http://doc.qt.io/qt-5/qtextlist.html

Parameters : void

- void add(QTextBlock block)
- int count(void)
- QTextListFormat format(void)
- QTextBlock item(int i)
- int itemNumber(QTextBlock block)
- QString itemText(QTextBlock block)
- void remove(QTextBlock block)
- void removeItem(int i)
- void setFormat(QTextListFormat format)

# QTextListFormat Class

C++ Reference : http://doc.qt.io/qt-5/qtextlistformat.html

Parameters : void

- int indent(void)
- QString numberPrefix(void)
- QString numberSuffix(void)
- void setIndent(int indentation)
- void setNumberPrefix(QString numberPrefix)
- void setNumberSuffix(QString numberSuffix)
- void setStyle(QTextListFormat::Style style)
- QTextListFormat::Style style(void)

# QTextOption Class

C++ Reference : http://doc.qt.io/qt-5/qtextoption.html

Parameters : Qt::Alignment

- Qt::Alignment alignment(void)
- QTextOption::Flags flags(void)
- void setAlignment(Qt::Alignment alignment)
- void setFlags(QTextOption::Flags flags)
- void setTextDirection(Qt::LayoutDirection direction)
- void setUseDesignMetrics(bool enable)
- void setWrapMode(QTextOption::WrapMode mode)
- qreal tabStopDistance(void)
- Qt::LayoutDirection textDirection(void)
- bool useDesignMetrics(void)
- QTextOption::WrapMode wrapMode(void)

# QTextStream Class

C++ Reference : http://doc.qt.io/qt-5/qtextstream.html

Parameters : void

- bool atEnd(void)
- bool autoDetectUnicode(void)
- QTextCodec * codec(void)
- QIODevice * device(void)
- QTextStream::FieldAlignment fieldAlignment(void)
- int fieldWidth(void)
- void flush(void)
- bool generateByteOrderMark(void)
- int integerBase(void)
- QLocale locale(void)
- QTextStream::NumberFlags numberFlags(void)
- QChar padChar(void)
- qint64 pos(void)
- QString read(qint64 maxlen)
- QString readAll(void)
- QString readLine(qint64 maxlen)
- QTextStream::RealNumberNotation realNumberNotation(void)
- int realNumberPrecision(void)
- void reset(void)
- void resetStatus(void)
- bool seek(qint64 pos)
- void setAutoDetectUnicode(bool enabled)
- void setCodec(QTextCodec * codec)
- void setCodec_2(char * codecName)
- void setDevice(QIODevice * device)
- void setFieldAlignment(QTextStream::FieldAlignment mode)
- void setFieldWidth(int width)
- void setGenerateByteOrderMark(bool generate)
- void setIntegerBase(int base)
- void setLocale(QLocale locale)
- void setNumberFlags(QTextStream::NumberFlags flags)
- void setPadChar(QChar ch)
- void setRealNumberNotation(QTextStream::RealNumberNotation notation)
- void setRealNumberPrecision(int precision)
- void setStatus(QTextStream::Status status)
- void setString(QString * string, QIODevice::OpenMode openMode)
- void skipWhiteSpace(void)
- QTextStream::Status status(void)
- QString * string(void)

# QTextStream2 Class

Parameters : QIODevice * device

Parent Class : QTextStream

# QTextStream3 Class

Parameters : FILE * fileHandle, QIODevice::OpenMode

Parent Class : QTextStream

# QTextStream4 Class

Parameters : QString *, QIODevice::OpenMode

Parent Class : QTextStream

# QTextStream5 Class

Parameters : QByteArray *, QIODevice::OpenMode

Parent Class : QTextStream

# QTextTable Class

C++ Reference : http://doc.qt.io/qt-5/qtexttable.html

Parameters : void

- void appendColumns(int count)
- void appendRows(int count)
- QTextTableCell cellAt(int row, int column)
- QTextTableCell cellAt_2(QTextCursor cursor)
- int columns(void)
- QTextTableFormat format(void)
- void insertColumns(int index, int columns)
- void insertRows(int index, int rows)
- void mergeCells(int row, int column, int numRows, int numCols)
- void mergeCells_2(QTextCursor cursor)
- void removeColumns(int index, int columns)
- void removeRows(int index, int rows)
- void resize(int rows, int columns)
- int rows(void)
- void setFormat(QTextTableFormat format)
- void splitCell(int row, int column, int numRows, int numCols)

# QTextTableCell Class

C++ Reference : http://doc.qt.io/qt-5/qtexttablecell.html

Parameters : void

- int column(void)
- int columnSpan(void)
- QTextCursor firstCursorPosition(void)
- QTextCharFormat format(void)
- bool isValid(void)
- QTextCursor lastCursorPosition(void)
- int row(void)
- int rowSpan(void)
- void setFormat(QTextCharFormat format)
- int tableCellFormatIndex(void)

# QTextTableFormat Class

C++ Reference : http://doc.qt.io/qt-5/qtexttableformat.html

Parameters : void

- Qt::Alignment alignment(void)
- qreal cellPadding(void)
- qreal cellSpacing(void)
- int columns(void)
- int headerRowCount(void)
- bool borderCollapse(void)
- void setAlignment(Qt::Alignment alignment)
- void setCellPadding(qreal padding)
- void setCellSpacing(qreal spacing)
- void setColumns(int columns)
- void setHeaderRowCount(int count)
- void setBorderCollapse(bool borderCollapse)

# QTextToSpeech Class

C++ Reference : http://doc.qt.io/qt-5/qtexttospeech.html

Parameters : QObject *

Parent Class : QObject

- QVector<QLocale> availableLocales(void)
- QVector<QVoice> availableVoices(void)
- QLocale locale(void)
- double pitch(void)
- double rate(void)
- QTextToSpeech::State state(void)
- QVoice voice(void)
- double volume(void)
- void pause(void)
- void resume(void)
- void say(QString text)
- void setLocale(QLocale locale)
- void setPitch(double pitch)
- void setRate(double rate)
- void setVoice(QVoice voice)
- void setVolume(double volume)
- void stop(void)
- QStringList availableEngines(void)
- void setlocaleChangedEvent(const char *)
- void setpitchChangedEvent(const char *)
- void setrateChangedEvent(const char *)
- void setstateChangedEvent(const char *)
- void setvoiceChangedEvent(const char *)
- void setvolumeChangedEvent(const char *)
- const char *getlocaleChangedEvent(void)
- const char *getpitchChangedEvent(void)
- const char *getrateChangedEvent(void)
- const char *getstateChangedEvent(void)
- const char *getvoiceChangedEvent(void)
- const char *getvolumeChangedEvent(void)

# QTextureLoader Class

C++ Reference : http://doc.qt.io/qt-5/qt3drender-qtextureloader.html

Parameters : Qt3DCore::QNode *

- bool isMirrored(void)
- QUrl source(void)
- void setMirrored(bool mirrored)
- void setSource(QUrl source)

# QTextureMaterial Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qtexturematerial.html

Parameters : Qt3DCore::QNode *

- bool isAlphaBlendingEnabled(void)
- Qt3DRender::QAbstractTexture *texture(void)
- QVector2D textureOffset(void)
- QMatrix3x3 textureTransform(void)
- void setAlphaBlendingEnabled(bool enabled)
- void setTexture(Qt3DRender::QAbstractTexture *texture)
- void setTextureOffset(QVector2D textureOffset)
- void setTextureTransform(QMatrix3x3 matrix)

# QThread Class

C++ Reference : http://doc.qt.io/qt-5/qthread.html

Parameters : QObject *

Parent Class : QObject

- QAbstractEventDispatcher *eventDispatcher(void)
- void exit(int returnCode) # In RingQt use : void exitfromthread(int returnCode)
- bool isFinished(void)
- bool isInterruptionRequested(void)
- bool isRunning(void)
- QThread::Priority priority(void)
- void requestInterruption(void)
- void setEventDispatcher(QAbstractEventDispatcher *eventDispatcher)
- void setPriority(QThread::Priority priority)
- void setStackSize(uint stackSize)
- uint stackSize(void)
- bool wait(unsigned long time)
- void quit(void)
- void start(QThread::Priority priority)
- void terminate(void)
- QThread *currentThread(void)
- Qt::HANDLE currentThreadId(void)
- int idealThreadCount(void)
- void msleep(unsigned long msecs)
- void sleep(unsigned long secs)
- void usleep(unsigned long usecs)
- void yieldCurrentThread(void)
- void setStartedEvent(const char *)
- void setFinishedEvent(const char *)
- const char *getStartedEvent(void)
- const char *getFinishedEvent(void)

# QThreadPool Class

C++ Reference : http://doc.qt.io/qt-5/qthreadpool.html

Parameters : void

Parent Class : QObject

- int activeThreadCount(void)
- void clear(void)
- int expiryTimeout(void)
- int maxThreadCount(void)
- void releaseThread(void)
- void reserveThread(void)
- void setExpiryTimeout(int expiryTimeout)
- void setMaxThreadCount(int maxThreadCount)
- void start(QRunnable * runnable, int priority)
- bool tryStart(QRunnable * runnable)
- bool waitForDone(int msecs)
- QThreadPool *globalInstance(void)

# QTime Class

C++ Reference : http://doc.qt.io/qt-5/qtime.html

Parameters : void

- QTime addMSecs(int ms)
- QTime addSecs(int s)
- int hour(void)
- bool isNull(void)
- bool isValid(void)
- int minute(void)
- int msec(void)
- int msecsSinceStartOfDay(void)
- int msecsTo(QTime)
- int second(void)
- int secsTo(QTime)
- bool setHMS(int h, int m, int s, int ms)
- QString toString(QString)
- QTime currentTime(void)
- QTime fromMSecsSinceStartOfDay(int msecs)
- QTime fromString(QString,QString)

# QTimer Class

C++ Reference : http://doc.qt.io/qt-5/qtimer.html

Parameters : QObject *parent

- int interval(void)
- bool isActive(void)
- bool isSingleShot(void)
- void setInterval(int msec)
- void setSingleShot(bool singleShot)
- int timerId(void)
- void start(void)
- void stop(void)
- void settimeoutEvent(const char *)
- const char *gettimeoutEvent(void)

# QToolBar Class

C++ Reference : http://doc.qt.io/qt-5/qtoolbar.html

Parameters : QWidget *

Parent Class : QWidget

- QAction *actionAt(int x, int y)
- QAction *addAction(QString)
- QAction *addSeparator(void)
- QAction *addWidget(QWidget *widget)
- int allowedAreas(void)
- void clear(void)
- QSize iconSize(void)
- QAction *insertSeparator(QAction *before)
- QAction *insertWidget(QAction *before, QWidget *widget)
- bool isAreaAllowed(Qt::ToolBarArea area)
- bool isFloatable(void)
- bool isFloating(void)
- bool isMovable(void)
- int orientation(void)
- void setAllowedAreas(Qt::ToolBarArea areas)
- void setFloatable(bool floatable)
- void setMovable(bool movable)
- void setOrientation(Qt::Orientation orientation)
- QAction *toggleViewAction(void)
- int toolButtonStyle(void)
- QWidget *widgetForAction(QAction *action)
- void setIconSize(QSize)
- void setToolButtonStyle(Qt::ToolButtonStyle toolButtonStyle)

# QToolBox Class

C++ Reference : http://doc.qt.io/qt-5/qtoolbox.html

Parameters : QWidget *parent

Parent Class : QFrame

- int addItem(QWidget *widget, QString text)
- int addItem_2(QWidget *widget, QIcon icon, QString text)
- int count(void)
- int currentIndex(void)
- QWidget *currentWidget(void)
- int indexOf(QWidget *widget)
- int insertItem(int index, QWidget *widget, QString text)
- int insertItem_2(int index, QWidget *widget, QIcon icon, QString text)
- bool isItemEnabled(int index)
- QIcon itemIcon(int index)
- QString itemText(int index)
- QString itemToolTip(int index)
- void removeItem(int index)
- void setItemEnabled(int index, bool enabled)
- void setItemIcon(int index, QIcon icon)
- void setItemText(int index, QString text)
- void setItemToolTip(int index, QString toolTip)
- QWidget *widget(int index)
- void setCurrentIndex(int index)
- void setCurrentWidget(QWidget *widget)
- void setcurrentChangedEvent(const char *)
- const char *getcurrentChangedEvent(void)

# QToolButton Class

C++ Reference : http://doc.qt.io/qt-5/qtoolbutton.html

Parameters : QWidget *

Parent Class : QAbstractButton

- Qt::ArrowType arrowType(void)
- bool autoRaise(void)
- QAction * defaultAction(void)
- QMenu * menu(void)
- QToolButton::ToolButtonPopupMode popupMode(void)
- void setArrowType(Qt::ArrowType type)
- void setAutoRaise(bool enable)
- void setMenu(QMenu * menu)
- void setPopupMode(QToolButton::ToolButtonPopupMode mode)
- Qt::ToolButtonStyle toolButtonStyle(void)
- void setDefaultAction(QAction * action)
- void setToolButtonStyle(Qt::ToolButtonStyle style)
- void showMenu(void)
- void settriggeredEvent(const char *)
- const char *gettriggeredEvent(void)
- void setClickEvent(const char *)
- const char *getClickEvent(void)

# QToolTip Class

C++ Reference : http://doc.qt.io/qt-5/qtooltip.html

Parameters : void

- QFont font(void)
- void hideText(void)
- bool isVisible(void)
- QPalette palette(void)
- void setFont(QFont font)
- void setPalette(QPalette palette)
- void showText(QPoint pos, QString text, QWidget *w)
- QString text(void)

# QTorusMesh Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qtorusmesh.html

Parameters : Qt3DCore::QNode *

- float minorRadius(void)
- float radius(void)
- int rings(void)
- int slices(void)
- void setMinorRadius(float minorRadius)
- void setRadius(float radius)
- void setRings(int rings)
- void setSlices(int slices)

# QTransform Class

C++ Reference : http://doc.qt.io/qt-5/qt3dcore-qtransform.html

Parameters : Qt3DCore::QNode *

- QMatrix4x4 matrix(void)
- QQuaternion rotation(void)
- float rotationX(void)
- float rotationY(void)
- float rotationZ(void)
- float scale(void)
- QVector3D scale3D(void)
- QVector3D translation(void)
- void setMatrix(QMatrix4x4 matrix)
- void setRotation(QQuaternion rotation)
- void setRotationX(float rotationX)
- void setRotationY(float rotationY)
- void setRotationZ(float rotationZ)
- void setScale(float scale)
- void setScale3D(QVector3D scale)
- void setTranslation(QVector3D translation)
- QQuaternion fromAxes(QVector3D xAxis, QVector3D yAxis, QVector3D zAxis)
- QQuaternion fromAxesAndAngles(QVector3D axis1, float angle1, QVector3D axis2, float angle2)
- QQuaternion fromAxesAndAngles_2(QVector3D axis1, float angle1, QVector3D axis2, float angle2, QVector3D axis3, float angle3)
- QQuaternion fromAxisAndAngle(QVector3D axis, float angle)
- QQuaternion fromAxisAndAngle_2(float x, float y, float z, float angle)
- QQuaternion fromEulerAngles(QVector3D eulerAngles)
- QQuaternion fromEulerAngles_2(float pitch, float yaw, float roll)
- QMatrix4x4 rotateAround(QVector3D point, float angle, QVector3D axis)
- QMatrix4x4 rotateFromAxes(QVector3D xAxis, QVector3D yAxis, QVector3D zAxis)

# QTransform2 Class

Parameters : qreal,qreal,qreal,qreal,qreal,qreal

- qreal m11(void)
- qreal m12(void)
- qreal m13(void)
- qreal m21(void)
- qreal m22(void)
- qreal m23(void)
- qreal m31(void)
- qreal m32(void)
- qreal m33(void)
- QTransform adjoint(void)
- qreal determinant(void)
- qreal dx(void)
- qreal dy(void)
- QTransform inverted(bool *invertible)
- bool isAffine(void)
- bool isIdentity(void)
- bool isInvertible(void)
- bool isRotating(void)
- bool isScaling(void)
- bool isTranslating(void)
- void map(qreal x, qreal y, qreal *tx, qreal *ty)
- QPoint map_2(QPoint point)
- QPointF map_3(QPointF p)
- QLine map_4(QLine l)
- QLineF map_5(QLineF line)
- QPolygonF map_6(QPolygonF polygon)
- QPolygon map_7(QPolygon polygon)
- QRegion map_8(QRegion region)
- QPainterPath map_9(QPainterPath path)
- void map_10(int x, int y, int *tx, int *ty)
- QRectF mapRect(QRectF rectangle)
- QRect mapRect_2(QRect rectangle)
- QPolygon mapToPolygon(QRect rectangle)
- void reset(void)
- QTransform rotate(qreal angle, Qt::Axis axis)
- QTransform rotateRadians(qreal angle, Qt::Axis axis)
- QTransform scale(qreal sx, qreal sy)
- void setMatrix(qreal m11, qreal m12, qreal m13, qreal m21, qreal m22, qreal m23, qreal m31, qreal m32, qreal m33)
- QTransform shear(qreal sh, qreal sv)
- QTransform translate(qreal dx, qreal dy)
- QTransform transposed(void)
- QTransform::TransformationType type(void)

# QTransform3 Class

Parameters : void

Parent Class : QTransform2

# QTreeView Class

C++ Reference : http://doc.qt.io/qt-5/qtreeview.html

Parameters : QWidget *

Parent Class : QAbstractItemView

- bool allColumnsShowFocus(void)
- int autoExpandDelay(void)
- int columnAt(int x)
- int columnViewportPosition(int column)
- int columnWidth(int column)
- bool expandsOnDoubleClick(void)
- QHeaderView *header(void)
- int indentation(void)
- QModelIndex indexAbove(QModelIndex)
- QModelIndex indexBelow(QModelIndex)
- bool isAnimated(void)
- bool isColumnHidden(int column)
- bool isExpanded(QModelIndex)
- bool isFirstColumnSpanned(int row, QModelIndex)
- bool isHeaderHidden(void)
- bool isRowHidden(int row,QModelIndex)
- bool isSortingEnabled(void)
- bool itemsExpandable(void)
- bool rootIsDecorated(void)
- void setAllColumnsShowFocus(bool enable)
- void setAnimated(bool enable)
- void setAutoExpandDelay(int delay)
- void setColumnHidden(int column, bool hide)
- void setColumnWidth(int column, int width)
- void setExpanded(QModelIndex, bool expanded)
- void setExpandsOnDoubleClick(bool enable)
- void setFirstColumnSpanned(int row, QModelIndex, bool span)
- void setHeader(QHeaderView * header)
- void setHeaderHidden(bool hide)
- void setIndentation(int i)
- void setItemsExpandable(bool enable)
- void setRootIsDecorated(bool show)
- void setRowHidden(int row,QModelIndex, bool hide)
- void setSortingEnabled(bool enable)
- void setUniformRowHeights(bool uniform)
- void setWordWrap(bool on)
- void sortByColumn(int column,Qt::SortOrder order)
- bool uniformRowHeights(void)
- bool wordWrap(void)
- void dataChanged(QModelIndex,QModelIndex)
- QModelIndex indexAt(QPoint)
- void keyboardSearch(QString)
- void reset(void)
- void scrollTo(QModelIndex, QAbstractItemView::ScrollHint)
- void selectAll(void)
- void setModel(QAbstractItemModel *model)
- void setRootIndex(QModelIndex)
- void setSelectionModel(QItemSelectionModel *selectionModel)
- QRect visualRect(QModelIndex)
- void collapse(QModelIndex)
- void collapseAll(void)
- void expand(QModelIndex)
- void expandAll(void)
- void expandToDepth(int depth)
- void hideColumn(int column)
- void resizeColumnToContents(int column)
- void showColumn(int column)
- void setcollapsedEvent(const char *)
- void setexpandedEvent(const char *)
- void setactivatedEvent(const char *)
- void setclickedEvent(const char *)
- void setdoubleClickedEvent(const char *)
- void setenteredEvent(const char *)
- void setpressedEvent(const char *)
- void setviewportEnteredEvent(const char *)
- const char *getcollapsedEvent(void)
- const char *getexpandedEvent(void)
- const char *getactivatedEvent(void)
- const char *getclickedEvent(void)
- const char *getdoubleClickedEvent(void)
- const char *getenteredEvent(void)
- const char *getpressedEvent(void)
- const char *getviewportEnteredEvent(void)

# QTreeWidget Class

C++ Reference : http://doc.qt.io/qt-5/qtreewidget.html

Parameters : QWidget *

Parent Class : QTreeView

- void addTopLevelItem(QTreeWidgetItem *item)
- void closePersistentEditor(QTreeWidgetItem *item, int column)
- int columnCount(void)
- int currentColumn(void)
- QTreeWidgetItem *currentItem(void)
- void editItem(QTreeWidgetItem *item, int column)
- QTreeWidgetItem *headerItem(void)
- int indexOfTopLevelItem(QTreeWidgetItem *item)
- void insertTopLevelItem(int index, QTreeWidgetItem *item)
- QTreeWidgetItem *invisibleRootItem(void)
- QTreeWidgetItem *itemAbove(QTreeWidgetItem *item)
- QTreeWidgetItem *itemAt(int x, int y)
- QTreeWidgetItem *itemBelow(QTreeWidgetItem *item)
- QWidget *itemWidget(QTreeWidgetItem *item, int column)
- void openPersistentEditor(QTreeWidgetItem *item, int column)
- void removeItemWidget(QTreeWidgetItem *item, int column)
- void setColumnCount(int columns)
- void setCurrentItem(QTreeWidgetItem * item, QItemSelectionModel::SelectionFlag column)
- void setHeaderItem(QTreeWidgetItem *item)
- void setHeaderLabel(QString)
- void setHeaderLabels(QStringList)
- void setItemWidget(QTreeWidgetItem *item, int column, QWidget * widget)
- int sortColumn(void)
- void sortItems(int column, Qt::SortOrder order)
- QTreeWidgetItem *takeTopLevelItem(int index)
- QTreeWidgetItem *topLevelItem(int index)
- int topLevelItemCount(void)
- QRect visualItemRect(QTreeWidgetItem *item)
- void setSelectionModel(QItemSelectionModel *selectionModel)
- void clear(void)
- void collapseItem(QTreeWidgetItem *item)
- void expandItem(QTreeWidgetItem *item)
- void scrollToItem(QTreeWidgetItem *item, QAbstractItemView::ScrollHint hint)
- void setcollapsedEvent(const char *)
- void setexpandedEvent(const char *)
- void setactivatedEvent(const char *)
- void setclickedEvent(const char *)
- void setdoubleClickedEvent(const char *)
- void setenteredEvent(const char *)
- void setpressedEvent(const char *)
- void setviewportEnteredEvent(const char *)
- void setcurrentItemChangedEvent(const char *)
- void setitemActivatedEvent(const char *)
- void setitemChangedEvent(const char *)
- void setitemClickedEvent(const char *)
- void setitemCollapsedEvent(const char *)
- void setitemDoubleClickedEvent(const char *)
- void setitemEnteredEvent(const char *)
- void setitemExpandedEvent(const char *)
- void setitemPressedEvent(const char *)
- void setitemSelectionChangedEvent(const char *)
- const char *getcollapsedEvent(void)
- const char *getexpandedEvent(void)
- const char *getactivatedEvent(void)
- const char *getclickedEvent(void)
- const char *getdoubleClickedEvent(void)
- const char *getenteredEvent(void)
- const char *getpressedEvent(void)
- const char *getviewportEnteredEvent(void)
- const char *getcurrentItemChangedEvent(void)
- const char *getitemActivatedEvent(void)
- const char *getitemChangedEvent(void)
- const char *getitemClickedEvent(void)
- const char *getitemCollapsedEvent(void)
- const char *getitemDoubleClickedEvent(void)
- const char *getitemEnteredEvent(void)
- const char *getitemExpandedEvent(void)
- const char *getitemPressedEvent(void)
- const char *getitemSelectionChangedEvent(void)

# QTreeWidgetItem Class

C++ Reference : http://doc.qt.io/qt-5/qtreewidgetitem.html

Parameters : void

- void addChild(QTreeWidgetItem *child)
- QBrush background(int column)
- int checkState(int column)
- QTreeWidgetItem *child(int index)
- int childCount(void)
- int childIndicatorPolicy(void)
- QTreeWidgetItem *clone(void)
- int columnCount(void)
- QVariant data(int column, int role)
- int flags(void)
- QFont font(int column)
- QBrush foreground(int column)
- QIcon icon(int column)
- int indexOfChild(QTreeWidgetItem *child)
- void insertChild(int index, QTreeWidgetItem *child)
- bool isDisabled(void)
- bool isExpanded(void)
- bool isFirstColumnSpanned(void)
- bool isHidden(void)
- bool isSelected(void)
- QTreeWidgetItem *parent(void)
- void read(QDataStream)
- void removeChild(QTreeWidgetItem *child)
- void setBackground(int column,QBrush)
- void setCheckState(int column, Qt::CheckState state)
- void setChildIndicatorPolicy(QTreeWidgetItem::ChildIndicatorPolicy policy)
- void setData(int column, int role,QVariant)
- void setDisabled(bool disabled)
- void setExpanded(bool expand)
- void setFirstColumnSpanned(bool span)
- void setFlags(Qt::ItemFlag flags)
- void setFont(int column, QFont)
- void setForeground(int column, QBrush)
- void setHidden(bool hide)
- void setIcon(int column, QIcon)
- void setSelected(bool select)
- void setSizeHint(int column, QSize)
- void setStatusTip(int column, QString)
- void setText(int column, QString)
- void setTextAlignment(int column, int alignment)
- void setToolTip(int column, QString)
- void setWhatsThis(int column, QString)
- QSize sizeHint(int column)
- void sortChildren(int column, Qt::SortOrder order)
- QString statusTip(int column)
- QTreeWidgetItem *takeChild(int index)
- QString text(int column)
- int textAlignment(int column)
- QString toolTip(int column)
- QTreeWidget *treeWidget(void)
- int type(void)
- QString whatsThis(int column)
- void write(QDataStream)

# QUdpSocket Class

C++ Reference : http://doc.qt.io/qt-5/qudpsocket.html

Parameters : QObject *parent

Parent Class : QAbstractSocket

- bool hasPendingDatagrams(void)
- bool joinMulticastGroup(QHostAddress groupAddress)
- bool joinMulticastGroup_2(QHostAddress groupAddress, QNetworkInterface iface)
- bool leaveMulticastGroup(QHostAddress groupAddress)
- bool leaveMulticastGroup_2(QHostAddress groupAddress, QNetworkInterface iface)
- QNetworkInterface multicastInterface(void)
- qint64 pendingDatagramSize(void)
- qint64 readDatagram(char *data, qint64 maxSize, QHostAddress *address, quint16 *port)
- void setMulticastInterface(QNetworkInterface iface)
- qint64 writeDatagram(QByteArray datagram, QHostAddress host, quint16 port)
- qint64 writeDatagram_2(char *data, qint64 size, QHostAddress address, quint16 port)
- void setconnectedEvent(const char *)
- void setdisconnectedEvent(const char *)
- void seterrorEvent(const char *)
- void sethostFoundEvent(const char *)
- void setstateChangedEvent(const char *)
- void setreadyReadEvent(const char *)
- const char *getconnectedEvent(void)
- const char *getdisconnectedEvent(void)
- const char *geterrorEvent(void)
- const char *gethostFoundEvent(void)
- const char *getstateChangedEvent(void)
- const char *getreadyReadEvent(void)

# QUndoCommand Class

C++ Reference : http://doc.qt.io/qt-5/qundocommand.html

Parameters : void

- QString actionText(void)
- QUndoCommand *child(int index)
- int childCount(void)
- int id(void)
- bool isObsolete(void)
- void redo(void)
- void setObsolete(bool obsolete)
- void setText(QString text)
- QString text(void)
- void undo(void)

# QUndoStack Class

C++ Reference : http://doc.qt.io/qt-5/qundostack.html

Parameters : QObject *

Parent Class : QObject

- bool canRedo(void)
- bool canUndo(void)
- int cleanIndex(void)
- void clear(void)
- int count(void)
- QAction *createRedoAction(QObject *parent, QString prefix)
- QAction *createUndoAction(QObject *parent, QString prefix)
- int index(void)
- bool isActive(void)
- bool isClean(void)
- void push(QUndoCommand *cmd)
- QString redoText(void)
- void setActive(bool active)
- void setUndoLimit(int limit)
- QString text(int index)
- int undoLimit(void)
- QString undoText(void)
- void redo(void)
- void setClean(void)
- void setIndex(int idx)
- void undo(void)
- void setcanRedoChangedEvent(const char *)
- void setcanUndoChangedEvent(const char *)
- void setcleanChangedEvent(const char *)
- void setindexChangedEvent(const char *)
- void setredoTextChangedEvent(const char *)
- void setundoTextChangedEvent(const char *)
- const char *getcanRedoChangedEvent(void)
- const char *getcanUndoChangedEvent(void)
- const char *getcleanChangedEvent(void)
- const char *getindexChangedEvent(void)
- const char *getredoTextChangedEvent(void)
- const char *getundoTextChangedEvent(void)

# QUndoView Class

C++ Reference : http://doc.qt.io/qt-5/qundoview.html

Parameters : QWidget *parent

Parent Class : QListView

- QIcon cleanIcon(void)
- QString emptyLabel(void)
- QUndoStack *stack(void)
- void setCleanIcon(QIcon icon)
- void setEmptyLabel(QString label)
- void setStack(QUndoStack *stack)

# QUrl Class

C++ Reference : http://doc.qt.io/qt-5/qurl.html

Parameters : QString

- QString authority(QUrl::ComponentFormattingOption options)
- void clear(void)
- QString errorString(void)
- QString fileName(QUrl::ComponentFormattingOption options)
- QString fragment(QUrl::ComponentFormattingOption options)
- bool hasFragment(void)
- bool hasQuery(void)
- QString host(QUrl::ComponentFormattingOption options)
- bool isEmpty(void)
- bool isLocalFile(void)
- bool isParentOf(QUrl)
- bool isRelative(void)
- bool isValid(void)
- QString password(QUrl::ComponentFormattingOption options)
- QString path(QUrl::ComponentFormattingOption options)
- int port(int defaultPort)
- QString query(QUrl::ComponentFormattingOption options)
- QUrl resolved(QUrl)
- QString scheme(void)
- void setAuthority(QString, QUrl::ParsingMode mode)
- void setFragment(QString, QUrl::ParsingMode mode)
- void setHost(QString, QUrl::ParsingMode mode)
- void setPassword(QString, QUrl::ParsingMode mode)
- void setPath(QString, QUrl::ParsingMode mode)
- void setPort(int port)
- void setQuery(QString, QUrl::ParsingMode mode)
- void setScheme(QString)
- void setUrl(QString, QUrl::ParsingMode parsingMode)
- void setUserInfo(QString, QUrl::ParsingMode mode)
- void setUserName(QString, QUrl::ParsingMode mode)
- void swap(QUrl)
- QString toString(QUrl::ComponentFormattingOption options)
- QString toLocalFile(void)
- QString userInfo(QUrl::ComponentFormattingOption options)
- QString userName(QUrl::ComponentFormattingOption options)
- QUrl fromLocalFile(QString)

# QUuid Class

C++ Reference : http://doc.qt.io/qt-5/quuid.html

Parameters : void

- QString toString(void)

# QVBarModelMapper Class

C++ Reference : http://doc.qt.io/qt-5/qvbarmodelmapper.html

Parameters : QObject *

Parent Class : QObject

- int firstBarSetColumn(void)
- int firstRow(void)
- int lastBarSetColumn(void)
- QAbstractItemModel * model(void)
- int rowCount(void)
- QAbstractBarSeries * series(void)
- void setFirstBarSetColumn(int firstBarSetColumn)
- void setFirstRow(int firstRow)
- void setLastBarSetColumn(int lastBarSetColumn)
- void setModel(QAbstractItemModel *model)
- void setRowCount(int rowCount)
- void setSeries(QAbstractBarSeries *series)
- void setfirstBarSetColumnChangedEvent(const char *)
- void setfirstRowChangedEvent(const char *)
- void setlastBarSetColumnChangedEvent(const char *)
- void setmodelReplacedEvent(const char *)
- void setrowCountChangedEvent(const char *)
- void setseriesReplacedEvent(const char *)
- const char *getfirstBarSetColumnChangedEvent(void)
- const char *getfirstRowChangedEvent(void)
- const char *getlastBarSetColumnChangedEvent(void)
- const char *getmodelReplacedEvent(void)
- const char *getrowCountChangedEvent(void)
- const char *getseriesReplacedEvent(void)

# QVBoxLayout Class

C++ Reference : http://doc.qt.io/qt-5/qvboxlayout.html

Parameters : void

Parent Class : QBoxLayout

- void addWidget(QWidget *)
- void addLayout(QLayout *)

# QVBoxPlotModelMapper Class

C++ Reference : http://doc.qt.io/qt-5/qvboxplotmodelmapper.html

Parameters : QObject *

Parent Class : QObject

- int firstBoxSetColumn(void)
- int firstRow(void)
- int lastBoxSetColumn(void)
- QAbstractItemModel * model(void)
- int rowCount(void)
- QBoxPlotSeries * series(void)
- void setFirstBoxSetColumn(int firstBoxSetColumn)
- void setFirstRow(int firstRow)
- void setLastBoxSetColumn(int lastBoxSetColumn)
- void setModel(QAbstractItemModel *model)
- void setRowCount(int rowCount)
- void setSeries(QBoxPlotSeries *series)
- void setfirstBoxSetColumnChangedEvent(const char *)
- void setfirstRowChangedEvent(const char *)
- void setlastBoxSetColumnChangedEvent(const char *)
- void setmodelReplacedEvent(const char *)
- void setrowCountChangedEvent(const char *)
- void setseriesReplacedEvent(const char *)
- const char *getfirstBoxSetColumnChangedEvent(void)
- const char *getfirstRowChangedEvent(void)
- const char *getlastBoxSetColumnChangedEvent(void)
- const char *getmodelReplacedEvent(void)
- const char *getrowCountChangedEvent(void)
- const char *getseriesReplacedEvent(void)

# QVCandlestickModelMapper Class

C++ Reference : http://doc.qt.io/qt-5/qvcandlestickmodelmapper.html

Parameters : QObject *

Parent Class : QCandlestickModelMapper

- int closeRow(void)
- int firstSetColumn(void)
- int highRow(void)
- int lastSetColumn(void)
- int lowRow(void)
- int openRow(void)
- void setCloseRow(int closeRow)
- void setFirstSetColumn(int firstSetColumn)
- void setHighRow(int highRow)
- void setLastSetColumn(int lastSetColumn)
- void setLowRow(int lowRow)
- void setOpenRow(int openRow)
- void setTimestampRow(int timestampRow)
- int timestampRow(void)
- void setcloseRowChangedEvent(const char *)
- void setfirstSetColumnChangedEvent(const char *)
- void sethighRowChangedEvent(const char *)
- void setlastSetColumnChangedEvent(const char *)
- void setlowRowChangedEvent(const char *)
- void setopenRowChangedEvent(const char *)
- void settimestampRowChangedEvent(const char *)
- const char *getcloseRowChangedEvent(void)
- const char *getfirstSetColumnChangedEvent(void)
- const char *gethighRowChangedEvent(void)
- const char *getlastSetColumnChangedEvent(void)
- const char *getlowRowChangedEvent(void)
- const char *getopenRowChangedEvent(void)
- const char *gettimestampRowChangedEvent(void)

# QVPieModelMapper Class

C++ Reference : http://doc.qt.io/qt-5/qvpiemodelmapper.html

Parameters : QObject *

Parent Class : QPieModelMapper

- int firstRow(void)
- int labelsColumn(void)
- QAbstractItemModel * model(void)
- int rowCount(void)
- QPieSeries * series(void)
- void setFirstRow(int firstRow)
- void setLabelsColumn(int labelsColumn)
- void setModel(QAbstractItemModel *model)
- void setRowCount(int rowCount)
- void setSeries(QPieSeries *series)
- void setValuesColumn(int valuesColumn)
- int valuesColumn(void)
- void setfirstRowChangedEvent(const char *)
- void setlabelsColumnChangedEvent(const char *)
- void setmodelReplacedEvent(const char *)
- void setrowCountChangedEvent(const char *)
- void setseriesReplacedEvent(const char *)
- void setvaluesColumnChangedEvent(const char *)
- const char *getfirstRowChangedEvent(void)
- const char *getlabelsColumnChangedEvent(void)
- const char *getmodelReplacedEvent(void)
- const char *getrowCountChangedEvent(void)
- const char *getseriesReplacedEvent(void)
- const char *getvaluesColumnChangedEvent(void)

# QVXYModelMapper Class

C++ Reference : http://doc.qt.io/qt-5/qvxymodelmapper.html

Parameters : QObject *

Parent Class : QXYModelMapper

- int firstRow(void)
- QAbstractItemModel * model(void)
- int rowCount(void)
- QXYSeries * series(void)
- void setFirstRow(int firstRow)
- void setModel(QAbstractItemModel *model)
- void setRowCount(int rowCount)
- void setSeries(QXYSeries *series)
- void setXColumn(int xColumn)
- void setYColumn(int yColumn)
- int xColumn(void)
- int yColumn(void)
- void setfirstRowChangedEvent(const char *)
- void setmodelReplacedEvent(const char *)
- void setrowCountChangedEvent(const char *)
- void setseriesReplacedEvent(const char *)
- void setxColumnChangedEvent(const char *)
- void setyColumnChangedEvent(const char *)
- const char *getfirstRowChangedEvent(void)
- const char *getmodelReplacedEvent(void)
- const char *getrowCountChangedEvent(void)
- const char *getseriesReplacedEvent(void)
- const char *getxColumnChangedEvent(void)
- const char *getyColumnChangedEvent(void)

# QValidator Class

C++ Reference : http://doc.qt.io/qt-5/qvalidator.html

Parent Class : QObject

- QLocale locale(void)
- void setLocale(QLocale locale)

# QValueAxis Class

C++ Reference : http://doc.qt.io/qt-5/qvalueaxis.html

Parameters : QObject *

Parent Class : QAbstractAxis

- QString labelFormat(void)
- qreal max(void)
- qreal min(void)
- int minorTickCount(void)
- void setLabelFormat(QString format)
- void setMax(qreal max)
- void setMin(qreal min)
- void setMinorTickCount(int count)
- void setRange(qreal min, qreal max)
- void setTickCount(int count)
- void setTickAnchor(qreal anchor)
- void setTickInterval(qreal insterval)
- void setTickType(QValueAxis::TickType type)
- qreal tickAnchor(void)
- qreal tickInterval(void)
- QValueAxis::TickType tickType(void)
- int tickCount(void)
- void setlabelFormatChangedEvent(const char *)
- void setmaxChangedEvent(const char *)
- void setminChangedEvent(const char *)
- void setminorTickCountChangedEvent(const char *)
- void setrangeChangedEvent(const char *)
- void settickAnchorChangedEvent(const char *)
- void settickCountChangedEvent(const char *)
- void settickIntervalChangedEvent(const char *)
- void settickTypeChangedEvent(const char *)
- const char *getlabelFormatChangedEvent(void)
- const char *getmaxChangedEvent(void)
- const char *getminChangedEvent(void)
- const char *getminorTickCountChangedEvent(void)
- const char *getrangeChangedEvent(void)
- const char *gettickAnchorChangedEvent(void)
- const char *gettickCountChangedEvent(void)
- const char *gettickIntervalChangedEvent(void)
- const char *gettickTypeChangedEvent(void)

# QVariant Class

C++ Reference : http://doc.qt.io/qt-5/qvariant.html

Parameters : void

- bool canConvert(int targetTypeId)
- void clear(void)
- bool convert(int targetTypeId)
- bool isNull(void)
- bool isValid(void)
- void swap(QVariant)
- QBitArray toBitArray(void)
- bool toBool(void)
- QByteArray toByteArray(void)
- QChar toChar(void)
- QDate toDate(void)
- QDateTime toDateTime(void)
- double toDouble(bool *ok)
- QEasingCurve toEasingCurve(void)
- float toFloat(bool *ok)
- int toInt(bool *ok)
- QJsonArray toJsonArray(void)
- QJsonDocument toJsonDocument(void)
- QJsonObject toJsonObject(void)
- QJsonValue toJsonValue(void)
- QLine toLine(void)
- QLineF toLineF(void)
- QLocale toLocale(void)
- qlonglong toLongLong(bool *ok)
- QModelIndex toModelIndex(void)
- QPoint toPoint(void)
- QPointF toPointF(void)
- qreal toReal(bool *ok)
- QRect toRect(void)
- QRectF toRectF(void)
- QRegExp toRegExp(void)
- QRegularExpression toRegularExpression(void)
- QSize toSize(void)
- QSizeF toSizeF(void)
- QStringList toStringList(void)
- QTime toTime(void)
- uint toUInt(bool *ok)
- qulonglong toULongLong(bool *ok)
- QUrl toUrl(void)
- QUuid toUuid(void)
- QVariant::Type type(void)
- const char *typeName(void)
- int userType(void)
- QString toString(void)

# QVariant2 Class

Parent Class : QVariant

Parameters : int

# QVariant3 Class

Parent Class : QVariant

Parameters : float

# QVariant4 Class

Parent Class : QVariant

Parameters : double

# QVariant5 Class

Parent Class : QVariant

Parameters : QString

# QVariantDouble Class

C++ Reference : http://doc.qt.io/qt-5/qvariantdouble.html

Parent Class : QVariant

Parameters : double

# QVariantFloat Class

C++ Reference : http://doc.qt.io/qt-5/qvariantfloat.html

Parent Class : QVariant

Parameters : float

# QVariantInt Class

C++ Reference : http://doc.qt.io/qt-5/qvariantint.html

Parent Class : QVariant

Parameters : int

# QVariantString Class

C++ Reference : http://doc.qt.io/qt-5/qvariantstring.html

Parent Class : QVariant

Parameters : QString

# QVector2D Class

C++ Reference : http://doc.qt.io/qt-5/qvector2d.html

Parameters : float,float

- float distanceToLine(QVector2D point, QVector2D direction)
- float distanceToPoint(QVector2D point)
- bool isNull(void)
- float length(void)
- float lengthSquared(void)
- void normalize(void)
- QVector2D normalized(void)
- void setX(float x)
- void setY(float y)
- QPoint toPoint(void)
- QPointF toPointF(void)
- QVector3D toVector3D(void)
- QVector4D toVector4D(void)
- float x(void)
- float y(void)
- float dotProduct(QVector2D v1, QVector2D v2)

# QVector3D Class

C++ Reference : http://doc.qt.io/qt-5/qvector3d.html

Parameters : float,float,float

- float distanceToLine(QVector3D point, QVector3D direction)
- float distanceToPlane(QVector3D plane, QVector3D normal)
- float distanceToPlane_2(QVector3D plane1, QVector3D plane2, QVector3D plane3)
- float distanceToPoint(QVector3D point)
- bool isNull(void)
- float length(void)
- float lengthSquared(void)
- void normalize(void)
- QVector3D normalized(void)
- QVector3D project(QMatrix4x4 modelView, QMatrix4x4 projection, QRect viewport)
- void setX(float x)
- void setY(float y)
- void setZ(float z)
- QPoint toPoint(void)
- QPointF toPointF(void)
- QVector2D toVector2D(void)
- QVector4D toVector4D(void)
- QVector3D unproject(QMatrix4x4 modelView, QMatrix4x4 projection, QRect viewport)
- float x(void)
- float y(void)
- float z(void)
- QVector3D crossProduct(QVector3D v1, QVector3D v2)
- float dotProduct(QVector3D v1, QVector3D v2)
- QVector3D normal(QVector3D v1, QVector3D v2)
- QVector3D normal_2(QVector3D v1, QVector3D v2, QVector3D v3)

# QVector4D Class

C++ Reference : http://doc.qt.io/qt-5/qvector4d.html

Parameters : float,float,float,float

- bool isNull(void)
- float length(void)
- float lengthSquared(void)
- void normalize(void)
- QVector4D normalized(void)
- void setW(float w)
- void setX(float x)
- void setY(float y)
- void setZ(float z)
- QPoint toPoint(void)
- QPointF toPointF(void)
- QVector2D toVector2D(void)
- QVector2D toVector2DAffine(void)
- QVector3D toVector3D(void)
- QVector3D toVector3DAffine(void)
- float w(void)
- float x(void)
- float y(void)
- float z(void)
- float dotProduct(QVector4D v1, QVector4D v2)

# QVectorQVoice Class

C++ Reference : http://doc.qt.io/qt-5/qvectorqvoice.html

Parameters : void

- int count(void)
- QVoice value(int i)

# QVersionNumber Class

C++ Reference : http://doc.qt.io/qt-5/qversionnumber.html

Parameters : void

- bool isNormalized(void)
- bool isNull(void)
- bool isPrefixOf(QVersionNumber other)
- int majorVersion(void)
- int microVersion(void)
- int minorVersion(void)
- QVersionNumber normalized(void)
- int segmentAt(int index)
- int segmentCount(void)
- QVector<int> segments(void)
- QString toString(void)

# QVideoProbe Class

C++ Reference : http://doc.qt.io/qt-5/qvideoprobe.html

Parameters : QObject *

Parent Class : QObject

- bool isActive(void)
- bool setSource(QMediaObject *source)
- bool setSource_2(QMediaRecorder *source)
- void setvideoFrameProbedEvent(const char *)
- void setflushEvent(const char *)
- const char *getvideoFrameProbedEvent(void)
- const char *getflushEvent(void)

# QVideoWidget Class

C++ Reference : http://doc.qt.io/qt-5/qvideowidget.html

Parameters : QWidget *parent

Parent Class : QWidget

- int aspectRatioMode(void)
- int brightness(void)
- int contrast(void)
- int hue(void)
- bool isFullScreen(void)
- int saturation(void)
- void setAspectRatioMode(Qt::AspectRatioMode mode)
- void setBrightness(int brightness)
- void setContrast(int contrast)
- void setFullScreen(bool fullScreen)
- void setHue(int hue)
- void setSaturation(int saturation)
- void setbrightnessChangedEvent(const char *)
- void setcontrastChangedEvent(const char *)
- void setfullScreenChangedEvent(const char *)
- void sethueChangedEvent(const char *)
- void setsaturationChangedEvent(const char *)
- const char *getbrightnessChangedEvent(void)
- const char *getcontrastChangedEvent(void)
- const char *getfullScreenChangedEvent(void)
- const char *gethueChangedEvent(void)
- const char *getsaturationChangedEvent(void)

# QVideoWidgetControl Class

C++ Reference : http://doc.qt.io/qt-5/qvideowidgetcontrol.html

Parent Class : QMediaControl

# QViewport Class

C++ Reference : http://doc.qt.io/qt-5/qt3drender-qviewport.html

Parameters : Qt3DCore::QNode *

- float gamma(void)
- QRectF normalizedRect(void)
- void setGamma(float gamma)
- void setNormalizedRect(QRectF normalizedRect)

# QVoice Class

C++ Reference : http://doc.qt.io/qt-5/qvoice.html

Parameters : void

- QVoice::Age age(void)
- QVoice::Gender gender(void)
- QString name(void)
- QString ageName(QVoice::Age age)
- QString genderName(QVoice::Gender gender)

# QWebEnginePage Class

C++ Reference : http://doc.qt.io/qt-5/qwebenginepage.html

Parameters : QObject *

Parent Class : QObject

- QAction * action(QWebEnginePage::WebAction action)
- QColor backgroundColor(void)
- QSizeF contentsSize(void)
- QMenu * createStandardContextMenu(void)
- QWebEnginePage * devToolsPage(void)
- void download(QUrl url, QString filename)
- void findText(QString subString, QWebEnginePage::FindFlags options, QWebEngineCallback<bool> resultCallback)
- bool hasSelection(void)
- QWebEngineHistory * history(void)
- QIcon icon(void)
- QUrl iconUrl(void)
- QWebEnginePage * inspectedPage(void)
- bool isAudioMuted(void)
- void load_2(QUrl url)
- void load_3(QWebEngineHttpRequest request)
- void print(QPrinter *printer,QWebEngineCallback<bool>)
- QWebEngineProfile * profile(void)
- bool recentlyAudible(void)
- void replaceMisspelledWord(QString replacement)
- QUrl requestedUrl(void)
- void runJavaScript(QString scriptSource)
- void runJavaScript_2(QString scriptSource, quint32 worldId)
- void save(QString filePath, QWebEngineDownloadItem::SavePageFormat format)
- QPointF scrollPosition(void)
- QString selectedText(void)
- void setAudioMuted(bool muted)
- void setBackgroundColor(QColor color)
- void setContent(QByteArray data, QString mimeType, QUrl baseUrl)
- void setDevToolsPage(QWebEnginePage *devToolsPage)
- void setFeaturePermission(QUrl securityOrigin, QWebEnginePage::Feature feature, QWebEnginePage::PermissionPolicy policy)
- void setHtml(QString html, QUrl baseUrl)
- void setInspectedPage(QWebEnginePage *page)
- void setUrl(QUrl url)
- void setView(QWidget *view)
- void setWebChannel(QWebChannel *channel, uint worldId)
- void setWebChannel_2(QWebChannel *channel)
- void setZoomFactor(qreal factor)
- QWebEngineSettings * settings(void)
- QString title(void)
- void triggerAction(QWebEnginePage::WebAction action, bool checked)
- QUrl url(void)
- QWidget * view(void)
- QWebChannel * webChannel(void)
- qreal zoomFactor(void)
- void setaudioMutedChangedEvent(const char *)
- void setauthenticationRequiredEvent(const char *)
- void setcontentsSizeChangedEvent(const char *)
- void setfeaturePermissionRequestCanceledEvent(const char *)
- void setfeaturePermissionRequestedEvent(const char *)
- void setfindTextFinishedEvent(const char *)
- void setfullScreenRequestedEvent(const char *)
- void setgeometryChangeRequestedEvent(const char *)
- void seticonChangedEvent(const char *)
- void seticonUrlChangedEvent(const char *)
- void setlinkHoveredEvent(const char *)
- void setloadFinishedEvent(const char *)
- void setloadProgressEvent(const char *)
- void setloadStartedEvent(const char *)
- void setpdfPrintingFinishedEvent(const char *)
- void setprintRequestedEvent(const char *)
- void setproxyAuthenticationRequiredEvent(const char *)
- void setquotaRequestedEvent(const char *)
- void setrecentlyAudibleChangedEvent(const char *)
- void setrecommendedStateChangedEvent(const char *)
- void setregisterProtocolHandlerRequestedEvent(const char *)
- void setscrollPositionChangedEvent(const char *)
- void setselectClientCertificateEvent(const char *)
- void setselectionChangedEvent(const char *)
- void settitleChangedEvent(const char *)
- void seturlChangedEvent(const char *)
- void setvisibleChangedEvent(const char *)
- void setwindowCloseRequestedEvent(const char *)
- const char *getaudioMutedChangedEvent(void)
- const char *getauthenticationRequiredEvent(void)
- const char *getcontentsSizeChangedEvent(void)
- const char *getfeaturePermissionRequestCanceledEvent(void)
- const char *getfeaturePermissionRequestedEvent(void)
- const char *getfindTextFinishedEvent(void)
- const char *getfullScreenRequestedEvent(void)
- const char *getgeometryChangeRequestedEvent(void)
- const char *geticonChangedEvent(void)
- const char *geticonUrlChangedEvent(void)
- const char *getlinkHoveredEvent(void)
- const char *getloadFinishedEvent(void)
- const char *getloadProgressEvent(void)
- const char *getloadStartedEvent(void)
- const char *getpdfPrintingFinishedEvent(void)
- const char *getprintRequestedEvent(void)
- const char *getproxyAuthenticationRequiredEvent(void)
- const char *getquotaRequestedEvent(void)
- const char *getrecentlyAudibleChangedEvent(void)
- const char *getrecommendedStateChangedEvent(void)
- const char *getregisterProtocolHandlerRequestedEvent(void)
- const char *getscrollPositionChangedEvent(void)
- const char *getselectClientCertificateEvent(void)
- const char *getselectionChangedEvent(void)
- const char *gettitleChangedEvent(void)
- const char *geturlChangedEvent(void)
- const char *getvisibleChangedEvent(void)
- const char *getwindowCloseRequestedEvent(void)

# QWebEngineView Class

C++ Reference : http://doc.qt.io/qt-5/qwebengineview.html

Parameters : QWidget *parent

Parent Class : QWidget

- bool hasSelection(void)
- QWebEngineHistory *history(void)
- void load(QUrl) # In RingQt use : void loadpage(QUrl)
- QWebEnginePage *page(void)
- QAction *pageAction(QWebEnginePage::WebAction action)
- QString selectedText(void)
- void setContent(QByteArray,QString,QUrl)
- void setHtml(QString,QUrl)
- void setPage(QWebEnginePage *page)
- void setUrl(QUrl)
- void setZoomFactor(qreal factor)
- QWebSettings *settings(void)
- QString title(void)
- void triggerPageAction(QWebEnginePage::WebAction action, bool checked)
- QUrl url(void)
- qreal zoomFactor(void)
- void back(void)
- void forward(void)
- void reload(void)
- void stop(void)
- void setloadFinishedEvent(const char *)
- void setloadProgressEvent(const char *)
- void setloadStartedEvent(const char *)
- void setselectionChangedEvent(const char *)
- void settitleChangedEvent(const char *)
- void seturlChangedEvent(const char *)
- const char *getloadFinishedEvent(void)
- const char *getloadProgressEvent(void)
- const char *getloadStartedEvent(void)
- const char *getselectionChangedEvent(void)
- const char *gettitleChangedEvent(void)
- const char *geturlChangedEvent(void)
- void print(QPrinter *printer,const char *cCode)

# QWebView Class

C++ Reference : http://doc.qt.io/qt-5/qwebengineview.html

Parameters : QWidget *parent

Parent Class : QWidget

- bool hasSelection(void)
- QWebHistory *history(void)
- void load(QUrl) # In RingQt use : void loadpage(QUrl)
- QWebPage *page(void)
- QAction *pageAction(QWebPage::WebAction action)
- QString selectedText(void)
- void setContent(QByteArray,QString,QUrl)
- void setHtml(QString,QUrl)
- void setPage(QWebPage *page)
- void setUrl(QUrl)
- void setZoomFactor(qreal factor)
- QWebSettings *settings(void)
- QString title(void)
- void triggerPageAction(QWebPage::WebAction action, bool checked)
- QUrl url(void)
- qreal zoomFactor(void)
- void back(void)
- void forward(void)
- void print(QPrinter *printer)
- void reload(void)
- void stop(void)
- void setloadFinishedEvent(const char *)
- void setloadProgressEvent(const char *)
- void setloadStartedEvent(const char *)
- void setselectionChangedEvent(const char *)
- void settitleChangedEvent(const char *)
- void seturlChangedEvent(const char *)
- const char *getloadFinishedEvent(void)
- const char *getloadProgressEvent(void)
- const char *getloadStartedEvent(void)
- const char *getselectionChangedEvent(void)
- const char *gettitleChangedEvent(void)
- const char *geturlChangedEvent(void)

# QWheelEvent Class

C++ Reference : http://doc.qt.io/qt-5/qwheelevent.html

Parameters : void

- QPoint angleDelta(void)
- Qt::MouseButtons buttons(void)
- bool inverted(void)
- QPointF globalPosF(void)
- int globalX(void)
- int globalY(void)
- QPoint pixelDelta(void)
- QPointF posF(void)
- Qt::ScrollPhase phase(void)
- int x(void)
- int y(void)

# QWidget Class

C++ Reference : http://doc.qt.io/qt-5/qwidget.html

Parameters : void

Parent Class : QObject

- bool acceptDrops(void)
- QString accessibleDescription(void)
- QString accessibleName(void)
- void activateWindow(void)
- void addAction(QAction *action)
- void adjustSize(void)
- bool autoFillBackground(void)
- int backgroundRole(void)
- QSize baseSize(void)
- QWidget *childAt(int x, int y)
- QRect childrenRect(void)
- QRegion childrenRegion(void)
- void clearFocus(void)
- void clearMask(void)
- QMargins contentsMargins(void)
- QRect contentsRect(void)
- int contextMenuPolicy(void)
- QCursor cursor(void)
- int effectiveWinId(void)
- void ensurePolished(void)
- int focusPolicy(void)
- QWidget *focusProxy(void)
- QWidget *focusWidget(void)
- QFont font(void)
- QFontInfo fontInfo(void)
- int foregroundRole(void)
- QRect frameGeometry(void)
- QSize frameSize(void)
- QRect geometry(void)
- QPixmap grab(QRect)
- void grabGesture(Qt::GestureType gesture, Qt::GestureFlag flags)
- void grabKeyboard(void)
- void grabMouse(void)
- int grabShortcut(QKeySequence , Qt::ShortcutContext context)
- QGraphicsEffect *graphicsEffect(void)
- QGraphicsProxyWidget *graphicsProxyWidget(void)
- bool hasFocus(void)
- bool hasMouseTracking(void)
- int height(void)
- int heightForWidth(int w)
- int inputMethodHints(void)
- QVariant inputMethodQuery(Qt::InputMethodQuery query)
- void insertAction(QAction *before, QAction *action)
- bool isActiveWindow(void)
- bool isAncestorOf(QWidget *child)
- bool isEnabled(void)
- bool isEnabledTo(QWidget *ancestor)
- bool isFullScreen(void)
- bool isHidden(void)
- bool isMaximized(void)
- bool isMinimized(void)
- bool isModal(void)
- bool isVisible(void)
- bool isVisibleTo(QWidget *ancestor)
- bool isWindow(void)
- bool isWindowModified(void)
- QLayout *layout(void)
- int layoutDirection(void)
- QLocale locale(void)
- QPoint mapFrom(QWidget *parent, QPoint)
- QPoint mapFromGlobal(QPoint)
- QPoint mapFromParent(QPoint)
- QPoint mapTo(QWidget *parent, QPoint)
- QPoint mapToGlobal(QPoint pos)
- QPoint mapToParent(QPoint pos)
- QRegion mask(void)
- int maximumHeight(void)
- QSize maximumSize(void)
- int maximumWidth(void)
- int minimumHeight(void)
- QSize minimumSize(void)
- int minimumWidth(void)
- void move(int x, int y)
- QWidget *nativeParentWidget(void)
- QWidget *nextInFocusChain(void)
- QRect normalGeometry(void)
- void overrideWindowFlags(Qt::WindowType flags)
- QPalette palette(void)
- QWidget *parentWidget(void)
- QPoint pos(void)
- QWidget *previousInFocusChain(void)
- QRect rect(void)
- void releaseKeyboard(void)
- void releaseMouse(void)
- void releaseShortcut(int id)
- void removeAction(QAction *action)
- void render(QPaintDevice *target, QPoint,QRegion, QWidget::RenderFlag)
- void repaint(void)
- void resize(int w, int h)
- bool restoreGeometry(QByteArray)
- QByteArray saveGeometry(void)
- void scroll(int dx, int dy)
- void setAcceptDrops(bool on)
- void setAccessibleDescription(QString)
- void setAccessibleName(QString)
- void setAttribute(Qt::WidgetAttribute attribute, bool on)
- void setAutoFillBackground(bool enabled)
- void setBackgroundRole(QPalette::ColorRole role)
- void setBaseSize(int basew, int baseh)
- void setContentsMargins(int left, int top, int right, int bottom)
- void setContextMenuPolicy(Qt::ContextMenuPolicy policy)
- void setCursor(QCursor)
- void setFixedHeight(int h)
- void setFixedSize(int w, int h)
- void setFixedWidth(int w)
- void setFocus(Qt::FocusReason reason)
- void setFocusPolicy(Qt::FocusPolicy policy)
- void setFocusProxy(QWidget *w)
- void setFont(QFont)
- void setForegroundRole(QPalette::ColorRole role)
- void setGeometry(int x, int y, int w, int h)
- void setGraphicsEffect(QGraphicsEffect *effect)
- void setInputMethodHints(Qt::InputMethodHint hints)
- void setLayout(QLayout *layout)
- void setLayoutDirection(Qt::LayoutDirection direction)
- void setLocale(QLocale)
- void setMask(QBitmap)
- void setMaximumHeight(int maxh)
- void setMaximumSize(int maxw, int maxh)
- void setMaximumWidth(int maxw)
- void setMinimumHeight(int minh)
- void setMinimumSize(int minw, int minh)
- void setMinimumWidth(int minw)
- void setMouseTracking(bool enable)
- void setPalette(QPalette)
- void setParent(QWidget *parent)
- void setShortcutAutoRepeat(int id, bool enable)
- void setShortcutEnabled(int id, bool enable)
- void setSizeIncrement(int w, int h)
- void setSizePolicy(QSizePolicy::Policy horizontal, QSizePolicy::Policy vertical)
- void setStatusTip(QString)
- void setStyle(QStyle *style)
- void setToolTip(QString)
- void setUpdatesEnabled(bool enable)
- void setWhatsThis(QString)
- void setWindowFilePath(QString)
- void setWindowFlags(Qt::WindowType type)
- void setWindowIcon(QIcon)
- void setWindowIconText(QString)
- void setWindowModality(Qt::WindowModality windowModality)
- void setWindowOpacity(double level)
- void setWindowRole(QString)
- void setWindowState(Qt::WindowState windowState)
- QSize size(void)
- QSize sizeIncrement(void)
- QSizePolicy sizePolicy(void)
- void stackUnder(QWidget *w)
- QString statusTip(void)
- QStyle *style(void)
- QString styleSheet(void)
- bool testAttribute(Qt::WidgetAttribute attribute)
- QString toolTip(void)
- bool underMouse(void)
- void ungrabGesture(Qt::GestureType gesture)
- void unsetCursor(void)
- void unsetLayoutDirection(void)
- void unsetLocale(void)
- void update(int x, int y, int w, int h)
- void updateGeometry(void)
- bool updatesEnabled(void)
- QRegion visibleRegion(void)
- QString whatsThis(void)
- int width(void)
- int winId(void)
- QWidget *window(void)
- QString windowFilePath(void)
- int windowFlags(void)
- QWindow *windowHandle(void)
- QIcon windowIcon(void)
- QString windowIconText(void)
- int windowModality(void)
- double windowOpacity(void)
- QString windowRole(void)
- int windowState(void)
- QString windowTitle(void)
- int windowType(void)
- int x(void)
- int y(void)
- bool close(void)
- void hide(void)
- void lower(void)
- void raise(void)
- void setDisabled(bool disable)
- void setEnabled(bool)
- void setHidden(bool hidden)
- void setStyleSheet(QString)
- void setWindowModified(bool)
- void setWindowTitle(QString)
- void show(void)
- void showFullScreen(void)
- void showMaximized(void)
- void showMinimized(void)
- void showNormal(void)
- QWidget *find(int id)
- QWidget *keyboardGrabber(void)
- QWidget *mouseGrabber(void)
- void setTabOrder(QWidget *first, QWidget *second)
- QWidget *createWindowContainer(QWindow *window, QWidget *parent, Qt::WindowFlags flags)

# QWindow Class

C++ Reference : http://doc.qt.io/qt-5/qwindow.html

Parameters : QScreen *

Parent Class : QObject

- QSize baseSize(void)
- Qt::ScreenOrientation contentOrientation(void)
- void create(void)
- QCursor cursor(void)
- void destroy(void)
- qreal devicePixelRatio(void)
- QString filePath(void)
- Qt::WindowFlags flags(void)
- QObject * focusObject(void)
- QRect frameGeometry(void)
- QMargins frameMargins(void)
- QPoint framePosition(void)
- QRect geometry(void)
- int height(void)
- QIcon icon(void)
- bool isActive(void)
- bool isAncestorOf(QWindow *child, QWindow::AncestorMode mode)
- bool isExposed(void)
- bool isModal(void)
- bool isTopLevel(void)
- bool isVisible(void)
- QPoint mapFromGlobal(QPoint pos)
- QPoint mapToGlobal(QPoint pos)
- QRegion mask(void)
- int maximumHeight(void)
- QSize maximumSize(void)
- int maximumWidth(void)
- int minimumHeight(void)
- QSize minimumSize(void)
- int minimumWidth(void)
- Qt::WindowModality modality(void)
- qreal opacity(void)
- QPoint position(void)
- void reportContentOrientationChange(Qt::ScreenOrientation orientation)
- QSurfaceFormat requestedFormat(void)
- void resize(QSize newSize)
- void resize_2(int w, int h)
- QScreen * screen(void)
- void setBaseSize(QSize size)
- void setCursor(QCursor cursor)
- void setFilePath(QString filePath)
- void setFlags(Qt::WindowFlags flags)
- void setFormat(QSurfaceFormat format)
- void setFramePosition(QPoint point)
- void setGeometry(int posx, int posy, int w, int h)
- void setGeometry_2(QRect rect)
- void setIcon(QIcon icon)
- bool setKeyboardGrabEnabled(bool grab)
- void setMask(QRegion region)
- void setMaximumSize(QSize size)
- void setMinimumSize(QSize size)
- void setModality(Qt::WindowModality modality)
- bool setMouseGrabEnabled(bool grab)
- void setOpacity(qreal level)
- void setParent(QWindow *parent)
- void setPosition(QPoint pt)
- void setPosition_2(int posx, int posy)
- void setScreen(QScreen *newScreen)
- void setSizeIncrement(QSize size)
- void setTransientParent(QWindow *parent)
- void setVisibility(QWindow::Visibility v)
- void setWindowState(Qt::WindowState state)
- QSize sizeIncrement(void)
- QString title(void)
- QWindow * transientParent(void)
- Qt::WindowType type(void)
- void unsetCursor(void)
- QWindow::Visibility visibility(void)
- int width(void)
- WId winId(void)
- Qt::WindowState windowState(void)
- int x(void)
- int y(void)
- void alert(int msec)
- bool close(void)
- void hide(void)
- void lower(void)
- void raise(void)
- void requestActivate(void)
- void setHeight(int arg)
- void setMaximumHeight(int h)
- void setMaximumWidth(int w)
- void setMinimumHeight(int h)
- void setMinimumWidth(int w)
- void setTitle(QString )
- void setVisible(bool visible)
- void setWidth(int arg)
- void setX(int arg)
- void setY(int arg)
- void show(void)
- void showFullScreen(void)
- void showMaximized(void)
- void showMinimized(void)
- void showNormal(void)
- QWindow * fromWinId(WId id)
- void setactiveChangedEvent(const char *)
- void setcontentOrientationChangedEvent(const char *)
- void setfocusObjectChangedEvent(const char *)
- void setheightChangedEvent(const char *)
- void setmaximumHeightChangedEvent(const char *)
- void setmaximumWidthChangedEvent(const char *)
- void setminimumHeightChangedEvent(const char *)
- void setminimumWidthChangedEvent(const char *)
- void setmodalityChangedEvent(const char *)
- void setopacityChangedEvent(const char *)
- void setscreenChangedEvent(const char *)
- void setvisibilityChangedEvent(const char *)
- void setvisibleChangedEvent(const char *)
- void setwidthChangedEvent(const char *)
- void setwindowStateChangedEvent(const char *)
- void setwindowTitleChangedEvent(const char *)
- void setxChangedEvent(const char *)
- void setyChangedEvent(const char *)
- const char *getactiveChangedEvent(void)
- const char *getcontentOrientationChangedEvent(void)
- const char *getfocusObjectChangedEvent(void)
- const char *getheightChangedEvent(void)
- const char *getmaximumHeightChangedEvent(void)
- const char *getmaximumWidthChangedEvent(void)
- const char *getminimumHeightChangedEvent(void)
- const char *getminimumWidthChangedEvent(void)
- const char *getmodalityChangedEvent(void)
- const char *getopacityChangedEvent(void)
- const char *getscreenChangedEvent(void)
- const char *getvisibilityChangedEvent(void)
- const char *getvisibleChangedEvent(void)
- const char *getwidthChangedEvent(void)
- const char *getwindowStateChangedEvent(void)
- const char *getwindowTitleChangedEvent(void)
- const char *getxChangedEvent(void)
- const char *getyChangedEvent(void)

# QWizard Class

C++ Reference : http://doc.qt.io/qt-5/qwizard.html

Parameters : QWidget *parent

Parent Class : QDialog

- int addPage(QWizardPage *page)
- QAbstractButton *button(QWizard::WizardButton which)
- QString buttonText(QWizard::WizardButton which)
- int currentId(void)
- QWizardPage *currentPage(void)
- QVariant field(QString name)
- bool hasVisitedPage(int id)
- int nextId(void)
- QWizard::WizardOptions options(void)
- QWizardPage *page(int id)
- QList<int> pageIds(void)
- QPixmap pixmap(QWizard::WizardPixmap which)
- void removePage(int id)
- void setButton(QWizard::WizardButton which, QAbstractButton *button)
- void setButtonText(QWizard::WizardButton which, QString text)
- void setField(QString name, QVariant value)
- void setOption(QWizard::WizardOption option, bool on)
- void setOptions(QWizard::WizardOptions options)
- void setPage(int id, QWizardPage *page)
- void setPixmap(QWizard::WizardPixmap which, QPixmap pixmap)
- void setSideWidget(QWidget *widget)
- void setStartId(int id)
- void setSubTitleFormat(Qt::TextFormat format)
- void setTitleFormat(Qt::TextFormat format)
- void setWizardStyle(QWizard::WizardStyle style)
- QWidget *sideWidget(void)
- int startId(void)
- Qt::TextFormat subTitleFormat(void)
- Qt::TextFormat titleFormat(void)
- QList<int> visitedPages(void)
- QWizard::WizardStyle wizardStyle(void)
- void back(void)
- void next(void)
- void restart(void)
- void setcurrentIdChangedEvent(const char *)
- void setpageAddedEvent(const char *)
- void setpageRemovedEvent(const char *)
- const char *getcurrentIdChangedEvent(void)
- const char *getpageAddedEvent(void)
- const char *getpageRemovedEvent(void)

# QWizardPage Class

C++ Reference : http://doc.qt.io/qt-5/qwizardpage.html

Parameters : QWidget *parent

Parent Class : QWidget

- QString buttonText(QWizard::WizardButton which)
- bool isCommitPage(void)
- bool isComplete(void)
- bool isFinalPage(void)
- int nextId(void)
- QPixmap pixmap(QWizard::WizardPixmap which)
- void setButtonText(QWizard::WizardButton which, QString text)
- void setCommitPage(bool commitPage)
- void setFinalPage(bool finalPage)
- void setPixmap(QWizard::WizardPixmap which, QPixmap pixmap)
- void setSubTitle(QString subTitle)
- void setTitle(QString title)
- QString subTitle(void)
- QString title(void)
- void setcompleteChangedEvent(const char *)
- const char *getcompleteChangedEvent(void)

# QXYLegendMarker Class

C++ Reference : http://doc.qt.io/qt-5/qxylegendmarker.html

Parent Class : QLegendMarker

- QXYSeries * series(void)
- QLegendMarker::LegendMarkerType type(void)

# QXYSeries Class

C++ Reference : http://doc.qt.io/qt-5/qxyseries.html

Parent Class : QAbstractSeries

- void append(qreal x, qreal y)
- void append_2(QPointF point)
- void append_3(QList<QPointF> points)
- QPointF at(int index)
- QBrush brush(void)
- void clear(void)
- QColor color(void)
- int count(void)
- void insert(int index, QPointF point)
- QPen pen(void)
- bool pointLabelsClipping(void)
- QColor pointLabelsColor(void)
- QFont pointLabelsFont(void)
- QString pointLabelsFormat(void)
- bool pointLabelsVisible(void)
- QList<QPointF> points(void)
- QVector<QPointF> pointsVector(void)
- bool pointsVisible(void)
- void remove(qreal x, qreal y)
- void remove_2(QPointF point)
- void remove_3(int index)
- void removePoints(int index, int count)
- void replace(qreal oldX, qreal oldY, qreal newX, qreal newY)
- void replace_2(QPointF oldPoint, QPointF newPoint)
- void replace_3(int index, qreal newX, qreal newY)
- void replace_4(int index, QPointF newPoint)
- void replace_5(QList<QPointF> points)
- void replace_6(QVector<QPointF> points)
- void setBrush(QBrush brush)
- void setColor(QColor color)
- void setPen(QPen pen)
- void setPointLabelsClipping(bool enabled)
- void setPointLabelsColor(QColor color)
- void setPointLabelsFont(QFont font)
- void setPointLabelsFormat(QString format)
- void setPointLabelsVisible(bool visible)
- void setPointsVisible(bool visible)
- void setclickedEvent(const char *)
- void setcolorChangedEvent(const char *)
- void setdoubleClickedEvent(const char *)
- void sethoveredEvent(const char *)
- void setpenChangedEvent(const char *)
- void setpointAddedEvent(const char *)
- void setpointLabelsClippingChangedEvent(const char *)
- void setpointLabelsColorChangedEvent(const char *)
- void setpointLabelsFontChangedEvent(const char *)
- void setpointLabelsFormatChangedEvent(const char *)
- void setpointLabelsVisibilityChangedEvent(const char *)
- void setpointRemovedEvent(const char *)
- void setpointReplacedEvent(const char *)
- void setpointsRemovedEvent(const char *)
- void setpointsReplacedEvent(const char *)
- void setpressedEvent(const char *)
- void setreleasedEvent(const char *)
- const char *getclickedEvent(void)
- const char *getcolorChangedEvent(void)
- const char *getdoubleClickedEvent(void)
- const char *gethoveredEvent(void)
- const char *getpenChangedEvent(void)
- const char *getpointAddedEvent(void)
- const char *getpointLabelsClippingChangedEvent(void)
- const char *getpointLabelsColorChangedEvent(void)
- const char *getpointLabelsFontChangedEvent(void)
- const char *getpointLabelsFormatChangedEvent(void)
- const char *getpointLabelsVisibilityChangedEvent(void)
- const char *getpointRemovedEvent(void)
- const char *getpointReplacedEvent(void)
- const char *getpointsRemovedEvent(void)
- const char *getpointsReplacedEvent(void)
- const char *getpressedEvent(void)
- const char *getreleasedEvent(void)

# QXmlStreamAttribute Class

C++ Reference : http://doc.qt.io/qt-5/qxmlstreamattribute.html

Parameters : void

- bool isDefault(void)
- QStringRef name(void)
- QStringRef namespaceUri(void)
- QStringRef prefix(void)
- QStringRef qualifiedName(void)
- QStringRef value(void)

# QXmlStreamAttributes Class

C++ Reference : http://doc.qt.io/qt-5/qxmlstreamattributes.html

Parameters : void

- void append(QString  namespaceUri, QString  name, QString  value)
- void append_2(QString  qualifiedName, QString  value)
- bool hasAttribute(QString  qualifiedName)
- bool hasAttribute_2(QLatin1String qualifiedName)
- bool hasAttribute_3(QString  namespaceUri, QString  name)
- QStringRef value(QString  namespaceUri, QString  name)
- QStringRef value_2(QString  namespaceUri, QLatin1String name)
- QStringRef value_3(QLatin1String namespaceUri, QLatin1String name)
- QStringRef value_4(QString  qualifiedName)
- QStringRef value_5(QLatin1String qualifiedName)

# QXmlStreamEntityDeclaration Class

C++ Reference : http://doc.qt.io/qt-5/qxmlstreamentitydeclaration.html

Parameters : void

- QStringRef name(void)
- QStringRef notationName(void)
- QStringRef publicId(void)
- QStringRef systemId(void)
- QStringRef value(void)

# QXmlStreamEntityResolver Class

C++ Reference : http://doc.qt.io/qt-5/qxmlstreamentityresolver.html

Parameters : void

# QXmlStreamNamespaceDeclaration Class

C++ Reference : http://doc.qt.io/qt-5/qxmlstreamnamespacedeclaration.html

Parameters : void

- QStringRef namespaceUri(void)
- QStringRef prefix(void)

# QXmlStreamNotationDeclaration Class

C++ Reference : http://doc.qt.io/qt-5/qxmlstreamnotationdeclaration.html

Parameters : void

- QStringRef name(void)
- QStringRef publicId(void)
- QStringRef systemId(void)

# QXmlStreamReader Class

C++ Reference : http://doc.qt.io/qt-5/qxmlstreamreader.html

Parameters : void

- void addData(QByteArray)
- void addData_2(QString)
- void addData_3(const char * data)
- void addExtraNamespaceDeclaration(QXmlStreamNamespaceDeclaration)
- void addExtraNamespaceDeclarations(QXmlStreamNamespaceDeclarations)
- bool atEnd(void)
- QXmlStreamAttributes attributes(void)
- qint64 characterOffset(void)
- void clear(void)
- qint64 columnNumber(void)
- QIODevice *device(void)
- QStringRef documentEncoding(void)
- QStringRef documentVersion(void)
- QStringRef dtdName(void)
- QStringRef dtdPublicId(void)
- QStringRef dtdSystemId(void)
- QXmlStreamEntityDeclarations entityDeclarations(void)
- QXmlStreamEntityResolver *entityResolver(void)
- Error error(void)
- QString errorString(void)
- bool hasError(void)
- bool isCDATA(void)
- bool isCharacters(void)
- bool isComment(void)
- bool isDTD(void)
- bool isEndDocument(void)
- bool isEndElement(void)
- bool isEntityReference(void)
- bool isProcessingInstruction(void)
- bool isStandaloneDocument(void)
- bool isStartDocument(void)
- bool isStartElement(void)
- bool isWhitespace(void)
- qint64 lineNumber(void)
- QStringRef name(void)
- QXmlStreamNamespaceDeclarations namespaceDeclarations(void)
- bool namespaceProcessing(void)
- QStringRef namespaceUri(void)
- QXmlStreamNotationDeclarations notationDeclarations(void)
- QStringRef prefix(void)
- QStringRef processingInstructionData(void)
- QStringRef processingInstructionTarget(void)
- QStringRef qualifiedName(void)
- void raiseError(QString)
- QString readElementText(QXmlStreamReader::ReadElementTextBehaviour)
- TokenType readNext(void)
- bool readNextStartElement(void)
- void setDevice(QIODevice *device)
- void setEntityResolver(QXmlStreamEntityResolver *resolver)
- void setNamespaceProcessing(bool)
- void skipCurrentElement(void)
- QStringRef text(void)
- QString tokenString(void)
- TokenType tokenType(void)

# QXmlStreamWriter Class

C++ Reference : http://doc.qt.io/qt-5/qxmlstreamwriter.html

Parameters : void

- bool autoFormatting(void)
- int autoFormattingIndent(void)
- QTextCodec *codec(void)
- QIODevice *device(void)
- bool hasError(void)
- void setAutoFormatting(bool enable)
- void setAutoFormattingIndent(int spacesOrTabs)
- void setCodec(QTextCodec *codec)
- void setCodec_2(const char *codecName)
- void setDevice(QIODevice *device)
- void writeAttribute(QString, QString,QString)
- void writeAttribute_2(QString, QString)
- void writeAttribute_3(QXmlStreamAttribute)
- void writeAttributes(QXmlStreamAttributes)
- void writeCDATA(QString text)
- void writeCharacters(QString text)
- void writeComment(QString text)
- void writeCurrentToken(QXmlStreamReader reader)
- void writeDTD(QString dtd)
- void writeDefaultNamespace(QString namespaceUri)
- void writeEmptyElement(QString namespaceUri, QString name)
- void writeEmptyElement_2(QString qualifiedName)
- void writeEndDocument(void)
- void writeEndElement(void)
- void writeEntityReference(QString name)
- void writeNamespace(QString namespaceUri, QString prefix)
- void writeProcessingInstruction(QString target, QString data)
- void writeStartDocument(QString version)
- void writeStartDocument_2(QString version, bool standalone)
- void writeStartDocument_3(void)
- void writeStartElement(QString namespaceUri, QString name)
- void writeStartElement_2(QString qualifiedName)
- void writeTextElement(QString namespaceUri, QString name, QString text)
- void writeTextElement_2(QString qualifiedName, QString text)

# Qt3DCamera Class

C++ Reference : http://doc.qt.io/qt-5/qt3dcamera.html

Parameters : Qt3DCore::QNode *

Parent Class : QEntity

- float aspectRatio(void)
- float bottom(void)
- float exposure(void)
- float farPlane(void)
- float fieldOfView(void)
- float left(void)
- QCameraLens *lens(void)
- float nearPlane(void)
- void pan(float angle)
- void pan_2(float angle, QVector3D axis)
- void panAboutViewCenter(float angle)
- void panAboutViewCenter_2(float angle, QVector3D axis)
- QQuaternion panRotation(float angle)
- QVector3D position(void)
- QMatrix4x4 projectionMatrix(void)
- Qt3DRender::QCameraLens::ProjectionType projectionType(void)
- float right(void)
- void roll(float angle)
- void rollAboutViewCenter(float angle)
- QQuaternion rollRotation(float angle)
- void rotate(QQuaternion q)
- void rotateAboutViewCenter(QQuaternion q)
- QQuaternion rotation(float angle, QVector3D axis)
- void tilt(float angle)
- void tiltAboutViewCenter(float angle)
- QQuaternion tiltRotation(float angle)
- float top(void)
- Qt3DCore::QTransform * transform(void)
- void translate(QVector3D vLocal, Qt3DRender::QCamera::CameraTranslationOption option)
- void translateWorld(QVector3D vWorld, Qt3DRender::QCamera::CameraTranslationOption option)
- QVector3D upVector(void)
- QVector3D viewCenter(void)
- QVector3D viewVector(void)
- void setAspectRatio(float aspectRatio)
- void setBottom(float bottom)
- void setExposure(float exposure)
- void setFarPlane(float farPlane)
- void setFieldOfView(float fieldOfView)
- void setLeft(float left)
- void setNearPlane(float nearPlane)
- void setPosition(QVector3D position)
- void setProjectionMatrix(QMatrix4x4 projectionMatrix)
- void setProjectionType(Qt3DRender::QCameraLens::ProjectionType type)
- void setRight(float right)
- void setTop(float top)
- void setUpVector(QVector3D upVector)
- void setViewCenter(QVector3D viewCenter)
- void viewAll(void)
- void viewEntity(Qt3DCore::QEntity *entity)
- void viewSphere(QVector3D center, float radius)

# Qt3DWindow Class

C++ Reference : http://doc.qt.io/qt-5/qt3dextras-qt3dwindow.html

Parameters : void

Parent Class : QWindow

- Qt3DRender::QFrameGraphNode * activeFrameGraph(void)
- QForwardRenderer * defaultFrameGraph(void)
- void registerAspect(Qt3DCore::QAbstractAspect *aspect)
- void registerAspect_2(QString name)
- Qt3DRender::QRenderSettings * renderSettings(void)
- void setActiveFrameGraph(Qt3DRender::QFrameGraphNode *activeFrameGraph)
- void setRootEntity(Qt3DCore::QEntity *root)
- Qt3DCamera *camera(void)

# RingCodeHighlighter Class

Parameters : QTextDocument *parent

- void setColors(QColor c1,QColor c2,QColor c3,QColor c4,QColor c5)
- void setKeywordsBold(int nStatus)
- void setUseDefaultKeywords(int nStatus)
- void setCustomKeywords(QStringList aKeywords)


## qtmobile

# =
# Building RingQt Applications for Mobile

In this chapter we will learn about Building RingQt Applications for Mobile.

# Download Requirements

- Install Qt 5.15.2
- Install Qt Creator (Tested using Qt Creator 6.0.1)

# Install Qt for Android

(1) Check the next link : http://doc.qt.io/qt-5/androidgs.html

- Run Qt Creator
- Select Tools > Options > Devices > Android
- Set the path for JDK, Android NDK and Android SDK Tools

(2) Using Qt Creator, We can download these requirements

- The Android SDK Tools (Tested using version 2.1)
- The Android NDK (Tested using version 21.3)
- Java SE Development Kit (JDK) v6 or later

(3) Update the Android SDK to get the API and tools packages required for development

- Tested using Android 7.1 (API 25)

Screen Shot:

:alt: Qt for Android

# Using Ring2EXE

We can use Ring2EXE to quickly prepare Qt project for our application

Example:

```ring
ring2exe myapp.ring -dist -mobileqt
```

> **Note:**

> **Tip:**

# The Qt project for your Ring application

After using Ring2EXE or the Distribute Menu in Ring Notepad

- Using the Qt Creator Open the generated Qt project

Folder : target/mobile/qtproject

Project file : project.pro

:alt: Qt for Android - Shot 1

- Using Qt Creator, You will find the compiled Ring application in the resources (YourAppName.ringo)

This file (Ring Object File) is generated by the Ring compiler using

```ring
ring YourAppName.ring -go -norun
```

- You can build your application using Qt Creator

When we open the project file, We can select the Kit

:alt: Qt for Android - Shot 2

After selecting the Kit, Click Configure Project

:alt: Qt for Android - Shot 3

Now We can build & Run the application

:alt: Qt for Andr-oid - Shot 4

The next screen shot for the application during the runtime

:alt: Qt for Android - Shot 5

(1) You can add your application images to the resources

Or You can use any text editor (Notepad) and modify : project.qrc

(2) To find images from your Ring application, You need to use the file name in resources

Example

```ring
if isandroid()
		mypic = new QPixmap(":/cards.jpg")
else
   		mypic = new QPixmap("cards.jpg")
ok
```


# Comments about developing for Android using RingQt

(1) The main project file is main.cpp

This file load Ring Compiler/Virtual Machine and RingQt

Then get the Ring Object File during the runtime from the resources

Then run the Ring Object File (ringapp.ringo) using the Ring VM

Through main.cpp you can extract more files from the resources to temp. folder once you
add them (create projects with many files).

(2) The next functions are missing from this Ring edition

- Database (ODBC, SQLite & MySQL)

- Security and Internet functions (LibCurl & OpenSSL)

- RingAllegro (Allegro Library)

- RingLibSDL (LibSDL Library)

Just use Qt Classes through RingQt.

For database access use the QSqlDatabase Class

> **Note:**

(3) use if isandroid() when you want to modify the code just for android

Example:

```ring
if isandroid()
	// Android code
else
 		// other platforms
ok
```

(4) Sometimes you will find that the button text/image is repeated in drawing !
it's Qt problem that you can avoid using the next code.

```ring
if isandroid()
	setStyleSheet("
		border-style: outset;
		border-width: 2px;
		border-radius: 4px;
		border-color: black;
		padding: 6px;")
 ok
```

(5)  Always use Layouts instead of manual setting of controls position and size.

This is the best way to get the expected user interface to avoid problems like (controls with small/extra size)

(6) When you deal with Qt Classes you can determine the images from resources (you don't need to copy them using main.cpp)

Example:

```ring
if isandroid()
    mypic = new QPixmap(":/cards.jpg")
else
    mypic = new QPixmap("cards.jpg")
ok
```

Now RingQt comes with the AppFile() function to determine the file name

Example:

```ring
mypic = new QPixmap(AppFile("cards.jpg"))  # Desktop or Android
```

(7) When you update your project code, You don't have to use Ring2EXE to generate the Qt project again

Just use the Distribute Menu in Ring Notepad and select (Generate Ring Object File)

Then copy the YourAppName.ringo file to target/mobile/qtproject folder and accept replacing files.

(8) If your application folder contains a Qt resource file (project.qrc)

Then when you use Ring2EXE or Ring Notepad (Distribute - Prepare Qt project for Mobile devices) the
resource file will be used

See ring/applications/cards game as an example.


## qtwebassembly

# =
# Building RingQt Applications for WebAssembly

In this chapter we will learn about Building RingQt Applications for WebAssembly.

# Download Requirements

Check the next link : https://doc.qt.io/qt-5/wasm.html

Tested using

- Qt (5.15.2)

- Qt Creator (11.0.2)

- Emscripten (1.39.8) : https://emscripten.org/docs/getting_started/index.html

Use Git to have emsdk

```ring
# Get the emsdk repo
git clone https://github.com/emscripten-core/emsdk.git

# Enter that directory
cd emsdk
```

Use emsdk to install and activate the required version for Qt 5.15

```ring
emsdk install 1.39.8
emsdk activate --embedded 1.39.8
```

Check Emscripten installation

```ring
em++ --version
```

Output

```ring
emcc (Emscripten gcc/clang-like replacement) 1.39.8
(commit 24d88487f47629fac9d4acd231497a3a412bdee8)
Copyright (C) 2014 the Emscripten authors (see AUTHORS.txt)
This is free and open source software under the MIT license.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.
```

- Run Qt Creator
- Select Tools > Options > Devices > WebAssembly

:alt: Qt for WebAssembly

# Using Ring2EXE

We can use Ring2EXE to quickly prepare Qt project for our application

Example:

```ring
ring2exe myapp.ring -dist -webassemblyqt
```

> **Note:**

> **Tip:**

:alt: Qt for WebAssembly shot1

# The Qt project for your Ring application

After using Ring2EXE or the Distribute Menu in Ring Notepad

- Using the Qt Creator Open the generated Qt project

Folder : target/webassembly/qtproject

Project file : project.pro

:alt: Qt for WebAssembly shot2

- Using Qt Creator, You will find the compiled Ring application in the resources (YourAppName.ringo)

This file (Ring Object File) is generated by the Ring compiler using

```ring
ring YourAppName.ring -go -norun
```

- You can build your application using Qt Creator

:alt: Qt for WebAssembly shot3

The next screen shot for the application during the runtime

:alt: Qt for WebAssembly shot4

(1) You can add your application images to the resources

Or You can use any text editor (Notepad) and modify : project.qrc

(2) To find images from your Ring application, You need to use the file name in resources

Example

```ring
if isWebAssembly()
		mypic = new QPixmap(":/cards.jpg")
else
   		mypic = new QPixmap("cards.jpg")
ok
```


# Comments about developing for WebAssembly using RingQt

(1) The main project file is main.cpp

This file load Ring Compiler/Virtual Machine and RingQt

Then get the Ring Object File during the runtime from the resources

Then run the Ring Object File (ringapp.ringo) using the Ring VM

Through main.cpp you can extract more files from the resources to temp. folder once you
add them (create projects with many files).

(2) use if isWebAssembly() when you want to modify the code just for WebAssembly

Example:

```ring
if isWebAssembly()
	// WebAssembly code
else
 		// other platforms
ok
```

(3) When you deal with Qt Classes you can determine the images from resources (you don't need to copy them using main.cpp)

Example:

```ring
if isWebAssembly()
    mypic = new QPixmap(":/cards.jpg")
else
    mypic = new QPixmap("cards.jpg")
ok
```

Now RingQt comes with the AppFile() function to determine the file name

Example:

```ring
mypic = new QPixmap(AppFile("cards.jpg"))  # Desktop, Android or WebAssembly
```

(4) When you update your project code, You don't have to use Ring2EXE to generate the Qt project again

Just use the Distribute Menu in Ring Notepad and select (Generate Ring Object File)

Then copy the YourAppName.ringo file to target/webassembly/qtproject folder and accept replacing files.

(5) If your application folder contains a Qt resource file (project.qrc)

Then when you use Ring2EXE or Ring Notepad (Distribute - Prepare Qt project for WebAssembly) the
resource file will be used

See ring/applications/cards game as an example.

(6) Use stdlibcore.ring instead of stdlib.ring when using StdLib functions

(7) Use ClocksPerSecond() function instead of typing the value (1000)

(8) Nested events loops are not supported, use events for dialogs instead of calling the exec() method

(9) Using Sleep() or ProcessEvents() doesn't provide the expected results, use Qt Timers.

(10) We don't have a direct access to the File System because the applications are executed in a secure environment

> **Tip:**

# Dialogs

See the folder: ring/samples/UsingQtWASM

Folders:

- ColorDialog
- FontDialog
- FileDialog
- FileContent

# Online Applications

- Hello World   : https://ring-lang.github.io/web/helloworld/project.html
- Matching Game : https://ring-lang.github.io/web/matching/project.html
- Pairs Game    : https://ring-lang.github.io/web/pairs/project.html
- Othello Game  : https://ring-lang.github.io/web/othello/project.html
- Game of Life  : https://ring-lang.github.io/web/gameoflife/project.html
- Form Designer : https://ring-lang.github.io/web/formdesigner/project.html

:alt: Othello Game
