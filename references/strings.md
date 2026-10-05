# Strings

In this chapter we learn about string creation and manipulation in Ring.

# String Literals

Syntax:

```ring
cStr  = "This is a string"
cStr2 = 'Another string'
cStr3 = :JustAnotherString
cStr4 = `Yet "another" 'string' ! `
```

# Get String Length

```ring
len(string) ---> string length
```

Example:

```ring
cStr = "How are you?"
see "String size : " + len(cStr) + nl
```

# Convert Letters Case

```ring
lower(string) ---> convert string letters to lower case
upper(string) ---> convert string letters to UPPER case
```

# Access String Letters (1-based index)

```ring
string[index] ---> get string character
string[index] = letter  # set single character
```

Example:

```ring
cName = "hello"
cName[1] = upper(cName[1])   # "Hello"
```

# Left() & Right() & Trim() Functions

```ring
left(string, count)    # first count characters
right(string, count)   # last count characters
trim(string)           # strip whitespace
```

# Substr() Function

```ring
# 1. Find substring position (1-based, 0 if not found)
nPos = substr(cStr, "Ring")

# 2. Get substring from position to end
cSub = substr(cStr, nPos)

# 3. Get N characters from position
cSub = substr(cStr, nPos, 4)

# 4. Replace substring
cNew = substr(cStr, "old", "new")
cNew = substr(cStr, "old", "new", 1)  # case-insensitive
```

# str2list() and list2str() Functions

Convert newline-separated string to a list of lines and vice versa:

```ring
aLines = str2list(cText)
cText  = list2str(aLines)
```

# String Comparison

```ring
# Equality check
if cStr1 = cStr2 { ... }

# Lexicographical comparison
nRes = strcmp(cStr1, cStr2)   # 0 if equal, <0 if cStr1 < cStr2, >0 if cStr1 > cStr2
```
