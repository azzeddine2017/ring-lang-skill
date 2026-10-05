## bignumber

# =
# BigNumber Library

In this chapter we will learn about using the Big Number library.

# Loading the library

Before using the next function load the bignumber.ring library

```ring
load "bignumber.ring"
# Use Big Number library functions
```


# Examples

Using the BigNumber library we can do arithmetic operations on huge numbers.

Example:

```ring
load "bignumber.ring"

num1 = "62345678901234567891678345123456789"    ### Big
num2 =  "1237894567890123419871236545"          ### Small
num3 =     "64"                                 ### Divide Small
num4 = "765432"
num5 =      "3"                                 ### Power

? "Add big numbers:"
a1 = new BigNumber(num1)        a1.Print()
a2 = new BigNumber(num2)        a2.Print()
a3 = a1 + a2                    a3.Print() ? nl

? "Substract big numbers:"
a1 = new BigNumber(num1)        a1.Print()
a2 = new BigNumber(num2)        a2.Print()
a3 = a1 - a2                    a3.Print() ? nl

? "Multiply big numbers:"
a1 = new BigNumber(num1)        a1.print()
a2 = new BigNumber(num2)        a2.print()
a3 = a1 * a2                    a3.print() ? nl

? "Divide big numbers:"
a1 = new BigNumber(num1)        a1.print()
a2 = new BigNumber(num2)        a2.print()
a3 = a1 / a2                    a3.print() ? nl

? "Divide big numbers: by very small number"
a1 = new BigNumber(num1)        a1.print()
a2 = new BigNumber(num3)        a2.print()
a3 = a1 / a2                    a3.print() ? nl

? "Power of big number:"
a1 = new BigNumber(num1)        a1.print()
a2 = new BigNumber(num5)        a2.print()
a3 = a1 ^ a2                    a3.print() ? nl
```

Output:

```ring
Add big numbers:
62345678901234567891678345123456789
1237894567890123419871236545
62345680139129135781801764994693334


Substract big numbers:
62345678901234567891678345123456789
1237894567890123419871236545
52345687663340000001554925252220244


Multiply big numbers:
62345678901234567891678345123456789
1237894567890123419871236545
77177377243260150103462178714197454736432472780119682305154005


Divide big numbers:
62345678901234567891678345123456789
1237894567890123419871236545
50364288


Divide big numbers: by very small number
62345678901234567891678345123456789
64
974151232831790123307474142554012


Power of big number:
62345678901234567891678345123456789
3
242336636261471172092347146031727004 (Output continue in next line)
371698195628343934238988256152289508 (Output continue in next line)
493964611043228971692389860897069
```


# BigNumber Functions

The library contains the next functions

```ring
FuncAdd(num1,num2)
FuncSubtract(num1,num2)
FuncCompare(num1,num2)
FuncDivide(num1,num2)
FuncMultiply(num1,num2)
FuncPower(num1,num2)
FuncBinaryToDecimal(num1)
FuncDecimalToBinary(num1)
printBinaryDigits(binList)
printDecimalDigits(decList)
```


# BigNumber Class

The library contains the next class

```ring
class BigNumber
	func init aPara
	func operator cOperator, Para
	func print
	func value
```


# Library Source Code

You can see the library source code in : ring/libraries/bignumber folder

Source Code : https://github.com/ring-lang/ring/blob/master/libraries/bignumber/bignumber.ring


## codeeditors

# =
# Using Other Code Editors

We have extensions for the next editors:

- Notepad++
- Geany
- nano
- Atom
- Sublime Text 2
- Visual Studio IDE
- Emacs
- Visual Studio Code (VSCode)
- SpaceVim
- Lite XL

# Using Notepad++

Folder : ring/tools/editors/notepad_plus_plus

- Open Notepad++
- Open the "Language" menu
- Select "Define your language..."
- Click "Import..."
- select `Ring.xml`
- Select "OK" on the "Import successful" dialog and close the "User Defined Language" dialog/panel
- You may need to restart notepad++

:alt: Using Notepad++

# Using Geany

Folder : ring/tools/editors/geany

- Run Geany editor
- Click on "Tools -> configuration files -> filetypes_extensions.conf"  menu
- Add this line "Ring=*.ring;" without quotes after [Extensions]
- In Ubuntu copy file "filetypes.Ring.conf" to folder "/home/USERNAME/filetypes.Ring.conf"
- You can run your files by pressing F5 button

:alt: Using Geany

# Using nano

Folder : ring/tools/editors/nano

Check the ReadMe file for installation instructions.

:alt: Using nano

# Using Atom

Folder : ring/tools/editors/atom

Just Copy the folder atom-language-ring to the next path

```ring
"C:\Users\{UserName}\.atom\Packages"
```

:alt: Using Atom

# Using Sublime Text 2

Folder : ring/tools/editors/sublime text 2

In the folder Sublime_Text_2 you will find the next three files

1 - ring.json-tmlanguage

2 - ring.sublime-build

3 - ring.tmlanguage

Just Copy the files to the next path

```ring
"C:\Users\{UserName}\AppData\Roaming\Sublime Text 2\Packages\User\"
```

The file ring.sublime-build includes the next line

```ring
"cmd": ["B:\\ring\\bin\\ring.exe","$file"],
```

You can modify it according to the ring.exe path in your machine

:alt: Using Sublime Text 2

# Using Visual Studio IDE

Folder : ring/tools/editors/visualstudio

Check the ReadMe file for installation instructions.

:alt: Using Visual Studio

# Using Emacs Editor

Folder : ring/tools/editors/emacs

Check the ReadMe file for installation instructions.

Screen Shot:

:alt: Ring mode for Emacs Editor

# Visual Studio Code

Folder : ring/tools/editors/vscode

Check the ReadMe file for installation instructions.

Screen Shot:

:alt: Ring in Visual Studio Code

# SpaceVim

URL: https://github.com/SpaceVim/SpaceVim

Screen Shot:

:alt: Ring in SpaceVim

# Lite XL

Folder: ring/tools/editors/lite-xl

Screen Shot:

:alt: Ring in Lite XL


## contribute

# =
# How to contribute?

Ring is a free-open source project, Everyone is welcome to contribute to Ring.

Project Home : https://github.com/ring-lang/ring

To editing on web browser without Git client, when login GitHub then click pencil icon in target file. Then, sends pull request.

You can help in many parts in the project

- Documentation
- Testing
- Samples
- Applications
- Editors Support
- Libraries in Ring
- Extensions in C/C++
- Compiler and Virtual Machine (VM)
- Ideas and suggestions

# Special thanks to contributors

Throughout the creation of this project, Ring relied heavily on contributions from experts along with college students.
Their input was invaluable, and we want to take a moment to thank them and recognize them for all of their hard work.

Ring Team: https://ring-lang.github.io/team.html

# Documentation

You can modify anything in the documentation, by updating the text files (*.txt)
in this folder : https://github.com/ring-lang/ring/tree/master/documents/source

The documentation is created using Sphinx : http://www.sphinx-doc.org/en/stable/

# Testing

You can write new tests in this folder

https://github.com/ring-lang/ring/tree/master/language/tests/scripts

# Samples

You can add new samples to this folder

https://github.com/ring-lang/ring/tree/master/samples

# Applications

You can add new applications to this folder

https://github.com/ring-lang/ring/tree/master/applications

# Editors Support

You can help in supporting Ring in different code editors

Check the next folder

https://github.com/ring-lang/ring/tree/master/tools/editors

# Libraries in Ring

You can update and add libraries to this folder

https://github.com/ring-lang/ring/tree/master/libraries

# Extensions in C/C++

You can add and update extensions in this folder

https://github.com/ring-lang/ring/tree/master/extensions

# Compiler and Virtual Machine (VM)

- Source Code (C Language) : https://github.com/ring-lang/ring/tree/master/language/src
- Visual Source (PWCT) : https://github.com/ring-lang/ring/tree/master/language/visualsrc


## demo

# =
# Demo Programs

In this chapter we will see simple demo programs

- Language Shell
- Main Menu

# Language Shell

We can create simple interactive programming environment using the next program

```ring
while true
	see nl + "code:> "
	give cCode
	try
		eval(cCode)
	catch
		see cCatchError
	done
end
```

Output:

```ring
code:> see "hello world"
hello world
code:> for x = 1 to 10 see x + nl next
1
2
3
4
5
6
7
8
9
10

code:> func test see "Hello from test" + nl

code:> test()
Hello from test

code:> bye
```


# Main Menu

Example:

```ring
# Demo Program

while true

	see "

	Main Menu
	===========
	[1] Say Hello
	[2] Sum two numbers
	[3] Stars
	[4] Fact
	[5] Exit

	" give nMenu see nl

	# we can use Switch-ON-Other-OFF instead of IF-BUT-ELSE-OK

	Switch nMenu
	On 1 sayhello()
	On 2 Sum()
	On 3 Stars()
	On 4
		see "Enter Number : " give x
		see "Output : "

		Try
			see Fact(number(x))
		Catch
			see "Error in parameters!" + nl
		Done

	On "5" return
	Other see "bad option" + nl
	Off

end

func sayhello
	see "Enter your name ? " give fname
	see "Hello " + fname + nl

func sum
	see "number 1 : " give num1 see "number 2 : " give num2
	see "Sum : " see 0 + num1 + num2

func stars
	for x = 1 to 10
		see space(8)
		for y = 1 to x see "*" next see nl
	next

func fact x if x = 0 return 1 else return x * fact(x-1) ok

func space x y = "" for t=1 to x y += " " next return y
```

Output:

```ring
Main Menu
===========
[1] Say Hello
[2] Sum two numbers
[3] Stars
[4] Fact
[5] Exit

1

ur name ? Mahmoud Fayed
hmoud Fayed


Main Menu
===========
[1] Say Hello
[2] Sum two numbers
[3] Stars
[4] Fact
[5] Exit

2

 : 3
 : 4
Sum : 7

Main Menu
===========
[1] Say Hello
[2] Sum two numbers
[3] Stars
[4] Fact
[5] Exit

3

*
**
***
****
*****
******
*******
********
*********
**********


Main Menu
===========
[1] Say Hello
[2] Sum two numbers
[3] Stars
[4] Fact
[5] Exit

4

mber : 5
 120

Main Menu
===========
[1] Say Hello
[2] Sum two numbers
[3] Stars
[4] Fact
[5] Exit

5
```


## deployincloud

# =
# Deploying Web Applications using Heroku

In this chapter we will learn about deploying Ring Web Applications in the Cloud using Heroku

# Introduction

We created a new project and tutorial to explain how to deploy Ring web applications in the Cloud using Heroku

Project : https://github.com/ringpackages/RingWebAppOnHeroku

Heroku Website : https://www.heroku.com/

:alt: Ring Web Application in the Cloud

# Usage

To use this project and deploy it on Heroku

(1) Create Heroku account

(2) Open your Heroku account and create new application

Example : testring

Note (You have to select a unique name for your application)

(3) Open the command prompt, Create new folder : MyApp

```ring
md MyApp
```

(4) Open the application folder

```ring
cd MyApp
```

(5) Clone this project using Git (Don't forget the dot in the end to clone in the current directory)

```ring
git clone https://github.com/ringpackages/RingWebAppOnHeroku .
```

(6) Login to Heroku (Enter your Email and Password)

```ring
heroku login
```

(7) Add heroku (remote) to your Git project

change testring to your application name

```ring
heroku git:remote -a testring
```

(8) Set the buildpacks (So Heroku can know how to support your project)

```ring
heroku buildpacks:add --index 1 https://github.com/ringpackages/heroku-buildpack-apt
heroku buildpacks:add --index 2 https://github.com/ringpackages/heroku-buildpack-ring
```

(9) Now build your project and deploy it

```ring
git push heroku master
```

(10) Test your project (In the browser)

```ring
heroku open
```


# Ring source code files and permissions

To be able to run your new Ring scripts, Set the permission of the file to be executable using Git

For example, if you created a file : myscript.ring

```ring
git update-index --chmod=+x myscript.ring
git commit -m "Update file permission"
```

If you are using TortoiseGit, From windows explorer, select the file

Right click ---> Properties ---> Git ---> Executable (+x)

Then commit and deploy!

# Hello World program

file : ringapp/helloworld.ring

```ring
#!/app/runring.sh -cgi

see "content-type: text/html" +nl+nl
see "Hello, World!" + nl
```

file : ringapp/helloworld2.ring

```ring
#!/app/runring.sh -cgi
load "weblib.ring"
import System.Web
new page {
	text("Hello, World!")
}
```


# Application Database

When you deploy the application, Everything will works directly!

No change is required, but in practice, You will need to update the next files to use your database

There are two scripts to interact with the database (We are using PostgreSQL in the cloud)

You will need to update the connection string in these files if you will use another database

- file: ringapp/database/newdb.ring (We run it using the browser for one time to create the tables)
- file: ringapp/datalib.ring (Class: Database)

In your practical projects, You can write better code (To be able to change the database)

Also you can create configuration file (To write the connection string in one place)

Database service : https://www.heroku.com/postgres

# Deploying after updates

Just use Git and commit then push to heroku

file: build.bat contains the next commands for quick tests

```ring
git add .
git commit -m "Update RingWebAppOnHeroku"
git push heroku master
heroku open
```


# Local Tests

Local tests using Ring Notepad on Windows (Using local Apache Web Server)

Replace the first line in the file : ringapp/index.ring with

```ring
#!ring -cgi
```

Then run it from Ring Notepad (Ctrl+F6)


## generalinfo

﻿.. index::

# =
# General Information

This chapter contains general information about the Ring programming language

(1) Ring Architecture
(2) Memory Management
(3) Data Representation

# Ring Architecture

We have the next architecture

(1) Ring Applications (Your Code)  - Written in Ring - See folder : ring/applications
(2) Ring Libraries (StdLib, WebLib, GameEngine, etc) - Written in Ring - See folder : ring/ringlibs
(3) Ring Extensions (RingAllegro, RingQt, etc) - Written in C/C++ (may include Ring code) - See folder : ring/extensions
(4) Ring Virtual Machine (Ring VM) - Written in C language
(5) Operating System (Current Platform) - (Windows, Linux, macOS, Android, etc)

The extensions are just dynamic libraries (DLL, So, Dylib)
You can update the extensions without the need to update your code.

Folder (ring/extensions/libdepwin) ====> C libraries used for building Ring Extensions (written in C) on Windows platform

Folder (ring/ringlibs)  ====> Ring libraries written in Ring itself (StdLib, WebLib, GameEngine, etc)

Folder (ring/language/visualsrc) ====> The Visual Source Code of the Ring Compiler & Ring VM developed using Programming Without Coding Technology (PWCT)

We use the term Ring Library ---> When the library code is written in Ring
We use the term Ring Extension ---> When the library code is Written in C or C++

# Memory Management

(1) When we call function, we get a new scope for this function, inside this scope we store variables.

Also we get Temp. memory for this function. Inside this temp. memory we store temp. lists

All of this will be deleted directly after the end of the function call (end of scope)

(2) In Ring to delete memory, you have the next options

2.1 Wait until the end of the function scope

2.2 Use the Assignment operator

2.3 Use callgc() function (delete temp. lists only)

(3) Ring Memory Management system is Scope-Based and uses Escape Analysis and Optional Reference Counting with cycle detection

In most cases, the SBMM/Escape Analysis is used.
We directly know what will be deleted and what will remain in the memory.

In some cases Ring may use Reference Counting.

For example when we pass a list and sub list to a function
Ring will pass the lists by reference, but what will happens if we deleted the Parent List?
In this case, the Sub List will use reference counting, and when deleting the Parent List, it will stay in memory until the end of the function.

Remember that Ring encourage us to avoid using references, and the
Assignment Operator will copy lists by value, so Ring usage of reference counting is
very limited to special cases and in most cases the Escape Analysis is enough which is very fast.

Starting from Ring 1.9 we extended the Reference Counting support to Ring Extensions and low level C pointers.
So we don't have to care about using fclose() when we use fopen() for example. and the same for
other extensions like RingODBC, RingSQLite, RingMySQL, RingQt, etc.

All of the allocated resources will be cleaned by the Memory Management System when we finish using it (when we lost the last reference).

Starting from Ring 1.18 we added optional references using the Ref() function.

# Data Representation

(1) In Ring, The String is just (Array of bytes)

Ring is 8-bit clean, Each character in the string is 8 bits (1 byte)

So these functions (Int2Bytes(), Float2Bytes() and Double2Bytes()) just return a string.

Also we can store binary data in strings

```ring
mystring = read("myfile.exe")
```

(2) Remember this, when you think about variables

- Value ---> What we have (What we are storing in the computer memory as data) - Low Level Concept
- Type  ---> What we can do with what we have or how we do things with what we have (Just a Logical Concept)

Computer memory ----> Just store [Bytes] - Each byte is 8-bit - (Here we avoid the memory word concept)

These bytes could be grouped together when moved between the memory and the processor registers.
Here we have (The register size) and things like 32-bit and 64-bit for example.
Also we have the bytes order.

Programming Languages ----> Add Types (Just as a concept) to these bytes so we can determine what to do with them and how operations should be done.

And programming language could allow (Type Conversion) ---> Because the Type is a logical concept in most cases, What we really have is just data (Bytes, Bytes Count, Bytes Order, etc)

Ring Stings ----> You have these bytes (each byte is 8-bit) and Ring know the string size (stored as number in the String structure)

So we don't check the NULL character or add it to the end of the string (Not Required)

All operations inside Ring VM, will check the Ring size and deal with the string as binary data (each character is 8-bit)

In the C language ---> The normal case is adding NULL character (\0) to the end of each string

And the string functions check this character, This is not suitable for binary data.

Signed vs Unsigned ---> Is a logical concept which is important when you do arithmetic operations on the data, but when storing the data, if you will include all of the (8-bits) and will not ignore any of them ---> Then don't care.

In Ring, don't think about these details, we are hiding it from you, so you can focus on your application and what you will do.

Think in C when you write C code which could be (based on need) low level code to have control on everything.
----> Good for performance and memory management

Think in Ring when you write Ring code which let you ignore a lot of details and concentrate only on the result
-----> Good for productivity and delivering software quickly

The good news (We can mix between Ring and C in our projects)

(3) The functions Int2Bytes(), Float2Bytes() and Double2Bytes()

These function take input as (Number) ---> Convert it to group of bytes based on the number type (int|float|double) ---> Then return a Ring string that contains these bytes

Int2Bytes() ---> Ring string (Group of bytes) and the string size = sizeof(int)

Float2Bytes() ---> Ring string (Group of bytes) and the string size = sizeof(float)

Double2Bytes() ---> Ring string (Group of bytes) and the string size = sizeof(double)

Example:

```ring
? len( int2bytes(1) )
? len( float2bytes(1) )
? len( double2bytes(1) )
```

Output:

```ring
4
4
8
```

(4) Storing Numbers

When we use a number, Ring always use the (Double) data type for representing these numbers in memory.
This is important to know when we do arithmetic operations on numbers.

But when we convert the number to a String using "" + number  or using string(number) we get a string where each digit is represented in 1 byte (Not good idea for storage, but useful for string processing)

If you need the number to be represented in specific size (int|float|double) for storage then use bytes2int() , bytes2float() and bytes2double() when writing the data to binary files.

Ring Number (double) ----> int2bytes()  - will cast the number from double to int then return the bytes ----> 4 bytes (Ring String)

Ring Number (double) ----> float2bytes()  - will cast the number from double to float then return the bytes ----> 4 bytes (Ring String)

Ring Number (double) ----> double2bytes()  - will use the number (double) to return the bytes ----> 8 bytes (Ring String)

The (int) type is used only for internal Ring operations, but Ring applications|code will use only the (double) type for numbers.

(5) The Unsigned() Function

The function unsigned() expect the first and the second parameters as numbers

```ring
unsigned(nNumber1,nNumber2,cOperator)
```

We can use the bytes2int() function to convert the bytes to a number

Example:

```ring
B = list(4)

for k=1 to 4
{
	B[k]= Space(4)
	for kk=1 to 4 { B[k][kk]= char(60+4*k +kk) }
	? " B" +k +": " +B[k]
}

A12= Space(4)     A12= bytes2int(B[1]) ^ bytes2int(B[2])
? "A12: " +string(A12)
A34= Space(4)     A34= bytes2int(B[3]) ^ bytes2int(B[4])
? "A34: " +string(A34)
A12= space(4)     A12= Unsigned(bytes2int(B[1]),bytes2int(B[2]),"^")
? "unsigned A12: " +A12
A34= space(4)     A34= Unsigned(bytes2int(B[3]),bytes2int(B[4]),"^")
? "unsigned A34: " +A34
```

Output:

```ring
B1: ABCD
B2: EFGH
B3: IJKL
B4: MNOP
A12: 201589764
A34: 470025220
unsigned A12: 201589764
unsigned A34: 470025220
```


## languagedesign

﻿.. index::

# =
# Language Design

In this chapter we will learn about the basic concepts behind the language design.

# Why Ring?

The language is simple, trying to be natural, encourage organization and comes
with transparent and visual implementation. It comes with compact syntax and a
group of features that enable the programmer to create natural interfaces and
declarative domain-specific languages in a fraction of time. It is very small,
fast and comes with smart garbage collector that puts the memory under the
programmer control. It supports many programming paradigms, comes with useful
and practical libraries. The language is designed for productivity and developing
high quality solutions that can scale.

# Designed for a Clear Goal

- Applications programming language.
- Productivity and developing high quality solutions that can scale.
- Small and fast language that can be embedded in C/C++ projects.
- Simple language that can be used in education and introducing Compiler/VM concepts.
- General-Purpose language that can be used for creating domain-specific libraries, frameworks and tools.
- Practical language designed for creating the next version of the Programming Without Coding Technology software.

# Simple

Ring is a very simple language, and has a very straightforward syntax. It encourages programmers to program without boilerplate code

```ring
See "Hello, World!"
```

The Main function is optional and will be executed after the statements, and is useful for using the local scope.

```ring
Func Main
	See "Hello, World!"
```

Uses Dynamic Typing and Lexical scoping. No $ is required before the variable name!
You can use the '+' operator for string concatenation and the language is weakly typed and will convert automatically between numbers and strings based on the context.

```ring
nCount = 10	# Global variable
Func Main
	nID = 1	# Local variable
	See "Count = " + nCount + nl + " ID = " + nID
```


# Trying to be natural

Ring is not case-sensitive

```ring
See "Enter your name ? "
Give name
See "Hello " + Name	# Name is the same as name
```

The list index starts from 1

```ring
aList = ["one","two","three"]
See aList[1]	# print one
```

Call functions before definition

```ring
one()
two()
three()
Func one
	See "One" + nl
Func two
	See "two" + nl
Func three
	See "three" + nl
```

The assignment operator uses Deep copy (no references in this operation)

```ring
aList = ["one","two","three"]
aList2 = aList
aList[1] = 1
see alist[1]	# print 1
see aList2[1]	# print one
```

Pass numbers and strings by value, but pass lists and objects by reference.
The for in loop can update the list items.

```ring
Func Main
	aList = [1,2,3]
	update(aList)
	see aList	# print one two three

Func update aList
	for x in aList
		switch x
		on 1 x = "one"
		on 2 x = "two"
		on 3 x = "three"
		off
	next
```

Using Lists during definition

```ring
aList = [ [1,2,3,4,5] , aList[1] , aList[1] ]
see aList       # print 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5
```

Exit from more than one loop

```ring
for x = 1 to 10
		for y = 1 to 10
				see "x=" + x + " y=" + y + nl
				if x = 3 and y = 5
						exit 2     # exit from 2 loops
				ok
		next
next
```


# Encourage Organization

The language encourage organization, Forget bad days using languages where the programmer start with function then class then function and a strange mix between things!

Each source file follow the next structure

- Load Files
- Statements and Global Variables
- Functions
- Packages and Classes

This enable us to use Packages, Classes and Functions without the need to use a keyword to end these components.

We can write one line comments and multi-line comments
The comment starts with # or //
Multi-line comments are written between /* and */

```ring
/*
	Program Name : My first program using Ring
	Date         : 2015.05.08
*/

See "What is your name? " 	# print message on screen
give cName 			# get input from the user
see "Hello " + cName		# say hello!

// See "Bye!"
```


# Data Representation

Ring contains only 4 types that represent the program data

These types are (String, Number, List & Object)

The idea is to have many use cases for each type which increase the flexibility and the ability
to write functions that are more usable in different situations.

The String type is used to represent:
- One character
- A string of many characters
- Multi-line string
- Binary Data

```ring
cStr1 = "a"			# One character
cStr2 = "Hello, World!" 	# A string of many characters
cStr3 = "Hello
Welcome to the Ring language!
"				# Multi-line string
cStr4 = read(EXEFileName())	# Read executable file (Binary Data)
```

The Number type is used to represent
- Boolean Values
- Signed/Unsigned Integers
- Float/Double

```ring
nNum1 = True		# Boolean Value (1)
nNum2 = False		# Boolean Value (0)
nNum3 = 10		# Integer
nNum4 = -10		# Signed Integer
nNum5 = 1250.11		# Float/Double
```

The List type is used instead of
- One Dimension Arrays
- Multi-Dimension Arrays
- Lists of multiple types
- Nested Lists
- Hash Tables (Key & Value)
- Tree
- Wrapper around a C Pointer

```ring
aList1 = ["one","two","three"]				# Strings
aList2 = [1,2,3,4,5,6,7,8,9,10]				# Numbers
aList3 = ["Ring",1234]					# Multiple types
aList4 = [["Fayed","Egypt"],["Mansour","Tunisia"]]  	# Nested Lists
aList5 = [ :name = "Fayed", :country = "Egypt"]		# Hash Tables
```

The Object type is used to represent objects created from classes

Using classes and operator overloading we can create custom types

# Compact Syntax

The language is not line sensitive, you don't need to write ; after statements, also you don't need to press ENTER or TAB, so we can write the next code

```ring
See "The First Message"	See " Another message in the same line! " + nl
See "Enter your name?" Give Name See "Hello " + Name
```

The next code create a class called Point contains three attributes X,Y and Z. No keywords is used to end the package/class/function definition. Also, we can write the attributes names directly below the class name.

```ring
Class Point X Y Z
```

We can use classes and functions before their definition, In this example we will create new object, set the object attributes then print the object values.

```ring
o1 = New point	o1.x=10    o1.y=20   o1.z=30	See O1	Class Point X Y Z
```

Instead of using the dot '.' operator to access the object attributes and methods we can use braces { } to access the object, then we can use the object attributes and methods.

```ring
o1 = New point { x=10 y=20 z=30 } See O1  Class Point X Y Z
```

Now we will call a method after accessing the object using { }

```ring
oPerson = new Person
{
	Name = "Somebody"
	Address = "Somewhere"
	Phone = "0000000"
	Print()			# here we call the Print() method
}
Class Person Name Address Phone
	Func Print
		See "Name :" + name + nl +
			"Address :" + Address + nl +
			"Phone : " + phone + nl
```

When we use { } to access the object then write any attribute name, the language will check the class for any setter/getter methods that will be called automatically.

```ring
New Number {
		See one		# Execute GetOne()
		See two		# Execute GetTwo()
		See three	# Execute GetThree()
}
Class Number one two three
	Func GetOne
		See "Number : One" + nl
		return 1
	Func GetTwo
		See "Number : Two" + nl
		return 2
	Func GetThree
		See "Number : Three" + nl
		return 3
```


# Define Natural Statements

After the object access using { } if the class contains a method called BraceEnd() it will be executed!

```ring
TimeForFun = new journey
# The first surprise!
TimeForFun {
	Hello it is me		# What a beautiful programming world!
}
# Our Class
Class journey
	hello=0 it=0 is=0 me=0
	func GetHello
		See "Hello" + nl
	func braceEnd
		See "Goodbye!" + nl
```

We can execute code written in strings using the Eval() function

```ring
cCode = "See 'Code that will be executed later!' "
Eval(cCode)	# execute the code to print the message
```

We can create a list then execute code generated from that list

```ring
aWords = ["hello","it","is","me"]
for word in aWords cCode=word+"=0" eval(cCode) next
```

We can read text files using the Read(cFileName) function and we can write files using the Write(cFileName,cString) function.

```ring
See "Enter File Name:" Give cFileName See Read(cFileName) # Print the file content
```

The next example presents how to create a class that defines two instructions
The first instruction is : I want window
The second instruction is : Window title = Expression
Also keywords that can be ignored like the ‘the’ keyword

```ring
New App
{
	I want window
	The window title = "hello world"
}

Class App

	# Attributes for the instruction I want window
		i want window
		nIwantwindow = 0
	# Attributes for the instruction Window title
	# Here we don't define the window attribute again
		title
		nWindowTitle = 0
	# Keywords to ignore, just give them any value
		the=0

	func geti
			if nIwantwindow = 0
				nIwantwindow++
			ok

	func getwant
			if nIwantwindow = 1
				nIwantwindow++
			ok

	func getwindow
			if nIwantwindow = 2
				nIwantwindow= 0
				see "Instruction : I want window" + nl
			ok
			if nWindowTitle = 0
				nWindowTitle++
			ok

	func settitle cValue
			if nWindowTitle = 1
				nWindowTitle=0
				see "Instruction : Window Title = " + cValue + nl
			ok
```

To complete the previous example, use read() to get the content of a file that contains

```ring
I want window
The window title = "hello world"
```

Then use eval() to execute the content of that file!.
Also, you can update the methods GetWindow() and SetTitle() to create Real windows using the GUI Library

# Define Declarative Languages

We learned how to use Natural statements to execute our code and using the same features we can use nested structures to execute our code.

The next example from the Web library, generate HTML document using the Bootstrap library. No HTML code is written directly in this example, we created a similar language (just as example) Then using this declarative language that uses nested structures, we generated the HTML Document..
The idea in this example is that the GetDiv() and GetH1() methods return an object that we can access using {} and after each object access the method BraceEnd() will be executed to send the generated HTML to the parent object until we reach to the root where BraceEnd() will print the output.

```ring
Load "weblib.ring"
Import System.Web

Func Main

  BootStrapWebPage()
  {
	div
	{
	  classname = :container
	  div
	  {
		classname = :jumbotron
		H1 {   text("Bootstrap Page")   }
	  }
	  div
	  {
		classname = :row
		for x = 1 to 3
		  div
		  {
		    classname = "col-sm-4"
		    H3 { html("Welcome to the Ring programming language") }
		    P  { html("Using a scripting language is very fun!") }
		  }
		next
	  }
	}
  }
```

The classes that power the declarative interface looks like this

```ring
Class Link from ObjsBase
	title  link
	Func braceend
		cOutput = nl+GetTabs() + "<a href='" +
			  Link + "'> "+ Title + " </a> " + nl

Class Div from ObjsBase
	Func braceend
		cOutput += nl+'<div'
		addattributes()
		AddStyle()
		getobjsdata()
		cOutput += nl+"</div>" + nl
		cOutput = TabMLString(cOutput)
```


# Transparent Implementation

Ring comes with transparent implementation. We can know what is happening in each compiler stage and what is going on during the run-time by the Virtual Machine Example : ring helloworld.ring -tokens -rules -ic

```ring
See "Hello, World!"
```

Output

```ring
==================================================================
Tokens - Generated by the Scanner
==================================================================

   Keyword : SEE
   Literal : Hello, World!
   EndLine

==================================================================

==================================================================
Grammar Rules Used by The Parser
==================================================================

Rule : Program --> {Statement}

Line 1
Rule : Factor --> Literal
Rule : Range --> Factor
Rule : Term --> Range
Rule : Arithmetic --> Term
Rule : BitShift --> Arithmetic
Rule : BitAnd --> BitShift
Rule : BitOrXOR -->  BitAnd
Rule : Compare --> BitOrXOR
Rule : EqualOrNot --> Compare
Rule : LogicNot -> EqualOrNot
Rule : Expr --> LogicNot
Rule : Statement  --> 'See' Expr

==================================================================



==================================================================
Byte Code - Before Execution by the VM
==================================================================

	 PC      OPCode        Data

	  1     FuncExE
	  2       PushC   Hello, World!
	  3       Print
	  4  ReturnNull

==================================================================

Hello, World!
```


# Visual Implementation

The Ring programming language is designed using the PWCT visual programming tool
and you will find the visual source of the language in the folder "language/visualsrc" - *.ssf
files and the generated source code (In the C Language) in the	language/src folder and
the language/include folder.

The next screen shot from the ring_vm.ssf file (Generate ring_vm.c and ring_vm.h)

The next screen shot from the ring_list.ssf file (Generate ring_list.c and ring_list.h)

# Smart Garbage Collector

Avoid memory problems :-

- Invalid Memory Access
- Memory leaks
- Uninitialized Memory Access
- Dangling pointer

Rules :-

- Global variables always stay in the memory, until you delete these variables using the assignment statement.
- Local variables always deleted after the end of the function.
- The programmer have full control on when to delete the variable from the memory using the Assignment statement.

Example:

```ring
aList = [1,2,3,4,5]
aList = "nice"
```

After the second line directly, The list [1,2,3,4,5] will be deleted from the memory and we will have a string "nice"

- The programmer can call the function callgc() to force running the garbage collector.
- If we have a reference to a variable (when we pass objects and lists to functions), then deleting variables will be based on reference counting, if no references everything will be deleted, but if we have a reference, the data will stay in memory.

# No Global Interpreter (VM) Lock - No GIL

When we use threads in Ring applications, We don't have Global Interpreter Lock (No GIL)

So threads can work in parallel and execute Ring instructions at the same time

This enables true parallelism for faster multi-threaded execution

# Fast Enough For Many Applications

Ring is designed to be a simple, small and flexible language in the first place, but also it is fast enough for many applications.

Also when we need more speed we can use C/C++ extensions!


## multilanguage

﻿.. index::

# =
# Multi-language Applications

There are many ways to create multi-language Ring application!

In this chapter we will learn about using the String2Constant tool

# Using String2Constant

Starting from Ring 1.8 we have the String2Constant application

You will find this tool in the ring/tools/string2constant folder

Using this tool we can convert the source code to be based on constants instead of string literals

Then we can store constants in separate source code files that we can translate to different languages

Where we can have special file for each language, like (English.ring, Arabic.ring and so on)

Using this simple tool, the Form Designer is translated to Arabic language too just as an example.

:alt: String2Constant

# Form Designer Translation

You will find the form designer application in the ring/applications/formdesigner folder

The files used for translation are stored in the ring/applications/formdesigner/translation folder

You will find two files

- Arabic.ring
- English.ring

You can check these files to get an idea about constants definition.

The next section from the English.ring file

```ring
T_LANGUAGE = "english"
T_LAYOUTDIRECTION = 0			# Left to Right

T_FORMDESIGNER_FORMDESIGNER 		= "Form Designer"
T_FORMDESIGNER_FORMTITLE 		= "Form1"

T_FORMDESIGNER_FILE 			= "File"
T_FORMDESIGNER_NEW 			= "New"
T_FORMDESIGNER_OPEN 			= "Open"
T_FORMDESIGNER_SAVE 			= "Save"
T_FORMDESIGNER_SAVEAS 			= "Save As"
T_FORMDESIGNER_CLOSE 			= "Close"
```

The form designer source code files will use these constants instead of typing the string literals

the next section from the formdesigner/mainwindow/formdesignerview.ring

```ring
# Create the Main Window and use the Mdi Area
	win = new qMainwindow() {
		setWindowTitle(T_FORMDESIGNER_FORMDESIGNER) # "Form Designer"
		setcentralWidget(this.oArea)
		setLayoutDirection(T_LAYOUTDIRECTION)
	}
```

- Using comments we can write the string literal to get more readable code.

- Using setLayoutDirection() method we can set the window direction to be Right To Left.

- Using the Load command, We can determine which translation file to use.

# Forms Translation

After creating the form using the Form Designer, the View class will be generated.

We don't modify the view class, We just add the translation through the Controller class.

For example, we have the form file : ring/formdesigner/selobjects/selobjects.rform

:alt: Form Translation

And we add the translation through the Controller class using the next code

And we define the constants in English.ring and Arabic.ring

```ring
class selobjectsController from windowsControllerParent

	oView = new selobjectsView  {
		ListObjects.setselectionmode(QAbstractItemView_MultiSelection)
		win.setwindowmodality(2)
		# Translation
			win.setWindowTitle(T_FORMDESIGNER_SELOBJECTS_TITLE)
			win.setLayoutDirection(T_LAYOUTDIRECTION)
			labelobjects.setText(T_FORMDESIGNER_SELOBJECTS_OBJECTS)
			btnSelect.setText(T_FORMDESIGNER_SELOBJECTS_SELECT)
			btnClose.setText(T_FORMDESIGNER_SELOBJECTS_CLOSE)
	}
```


## performancetips

﻿.. index::

# =
# Performance Tips

In this chapter we will learn more about the Ring performance.

Tested using Victus Laptop [13th Gen Intel(R) Core(TM) i7-13700H, Windows 11, Ring 1.21]

# Introduction

Ring is designed to be a simple, small and flexible language in the first place, but also it is fast enough for many applications.

Ring can do each of the following tasks in around one second.

(1) Compiling 200,000 lines of code
(2) Executing an empty loop that count from 1 to 100,000,000
(3) Creating list contains 7,000,000 items then summing all of the list items
(4) Printing numbers from 1 to 40,000 using command prompt
(5) Printing numbers from 1 to 500,000 using output redirection and Ring Notepad
(6) Adding 60,000 nodes to the TreeWidget in GUI applications
(7) Adding 60,000 items to the ListWidget in GUI applications
(8) Executing 3000 search operations using linear search in a list contains 100,000 items, trying to find the last item (The worst case)

Also when we need more speed we can use C/C++ extensions!

Example:

```ring
t1=clock()
for t=1 to 100_000_000 next
? (clock()-t1)/clockspersecond()
```

Output:

```ring
1.06
```

Example:

```ring
? "Create list contains 100,000 items"
nMax  = 100_000
aList = list(nMax)
for t=1 to nMax aList[t] = t next

? "Do 3000 search operations - Find the last item (Worst Case!)"
c = clock()

for t=1 to 3000
       	find(alist,nMax)
next

? "Time: " + ( clock() - c ) / clockspersecond() + " seconds"
```

Output:

```ring
Create list contains 100,000 items
Do 3000 search operations - Find the last item (Worst Case!)
Time: 0.81 seconds
```

Example:

```ring
load "guilib.ring"

C_NODESCOUNT = 60000

func main
new QApp {
	win = new QWidget() {
		move(100,100) resize(500,500)
		setWindowTitle("Many Tree Items - Testing Performance")
		tree = new QTreeWidget(win) {
			blocksignals(True) setUpdatesEnabled(False)
			root = new qTreeWidgetItem()
			root.setText(0,"The Root Node")
			t1 = clock()
			for t = 1 to C_NODESCOUNT
				oItem = new qTreeWidgetItem()
				oItem.settext(0,"Item " + t)
				root.addchild(oItem)
			next
			cTime = (clock()-t1)/clockspersecond()
			setHeaderLabel("Creating "+C_NODESCOUNT+" nodes in " + cTime + " seconds.")
			addTopLevelItem(root)
			expanditem(root)
			blocksignals(False) setUpdatesEnabled(True)
		}
		oLayout = new QVBoxLayout() {
			addWidget(tree)
		}
		setLayout(oLayout)
		show()
	}
	exec()
}
```

Output:

:alt: Many Tree Items

# Creating Lists

Example:

```ring
decimals(3)
C_COUNT = 100_000

? "Create the list using the Range operator"
t1 = clock()
aList = 1:C_COUNT
? "Time : " + ((clock()-t1)/clockspersecond()) + " seconds"

? "Create the list using the For loop"
t1 = clock()
aList = []
for x = 1 to C_COUNT
	aList + x
next
? "Time : " + ((clock()-t1)/clockspersecond()) + " seconds"

? "Create the list using the list() function and the For loop"
t1 = clock()
aList = list(C_COUNT)
for x = 1 to C_COUNT
	aList[x] = x
next
? "Time : " + ((clock()-t1)/clockspersecond()) + " seconds"
```

Output:

```ring
Create the list using the Range operator
Time : 0.001 seconds
Create the list using the For loop
Time : 0.009 seconds
Create the list using the list() function and the For loop
Time : 0.012 seconds
```

> **Note:**

> **Tip:**

# Arithmetic Operations

Example:

```ring
C_COUNT = 1_000_000

? "Using * operator"
t1 = clock()
out = 10
for x = 1 to C_COUNT
	out = out * 2
next
? "Time : " + ((clock()-t1)/clockspersecond()) + " seconds"

? "Using *= operator"
t1 = clock()
for x = 1 to C_COUNT
	out *= 2
next
? "Time : " + ((clock()-t1)/clockspersecond()) + " seconds"
```

Output:

```ring
Using * operator
Time : 0.08 seconds
Using *= operator
Time : 0.07 seconds
```

> **Note:**

# Using len() and For Loops

Example:

```ring
aList = 1:1000000

? "Using len() in the For loop"
t1 = clock()
for x = 1 to len(aList)
next
? "Time : " + ((clock()-t1)/clockspersecond()) + " seconds"

? "Using len() before the For loop"
t1 = clock()
nMax = len(aList)
for x = 1 to nMax
next
? "Time : " + ((clock()-t1)/clockspersecond()) + " seconds"
```

Output:

```ring
Using len() in the For loop
Time : 0.06 seconds
Using len() before the For loop
Time : 0.03 seconds
```

> **Note:**

# Calling Functions and Methods

Example:

```ring
? "calling 100000 functions"
t1 = clock()
for x = 1 to 100000
	test()
next
? "Time : " + ((clock()-t1)/clockspersecond()) + " seconds"

o1 = new test

? "calling 100000 methods using the dot operator"
t1 = clock()
for x = 1 to 100000
	o1.test()
next
? "Time : " + ((clock()-t1)/clockspersecond()) + " seconds"

? "calling 100000 methods using braces "
t1 = clock()
for x = 1 to 100000
	o1 { test() }
next
? "Time : " + ((clock()-t1)/clockspersecond()) + " seconds"

? "calling 100000 methods using braces (outside the loop) "
t1 = clock()
o1 {
for x = 1 to 100000
	test()
next
}
? "Time : " + ((clock()-t1)/clockspersecond()) + " seconds"

func test

class test
	func test
```

Output:

```ring
calling 100000 functions
Time : 0.01 seconds
calling 100000 methods using the dot operator
Time : 0.04 seconds
calling 100000 methods using braces
Time : 0.09 seconds
calling 100000 methods using braces (outside the loop)
Time : 0.03 seconds
```

> **Note:**

> **Note:**

> **Tip:**


## resources

# =
# Resources

In this section you will find resources about the language

# Ring Language Website

For news about the language check the website

URL: https://ring-lang.github.io/

# Source Code

Ring is Free-Open Source (MIT License)

URL: https://github.com/ring-lang/ring

# Ring Group

If you have any question or would like to send a bug report

URL: https://groups.google.com/g/ring-lang

# Ring Team

URL: https://ring-lang.github.io/team.html


## ring_cloud

# Deploying Ring Web Applications using Docker

Chapter Author: Youssef Saeed

This tutorial guides you through containerizing a Ring application with Docker and setting up a reverse proxy for cloud deployment. We will explore three popular reverse proxy solutions: **Nginx** for a traditional, robust setup, **Traefik** for modern, dynamic routing, and **Caddy** for ultimate simplicity and automated HTTPS. You will learn how to create a production-ready setup using Docker Compose.

:depth: 2

## ring_cloud_cgi

# Deploying Ring Web Applications to Shared Hosting

Chapter Author: Youssef Saeed

While modern application deployment often involves containers, many hosting environments—especially traditional shared hosting panels like cPanel and Plesk—do not allow running persistent background processes. For these platforms, the classic **CGI (Common Gateway Interface)** model remains the perfect and most compatible solution.

This tutorial guides you through deploying Ring applications as CGI scripts. We will use a powerful, secure CGI wrapper script that makes the process robust and reliable across different hosting environments.

:depth: 2
