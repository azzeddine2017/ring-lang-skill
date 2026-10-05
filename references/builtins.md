# Ring Built-in Functions Reference (Ring 1.27)

Ring provides 258 built-in functions implemented natively in C for high performance. All function names are **case-insensitive**.

---

## 1. Input / Output & Printing

| Function | Description | Example |
|---|---|---|
| `see expr` / `put expr` | Print expression without newline | `see "Hello"` |
| `? expr` | Print expression followed by newline | `? "Count: " + 5` |
| `give var` / `get var` | Read text line from stdin into variable | `give cName` |
| `print(expr)` | Standard printing (defined via stdlib) | `print("Hello #{cName}\n")` |

---

## 2. String Functions

| Function | Description | Example |
|---|---|---|
| `len(cStr)` | Return string length (bytes/characters) | `len("hello")` → `5` |
| `lower(cStr)` | Convert string to lower case | `lower("RING")` → `"ring"` |
| `upper(cStr)` | Convert string to UPPER case | `upper("ring")` → `"RING"` |
| `trim(cStr)` | Remove leading and trailing whitespace | `trim("  abc  ")` → `"abc"` |
| `left(cStr, n)` | Get first `n` characters | `left("abcdef", 3)` → `"abc"` |
| `right(cStr, n)` | Get last `n` characters | `right("abcdef", 3)` → `"def"` |
| `substr(cStr, nStart, [nCount])` | Substring (1-based index) | `substr("abcdef", 2, 3)` → `"bcd"` |
| `substr(cStr, cSub)` | Find 1-based index of substring in string (0 if not found) | `substr("hello", "ll")` → `3` |
| `substr(cStr, cFind, cReplace)` | Replace all occurrences of `cFind` with `cReplace` | `substr("a-b-c", "-", ":")` → `"a:b:c"` |
| `lines(cStr)` | Return number of lines in string | `lines(cText)` |
| `str2list(cStr)` | Convert newline-separated string into a list of lines | `aLines = str2list(cText)` |
| `list2str(aList)` | Join list items with newlines into a string | `cText = list2str(aLines)` |
| `str2hex(cStr)` | Convert string to hex representation | `str2hex("abc")` |
| `hex2str(cHex)` | Convert hex string back to raw string | `hex2str("616263")` |
| `ascii(cChar)` | Get ASCII code of character | `ascii("A")` → `65` |
| `char(nCode)` | Get character from ASCII code | `char(65)` → `"A"` |
| `strcmp(s1, s2)` | Compare two strings (-1, 0, 1) | `strcmp("a", "b")` |
| `starts_with(str, sub)` | Check if string starts with prefix (case-sensitive) | `starts_with(s, "abc")` |
| `ends_with(str, sub)` | Check if string ends with suffix (case-sensitive) | `ends_with(s, ".ring")` |

---

## 3. List Manipulation Functions (1-based indexing)

| Function | Description | Example |
|---|---|---|
| `len(aList)` | Return number of items in list | `len([1,2,3])` → `3` |
| `add(aList, item)` | Append item to end of list (modifies in place) | `add(aList, "new item")` |
| `del(aList, nIndex)` | Delete item at 1-based index | `del(aList, 1)` |
| `insert(aList, nIndex, item)`| Insert item before 1-based index | `insert(aList, 2, "mid")` |
| `find(aList, value)` | Find 1-based index of value (0 if not found) | `find(aList, "target")` |
| `find(aList, value, nCol)` | Find row index where column `nCol` equals value in 2D list | `find(aTable, "ID_123", 1)` |
| `sort(aList)` | Sort list in ascending order | `sort([3, 1, 2])` → `[1, 2, 3]` |
| `sort(aList, nCol)` | Sort 2D list / table by column index | `sort(aTable, 2)` |
| `reverse(aList)` | Reverse list items | `reverse([1, 2, 3])` → `[3, 2, 1]` |
| `binarysearch(aList, val)` | Fast binary search on sorted list | `binarysearch(aList, 42)` |
| `list(nSize)` | Create a list with `nSize` empty strings | `a = list(10)` |
| `matrix(nRows, nCols)` | Create a 2D matrix initialized to 0 | `m = matrix(3, 3)` |

---

## 4. Type Checking & Conversion

| Function | Description | Example |
|---|---|---|
| `type(x)` | Returns `"STRING"`, `"NUMBER"`, `"LIST"`, `"OBJECT"` | `type([1,2])` → `"LIST"` |
| `isstring(x)` | Check if variable is a string | `isstring("abc")` → `1` |
| `isnumber(x)` | Check if variable is a number | `isnumber(123)` → `1` |
| `islist(x)` | Check if variable is a list | `islist([])` → `1` |
| `isobject(x)` | Check if variable is an object instance | `isobject(oItem)` → `1` |
| `isnull(x)` | Check if variable/pointer is NULL | `isnull(p)` |
| `number(cStr)` | Convert numeric string to number | `number("123.45")` → `123.45` |
| `string(nNum)` | Convert number to string | `string(100)` → `"100"` |
| `decimals(n)` | Set float precision (default 2, max 90) | `decimals(4)` |

---

## 5. File & Directory System Functions

| Function | Description | Example |
|---|---|---|
| `read(cFileName)` | Read entire file content into string | `cContent = read("file.txt")` |
| `write(cFileName, cData)` | Write string data to file (overwrites) | `write("out.txt", cData)` |
| `fexists(cFilePath)` | Check if file exists (returns 1 or 0) | `if fexists("a.txt") ...` |
| `direxists(cDirPath)` | Check if directory exists | `if direxists("src") ...` |
| `dir(cDirPath)` | List files/subdirs as a 2D list: `[[name, is_dir, size], ...]` | `aFiles = dir(".")` |
| `fopen(cFile, cMode)` | Open file handle (`"r"`, `"w"`, `"a"`, `"rb"`, `"wb"`) | `fp = fopen("a.bin", "rb")` |
| `fclose(fp)` | Close file handle | `fclose(fp)` |
| `fgetc(fp)` | Read single character | `c = fgetc(fp)` |
| `fputc(fp, c)` | Write single character | `fputc(fp, "a")` |
| `fgets(fp, nSize)` | Read line up to `nSize` | `cLine = fgets(fp, 1024)` |
| `fputs(fp, cStr)` | Write string to file handle | `fputs(fp, "line\n")` |
| `remove(cFileName)` | Delete file | `remove("temp.txt")` |
| `rename(cOld, cNew)` | Rename/move file | `rename("a.txt", "b.txt")` |
| `tempname()` | Generate unique temporary filename | `cTemp = tempname()` |
| `currentdir()` | Get current working directory | `cDir = currentdir()` |
| `exefilename()` | Get full path to Ring executable | `cRing = exefilename()` |
| `filename()` | Get path of currently executing Ring script | `cScript = filename()` |

---

## 6. Math Functions

| Function | Description |
|---|---|
| `sin(x)`, `cos(x)`, `tan(x)` | Trigonometric functions (radians) |
| `asin(x)`, `acos(x)`, `atan(x)`, `atan2(y, x)` | Inverse trigonometric functions |
| `sinh(x)`, `cosh(x)`, `tanh(x)` | Hyperbolic functions |
| `sqrt(x)` | Square root |
| `pow(base, exp)` | Power function (`base ** exp`) |
| `log(x)`, `log10(x)` | Natural and base-10 logarithm |
| `exp(x)` | Exponential $e^x$ |
| `floor(x)`, `ceil(x)` | Floor and Ceiling rounding |
| `random(nMax)` | Generate random integer between 0 and `nMax` |
| `srandom(nSeed)` | Seed random number generator |
| `unsigned(n, cType)` | Unsigned number conversion |

---

## 7. Date and Time Functions

| Function | Description | Example |
|---|---|---|
| `date()` | Current date string (`dd/mm/yyyy`) | `date()` → `"05/10/2026"` |
| `time()` | Current time string (`hh:mm:ss`) | `time()` → `"14:30:15"` |
| `timelist()` | Returns 16-element list with granular clock/date data | `aTime = timelist()` |
| `clock()` | CPU clock ticks | `nStart = clock()` |
| `clockspersecond()` | Number of clock ticks per second | `nSec = (clock() - nStart)/clockspersecond()` |
| `epochtime(date, time)` | Convert date/time to UNIX epoch timestamp | `nEpoch = epochtime(date(), time())` |

---

## 8. System & Runtime Functions

| Function | Description | Example |
|---|---|---|
| `sysargv` | Global 1-based list containing CLI arguments: `[ring.exe, script.ring, arg1, ...]` | `cArg = sysargv[3]` |
| `system(cCmd)` | Execute OS shell command | `system("mkdir test")` |
| `eval(cCode)` | Evaluate Ring source string dynamically in active VM | `eval("? 10 + 20")` |
| `raise(cMsg)` | Raise runtime exception | `raise("Custom Error")` |
| `assert(cond)` | Trigger R48 error if condition evaluates to 0 | `assert(nCount > 0)` |
| `exit [nLevel]` | Exit innermost (or N-nested) loops | `exit 2` |
| `bye` | Immediately exit VM / application | `bye` |
| `callgc()` | Explicitly trigger Garbage Collector cycle | `callgc()` |
| `sysget(cEnvVar)` | Get environment variable | `cPath = sysget("PATH")` |
| `sysset(cEnv, cVal)`| Set environment variable | `sysset("MODE", "DEBUG")` |
| `iswindows()`, `islinux()`, `ismacos()`, `isandroid()`, `iswasm()` | Platform identification functions (return 1 or 0) | `if iswindows() ...` |
| `ringvm_see(expr)` | VM direct print | `ringvm_see("raw")` |
| `ringvm_give()` | VM direct input | `c = ringvm_give()` |
| `ring_state_init()` | Create embedded Ring VM instance in C/extensions | |
| `ring_state_runcode(pState, cCode)` | Run code in sub-VM state | |
| `ring_state_delete(pState)` | Destroy embedded Ring VM instance | |
