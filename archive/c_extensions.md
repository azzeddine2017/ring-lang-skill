## foxringfuncsdoc

# =
# FoxRing Functions Reference

A class contains functions similar to FoxPro functions.

# FoxRing functions

+-----------------------+-----------------------------------------------------------------------------------------------+
| Function Name		| 				Description						        |
+=======================+===============================================================================================+
| frAbs()		| Returns the absolute value of the specified numeric expression.			       	|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frAddBs()		| Adds a backslash (if needed) to a path expression.						|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frALines()		| Creates an Array with the content of the specified string. 					|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frAllTrim()		| Removes all leading and trailing spaces of the specified string. 				|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frAsc()		| Returns the ANSI value for the leftmost character in a character expression.			|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frAt()		| Searches a character expression for the occurrence 						|
+-----------------------+-----------------------------------------------------------------------------------------------+
| 			| of another character expression.								|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frAtC()		| Searches a character expression for the occurrence of another character expression without 	|
+-----------------------+-----------------------------------------------------------------------------------------------+
| 			| regard for the case of these two expressions.							|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frBetween()		| Determines whether the value of an expression is inclusively between the values of two 	|
+-----------------------+-----------------------------------------------------------------------------------------------+
| 			| expressions of the same type.									|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frChr()		| Returns the character associated with the specified numeric ANSI code.			|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frEmpty()		| Determines whether an expression evaluates to empty.						|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frFile()		| Checks if a file exists on disk.								|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frFileToStr()		| Returns the contents of a file as a character string.						|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frForceExt()		| Returns a string with the old file name extension replaced by a new extension.		|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frForcePath()		| Returns a file name with a new path name substituted for the old one.				|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frIif()   		| Returns one of two values depending on the value of a logical expression.			|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frInList()		| Determines whether an expression matches another expression in a list.			|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frInt()		| Evaluates a numeric expression and returns the integer portion of the expression.		|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frJustDrive()		| Returns the drive letter from a complete path.						|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frJustExt()		| Returns the characters of a file extension from a complete path.				|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frJustFName()		| Returns the file name portion of a complete path and file name.				|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frJustPath()		| Returns the path portion of a complete path and file name.					|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frJustStem()		| Returns the stem name (the file name before the extension) 					|
+-----------------------+-----------------------------------------------------------------------------------------------+
| 			| from a complete path and file name.								|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frLen()		| Determines the number of characters in a character expression, 				|
+-----------------------+-----------------------------------------------------------------------------------------------+
| 			| indicating the length of the expression.							|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frListToString()	| Creates a string with the string elements of an Array.					|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frLTrim()		| Removes all leading spaces or parsing characters from the 					|
+-----------------------+-----------------------------------------------------------------------------------------------+
| 			| specified character expression.								|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frPadL()		| Returns a string from an expression, padded with spaces or characters to a 			|
+-----------------------+-----------------------------------------------------------------------------------------------+
| 			| specified length on the left side.								|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frPadR()		| Returns a string from an expression, padded with spaces or characters to a 			|
+-----------------------+-----------------------------------------------------------------------------------------------+
| 			| specified length on the right side.								|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frProper()		| Returns from a character expression a string capitalized as 					|
+-----------------------+-----------------------------------------------------------------------------------------------+
| 			| appropriate for proper names.									|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frReplicate()		| Returns a character string that contains a specified character 				|
+-----------------------+-----------------------------------------------------------------------------------------------+
| 			| expression repeated a specified number of times.						|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frRTrim()		| Removes all trailing spaces or parsing characters from 					|
+-----------------------+-----------------------------------------------------------------------------------------------+
| 			| the specified character expression.								|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frSetIfEmpty()	| Set a Value into a variable if the variable value is empty, null or zero.			|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frSetSeparatorTo()	| Specifies the character for the numeric place separator.					|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frSpace()		| Returns a character string composed of a specified number of spaces.				|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frStr()		| Returns the character equivalent of a numeric expression.					|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frStringToList()	| Creates a List with the content of the specified string.					|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frStrTran()		| Searches a character expression for a second character expression and 			|
+-----------------------+-----------------------------------------------------------------------------------------------+
| 			| replaces each occurrence with a third character expression.					|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frStuff()		| Returns a new character string replaced by a specified number of 				|
+-----------------------+-----------------------------------------------------------------------------------------------+
| 			| characters in a character expression with another character expression.			|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frSubStr()		| Returns a character string from the given character expression, 				|
+-----------------------+-----------------------------------------------------------------------------------------------+
| 			| starting at a specified position in the character 						|
+-----------------------+-----------------------------------------------------------------------------------------------+
| 			| expression and continuing for a specified number of characters.				|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frTransform()		| Returns a character string from an expression in a 						|
+-----------------------+-----------------------------------------------------------------------------------------------+
| 			| format determined by a format code.								|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frVal()		| Returns a numeric value from a character expression composed of numbers.			|
+-----------------------+-----------------------------------------------------------------------------------------------+
| frVarType()		| Returns the data type of an expression.							|
+-----------------------+-----------------------------------------------------------------------------------------------+

# frAbs() function

```ring
* Syntax	: lnReturnValue = frAbs(tnExpression)
* Description	: Returns the absolute value of the specified numeric expression.
* 		:
* Arguments	: <tnExpression>
*		: Specifies the numeric expression whose absolute value frAbs()
*		: returns.
* Returns	: <lnReturnValue>
*		: Returns the absolute value of the specified numeric expression.
```


# frAsc() function

```ring
* Syntax	: lnReturnValue = frAsc(tcExpression)
* Description	: Returns the ANSI value for the leftmost character in
* 		: a character expression.
* Arguments	: <tcExpression>
*		: Specifies the character expression containing the character
*		: whose ANSI value frAsc()
*		: returns. Any characters after the first character in
*		: tcExpression are ignored by frAsc().
* Returns	: <lnReturnValue>
*		: returns the position of the character in the character
*		: table of the current code page.
*		: Every character has a unique ANSI value in the
*		: range from 0 to 255.
```


# frAddBs() function

```ring
* Syntax	: lcReturnValue = frAddBs(tcPath)
* Description	: Adds a backslash (if needed) to a path expression.
*		:
* Arguments   	: <tcPath>
*		: Specifies the path name to which to add the backslash.
*		:
* Returns	: <lcReturnValue> The path with the backslash.
```


# frAt() function

```ring
* Syntax	: lnPos = frAt(tcToSearch, tcString, tnOccurrence)
* Description	: Searches a character expression for the occurrence of
*		: another character expression.
*		: The search performed by frAt() is case-sensitive.
*		:
* Arguments   	: <tcToSearch>
*		: Specifies the character expression to search
*		: for in <tcString>.
*		: <tcString>
*		: Specifies the character expression to search
*		: for <tcToSearch>.
*		: <tnOccurrence>
*		: Specifies which occurrence, first, second, third,
*		: and so on, of <tcToSearch> to search for
*		: in <tcString>.
*		: By default, frAt() searches for the first occurrence
*		: of <tcToSearch> (tnOccurrence = 1).
* Returns	: Numeric. frAt() returns an integer indicating the
*		: position of the first character for a
*		: character expression or memo field within another
*		: character expression or memo field,
*		: beginning from the leftmost character. If the
*		: expression or field is not found, or if
*		: <tnOccurrence> is greater than the number of
*		: times <tcToSearch> occurs in  <tcString>, frAt()
*		: returns 0.
```


# frAtC() function

```ring
* Syntax	: lnPos = frAtC(tcToSearch, tcString, tnOccurrence)
* Description	: Searches a character expression for the occurrence
*		: of another character expression
*		: without regard for the case of these two expressions.
*		:
* Arguments   	: <tcToSearch>
*		: Specifies the character expression to search
*		: for in <tcString>.
*		: <tcString>
*		: Specifies the character expression to search
*		: for <tcToSearch>.
*		: <tnOccurrence>
*		: Specifies which occurrence, first, second, third,
* 		: and so on, of <tcToSearch> to search for
*		: in tcString.
*		: By default, frAtC() searches for the first occurrence
*		: of <tcToSearch> (tnOccurrence = 1).
* Returns	: Numeric. frAtC() returns an integer indicating the
*		: position of the first character for a
*		: character expression or memo field within
*		: another character expression or memo field,
*		: beginning from the leftmost character. If the
*		: expression or field is not found, or if
*		: <tnOccurrence> is greater than the number of
* 		: times <tcToSearch> occurs in <tcString>, frAtC()
*		: returns 0.
```


# frChr() function

```ring
* Syntax	: lcReturnValue = frChr(tnExpression)
* Description	: Returns the character associated with the specified numeric
*		:  ANSI code.
* Arguments	: <tnExpression>
*		: Specifies a number between 0 and 255 whose equivalent ANSI
*		: character frChr() returns.
* Returns	: <lcReturnValue>
*		: Returns a single character corresponding to the numeric
*		: position of the character in the
*		: character table of the current code page.
* 		:
* Remarks	: tnExpression must be between 0 and 255
```


# frEmpty() function

```ring
* Syntax	: llReturnValue = frEmpty(tuExpression)
* Description	: Determines whether an expression evaluates to empty.
*		:
* Arguments   	: <tuExpression>
*		: Specifies the expression that EMPTY() evaluates.
*		: You can specify an expression with Character,
*		: Numeric, or logical type.
*		:
* Returns	: <llReturnValue> Logical
```


# frFile() function

```ring
* Syntax	: llReturnValue = frFile(tcFileName, tnFlag)
* Description	: Checks if the specified file exists on disk.
*		:
* Arguments   	: <tcFileName>
*		: Specifies the name of the file to check.
*		: tcFileName must include
*		: the file extension. You can include a path with
*		: the file name to
*		: search for a file in a directory or on a drive
*		: other than the current directory or drive.
*		:
*		: <tnFlag>
*		: tnFlag was included for future compatibility.
*		: In this version, It always returns true whenever
*		: the file exists on disk.
* Returns	: <llReturnValue> Logical
*		: True if file exists on disk.
*		: False if file doesn't exist on disk.
```


# frFileToStr() function

```ring
* Syntax	: lcReturnValue = frFileToStr(tcFileName)
* Description	: Returns the contents of a file as a character string.
*		:
* Arguments	: <tcFileName>
* 		: Specifies the name of the file whose contents are
*		: returned as a character
*		: string. If the file is in a directory other than
*		: the current default directory,
*		: include a path with the file name.
*		:
* Returns	: <lcReturnValue>
*		: A character string with the content of the specified file.
*		:
```


# frStr() function

```ring
* Syntax	: lcReturnValue = frStr(tnValue, tnLen, tnDec)
* Description	: Returns the character equivalent of a numeric expression.
*		:
* Arguments	: <tnValue>
*		: Specifies the numeric expression to evaluate.
*		:
*		: <tnLen>
*		: Specifies the length of the character string returned.
*		: If tnLen is 0, tnLen defaults to 10 characters.
*		: If tnLen < 0 returns one string with same length as the number.
*		: Note
*		: If the expression contains a decimal point,
* 		: the length includes one character for
*		: the decimal point and one character
 *		: for each digit in the character string.
*		:
*		: <tnDec>
*		: Specifies the number of decimal places in the
*		: character string returned.
*		: To specify the number of decimal places using
*		: tnDec, you must include nLength. If nDecimalPlaces is omitted,
*		: the number of decimal places defaults to zero (0).
*		:
* Returns	: Character data type. frStr() returns a character string
*		: equivalent to the specified numeric expression.
*		: Depending on certain conditions, frStr() can return the following:
*		: If you specify fewer decimal places than exist in tnValue,
*		: the return value is rounded up. To round results to the nearest
*		: decimal place instead of upward, include the ROUND( ) function.
*		: For more information, see ROUND( ) Function.
*		: If nExpression is an integer, and nLength is less than
*		: the number of digits in nExpression, frStr( ) returns a string of
*		: asterisks, indicating numeric overflow.
*		: If nExpression contains a decimal point, and nLength is equal
*		: to or less than the number of digits to the left of the decimal
*		: point, frStr( ) returns a string of asterisks,
*		: indicating numeric overflow.
*		: If nLength is greater than the length of the value evaluated
*		: by nExpression, frStr( ) returns a character string padded with
* 		: leading spaces.
*		: If nExpression has Numeric or Float type, and nLength
*		: is less than the number of digits in nExpression, and , frStr( )
*		: returns a value using scientific notation.
```


# frSetIfEmpty() function

```ring
* Syntax	: tuReturnValue = frSetIfEmpty(tuValue, tuNewValue)
* Description	: Set a Value into a variable if the variable
*		: value is empty, null or zero.
* Arguments   	: <tuValue>
*		: The value to evaluate.
*		:
*		: <tuNewValue>
*		: The value to set if tuValue is empty.
*		:
* Returns	: tuNewValue if tuValue is empty, otherwise
*		: returns the original value.
* Remarks	: This function doesn't exist in VFP.
```


# frSpace() function

```ring
* Syntax	: lcReturnValue = frSpace(tnSpaces)
* Description	: Returns a character string composed of a
*		: specified number of spaces.
* Arguments   	: <tnSpaces>
*		: Specifies the number of spaces that frSpace() returns.
*		:
* Returns	: <lcReturnValue>
*		: Character
```


# frInList() function

```ring
* Syntax	: llReturnValue = frInList(tuExpression, taList)
* Description	: Determines whether an expression matches another
*		: expression in a set of expressions.
* Arguments   	: <tuExpression>
*		: Specifies the expression frInList() searches for in the List.
*		:
*		: <taList>
*		: Specifies the List of expressions to search.
*		: You must include at least one element in the list.
*		: The expressions in the list of expressions needn't to be
*		: of the same data type.
*		:
* Returns	: <luReturnValue> Null or logical value.
```


# frForcePath() function

```ring
* Syntax	: lcReturnValue = frForcePath(tcFileName, tcPath)
* Description	: Returns a file name with a new path name
*		: substituted for the old one.
* Arguments   	: <tcFileName>
*		: Specifies the file name (with or without a path or extension),
*		: which will get a new path.
*		: <tcPath>
*		: Specifies the new path for tcFileName.
*		:
* Returns	: <lcReturnValue>
*		: Returns a file name with a new path name
*		: substituted for the old one.
```


# frAllTrim() function

```ring
Syntax	: lcReturnValue = frAllTrim(tcExpression, tcCharacter)
```


# frLTrim() function

```ring
Syntax	: lcRet = frLTrim(tcExpression, tcCharacter)
```


# frJustDrive() function

```ring
* Syntax	: lcReturnValue = frJustDrive(tcPath)
* Description	: Returns the drive letter from a complete path.
*		:
* Arguments   	: <tcPath>
*		: Specifies the complete path name for
*		: which you want only the drive.
* Returns	: <lcReturnValue>
*		: Returns the drive letter from a complete path.
```


# frJustExt() function

```ring
* Syntax	: lcReturnValue = frJustExt(tcPath)
* Description	: Returns the characters of a file extension
*		: from a complete path.
* Arguments   	: <tcPath>
*		: Specifies the name, which may include the full path,
*		: of the file for which you want only the extension.
* Returns	: <lcReturnValue>
*		: Returns the drive characters of a file extension
*		: from a complete path.
```


# frJustStem() function

```ring
* Syntax	: lcReturnValue = frJustStem(tcPath)
* Description	: Returns the stem name (the file name before the extension)
*		: from a complete path and file name.
* Arguments   	: <tcPath>
*		: Specifies the name (including path) of the file
*		: for which you want only the stem.
* Returns	: <lcReturnValue>
*		: Returns the stem name of a file from a complete path.
```


# frRTrim() function

```ring
Syntax	: lcRet = frRTrim(tcExpression, tcCharacter)
```


# frJustPath() function

```ring
Syntax	: tcReturnValue = frJustPath(tcExpression)
```


# frForceExt() function

```ring
Syntax	: tcReturnValue = frForceExt(tcFileName, tcNewExtension)
```


# frALines() function

```ring
Syntax	: tnReturnValue = frALines(taList, tcExpression, tcSeparator)
```


# frJustFName() function

```ring
Syntax	: tcReturnValue = frJustFName(tcExpression)
```


# frPadL() function

```ring
Syntax	: tcReturnValue = frPadL(tcString, tnLen, tcChar)
```


# frPadR() function

```ring
Syntax	: tcReturnValue = frPadR(tcString, tnLen, tcChar)
```


# frProper() function

```ring
* Syntax	: tcReturnValue = frProper(tcExpression)
* Description	: Returns from a character expression a string
*		: capitalized as appropriate for proper names.
* Arguments	: <tcExpression>
*		: Specifies the character expression from which
*		: frProper() returns a capitalized character string.
* Returns	: <tcReturnValue>
```


# frReplicate() function

```ring
Syntax	: tcReturnValue = frReplicate(tcString, tnTimes)
```


# frLen() function

```ring
Syntax	: tnReturnValue = frLen(tcString)
```


# frStuff() function

```ring
* Syntax	: tcReturnValue = frStuff(tcExpression, tnStartRep,
				  tnCharRep, tcToReplace)
* Description	: Returns a new character string replaced by a
*		: specified number of characters in a character
*		: expression with another character expression.
*		:
* Arguments   	: <tcExpression>
*		: Specify the character expression in which the replacement occurs.
*		:
*		: <tnStartRep>
*		: Specify the position in <tcExpression> where the replacement begins.
*		:
*		: <tnCharRep>
*		: Specifies the number of characters to be replaced.
*		: If <tnCharRep> is 0, the replacement string
*		: <tcToReplace> is inserted into <tcExpression>.
*		:
*		: <tcToReplace>
*		: Specifies the replacement character expression.
* 		: If <tcToReplace> is an empty string, the number of
*		: characters specified by <tnCharRep> are removed from <tcExpression>.
*		:
* Returns	: Character
```


# frSubStr() function

```ring
Syntax	: tcReturnValue = frSubStr(tcString, tnInitialPosition, tnNumberBytes)
```


# frStrTran() function

```ring
Syntax	: tcReturnValue = frStrTran(tcString, tcOldString, tcNewString)
```


# frListToString() function

```ring
* Syntax	: lcRet = frListToString(taList)
* Remarks	: This function doesn't exist in VFP.
```


# frInt() function

```ring
Syntax		: lnInt = frInt(tnExpression)
```


# frStringToList() function

```ring
* Syntax	: laList = frStringToList(tcExpression)
* Remarks	: This function doesn't exist in VFP.
```


# frIIf() function

```ring
* Syntax	: luReturnValue = frIIf(tlExpression, tuReturnIfTrue, tuReturnIfFalse)
* Description	: Returns one of two values depending on the
*		: value of a logical expression.
* Arguments   	: <tlExpression>
*		: Specifies the logical expression that frIIf() evaluates.
*		:
*		: <tuReturnTrue>, <tuReturnFalse>
*		: If tlExpression evaluates to True, tuReturnIfTrue is
*		: returned and tuReturnIfFalse is not evaluated.
*		: If tlExpression evaluates to False or Null, tuReturnIfFalse is
*		: returned and tuReturnIfTrue is not evaluated.
*		:
* Returns	: <luReturnValue> Defined by <tuReturnIfTrue> or <tuReturnIfFalse>
```


# frVal() function

```ring
* Syntax	: luReturnValue = frVal(tcExpression)
* Description	: Returns a numeric value from a character expression
*		: composed of numbers
* Arguments   	: <tcExpression>
*		: Specifies a character expression composed of up to 16 numbers.
*		:
* Returns	: <tnValue>
*		: Return a numeric value.
```


# frBetween() function

```ring
* Syntax	: luReturnValue = frBetween(tuTestValue, tuLowValue, tuHighValue)
* Description	: Determines whether the value of an expression
*		: is inclusively between the
*		: values of two expressions of the same type.
*		:
* Arguments   	: <tuTestValue>
*		: Specifies an expression to evaluate.
*		:
*		: <tuLowValue>
*		: Specifies the lower value in the range.
*		:
*		: <tuHighValue>
*		: Specifies the higher value in the range.
*		:
* Returns	: <luReturnValue>
*		: Returns a logical order null value.
```


# frSetSeparatorTo() function

```ring
* Syntax	: frSetSeparatorTo(tuExpression)
* Description	: Specifies the character for the numeric place separator.
*		:
* Arguments   	: <tuExpression>
*		: Specifies the character for the numeric place separator.
*		:
*		: Use frSetSeparatorTo() to change the numeric place
*		: separator from default, for example space " " or a comma ",".
*		: Issue frSetSeparatorTo(Null) to reset the value to its default.
*		:
* Returns	: None
```


# frTransform() function

```ring
* Syntax	: tcReturnValue = frTransform(tuExpression, tcFormatCodes)
* Description	: Returns a character string from an expression in a
*		: format determined by a format code.
* Arguments   	: <tuExpression>
*		: Specifies the expression to format.
*		:
*		: <tcFormatCodes>
*		: Specifies one or more format codes that determine how to
*		: format the expression.
*		:
* Returns	: <tcReturnValue>
```

The following table lists the available format codes for tcFormatCodes.

```ring
--------------------------------------------------------------------------
 Format Code	Description
--------------------------------------------------------------------------
 @!		Converts an entire character string to uppercase.
 @T 		Trims leading and trailing spaces from character values.
 @B		Left-justifies Numeric data within the display region.
 @L		Pads numeric and string data with leading zeros.
 @C		Appends CR to positive numeric values to indicate a credit.
 @X		Appends DB to negative numeric values to indicate a debit.
--------------------------------------------------------------------------
```


# frVarType() function

```ring
* Syntax	: lcRet = frVarType(tuExpression)
* Description	: Returns the data type of an expression.
*		:
* Arguments   	: <tuExpression>
*		: Specifies the expression for which the data type is returned.
*		:  frVartype() returns a
*		: single character indicating the data type of the expression.
*		: The following table lists the characters that frVarType()
*		: returns for each data type.
*		:
*		: -------------------	-------------------------------------
*		: Return Value		Data Type
*		: -------------------	-------------------------------------
*		: C			Character
*		: N			Numeric
*		: A			List
*		: O			Object
*		: U			Undefined type
*		: -------------------	-------------------------------------
*		:
* Returns	: Character
```


# Example

```ring
Load "foxring.ring"


mf = new frFunctions

/*----------------------------------------------------------*/
 * frProper() samples
/*----------------------------------------------------------*/

lcStr1 = "ring is a good language"
?mf.frProper(lcStr1)
?mf.frProper(Upper(lcStr1))


/*----------------------------------------------------------*/
 * frStuff() samples
/*----------------------------------------------------------*/

lcStr1 = "abcdefghijklm"
lcStr2 = "12345"

// insert
?mf.frStuff(lcStr1, 4, 0, lcStr2)
// replace
?mf.frStuff(lcStr1, 4, 3, lcStr2)
// delete
?mf.frStuff(lcStr1, 4, 6, "")
// replace and insert
?mf.frStuff(lcStr1, 4, 1, lcStr2)
// replace and delete
?mf.frStuff(lcStr1, 4, 4, lcStr2)
// replace, delete rest
?mf.frStuff(lcStr1, 4, Len(lcStr1), lcStr2)

/*----------------------------------------------------------*/



?mf.frAbs(-45)
?mf.frAbs(10-30)
?mf.frAbs(30-10)

lcNumber1 = 40
lcNumber2 = 2

?mf.frAbs(lcNumber2-lcNumber1)




lcCompletFileName = "C:\ring\docs\source\contribute.txt"

?mf.frFile(lcCompletFileName, Null)
if mf.frFile(lcCompletFileName, Null) {
  ?mf.frFileToStr(lcCompletFileName)
else
  ?"File does not exist"
}

lcNewPath = "C:\ring_2\docs\source\"
?mf.frJustExt(lcCompletFileName)
?mf.frJustDrive(lcCompletFileName)
?mf.frJustStem(lcCompletFileName)
?mf.frForcePath(lcCompletFileName, lcNewPath)
?mf.frTransform("    Ring is a good language    ",
		"@! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
?mf.frAllTrim("    Ring is a good language    ", Null)
?mf._version
lnValue = 3125.54
?mf.frTransform(lnValue, "@B")+ "Euros"
?mf.frTransform(lnValue, "@C 9999,999,999,999.999")
mf.frSetSeparatorTo(" ")
?mf.frTransform(lnValue, "9999,999,999,999.999")
?mf.frInt(lnValue)
?mf.frForceExt("teste", "dbf")
// Format "@L" Added into frTransform() function
?mf.frTransform("123", "@L 999999")
?mf.frTransform(123, "@L 999999")
```


## libcurl

# =
# Using RingLibCurl

In this chapter we will learn about using RingLibCurl

# Get Request

Example:

```ring
load "libcurl.ring"

curl = curl_easy_init()

curl_easy_setopt(curl, CURLOPT_USERAGENT, "curl/7.54.1")
curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1)
curl_easy_setopt(curl, CURLOPT_URL, "https://ring-lang.github.io/")

curl_easy_perform(curl)

curl_easy_cleanup(curl)
```


# Post Request

Example:

```ring
load "libcurl.ring"

curl = curl_easy_init()

curl_easy_setopt(curl, CURLOPT_USERAGENT, "curl/7.54.1")

cPostThis = "page=4&Number1=4&Number2=5"
curl_easy_setopt(curl, CURLOPT_URL, "http://localhost/ringapp/index.ring?page=3")
curl_easy_setopt(curl, CURLOPT_POSTFIELDS, cPostThis)

curl_easy_perform(curl)

curl_easy_cleanup(curl)
```


# Facebook Login

Example:

```ring
load "libcurl.ring"

see "Enter Email : " give $login_email
See "Enter Password : " give $login_pass

curl = curl_easy_init()

curl_easy_setopt(curl, CURLOPT_USERAGENT, "curl/7.54.1")

curl_easy_setopt(curl, CURLOPT_URL, 'https://www.facebook.com/login.php')
curl_easy_setopt(curl, CURLOPT_POSTFIELDS,'charset_test=j u s t a t e s t'+
' &email='+urlencode($login_email)+'&pass='+
urlencode($login_pass)+'&login=Login')
curl_easy_setopt(curl, CURLOPT_POST, 1)
curl_easy_setopt(curl, CURLOPT_HEADER, 0)
curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1)
curl_easy_setopt(curl, CURLOPT_COOKIEJAR, "cookies.txt")
curl_easy_setopt(curl, CURLOPT_COOKIEFILE, "cookies.txt")
curl_easy_setopt(curl, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows; U;"+
" Windows NT 5.1; en-US; rv:1.8.1.3) Gecko/20070309 Firefox/2.0.0.3")
curl_easy_setopt(curl, CURLOPT_REFERER, "http://www.facebook.com")
curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, FALSE)
curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 2)

mylist = curl_slist_append(NULL,'Accept-Charset: utf-8')
curl_slist_append(mylist,'Accept-Language: en-us,en;q=0.7,bn-bd;q=0.3')
curl_slist_append(mylist,'Accept: text/xml,application/xml,'+
'application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5')
curl_easy_setopt(curl, CURLOPT_HTTPHEADER, mylist)

curl_easy_setopt(curl, CURLOPT_COOKIESESSION, false)

curl_easy_perform(curl)

curl_easy_cleanup(curl)

Func URLEncode cStr
	cOut = ""
	for x in cStr
		if isalnum(x)
			cOut += x
		but x = " "
			cOut += "+"
		else
			cOut += "%"+str2hex(x)
		ok
	next
	return cOut
```


# Save Output to String

Example:

```ring
load "libcurl.ring"

curl = curl_easy_init()

curl_easy_setopt(curl, CURLOPT_USERAGENT, "curl/7.54.1")
curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1)
curl_easy_setopt(curl, CURLOPT_URL, "https://ring-lang.github.io/")

cOutput = curl_easy_perform_silent(curl)

See "Output:" + nl
see cOutput

curl_easy_cleanup(curl)
```


# Get Stock Data From Yahoo

Example:

```ring
Load "libcurl.ring"

### Part 1 --- Get Crumb and Cookie -----------------------------------------

See "Start curl_easy_init(): "+ nl
curl = curl_easy_init()                     ### >>> HANDLE >>> 01006BD0  CURL  0

	curl_easy_setopt(curl, CURLOPT_USERAGENT, "curl/7.54.1")
	curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1)
	curl_easy_setopt(curl, CURLOPT_COOKIEJAR,  "cookies.txt")
	curl_easy_setopt(curl, CURLOPT_COOKIEFILE, "cookies.txt")
	curl_easy_setopt(curl, CURLOPT_URL, "https://finance.yahoo.com/quote/AMZN/history")

	###  HTML Data >>> STDOUT Window,  Use curl_easy_perform_silent >>> String

cOutput = curl_easy_perform_silent(curl)    ### GO Get Data >>> String


###   Extract Crumb from data
###  "CrumbStore":{"crumb":"abcdefghijk"},

if cOutput != NULL

	newStr1     = substr(cOutput, substr(cOutput, '"CrumbStore":{"crumb":"' ), 48 )
		nPosS   = substr(newStr1, ':"' ) ;  ### Start of crumb -2
		nPosE   = substr(newStr1, '"}' ) ;  ### End   of crumb
		nCount  = nPosE - nPosS -2          ### size  of crumb
	myCrumb     = substr(newStr1, nPosS +2, nCount)

	See "myCrumb.: |"+ myCrumb +"|" +nl

	### UniCode "\u002F" replace it with "/"
		if substr( myCrumb, "\u002F")
		   myCrumb = substr( myCrumb, "\u002F", "/")
		   See "myCrumb2: |"+ myCrumb +"|"+ nl
		ok

else
	See "No Connectivity to Yahoo. Looking for Cookie and Crumb." +nl +nl
ok


### Part 2 --- Send URL with Crumb, and Cookie -----------------------------------------

	### Send URL+Crumb to Yahoo to fetch 1st stock history data,

	$url = "https://query1.finance.yahoo.com/v7/finance/download/AMZN"+
		"?period1=1277856000&period2=1498777545&interval=1wk" +
		"&events=history&crumb=" + myCrumb

	curl_easy_setopt(curl, CURLOPT_URL, $url);
	cStr = curl_easy_perform_silent(curl)
	See cStr

curl_easy_cleanup(curl)  ### REMEMBER to CLOSE  CURL
```

Output:

```ring
myCrumb.: |sEEeW97mxvN|
Date,Open,High,Low,Close,Adj Close,Volume
2010-07-05,110.650002,117.480003,109.000000,117.260002,117.260002,21000400
2010-07-12,117.809998,124.879997,117.320000,118.489998,118.489998,29407300
2010-07-19,118.379997,121.250000,105.800003,118.870003,118.870003,74252100
```


# Helper Functions

RingLibCurl provides several helper functions to easily retrieve information about HTTP responses.

# Get Response Information

Example:

```ring
load "libcurl.ring"

curl = curl_easy_init()

curl_easy_setopt_2(curl, CURLOPT_URL, "https://ring-lang.github.io/")
curl_easy_setopt_2(curl, CURLOPT_USERAGENT, "RingLibCurl")
curl_easy_setopt_1(curl, CURLOPT_FOLLOWLOCATION, 1)

curl_easy_perform_silent(curl)

? "Response Code: " + curl_getResponseCode(curl)
? "Content Type: " + curl_getContentType(curl)
? "Content Length: " + curl_getContentLength(curl)
? "Effective URL: " + curl_getEffectiveUrl(curl)
? "Redirect URL: " + curl_getRedirectUrl(curl)
? "Redirect Count: " + curl_getRedirectCount(curl)
? "Total Time: " + curl_getTotalTime(curl)
? "Name Lookup Time: " + curl_getNameLookupTime(curl)
? "Connect Time: " + curl_getConnectTime(curl)
? "Request Size: " + curl_getRequestSize(curl)
? "Header Size: " + curl_getHeaderSize(curl)
? "Speed Download: " + curl_getSpeedDownload(curl)
? "Speed Upload: " + curl_getSpeedUpload(curl)
? "SSL Verify Result: " + curl_getSSLVerifyResult(curl)
? "Primary IP: " + curl_getPrimaryIP(curl)
? "Primary Port: " + curl_getPrimaryPort(curl)
? "Local IP: " + curl_getLocalIP(curl)
? "Local Port: " + curl_getLocalPort(curl)
? "Content Length Upload: " + curl_getContentLengthUpload(curl)
? "Download Size: " + curl_getDownloadSize(curl)
? "Upload Size: " + curl_getUploadSize(curl)
? "File Time: " + curl_getFiletime(curl)
? "App Connect Time: " + curl_getAppConnectTime(curl)
? "Content Length Header: " + curl_getContentLengthHeader(curl)
? "Start Transfer Time: " + curl_getStartTransferTime(curl)
? "Pre Transfer Time: " + curl_getPreTransferTime(curl)

curl_easy_cleanup(curl)
```


# Download and Check Status

Example:

```ring
load "libcurl.ring"

# Download a file from URL and save it to a local file
downloadFile("https://ring-lang.github.io/", "test_download.txt")

# Function to download file from URL and save to specified local path
func downloadFile URL, cFile
	# Initialize a new curl session
	curl = curl_easy_init()

	# Open file in binary write mode
	fp = fopen(cFile,"wb")

	# Set curl options:
	# Specify where to write the downloaded data
	curl_easy_setopt(curl, CURLOPT_WRITEDATA, fp)
	# Set the URL to download from
	curl_easy_setopt(curl, CURLOPT_URL, URL)
	# Follow redirects if any
	curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1)

	# Perform the download
	curl_easy_perform(curl)

	# Get response information
	nResponseCode = curl_getResponseCode(curl)
	cContentType = curl_getContentType(curl)

	# Clean up: close file and curl session
	fclose(fp)
	curl_easy_cleanup(curl)

	# Check if download was successful (HTTP 200 OK)
	if nResponseCode = 200
		? "File downloaded successfully!"
		return true
	else
		? "Failed to download file."
		? "HTTP Response Code: " + nResponseCode
		return false
	ok
```


# Using Callbacks

RingLibCurl supports using callbacks for different operations like handling the response data, headers, progress information and reading data for upload.

We can set the callback function using `curl_easy_setopt` and the option name.
The callback function can get the data using `curl_get_data()` or `curl_get_progress_info()`.

Example (1): Using the Write Callback

```ring
load "libcurl.ring"

func main
	curl = curl_easy_init()
	curl_easy_setopt(curl, CURLOPT_URL, "https://ring-lang.github.io")
	curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, :write_callback)
	curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1)
	curl_easy_perform(curl)
	curl_easy_cleanup(curl)

func write_callback
	cData = curl_get_data()
	? "Received Data Size: " + len(cData)
```

Example (2): Using the Progress Callback

```ring
load "libcurl.ring"

func main
	curl = curl_easy_init()
	curl_easy_setopt(curl, CURLOPT_URL, "https://ring-lang.github.io")
	curl_easy_setopt(curl, CURLOPT_XFERINFOFUNCTION, :progress_callback)
	curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1)
	curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0)
	curl_easy_perform(curl)
	curl_easy_cleanup(curl)

func progress_callback
	aInfo = curl_get_progress_info()
	dltotal = aInfo[1]
	dlnow = aInfo[2]
	ultotal = aInfo[3]
	ulnow = aInfo[4]
	? "Progress: DL=" + dlnow + "/" + dltotal +
		" UL=" + ulnow + "/" + ultotal
	curl_set_progress_result(0)
```

Example (3): Using the Header Callback

```ring
load "libcurl.ring"

func main
	curl = curl_easy_init()
	curl_easy_setopt(curl, CURLOPT_URL, "https://ring-lang.github.io")
	curl_easy_setopt(curl, CURLOPT_HEADERFUNCTION, :header_callback)
	curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1)
	curl_easy_setopt(curl, CURLOPT_NOBODY, 1)
	curl_easy_perform(curl)
	curl_easy_cleanup(curl)

func header_callback
	cData = curl_get_data()
	? "Header: " + trim(cData)
```

Example (4): Using the Read Callback

```ring
load "libcurl.ring"

uploadData = "This is test data from RingLibCurl"
uploadPos = 0

func main
	curl = curl_easy_init()
	curl_easy_setopt(curl, CURLOPT_URL, "https://postman-echo.com/put")
	curl_easy_setopt(curl, CURLOPT_UPLOAD, 1)
	curl_easy_setopt(curl, CURLOPT_READFUNCTION, :read_callback)
	curl_easy_setopt(curl, CURLOPT_INFILESIZE, len(uploadData))
	curl_easy_perform(curl)
	curl_easy_cleanup(curl)

func read_callback
	remaining = len(uploadData) - uploadPos
	if remaining > 0
		chunkSize = 16
		if remaining < chunkSize chunkSize = remaining ok
		chunk = substr(uploadData, uploadPos + 1, chunkSize)
		uploadPos += chunkSize
		curl_set_read_data(chunk)
	else
		curl_set_read_data("")
	ok
```


## libui

# =
# RingLibUI Extension

In this chapter we will learn about using the RingLibUI extension.

This extension provides complete support for Libui

Using this extension we can develop and distribute lightweight GUI Applications using Ring (Less than 1 MB)

Runtime files and their size (For Ring 1.14)

- Ring.dll (448 KB)
- Libui.dll (210 KB)
- Ring_Libui.dll (633 KB)
- Total : 1,291 KB without compressing the files
- After compressing the files (To ZIP file) - Total : 504 KB

> **Note:**

> **Tip:**

# Hello World

```ring
load "libui.ring"

oWindow = uiNewWindow( "Hello, World", 400, 400, True)
uiWindowOnClosing(oWindow,"closeApp()")

btn1 = uiNewButton("SayHello")
uiButtonOnClicked(btn1,"sayHello()")

btn2 = uiNewButton("Close")
uiButtonOnClicked(btn2,"closeApp()")

g = uiNewGrid() uiGridSetPadded(g, 1) uiWindowSetChild(oWindow, g)
uiGridAppend(g, btn1, 0, 0, 2, 1, 1, uiAlignFill, 0, uiAlignFill)
uiGridAppend(g, btn2, 0, 1, 1, 1, 1, uiAlignFill, 0, uiAlignFill)

uiControlShow( oWindow )
uiMain()

func sayHello
	uiMsgBox(oWindow,"Hi","Hello")

func closeApp
	uiQuit()
```

Screen Shots:

:alt: RingLibui Screen Shot

:alt: RingLibui Screen Shot

# Say Hello

```ring
load "libui.ring"

oWindow = uiNewWindow( "Say Hello", 500, 80, True)
uiWindowOnClosing(oWindow,"closeApp()")

lbl1 = uiNewLabel("Name: ")
text1 = uiNewEntry()

btn1 = uiNewButton("SayHello")
uiButtonOnClicked(btn1,"sayHello()")

btn2 = uiNewButton("Close")
uiButtonOnClicked(btn2,"closeApp()")

lbl2 = uiNewLabel("")

g = uiNewGrid() uiGridSetPadded(g, 1) uiWindowSetChild(oWindow, g)
uiGridAppend(g, lbl1, 0, 0, 2, 1, 1, uiAlignCenter, 0, uiAlignCenter)
uiGridAppend(g, text1, 1, 0, 2, 1, 1, uiAlignFill, 0, uiAlignFill)
uiGridAppend(g, btn1, 0, 1, 1, 2, 1, uiAlignFill, 0, uiAlignFill)
uiGridAppend(g, btn2, 2, 1, 1, 1, 1, uiAlignFill, 0, uiAlignFill)
uiGridAppend(g, lbl2, 0, 3, 2, 1, 1, uiAlignCenter, 0, uiAlignCenter)

uiControlShow( oWindow )
uiMain()

func sayHello
	uiLabelSetText(lbl2,"Hello " + uiEntryText(text1))

func closeApp
	uiQuit()
```

Screen Shot:

:alt: RingLibui Screen Shot

:alt: RingLibui Screen Shot

:alt: RingLibui Screen Shot

# Control Gallery

```ring
# Sample ported to Ring
# Based on original sample from : https://github.com/andlabs/libui

load "libui.ring"

# Global Variables

	slider = NULL
	spinbox = NULL
	pBar = NULL
	entryOpen = NULL
	entrySave = NULL

# Main Window

	mainwin = uiNewWindow("libui Control Gallery", 640, 480, 1)
	uiWindowOnClosing(mainwin, "onClosing()")

	tab = uiNewTab()
	uiWindowSetChild(mainwin, tab)
	uiWindowSetMargined(mainwin, 1)

	uiTabAppend(tab, "Basic Controls", makeBasicControlsPage())
	uiTabSetMargined(tab, 0, 1)

	uiTabAppend(tab, "Numbers and Lists", makeNumbersPage())
	uiTabSetMargined(tab, 1, 1)

	uiTabAppend(tab, "Data Choosers", makeDataChoosersPage())
	uiTabSetMargined(tab, 2, 1)

	uiControlShow(mainwin)
	uiMain()

func onClosing
	uiQuit()

func makeDataChoosersPage

	hbox = uiNewHorizontalBox()
	uiBoxSetPadded(hbox, 1)

	vbox = uiNewVerticalBox()
	uiBoxSetPadded(vbox, 1)
	uiBoxAppend(hbox, vbox, 0)

	uiBoxAppend(vbox,
		uiNewDatePicker(),
		0)
	uiBoxAppend(vbox,
		uiNewTimePicker(),
		0)
	uiBoxAppend(vbox,
		uiNewDateTimePicker(),
		0)

	uiBoxAppend(vbox,
		uiNewFontButton(),
		0)
	uiBoxAppend(vbox,
		uiNewColorButton(),
		0)

	uiBoxAppend(hbox,
		uiNewVerticalSeparator(),
		0)

	vbox = uiNewVerticalBox()
	uiBoxSetPadded(vbox, 1)
	uiBoxAppend(hbox, vbox, 1)

	grid = uiNewGrid()
	uiGridSetPadded(grid, 1)
	uiBoxAppend(vbox, grid, 0)

	button = uiNewButton("Open File")
	entryOpen = uiNewEntry()
	uiEntrySetReadOnly(entryOpen, 1)
	uiButtonOnClicked(button, "onOpenFileClicked()")
	uiGridAppend(grid, button,
		0, 0, 1, 1,
		0, uiAlignFill, 0, uiAlignFill)
	uiGridAppend(grid, entryOpen,
		1, 0, 1, 1,
		1, uiAlignFill, 0, uiAlignFill)

	button = uiNewButton("Save File")
	entrySave = uiNewEntry()
	uiEntrySetReadOnly(entrySave, 1)
	uiButtonOnClicked(button, "onSaveFileClicked()")
	uiGridAppend(grid, button,
		0, 1, 1, 1,
		0, uiAlignFill, 0, uiAlignFill)
	uiGridAppend(grid, entrySave,
		1, 1, 1, 1,
		1, uiAlignFill, 0, uiAlignFill)

	msggrid = uiNewGrid()
	uiGridSetPadded(msggrid, 1)
	uiGridAppend(grid, msggrid,
		0, 2, 2, 1,
		0, uiAlignCenter, 0, uiAlignStart)

	button = uiNewButton("Message Box")
	uiButtonOnClicked(button, "onMsgBoxClicked()")
	uiGridAppend(msggrid, button,
		0, 0, 1, 1,
		0, uiAlignFill, 0, uiAlignFill)
	button = uiNewButton("Error Box")
	uiButtonOnClicked(button, "onMsgBoxErrorClicked()")
	uiGridAppend(msggrid, button,
		1, 0, 1, 1,
		0, uiAlignFill, 0, uiAlignFill)

	return hbox

func makeNumbersPage

	hbox = uiNewHorizontalBox()
	uiBoxSetPadded(hbox, 1)

	group = uiNewGroup("Numbers")
	uiGroupSetMargined(group, 1)
	uiBoxAppend(hbox, group, 1)

	vbox = uiNewVerticalBox()
	uiBoxSetPadded(vbox, 1)
	uiGroupSetChild(group, vbox)

	spinbox = uiNewSpinbox(0, 100)
	slider = uiNewSlider(0, 100)
	pbar = uiNewProgressBar()
	uiSpinboxOnChanged(spinbox, "onSpinboxChanged()")
	uiSliderOnChanged(slider, "onSliderChanged()")
	uiBoxAppend(vbox, spinbox, 0)
	uiBoxAppend(vbox, slider, 0)
	uiBoxAppend(vbox, pbar, 0)

	ip = uiNewProgressBar()
	uiProgressBarSetValue(ip, -1)
	uiBoxAppend(vbox, ip, 0)

	group = uiNewGroup("Lists")
	uiGroupSetMargined(group, 1)
	uiBoxAppend(hbox, group, 1)

	vbox = uiNewVerticalBox()
	uiBoxSetPadded(vbox, 1)
	uiGroupSetChild(group, vbox)

	cbox = uiNewCombobox()
	uiComboboxAppend(cbox, "Combobox Item 1")
	uiComboboxAppend(cbox, "Combobox Item 2")
	uiComboboxAppend(cbox, "Combobox Item 3")
	uiBoxAppend(vbox, cbox, 0)

	ecbox = uiNewEditableCombobox()
	uiEditableComboboxAppend(ecbox, "Editable Item 1")
	uiEditableComboboxAppend(ecbox, "Editable Item 2")
	uiEditableComboboxAppend(ecbox, "Editable Item 3")
	uiBoxAppend(vbox, ecbox, 0)

	rb = uiNewRadioButtons()
	uiRadioButtonsAppend(rb, "Radio Button 1")
	uiRadioButtonsAppend(rb, "Radio Button 2")
	uiRadioButtonsAppend(rb, "Radio Button 3")
	uiBoxAppend(vbox, rb, 0)

	return hbox


func makeBasicControlsPage

	vbox = uiNewVerticalBox()
	uiBoxSetPadded(vbox, 1)

	hbox = uiNewHorizontalBox()
	uiBoxSetPadded(hbox, 1)
	uiBoxAppend(vbox, hbox, 0)

	uiBoxAppend(hbox,
		uiNewButton("Button"),
		0)
	uiBoxAppend(hbox,
		uiNewCheckbox("Checkbox"),
		0)

	uiBoxAppend(vbox,
		uiNewLabel("This is a label. Right now, labels can only span one line."),
		0)

	uiBoxAppend(vbox,
		uiNewHorizontalSeparator(),
		0)

	group = uiNewGroup("Entries")
	uiGroupSetMargined(group, 1)
	uiBoxAppend(vbox, group, 1)

	entryForm = uiNewForm()
	uiFormSetPadded(entryForm, 1)
	uiGroupSetChild(group, entryForm)

	uiFormAppend(entryForm,
		"Entry",
		uiNewEntry(),
		0)
	uiFormAppend(entryForm,
		"Password Entry",
		uiNewPasswordEntry(),
		0)
	uiFormAppend(entryForm,
		"Search Entry",
		uiNewSearchEntry(),
		0)
	uiFormAppend(entryForm,
		"Multiline Entry",
		uiNewMultilineEntry(),
		1)
	uiFormAppend(entryForm,
		"Multiline Entry No Wrap",
		uiNewNonWrappingMultilineEntry(),
		1)

	return vbox


func onSpinboxChanged
	s = uiEventSpinBox()
	uiSliderSetValue(slider, uiSpinboxValue(s));
	uiProgressBarSetValue(pbar, uiSpinboxValue(s));

func onSliderChanged
	s = uiEventSlider()
	uiSpinboxSetValue(spinbox, uiSliderValue(s));
	uiProgressBarSetValue(pbar, uiSliderValue(s));


func onOpenFileClicked
	filename = uiOpenFile(mainwin)
	if ISNULL(filename)
		uiEntrySetText(entryOpen, "(cancelled)")
		return
	ok
	uiEntrySetText(entryOpen, filename)

func onSaveFileClicked
	filename = uiSaveFile(mainwin)
	if ISNULL(filename)
		uiEntrySetText(entrySave, "(cancelled)")
		return
	ok
	uiEntrySetText(entrySave, filename)

func onMsgBoxClicked
	uiMsgBox(mainwin,
		"This is a normal message box.",
		"More detailed information can be shown here.")

func onMsgBoxErrorClicked
	uiMsgBoxError(mainwin,
		"This message box describes an error.",
		"More detailed information can be shown here.")
```

Screen Shot:

:alt: RingLibui Screen Shot

:alt: RingLibui Screen Shot

:alt: RingLibui Screen Shot

:alt: RingLibui Screen Shot

# Say Something

```ring
# Sample ported to Ring
# Based on original sample from : https://github.com/andlabs/libui

load "libui.ring"

w = uiNewWindow("Hello", 320, 240, 0)
uiWindowSetMargined(w, 1)

b = uiNewVerticalBox()
uiBoxSetPadded(b, 1)
uiWindowSetChild(w, b)

e = uiNewMultilineEntry()
uiMultilineEntrySetReadOnly(e, 1)

btn = uiNewButton("Say Something")
uiButtonOnClicked(btn, "saySomething()")
uiBoxAppend(b, btn, 0)

uiBoxAppend(b, e, 1)

uiTimer(1000, "sayTime()")

uiWindowOnClosing(w, "onClosing()")
uiControlShow(w)
uiMain()

func saySomething
	uiMultilineEntryAppend(e, "Saying something"+nl)

func sayTime
	uiMultilineEntryAppend(e, Time()+nl)

func onClosing
	uiQuit()
```

Screen Shot:

:alt: RingLibui Screen Shot

:alt: RingLibui Screen Shot

# Using the Menubar

```ring
# Sample ported to Ring
# Based on original sample from : https://github.com/andlabs/libui

load "libui.ring"

# Create the Menubar

	fileMenu = uiNewMenu("File")
	newItem = uiMenuAppendItem(fileMenu, "New")
	openItem = uiMenuAppendItem(fileMenu, "Open")
	uiMenuAppendSeparator(fileMenu)
	shouldQuitItem = uiMenuAppendCheckItem(fileMenu, "Should Quit")
	quitItem = uiMenuAppendQuitItem(fileMenu)

	editMenu = uiNewMenu("Edit")
	undoItem = uiMenuAppendItem(editMenu, "Undo")
	uiMenuItemDisable(undoItem)
	uiMenuAppendSeparator(editMenu)
	checkItem = uiMenuAppendCheckItem(editMenu, "Check Me\tTest")
	accelItem = uiMenuAppendItem(editMenu, "A&ccele&&rator T_es__t")
	prefsItem = uiMenuAppendPreferencesItem(editMenu)

	testMenu = uiNewMenu("Test")
	enabledItem = uiMenuAppendCheckItem(testMenu, "Enable Below Item")
	uiMenuItemSetChecked(enabledItem, 1)
	enableThisItem = uiMenuAppendItem(testMenu, "This Will Be Enabled")
	uiMenuItemOnClicked(enabledItem, "enableItemTest(enableThisItem)")
	forceCheckedItem = uiMenuAppendItem(testMenu, "Force Above Checked")
	uiMenuItemOnClicked(forceCheckedItem, "forceOn()")
	forceUncheckedItem = uiMenuAppendItem(testMenu, "Force Above Unchecked")
	uiMenuItemOnClicked(forceUncheckedItem, "forceOff()")
	uiMenuAppendSeparator(testMenu)
	whatWindowItem = uiMenuAppendItem(testMenu, "What Window?")
	uiMenuItemOnClicked(whatWindowItem, "whatWindow()")

	moreTestsMenu = uiNewMenu("More Tests")
	quitEnabledItem = uiMenuAppendCheckItem(moreTestsMenu, "Quit Item Enabled")
	uiMenuItemSetChecked(quitEnabledItem, 1)
	prefsEnabledItem = uiMenuAppendCheckItem(moreTestsMenu, "Preferences Item Enabled")
	uiMenuItemSetChecked(prefsEnabledItem, 1)
	aboutEnabledItem = uiMenuAppendCheckItem(moreTestsMenu, "About Item Enabled")
	uiMenuItemSetChecked(aboutEnabledItem, 1)
	uiMenuAppendSeparator(moreTestsMenu)
	checkEnabledItem = uiMenuAppendCheckItem(moreTestsMenu, "Check Me Item Enabled")
	uiMenuItemSetChecked(checkEnabledItem, 1)

	multiMenu = uiNewMenu("Multi")
	uiMenuAppendSeparator(multiMenu)
	uiMenuAppendSeparator(multiMenu)
	uiMenuAppendItem(multiMenu, "Item && Item && Item")
	uiMenuAppendSeparator(multiMenu)
	uiMenuAppendSeparator(multiMenu)
	uiMenuAppendItem(multiMenu, "Item __ Item __ Item")
	uiMenuAppendSeparator(multiMenu)
	uiMenuAppendSeparator(multiMenu)

	helpMenu = uiNewMenu("Help")
	helpItem = uiMenuAppendItem(helpMenu, "Help")
	aboutItem = uiMenuAppendAboutItem(helpMenu)

	uiMenuItemOnClicked(quitEnabledItem, "enableItemTest(quitItem)")
	uiMenuItemOnClicked(prefsEnabledItem, "enableItemTest(prefsItem)")
	uiMenuItemOnClicked(aboutEnabledItem, "enableItemTest(aboutItem)")
	uiMenuItemOnClicked(checkEnabledItem, "enableItemTest(checkItem)")

# Create the Window

	oWindow = uiNewWindow( "Using the Menubar", 400, 400, True)
	uiWindowOnClosing(oWindow,"closeApp()")

	uiControlShow( oWindow )
	uiMain()

func enableItemTest(data)
	item = uiEventMenuItem()
	if uiMenuItemChecked(item)
		uiMenuItemEnable(data)
	else
		uiMenuItemDisable(data)
	ok

func forceOn
	uiMenuItemSetChecked(enabledItem, 1)

func forceOff
	uiMenuItemSetChecked(enabledItem, 0)

func whatWindow
	? "menu item clicked on window "
	? oWindow

func closeApp
	uiQuit()
```

Screen Shot:

:alt: RingLibui Screen Shot

:alt: RingLibui Screen Shot

# Drawing Sample

```ring
load "libui.ring"

oWindow = uiNewWindow( "Drawing Sample", 420, 450, True)
uiWindowOnClosing(oWindow,"closeApp()")

oAreaHandler = uiNewAreaHandler("draw()","","","","")
area = uiNewArea(oAreaHandler)

btnClose = uiNewButton("Close Application")
uiButtonOnClicked(btnClose,"closeApp()")

hbox = uiNewVerticalBox()
uiBoxSetPadded(hbox, 1)
uiBoxAppend(hbox,btnClose,0)
uiBoxAppend(hbox,area,1)
uiWindowSetChild(oWindow, hbox)

uiControlShow( oWindow )
uiMain()

func draw
	Rectangle(0, 0, uiEventAreaWidth(), uiEventAreaHeight(), colorGray)
	Rectangle(0, 0, 400, 400, colorWhite)
	Rectangle(10, 10, 20, 20, colorRed)
	Rectangle(30, 30, 30, 30, colorGreen)
	Rectangle(60, 60, 40, 40, colorBlue)

# The Rectangle function is now part of RingLibUI as uiRectangle()
func Rectangle x,y,width,height,color
	oContext = uiEventContext()
	oBrush = uiNewSolidBrush(color)
	oPath = uiDrawNewPath(uiDrawFillModeWinding)
	uiDrawPathAddRectangle(oPath, x, y, width, height)
	uiDrawPathEnd(oPath)
	uiDrawFill(oContext, oPath, oBrush)
	uiDrawFreePath(oPath)

func closeApp
	uiQuit()
```

Screen Shot:

:alt: RingLibui Screen Shot

# Draw Gradient

```ring
load "libui.ring"

oWindow = uiNewWindow( "Draw Gradient", 500, 500, True)
uiWindowOnClosing(oWindow,"closeApp()")

oAreaHandler = uiNewAreaHandler("draw()","","","","")
area = uiNewArea(oAreaHandler)

btnClose = uiNewButton("Close Application")
uiButtonOnClicked(btnClose,"closeApp()")

hbox = uiNewVerticalBox()
uiBoxSetPadded(hbox, 1)
uiBoxAppend(hbox,btnClose,0)
uiBoxAppend(hbox,area,1)
uiWindowSetChild(oWindow, hbox)

uiControlShow( oWindow )
uiMain()

func draw
	nWidth = uiEventAreaWidth()		nHeight = uiEventAreaHeight()
	uiRectangle(0, 0, nWidth, nHeight, colorBlue)
	for y=0 to 255 step 2
		customColor = y
		uiRectangle(0, y, nWidth, y+1, customColor)
	next

func closeApp
	uiQuit()
```

Screen Shot:

:alt: RingLibui Screen Shot

# Histogram

```ring
# Sample ported to Ring
# Based on original sample from : https://github.com/andlabs/libui

load "libui.ring"

datapoints	= list(10)
currentPoint	= -1

// some metrics
xoffLeft	= 20			/* histogram margins */
yoffTop		= 20
xoffRight	= 20
yoffBottom	= 20
pointRadius	= 5

histogram	= NULL
mainwin		= NULL
colorButton	= NULL

func pointLocations width, height, xs, ys
	xincr = width / 9		// 10 - 1 to make the last point be at the end
	yincr = height / 100
	for i = 1 to 10
		// get the value of the point
		n = uiSpinboxValue(datapoints[i])
		// because y=0 is the top but n=0 is the bottom, we need to flip
		n = 100 - n;
		xs[i] = xincr * i
		ys[i] = yincr * n
	next

func constructGraph width, height, extend
	xs = list(10)
	ys = list(10)
	pointLocations(width, height, xs, ys)
	path = uiDrawNewPath(uiDrawFillModeWinding)
	uiDrawPathNewFigure(path, xs[1], ys[1])
	for i = 2 to 10
		uiDrawPathLineTo(path, xs[i], ys[i])
	next
	if extend
		uiDrawPathLineTo(path, width, height)
		uiDrawPathLineTo(path, 0, height)
		uiDrawPathCloseFigure(path)
	ok
	uiDrawPathEnd(path)
	return path


func graphSize clientWidth, clientHeight
	graphWidth = clientWidth - xoffLeft - xoffRight
	graphHeight = clientHeight - yoffTop - yoffBottom
	return [graphWidth,graphHeight]

func handlerDraw
	// fill the area with white
	Brush = uiNewSolidBrush(0)
	setSolidBrush(brush, colorWhite, 1.0)
	path = uiDrawNewPath(uiDrawFillModeWinding)
	uiDrawPathAddRectangle(path, 0, 0, uiEventAreaWidth(), uiEventAreaHeight())
	uiDrawPathEnd(path)
	uiDrawFill(uiEventContext(), path, brush)
	uiDrawFreePath(path)

	// figure out dimensions
	aOut = graphSize(uiEventAreaWidth(), uiEventAreaHeight())
	graphWidth = aOut[1]
	graphHeight = aOut[2]

	sp = new_managed_uiDrawStrokeParams()
	set_uiDrawStrokeParams_Cap(sp,uiDrawLineCapFlat)
	set_uiDrawStrokeParams_Join(sp,uiDrawLineJoinMiter)
	set_uiDrawStrokeParams_Thickness(sp,2)
	set_uiDrawStrokeParams_MiterLimit(sp,uiDrawDefaultMiterLimit)
	set_uiDrawStrokeParams_NumDashes(sp,0)

	// draw the axes
	setSolidBrush(brush, colorBlack, 1.0)
	path = uiDrawNewPath(uiDrawFillModeWinding)
	uiDrawPathNewFigure(path,
		xoffLeft, yoffTop)
	uiDrawPathLineTo(path,
		xoffLeft, yoffTop + graphHeight)
	uiDrawPathLineTo(path,
		xoffLeft + graphWidth, yoffTop + graphHeight)
	uiDrawPathEnd(path)
	uiDrawStroke(uiEventContext(), path, brush, sp)
	uiDrawFreePath(path)

	// now transform the coordinate space so (0, 0) is the top-left corner of the graph
	m = new_managed_uiDrawMatrix()
	uiDrawMatrixSetIdentity(m)
	uiDrawMatrixTranslate(m, xoffLeft, yoffTop)
	uiDrawTransform(uiEventContext(), m)

	// now get the color for the graph itself and set up the brush

	GraphR=0
	GraphG=0
	GraphB=0
	GraphA=0

	uiColorButtonColor(colorButton, :graphR,
		 :graphG,
		 :graphB,
		 :graphA)

	uiSetBrushType(brush,uiDrawBrushTypeSolid)
	uiSetBrushR(brush,graphR)
	uiSetBrushG(brush,graphG)
	uiSetBrushB(brush,graphB)

	// we set brush->A below to different values for the fill and stroke

	// now create the fill for the graph below the graph line
	path = constructGraph(graphWidth, graphHeight, 1)

  uiSetBrushA(brush, graphA / 2)
	uiDrawFill(uiEventContext(), path, brush)
	uiDrawFreePath(path)

	// now draw the histogram line
	path = constructGraph(graphWidth, graphHeight, 0)
	uiSetBrushA(brush,graphA)
	uiDrawStroke(uiEventContext(), path, brush, sp)
	uiDrawFreePath(path)

	// now draw the point being hovered over
	if currentPoint != -1
		xs = list(10)
		ys = list(10)
		pointLocations(graphWidth, graphHeight, xs, ys)
		path = uiDrawNewPath(uiDrawFillModeWinding)

		uiDrawPathNewFigureWithArc(path,
			xs[currentPoint], ys[currentPoint],
			pointRadius,
			0, 6.23,		// TODO pi
			0)
		uiDrawPathEnd(path)
		// use the same brush as for the histogram lines
		uiDrawFill(uiEventContext(), path, brush)
		uiDrawFreePath(path)
	ok

func inPoint x, y, xtest, ytest
	// TODO switch to using a matrix
	x -= xoffLeft
	y -= yoffTop
	return (x >= xtest - pointRadius) &&
		(x <= xtest + pointRadius) &&
		(y >= ytest - pointRadius) &&
		(y <= ytest + pointRadius)

func handlerMouseEvent
	xs = list(10)
	ys = list(10)

	aOut = graphSize(uiEventAreaWidth(), uiEventAreaHeight())
	graphWidth = aOut[1]
	graphHeight = aOut[2]

	pointLocations(graphWidth, graphHeight, xs, ys)

	e = uiEventAreaMouseEvent()
	eX = get_uiAreaMouseEvent_X(e)
	eY = get_uiAreaMouseEvent_Y(e)
	for i=1 to 10
		if inPoint(eX, eY, xs[i], ys[i])
			exit
		ok
	next
	if i = 11		// not in a point
		i = -1
	ok

	currentPoint = i

	uiAreaQueueRedrawAll(histogram)

func onDatapointChanged
	uiAreaQueueRedrawAll(histogram)

func onColorChanged
	uiAreaQueueRedrawAll(histogram);

func onClosing
	uiControlDestroy(uiControl(mainwin))
	uiQuit()
	return 0

func shouldQuit
	uiControlDestroy(uiControl(mainwin))

func main

	uiOnShouldQuit("shouldQuit()")

	mainwin = uiNewWindow("Histogram Sample", 800, 480, 1)
	uiWindowSetMargined(mainwin, 1)
	uiWindowOnClosing(mainwin, "onClosing()")

	Brush = uiNewSolidBrush(0)

	hbox = uiNewHorizontalBox()
	uiBoxSetPadded(hbox, 1)
	uiWindowSetChild(mainwin, uiControl(hbox))

	vbox = uiNewVerticalBox()
	uiBoxSetPadded(vbox, 1)
	uiBoxAppend(hbox, uiControl(vbox), 0)

	srandom(clock());
	for i=1 to 10
		datapoints[i] = uiNewSpinbox(0, 100)
		uiSpinboxSetValue(datapoints[i], random() % 101)
		uiSpinboxOnChanged(datapoints[i], "onDatapointChanged()")
		uiBoxAppend(vbox, uiControl(datapoints[i]), 0)
	next

	colorButton = uiNewColorButton()

	setSolidBrush(brush, colorDodgerBlue, 1.0)

	uiColorButtonSetColor(colorButton,
		uiBrushR(brush),
		uiBrushG(brush),
		uiBrushB(brush),
		uiBrushA(brush))

	uiColorButtonOnChanged(colorButton, "onColorChanged()")
	uiBoxAppend(vbox, uiControl(colorButton), 0)

	oAreaHandler = uiNewAreaHandler("handlerDraw()","handlerMouseEvent()","","","")
	histogram = uiNewArea(oAreaHandler)
	uiBoxAppend(hbox, uiControl(histogram), 1)

	uiControlShow(uiControl(mainwin))
	uiMain()
```

Screen Shot:

:alt: RingLibui Screen Shot

# Text Drawing

```ring
# Sample ported to Ring
# Based on original sample from : https://github.com/andlabs/libui

load "libui.ring"

# Global Variables
	mainwin		= NULL
	area		= NULL
	handler		= NULL
	fontButton	= NULL
	alignment	= NULL
	attrstr		= NULL

func appendWithAttribute what, attr, attr2
	nStart = uiAttributedStringLen(attrstr)
	nEnd = nStart + len(what)
	uiAttributedStringAppendUnattributed(attrstr, what)
	uiAttributedStringSetAttribute(attrstr, attr, nStart, nEnd)
	if ! ISNULL(attr2)
		uiAttributedStringSetAttribute(attrstr, attr2, nStart, nEnd)
	ok

func makeAttributedString

	attrstr = uiNewAttributedString("Drawing strings with libui is done with the uiAttributedString and uiDrawTextLayout objects."+nl+
		"uiAttributedString lets you have a variety of attributes: ")

	attr = uiNewFamilyAttribute("Courier New")
	appendWithAttribute("font family", attr, NULL)
	uiAttributedStringAppendUnattributed(attrstr, ", ")

	attr = uiNewSizeAttribute(18)
	appendWithAttribute("font size", attr, NULL)
	uiAttributedStringAppendUnattributed(attrstr, ", ")

	attr = uiNewWeightAttribute(uiTextWeightBold)
	appendWithAttribute("font weight", attr, NULL)
	uiAttributedStringAppendUnattributed(attrstr, ", ")

	attr = uiNewItalicAttribute(uiTextItalicItalic)
	appendWithAttribute("font italicness", attr, NULL)
	uiAttributedStringAppendUnattributed(attrstr, ", ")

	attr = uiNewStretchAttribute(uiTextStretchCondensed)
	appendWithAttribute("font stretch", attr, NULL)
	uiAttributedStringAppendUnattributed(attrstr, ", ")

	attr = uiNewColorAttribute(0.75, 0.25, 0.5, 0.75)
	appendWithAttribute("text color", attr, NULL)
	uiAttributedStringAppendUnattributed(attrstr, ", ")

	attr = uiNewBackgroundAttribute(0.5, 0.5, 0.25, 0.5)
	appendWithAttribute("text background color", attr, NULL)
	uiAttributedStringAppendUnattributed(attrstr, ", ")


	attr = uiNewUnderlineAttribute(uiUnderlineSingle)
	appendWithAttribute("underline style", attr, NULL)
	uiAttributedStringAppendUnattributed(attrstr, ", ")

	uiAttributedStringAppendUnattributed(attrstr, "and ")
	attr = uiNewUnderlineAttribute(uiUnderlineDouble)
	attr2 = uiNewUnderlineColorAttribute(uiUnderlineColorCustom, 1.0, 0.0, 0.5, 1.0)
	appendWithAttribute("underline color", attr, attr2)
	uiAttributedStringAppendUnattributed(attrstr, ". ")

	uiAttributedStringAppendUnattributed(attrstr, "Furthermore, there are attributes allowing for ")
	attr = uiNewUnderlineAttribute(uiUnderlineSuggestion)
	attr2 = uiNewUnderlineColorAttribute(uiUnderlineColorSpelling, 0, 0, 0, 0)
	appendWithAttribute("special underlines for indicating spelling errors", attr, attr2)
	uiAttributedStringAppendUnattributed(attrstr, " (and other types of errors) ")

	uiAttributedStringAppendUnattributed(attrstr, "and control over OpenType features such as ligatures (for instance, ")
	otf = uiNewOpenTypeFeatures()
	uiOpenTypeFeaturesAdd(otf, ASCII('l'), ASCII('i'), ASCII('g'), ASCII('a'), 0)
	attr = uiNewFeaturesAttribute(otf)
	appendWithAttribute("afford", attr, NULL)
	uiAttributedStringAppendUnattributed(attrstr, " vs. ")
	uiOpenTypeFeaturesAdd(otf, ASCII('l'), ASCII('i'), ASCII('g'), ASCII('a'), 1)
	attr = uiNewFeaturesAttribute(otf)
	appendWithAttribute("afford", attr, NULL)
	uiFreeOpenTypeFeatures(otf)
	uiAttributedStringAppendUnattributed(attrstr, ").\n")

	uiAttributedStringAppendUnattributed(attrstr, "Use the controls opposite to the text to control properties of the text.")

func handlerDraw

	defaultfont = new_uiFontDescriptor()
	params = new_uiDrawTextLayoutParams()

	set_uiDrawTextLayoutParams_String(params,attrstr)
	uiFontButtonFont(fontButton, defaultFont)
	set_uiDrawTextLayoutParams_DefaultFont(params,defaultFont)
	set_uiDrawTextLayoutParams_Width(params,uiEventAreaWidth())
	set_uiDrawTextLayoutParams_Align(params,uiComboboxSelected(alignment))
	textLayout = uiDrawNewTextLayout(params)
	uiDrawText(uiEventContext(), textLayout, 0, 0)
	uiDrawFreeTextLayout(textLayout)
	uiFreeFontButtonFont(defaultFont)

func onFontChanged
	uiAreaQueueRedrawAll(area)

func onComboboxSelected
	uiAreaQueueRedrawAll(area)

func onClosing
	uiControlDestroy(mainwin)
	uiQuit()

func shouldQuit
	uiControlDestroy(mainwin)

func main

	uiOnShouldQuit("shouldQuit()")

	makeAttributedString()

	mainwin = uiNewWindow("libui Text-Drawing Example", 640, 480, 1)
	uiWindowSetMargined(mainwin, 1)
	uiWindowOnClosing(mainwin, "onClosing()")

	hbox = uiNewHorizontalBox()
	uiBoxSetPadded(hbox, 1)
	uiWindowSetChild(mainwin, hbox)

	vbox = uiNewVerticalBox()
	uiBoxSetPadded(vbox, 1)
	uiBoxAppend(hbox, vbox, 0)

	fontButton = uiNewFontButton()
	uiFontButtonOnChanged(fontButton, "onFontChanged()")
	uiBoxAppend(vbox, fontButton, 0)

	form = uiNewForm()
	uiFormSetPadded(form, 1)
	uiBoxAppend(vbox, form, 0)

	alignment = uiNewCombobox()
	uiComboboxAppend(alignment, "Left")
	uiComboboxAppend(alignment, "Center")
	uiComboboxAppend(alignment, "Right")
	uiComboboxSetSelected(alignment, 0)		// start with left alignment
	uiComboboxOnSelected(alignment, "onComboboxSelected()")
	uiFormAppend(form, "Alignment", alignment, 0)

	oAreaHandler = uiNewAreaHandler("handlerDraw()","","","","")
	area = uiNewArea(oAreaHandler)
	uiBoxAppend(hbox, area, 1)

	uiControlShow(mainwin)
	uiMain()
	uiFreeAttributedString(attrstr)
```

Screen Shot:

:alt: RingLibui Screen Shot

:alt: RingLibui Screen Shot

:alt: RingLibui Screen Shot

# More Drawing Samples

Example (1):

```ring
# Sample ported to Ring
# Based on original sample from : https://github.com/andlabs/libui

load "libui.ring"

oWindow = uiNewWindow( "Drawing Sample", 400, 400, True)
uiWindowOnClosing(oWindow,"closeApp()")

oAreaHandler = uiNewAreaHandler("draw()","","","","")
area = uiNewArea(oAreaHandler)

btnClose = uiNewButton("Close Application")
uiButtonOnClicked(btnClose,"closeApp()")

hbox = uiNewVerticalBox()
uiBoxSetPadded(hbox, 1)
uiBoxAppend(hbox,btnClose,0)
uiBoxAppend(hbox,area,1)
uiWindowSetChild(oWindow, hbox)

uiControlShow( oWindow )
uiMain()

func draw
	nWidth = uiEventAreaWidth()		nHeight = uiEventAreaHeight()
	source = new_uiDrawBrush()
	sp = new_uiDrawStrokeParams()
	source = uiNewSolidBrush(colorBlue)
	set_uiDrawStrokeParams_Cap(sp,uiDrawLineCapFlat)
	set_uiDrawStrokeParams_Join(sp,uiDrawLineJoinMiter)
	set_uiDrawStrokeParams_MiterLimit(sp,uiDrawDefaultMiterLimit)
	set_uiDrawStrokeParams_NumDashes(sp,0)
	set_uiDrawStrokeParams_DashPhase(sp,0)
	set_uiDrawStrokeParams_Thickness(sp,40.96)

	path = uiDrawNewPath(uiDrawFillModeWinding)
	uiDrawPathNewFigure(path, 76.8, 84.48)
	uiDrawPathLineTo(path, 76.8 + 51.2, 84.48 -51.2)
	uiDrawPathLineTo(path, 76.8 + 51.2 + 51.2, 84.48 - 51.2 + 51.2)
	uiDrawPathEnd(path)
	set_uiDrawStrokeParams_Join(sp,uiDrawLineJoinMiter)
	uiDrawStroke(uiEventContext(), path, source, sp)
	uiDrawFreePath(path)

	path = uiDrawNewPath(uiDrawFillModeWinding)
	uiDrawPathNewFigure(path, 76.8, 161.28)
	uiDrawPathLineTo(path, 76.8 + 51.2, 161.28 -51.2)
	uiDrawPathLineTo(path, 76.8 + 51.2 + 51.2, 161.28 - 51.2 + 51.2)
	uiDrawPathEnd(path)
	set_uiDrawStrokeParams_Join(sp,uiDrawLineJoinBevel)
	uiDrawStroke(uiEventContext(), path, source, sp)
	uiDrawFreePath(path)

	path = uiDrawNewPath(uiDrawFillModeWinding)
	uiDrawPathNewFigure(path, 76.8, 238.08)
	uiDrawPathLineTo(path, 76.8 + 51.2, 238.08 -51.2)
	uiDrawPathLineTo(path, 76.8 + 51.2 + 51.2, 238.08 - 51.2 + 51.2)
	uiDrawPathEnd(path)
	set_uiDrawStrokeParams_Join(sp,uiDrawLineJoinRound)
	uiDrawStroke(uiEventContext(), path, source, sp)
	uiDrawFreePath(path)

func closeApp
	uiQuit()
```

Screen Shot:

:alt: RingLibui Screen Shot

Example (2):

```ring
# Sample ported to Ring
# Based on original sample from : https://github.com/andlabs/libui

load "libui.ring"

oWindow = uiNewWindow( "Drawing Sample", 400, 400, True)
uiWindowOnClosing(oWindow,"closeApp()")

oAreaHandler = uiNewAreaHandler("draw()","","","","")
area = uiNewArea(oAreaHandler)

btnClose = uiNewButton("Close Application")
uiButtonOnClicked(btnClose,"closeApp()")

hbox = uiNewVerticalBox()
uiBoxSetPadded(hbox, 1)
uiBoxAppend(hbox,btnClose,0)
uiBoxAppend(hbox,area,1)
uiWindowSetChild(oWindow, hbox)

uiControlShow( oWindow )
uiMain()

func draw
	nWidth = uiEventAreaWidth()		nHeight = uiEventAreaHeight()

	source = new_uiDrawBrush()
	sp = new_uiDrawStrokeParams()
	source = uiNewSolidBrush(colorBlack)
	set_uiDrawStrokeParams_Cap(sp,uiDrawLineCapFlat)
	set_uiDrawStrokeParams_Join(sp,uiDrawLineJoinMiter)
	set_uiDrawStrokeParams_MiterLimit(sp,uiDrawDefaultMiterLimit)
	set_uiDrawStrokeParams_NumDashes(sp,0)
	set_uiDrawStrokeParams_DashPhase(sp,0)
	set_uiDrawStrokeParams_Thickness(sp,30)

	set_uiDrawStrokeParams_Cap(sp,uiDrawLineCapFlat)
	path = uiDrawNewPath(uiDrawFillModeWinding)
	uiDrawPathNewFigure(path, 64.0, 50.0)
	uiDrawPathLineTo(path, 64.0, 200.0)
	uiDrawPathEnd(path)
	uiDrawStroke(uiEventContext(), path, source, sp)
	uiDrawFreePath(path)

	set_uiDrawStrokeParams_Cap(sp,uiDrawLineCapRound)
	path = uiDrawNewPath(uiDrawFillModeWinding)
	uiDrawPathNewFigure(path, 128.0, 50.0)
	uiDrawPathLineTo(path, 128.0, 200.0)
	uiDrawPathEnd(path)
	uiDrawStroke(uiEventContext(), path, source, sp)
	uiDrawFreePath(path)

	set_uiDrawStrokeParams_Cap(sp,uiDrawLineCapSquare)
	path = uiDrawNewPath(uiDrawFillModeWinding)
	uiDrawPathNewFigure(path, 192.0, 50.0)
	uiDrawPathLineTo(path, 192.0, 200.0)
	uiDrawPathEnd(path)
	uiDrawStroke(uiEventContext(), path, source, sp)
	uiDrawFreePath(path)

	// draw helping lines
	// keep the square cap to match the reference picture on the cairo website
	uiCrSourceRGBA(source, 1, 0.2, 0.2, 1)
	set_uiDrawStrokeParams_Thickness(sp,2.56)
	path = uiDrawNewPath(uiDrawFillModeWinding)
	uiDrawPathNewFigure(path, 64.0, 50.0)
	uiDrawPathLineTo(path, 64.0, 200.0)
	uiDrawPathNewFigure(path, 128.0, 50.0)
	uiDrawPathLineTo(path, 128.0, 200.0)
	uiDrawPathNewFigure(path, 192.0, 50.0)
	uiDrawPathLineTo(path, 192.0, 200.0)
	uiDrawPathEnd(path)
	uiDrawStroke(uiEventContext(), path, source, sp)
	uiDrawFreePath(path)

func closeApp
	uiQuit()
```

Screen Shot:

:alt: RingLibui Screen Shot

Example (3):

```ring
# Sample ported to Ring
# Based on original sample from : https://github.com/andlabs/libui

load "libui.ring"

oWindow = uiNewWindow( "Drawing Sample", 260, 300, True)
uiWindowOnClosing(oWindow,"closeApp()")

oAreaHandler = uiNewAreaHandler("draw()","","","","")
area = uiNewArea(oAreaHandler)

btnClose = uiNewButton("Close Application")
uiButtonOnClicked(btnClose,"closeApp()")

hbox = uiNewVerticalBox()
uiBoxSetPadded(hbox, 1)
uiBoxAppend(hbox,btnClose,0)
uiBoxAppend(hbox,area,1)
uiWindowSetChild(oWindow, hbox)

uiControlShow( oWindow )
uiMain()

func draw
	nWidth = uiEventAreaWidth()		nHeight = uiEventAreaHeight()

	source = new_uiDrawBrush()
	sp = new_uiDrawStrokeParams()

	x         = 25.6
	y         = 25.6
	width         = 204.8
	height        = 204.8
	aspect        = 1.0
	corner_radius = height

	radius = corner_radius / aspect
	degrees = uiPi / 180.0

	source = uiNewSolidBrush(colorBlue)
	set_uiDrawStrokeParams_Cap(sp,uiDrawLineCapFlat)
	set_uiDrawStrokeParams_Join(sp,uiDrawLineJoinMiter)
	set_uiDrawStrokeParams_MiterLimit(sp,uiDrawDefaultMiterLimit)
	set_uiDrawStrokeParams_NumDashes(sp,0)
	set_uiDrawStrokeParams_DashPhase(sp,0)
	set_uiDrawStrokeParams_Thickness(sp,30)

	path = uiDrawNewPath(uiDrawFillModeWinding)

	// top right corner
	uiDrawPathNewFigureWithArc(path,
		x + width - radius, y + radius,
		radius,
		-90 * degrees, uiPi / 2,
		0)
	// bottom right corner
	uiDrawPathArcTo(path,
		x + width - radius, y + height - radius,
		radius,
		0 * degrees, uiPi / 2,
		0)
	// bottom left corner
	uiDrawPathArcTo(path,
		x + radius, y + height - radius,
		radius,
		90 * degrees, uiPi / 2,
		0)
	// top left corner
	uiDrawPathArcTo(path,
		x + radius, y + radius,
		radius,
		180 * degrees, uiPi / 2,
		0)
	uiDrawPathCloseFigure(path)
	uiDrawPathEnd(path)

	uiCrSourceRGBA(source, 0.5, 0.5, 1, 1)
	uiDrawFill(uiEventContext(), path, source)
	uiCrSourceRGBA(source, 0.5, 0, 0, 0.5)
	set_uiDrawStrokeParams_Thickness(sp,10)
	uiDrawStroke(uiEventContext(), path, source, sp)
	uiDrawFreePath(path)

func closeApp
	uiQuit()
```

Screen Shot:

:alt: RingLibui Screen Shot

Example (4):

```ring
# Sample ported to Ring
# Based on original sample from : https://github.com/andlabs/libui

load "libui.ring"

oWindow = uiNewWindow( "Drawing Sample", 300, 300, True)
uiWindowOnClosing(oWindow,"closeApp()")

oAreaHandler = uiNewAreaHandler("draw()","","","","")
area = uiNewArea(oAreaHandler)

btnClose = uiNewButton("Close Application")
uiButtonOnClicked(btnClose,"closeApp()")

hbox = uiNewVerticalBox()
uiBoxSetPadded(hbox, 1)
uiBoxAppend(hbox,btnClose,0)
uiBoxAppend(hbox,area,1)
uiWindowSetChild(oWindow, hbox)

uiControlShow( oWindow )
uiMain()

func draw
	nWidth = uiEventAreaWidth()		nHeight = uiEventAreaHeight()

	source = new_uiDrawBrush()
	sp = new_uiDrawStrokeParams()

	source = uiNewSolidBrush(colorBlue)
	set_uiDrawStrokeParams_Cap(sp,uiDrawLineCapFlat)
	set_uiDrawStrokeParams_Join(sp,uiDrawLineJoinMiter)
	set_uiDrawStrokeParams_MiterLimit(sp,uiDrawDefaultMiterLimit)
	set_uiDrawStrokeParams_NumDashes(sp,0)
	set_uiDrawStrokeParams_DashPhase(sp,0)

	path = uiDrawNewPath(uiDrawFillModeWinding)

	uiDrawPathNewFigure(path, 50.0, 75.0)
	uiDrawPathLineTo(path, 200.0, 75.0)

	uiDrawPathNewFigure(path, 50.0, 125.0)
	uiDrawPathLineTo(path, 200.0, 125.0)

	uiDrawPathNewFigure(path, 50.0, 175.0)
	uiDrawPathLineTo(path, 200.0, 175.0)
	uiDrawPathEnd(path)

	set_uiDrawStrokeParams_Thickness(sp,30)
	set_uiDrawStrokeParams_Cap(sp,uiDrawLineCapRound)
	uiDrawStroke(uiEventContext(), path, source, sp)
	uiDrawFreePath(path)

func closeApp
	uiQuit()
```

Screen Shot:

:alt: RingLibui Screen Shot

Example (5):

```ring
# Sample ported to Ring
# Based on original sample from : https://github.com/andlabs/libui

load "libui.ring"

oWindow = uiNewWindow( "Drawing Sample", 260, 300, True)
uiWindowOnClosing(oWindow,"closeApp()")

oAreaHandler = uiNewAreaHandler("draw()","","","","")
area = uiNewArea(oAreaHandler)

btnClose = uiNewButton("Close Application")
uiButtonOnClicked(btnClose,"closeApp()")

hbox = uiNewVerticalBox()
uiBoxSetPadded(hbox, 1)
uiBoxAppend(hbox,btnClose,0)
uiBoxAppend(hbox,area,1)
uiWindowSetChild(oWindow, hbox)

uiControlShow( oWindow )
uiMain()

func draw
	nWidth = uiEventAreaWidth()		nHeight = uiEventAreaHeight()

	source = new_uiDrawBrush()
	sp = new_uiDrawStrokeParams()
	m = new_uiDrawMatrix()
	source = uiNewSolidBrush(colorBlue)
	set_uiDrawStrokeParams_Cap(sp,uiDrawLineCapFlat)
	set_uiDrawStrokeParams_Join(sp,uiDrawLineJoinMiter)
	set_uiDrawStrokeParams_MiterLimit(sp,uiDrawDefaultMiterLimit)
	set_uiDrawStrokeParams_NumDashes(sp,0)
	set_uiDrawStrokeParams_DashPhase(sp,0)
	set_uiDrawStrokeParams_Thickness(sp,6)

	path = uiDrawNewPath(uiDrawFillModeAlternate)
	uiDrawPathAddRectangle(path, 12, 12, 232, 70)
	uiDrawPathNewFigureWithArc(path,
		64, 64,
		40,
		0, 2*uiPi,
		0)
	uiDrawPathNewFigureWithArc(path,
		192, 64,
		40,
		0, -2*uiPi,
		1)
	uiDrawPathEnd(path)

	uicrsourcergba(source, 0, 0.7, 0, 1)
	uiDrawFill(uiEventContext(), path, source)
	uicrsourcergba(source, 0, 0, 0, 1)
	uiDrawStroke(uiEventContext(), path, source, sp)
	uiDrawFreePath(path)

	uiDrawMatrixSetIdentity(m)
	uiDrawMatrixTranslate(m, 0, 128)
	uiDrawTransform(uiEventContext(), m)

	path = uiDrawNewPath(uiDrawFillModeWinding)
	uiDrawPathAddRectangle(path, 12, 12, 232, 70)
	uiDrawPathNewFigureWithArc(path,
		64, 64,
		40,
		0, 2*uiPi,
		0)
	uiDrawPathNewFigureWithArc(path,
		192, 64,
		40,
		0, -2*uiPi,
		1)
	uiDrawPathEnd(path)

	uicrsourcergba(source, 0, 0, 0.9, 1)
	uiDrawFill(uiEventContext(), path, source)
	uicrsourcergba(source, 0, 0, 0, 1)
	uiDrawStroke(uiEventContext(), path, source, sp)
	uiDrawFreePath(path)

func closeApp
	uiQuit()
```

Screen Shot:

:alt: RingLibui Screen Shot

Example (6):

```ring
# Sample ported to Ring
# Based on original sample from : https://github.com/andlabs/libui

load "libui.ring"

oWindow = uiNewWindow( "Drawing Sample", 260, 300, True)
uiWindowOnClosing(oWindow,"closeApp()")

oAreaHandler = uiNewAreaHandler("draw()","","","","")
area = uiNewArea(oAreaHandler)

btnClose = uiNewButton("Close Application")
uiButtonOnClicked(btnClose,"closeApp()")

hbox = uiNewVerticalBox()
uiBoxSetPadded(hbox, 1)
uiBoxAppend(hbox,btnClose,0)
uiBoxAppend(hbox,area,1)
uiWindowSetChild(oWindow, hbox)

uiControlShow( oWindow )
uiMain()

func draw
	nWidth = uiEventAreaWidth()		nHeight = uiEventAreaHeight()

	source = new_uiDrawBrush()
	sp = new_uiDrawStrokeParams()
	source = uiNewSolidBrush(colorBlue)
	set_uiDrawStrokeParams_Cap(sp,uiDrawLineCapFlat)
	set_uiDrawStrokeParams_Join(sp,uiDrawLineJoinMiter)
	set_uiDrawStrokeParams_MiterLimit(sp,uiDrawDefaultMiterLimit)
	set_uiDrawStrokeParams_NumDashes(sp,0)
	set_uiDrawStrokeParams_DashPhase(sp,0)

	path = uiDrawNewPath(uiDrawFillModeWinding)

	uiDrawPathNewFigure(path, 128.0, 25.6)
	uiDrawPathLineTo(path, 230.4, 230.4)
	uiDrawPathLineTo(path, 230.4 - 102.4, 230.4 + 0.0)
	uiDrawPathBezierTo(path, 51.2, 230.4, 51.2, 128.0, 128.0, 128.0)
	uiDrawPathCloseFigure(path)

	uiDrawPathNewFigure(path, 64.0, 25.6)
	uiDrawPathLineTo(path, 64.0 + 51.2, 25.6 + 51.2)
	uiDrawPathLineTo(path, 64.0 + 51.2 -51.2, 25.6 + 51.2 + 51.2)
	uiDrawPathLineTo(path, 64.0 + 51.2 -51.2 -51.2, 25.6 + 51.2 + 51.2 -51.2)
	uiDrawPathCloseFigure(path)

	uiDrawPathEnd(path)

	set_uiDrawStrokeParams_Thickness(sp,10)
	uicrsourcergba(source, 0, 0, 1, 1)
	uiDrawFill(uiEventContext(), path, source)
	uicrsourcergba(source, 0, 0, 0, 1)
	uiDrawStroke(uiEventContext(), path, source, sp)
	uiDrawFreePath(path)

func closeApp
	uiQuit()
```

Screen Shot:

:alt: RingLibui Screen Shot

Example (7):

```ring
# Sample ported to Ring
# Based on original sample from : https://github.com/andlabs/libui

load "libui.ring"

oWindow = uiNewWindow( "Drawing Sample", 260, 300, True)
uiWindowOnClosing(oWindow,"closeApp()")

oAreaHandler = uiNewAreaHandler("draw()","","","","")
area = uiNewArea(oAreaHandler)

btnClose = uiNewButton("Close Application")
uiButtonOnClicked(btnClose,"closeApp()")

hbox = uiNewVerticalBox()
uiBoxSetPadded(hbox, 1)
uiBoxAppend(hbox,btnClose,0)
uiBoxAppend(hbox,area,1)
uiWindowSetChild(oWindow, hbox)

uiControlShow( oWindow )
uiMain()

func draw
	nWidth = uiEventAreaWidth()		nHeight = uiEventAreaHeight()

	source = new_uiDrawBrush()
	sp = new_uiDrawStrokeParams()
	source = uiNewSolidBrush(colorBlue)

	x=25.6   y=128.0
	x1=102.4 y1=230.4
	x2=153.6 y2=25.6
  	x3=230.4 y3=128.0

	uicrsourcergba(source, 0, 0, 0, 1)
	set_uiDrawStrokeParams_Cap(sp,uiDrawLineCapFlat)
	set_uiDrawStrokeParams_Join(sp,uiDrawLineJoinMiter)
	set_uiDrawStrokeParams_MiterLimit(sp,uiDrawDefaultMiterLimit)
	set_uiDrawStrokeParams_NumDashes(sp,0)
	set_uiDrawStrokeParams_DashPhase(sp,0)

	path = uiDrawNewPath(uiDrawFillModeWinding)

	uiDrawPathNewFigure(path, x, y)
	uiDrawPathBezierTo(path, x1, y1, x2, y2, x3, y3)
	uiDrawPathEnd(path)
  	set_uiDrawStrokeParams_Thickness(sp,10)
	uiDrawStroke(uiEventContext(), path, source, sp)
	uiDrawFreePath(path)

	uicrsourcergba(source, 1, 0.2, 0.2, 0.6)
  	set_uiDrawStrokeParams_Thickness(sp,6)
	path = uiDrawNewPath(uiDrawFillModeWinding)
	uiDrawPathNewFigure(path, x, y)
	uiDrawPathLineTo(path, x1, y1)
	uiDrawPathNewFigure(path, x2, y2)
	uiDrawPathLineTo(path, x3, y3)
	uiDrawPathEnd(path)
	uiDrawStroke(uiEventContext(), path, source, sp)
	uiDrawFreePath(path)

func closeApp
	uiQuit()
```

Screen Shot:

:alt: RingLibui Screen Shot


## libuv

# =
# Using RingLibuv

In this chapter we will learn about using RingLibuv

> **Note:**

Information from the library website: http://libuv.org/

Libuv is a multi-platform support library with a focus on asynchronous I/O.

Feature highlights

- Full-featured event loop backed by epoll, kqueue, IOCP, event ports.
- Asynchronous TCP and UDP sockets
- Asynchronous DNS resolution
- Asynchronous file and file system operations
- File system events
- ANSI escape code controlled TTY
- IPC with socket sharing, using Unix domain sockets or named pipes (Windows)
- Child processes
- Thread pool
- Signal handling
- High resolution clock
- Threading and synchronization primitives

# First Application using RingLibuv

Example:

```ring
load "libuv.ring"

func main

	myloop = new_uv_loop_t()
	uv_loop_init(myloop)
	? "Now quitting"
	uv_run(myloop, UV_RUN_DEFAULT)
	uv_loop_close(myloop)
	destroy_uv_loop_t(myloop)
```

Output:

```ring
Now quitting
```


# The Events Loop

Example:

```ring
load "libuv.ring"

counter = 0
idler = NULL

func main
	idler = new_uv_idle_t()
	uv_idle_init(uv_default_loop(), idler)
	uv_idle_start(idler, "wait()")
	? "Idling..."
	uv_run(uv_default_loop(), UV_RUN_DEFAULT);
	uv_loop_close(uv_default_loop());
	destroy_uv_idle_t(idler)

func wait
	counter++
	if counter >= 100000
		uv_idle_stop(idler)
	ok
```

Output:

```ring
Idling...
```


# Server Example

Example:

```ring
load "libuv.ring"

? "Testing RingLibuv - Server Side"

DEFAULT_PORT    = 13370
DEFAULT_BACKLOG = 1024

addr    = new_sockaddr_in()
server  = NULL
client  = NULL
myloop  = NULL

func main
	myloop = uv_default_loop()
	server = new_uv_tcp_t()
	uv_tcp_init(myloop, server)
	uv_ip4_addr("127.0.0.1", DEFAULT_PORT, addr)
	uv_tcp_bind(server, addr, 0)
	r = uv_listen(server, DEFAULT_BACKLOG, "newconnection()")
	if r
		? "Listen error " + uv_strerror(r)
		return 1
	ok
	uv_run(myloop, UV_RUN_DEFAULT)
	destroy_uv_tcp_t(server)
	destroy_sockaddr_in(addr)

func newconnection
	? "New Connection"
	aPara   = uv_Eventpara(server,:connect)
	nStatus = aPara[2]
	if nStatus < 0
		? "New connection error : " + nStatus
		return
	ok
	client = new_uv_tcp_t()
	uv_tcp_init(myloop, client)
	if uv_accept(server, client) = 0
			uv_read_start(client, uv_myalloccallback(), "echo_read()")
	ok

func echo_read
	aPara = uv_Eventpara(client,:read)
	nRead = aPara[2]
	buf   = aPara[3]
	if nRead > 0
		req = new_uv_write_t()
			wrbuf = uv_buf_init(get_uv_buf_t_base(buf), nread)
		uv_write(req, client, wrbuf, 1, "echo_write()")
		? uv_buf2str(wrbuf)
		message = "message from the server to the client"
		buf = new_uv_buf_t()
		set_uv_buf_t_len(buf,len(message))
		set_uv_buf_t_base(buf,varptr("message",:char))
		uv_write(req, client, buf, 1, "echo_write()")
	ok

func echo_write
	aPara = uv_Eventpara(client,:read)
	req   = aPara[1]
```

Output:

When we run the client, We will see the message "New Connection"

Then the message "hello from the client"

```ring
Testing RingLibuv - Server Side
New Connection
hello from the client
```


# Client Example

Example:

```ring
load "libuv.ring"

? "Testing RingLibuv - Client Side"

DEFAULT_PORT    = 13370
DEFAULT_BACKLOG = 1024

addr    = new_sockaddr_in()
connect = NULL
buffer  = null
socket  = null

func main
	myloop  = uv_default_loop()
	Socket  = new_uv_tcp_t()
	connect = new_uv_connect_t()
	uv_tcp_init(myloop, Socket)
	uv_ip4_addr("127.0.0.1", DEFAULT_PORT, addr)
	uv_tcp_connect(connect,Socket, addr, "connect()")
	uv_run(myloop, UV_RUN_DEFAULT)
	destroy_uv_tcp_t(socket)
	destroy_uv_connect_t(connect)

func connect
	? "Client: Start Connection"
	aPara   = uv_Eventpara(connect,:connect)
	req     = aPara[1]
	nStatus = aPara[2]
	if nStatus = -1
		? "Error : on_write_end "
		return
	ok
	buf = new_uv_buf_t()
	message = "hello from the client"
	set_uv_buf_t_len(buf,len(message))
	set_uv_buf_t_base(buf,varptr("message",:char))
	tcp       = get_uv_connect_t_handle(req)
	write_req = new_uv_write_t()
	buf_count = 1
	uv_write(write_req, tcp, buf, buf_count, "on_write_end()")

func on_write_end
		uv_read_start(socket, uv_myalloccallback(), "echo_read()")

func echo_read
	aPara = uv_Eventpara(socket,:read)
	nRead = aPara[2]
	buf   = aPara[3]
	if nRead > 0
			wrbuf = uv_buf_init(get_uv_buf_t_base(buf), nread);
		? uv_buf2str(wrbuf)
	ok
```

Output:

We will run the client after the server

```ring
Testing RingLibuv - Client Side
Client: Start Connection
hello from the client
message from the server to the client
```


# Server Example Using Classes

Example:

```ring
load "libuv.ring"
load "objectslib.ring"

? "Testing RingLibuv - Server Side - Using Classes"

open_object(:MyServer)

class MyServer from ObjectControllerParent

	DEFAULT_PORT    = 13370
	DEFAULT_BACKLOG = 1024

	addr    = new_sockaddr_in()
	server  = NULL
	client  = NULL
	myloop  = NULL

	func start
		myloop = uv_default_loop()
		server = new_uv_tcp_t()
		uv_tcp_init(myloop, server)
		uv_ip4_addr("127.0.0.1", DEFAULT_PORT, addr)
		uv_tcp_bind(server, addr, 0)
		r = uv_listen(server, DEFAULT_BACKLOG, Method(:newconnection) )
		if r
			? "Listen error " + uv_strerror(r)
			return 1
		ok
		uv_run(myloop, UV_RUN_DEFAULT)
		destroy_uv_tcp_t(server)
		destroy_sockaddr_in(addr)

	func newconnection
		? "New Connection"
		aPara   = uv_Eventpara(server,:connect)
		nStatus = aPara[2]
		if nStatus < 0
			? "New connection error : " + nStatus
			return
		ok
		client = new_uv_tcp_t()
		uv_tcp_init(myloop, client)
		if uv_accept(server, client) = 0
				uv_read_start(client, uv_myalloccallback(),
							Method(:echo_read))
		ok

	func echo_read
		aPara = uv_Eventpara(client,:read)
		nRead = aPara[2]
		buf   = aPara[3]
		if nRead > 0
			req = new_uv_write_t()
				wrbuf = uv_buf_init(get_uv_buf_t_base(buf), nread)
			uv_write(req, client, wrbuf, 1, Method(:echo_write))
			? uv_buf2str(wrbuf)
			message = "message from the server to the client"
			buf = new_uv_buf_t()
			set_uv_buf_t_len(buf,len(message))
			set_uv_buf_t_base(buf,varptr("message",:char))
			uv_write(req, client, buf, 1, Method(:echo_write))
		ok

	func echo_write
		aPara = uv_Eventpara(client,:read)
		req   = aPara[1]
```

Output:

When we run the client, We will see the message "New Connection"

Then the message "hello from the client"

```ring
Testing RingLibuv - Server Side - Using Classes
New Connection
hello from the client
```


# Client Example Using Classes

Example:

```ring
load "libuv.ring"
load "objectslib.ring"

? "Testing RingLibuv - Client Side - Using Classes"

open_object(:MyClient)

Class MyClient from ObjectControllerParent

	DEFAULT_PORT    = 13370
	DEFAULT_BACKLOG = 1024

	addr    = new_sockaddr_in()
	connect = NULL
	buffer  = null
	socket  = null

	func start
		myloop  = uv_default_loop()
		Socket  = new_uv_tcp_t()
		connect = new_uv_connect_t()
		uv_tcp_init(myloop, Socket)
		uv_ip4_addr("127.0.0.1", DEFAULT_PORT, addr)
		uv_tcp_connect(connect,Socket, addr, Method(:connect))
		uv_run(myloop, UV_RUN_DEFAULT)
		destroy_uv_tcp_t(socket)
		destroy_uv_connect_t(connect)

	func connect
		? "Client: Start Connection"
		aPara   = uv_Eventpara(connect,:connect)
		req     = aPara[1]
		nStatus = aPara[2]
		if nStatus = -1
			? "Error : on_write_end "
			return
		ok
		buf = new_uv_buf_t()
		message = "hello from the client"
		set_uv_buf_t_len(buf,len(message))
		set_uv_buf_t_base(buf,varptr("message",:char))
		tcp       = get_uv_connect_t_handle(req)
		write_req = new_uv_write_t()
		buf_count = 1
		uv_write(write_req, tcp, buf, buf_count, Method(:on_write_end))

	func on_write_end
			uv_read_start(socket, uv_myalloccallback(), Method(:echo_read))

	func echo_read
		aPara = uv_Eventpara(socket,:read)
		nRead = aPara[2]
		buf   = aPara[3]
		if nRead > 0
				wrbuf = uv_buf_init(get_uv_buf_t_base(buf), nread);
			? uv_buf2str(wrbuf)
		ok
```

Output:

We will run the client after the server

```ring
Testing RingLibuv - Client Side - Using Classes
Client: Start Connection
hello from the client
message from the server to the client
```


# Threads Example

Example:

```ring
load "libuv.ring"

? "Testing RingLibuv - Threads"

func main
	one_id = new_uv_thread_t()
	two_id = new_uv_thread_t()
	uv_thread_create(one_id, "one()")
	uv_thread_create(two_id, "two()")
	uv_thread_join(one_id)
	uv_thread_join(two_id)
	destroy_uv_thread_t(one_id)
	destroy_uv_thread_t(two_id)

func one
	? "Message from the First Thread!"

func two
	? "Message from the Second Thread!"
```

Output:

```ring
Testing RingLibuv - Threads
Message from the First Thread!
Message from the Second Thread!
```


# Threads Example - Using Classes

Example:

```ring
load "libuv.ring"
load "objectslib.ring"

? "Testing RingLibuv - Threads - Using Classes"

open_object(:MyThreads)

class MyThreads from ObjectControllerParent

	func Start
		one_id = new_uv_thread_t()
		two_id = new_uv_thread_t()
		uv_thread_create(one_id, Method(:One))
		uv_thread_create(two_id, Method(:Two))
		uv_thread_join(one_id)
		uv_thread_join(two_id)
		destroy_uv_thread_t(one_id)
		destroy_uv_thread_t(two_id)

	func one
		? "Message from the First Thread!"

	func Two
		? "Message from the Second Thread!"
```

Output:

```ring
Testing RingLibuv - Threads - Using Classes
Message from the First Thread!
Message from the Second Thread!
```


## lowlevel

# =
# Low Level Functions

In this chapter we will learn about the low level functions provided by Ring

It's not recommended to use these functions in your application code

These functions exist for C/C++ developers who are developing Ring libraries/tools

We expect from those developers to know about pointers and dynamic memory management

```ring
* callgarbagecollector()| callgc()
* variablepointer()	| varptr()
* space()
* nullpointer()		| nullptr()
* object2pointer()	| obj2ptr()
* pointer2object()	| ptr2obj()
* ispointer()
* pointercompare()	| ptrcmp()
* setpointer()		| setptr()
* getpointer()		| getptr()
* pointer2string()	| ptr2str()
* memorycopy()		| memcpy()
* ringvm_cfunctionslist()
* ringvm_functionslist()
* ringvm_classeslist()
* ringvm_packageslist()
* ringvm_memorylist()
* ringvm_calllist()
* ringvm_fileslist()
* ringvm_settrace()
* ringvm_tracedata()
* ringvm_traceevent()
* ringvm_tracefunc()
* ringvm_scopescount()
* ringvm_evalinscope()
* ringvm_passerror()
* ringvm_hideerrormsg()
* ringvm_callfunc()
* ringvm_see()
* ringvm_give()
* ringvm_errorhandler()
* ringvm_codelist()
* ringvm_info()
* ringvm_ismempool()
* ringvm_runcode()
* ringvm_ringolists()
* ringvm_translatecfunction()
* ringvm_writeringo()
```


# callgc() function

Syntax:

```ring
callgc()			# Short name
callgarbagecollector()		# Long name
```

Use this function to force calling the garbage collector during function execution when you
use a loop that create temp. variables that you don't free using the assignment operation.

It's very rare to need this function but it's useful when you create something like event-loop
for your game engine and start creating lists on the fly when you call functions.

Example

```ring
While True

	# process events
	# call functions using temp. lists like myfunc(["temp list"])

	# call the garbage collector
	callgc()
End
```

> **Tip:**
> when you use the assignment statement.

# varptr() function

Use the varptr() function when you need to pass a pointer to a C/C++ function.

Syntax:

```ring
varptr(cVariableName,cPointerType) ---> Low Level Object (C Pointer)
variablepointer(cVariableName,cPointerType) ---> Low Level Object (C Pointer)
```

example:

```ring
r = 10
z = 20
see r + nl
see varptr("r","int")
see varptr("z","int")
```

Output:

```ring
10
00E3C740
int
2
00E3BEC0
int
2
```

> **Note:**

# space() function

Use the space function to allocate a specific number of bytes in Memory.

Syntax:

```ring
Space(nBytesCount) ---> String
```

Example:

```ring
mystring = space(200)
See "String Size : " + len(mystring) + nl
See "String : " + mystring + nl
See "String Pointer : "
See varptr("mystring",:char)
```

Output:

```ring
String Size : 200
String :
String Pointer : 00FF8FE8
char
2
```

> **Note:**

> **Tip:**

```ring
mystring = space(1000)	# Allocate memory (1000 bytes)
mystring = NULL 	# Free memory stored in mystring
```

> **Note:**

# nullpointer() function

Syntax:

```ring
nullptr()		# Short name
nullpointer()		# Long name
```

You may need to pass the NULL pointer to a C function that may expect a pointer as parameter
and accept NULL pointers for optional parameters.

Example:

The next example uses the SDL_BlitSurface() function from the LibSDL Library through RingSDL
The function accept SDL_Rect pointers in the second and the last parameter.
Also the function accept NULL pointers, so we can pass them using the NULLPointer() Function.

```ring
SDL_BlitSurface(text, nullpointer(), surface, nullpointer())
```

> **Note:**

> **Tip:**

```ring
SDL_BlitSurface(text, NULL, surface, NULL)
```


# object2pointer() function

Use this function to get a C pointer for Ring lists and objects

Syntax:

```ring
obj2ptr(List|Object) --> Low Level Object ( C Pointer )		# Short name
object2pointer(List|Object) --> Low Level Object ( C Pointer )	# Long name
```

> **Note:**

# pointer2object() function

Use this function to get the Ring list and/or object from the low level object (C Pointer)

Syntax:

```ring
ptr2obj(Low Level Object) ---> ListReference|ObjectReference		# Short name
pointer2object(Low Level Object) ---> ListReference|ObjectReference	# Long name
```

> **Note:**

> **Tip:**

Example:

```ring
# Create the list
mylist = 1:5

# Create pointer to the list
x = object2pointer(mylist)
see x

see nl

# Add items to the list
mylist + "welcome"

# Get a copy from the list
y = pointer2object(x)
# print the new list items
see y
```

Output:

```ring
0069A5D8
OBJECTPOINTER
0

1
2
3
4
5
welcome
```

> **Note:**
> Just use the object2pointer() and pointer2object() functions.

The functions Object2Pointer() and Pointer2Object() are low level functions

We have to be careful when using them to avoid memory problems

If we created a Pointer to a (Local Variable)

This local variable will be deleted from the memory after the end of the function/method execution

This means that the pointer created with Object2Pointer() will becomes a dangling pointer

i.e. A pointer that points to the memory location of the deallocated memory

Using this invalid pointer could lead to (CRASH or Memory Corruption).

If you will use pointers (Using Object2Pointer() or Pointer2Object()) then never use pointers that point to the memory that are deallocated.

In simple words, Keep the memory (Don't delete it if you still need it)

i.e. instead of using (Local Variables) that will be deleted, You can use Class Attributes or Global Variables.

# ispointer() function

Check if the parameter is a pointer (C Object) or not.

Syntax:

```ring
IsPointer(vPara) ---> True|False	# Long name
```

Example :

```ring
fp = fopen(filename(),"r")

? type(fp)

? ispointer(fp)
```

Output :

```ring
file
1
```


# ptrcmp() function

We can compare between two pointers (C Objects) using the ptrcmp() function.

Syntax:

```ring
ptrcmp(oObject1,oObject2) ---> value = 1 if oObject1 = oObject2
			       value = 0 if oObject1 != oObject2
pointercompare(oObject1,oObject2) ---> value = 1 if oObject1 = oObject2
				       value = 0 if oObject1 != oObject2
```

Example:

```ring
fp = fopen("ptrcmp.ring","r")
fp2 = fp
fp3 = fopen("ptrcmp.ring","r")

see ptrcmp(fp,fp2) + nl
see ptrcmp(fp,fp3) + nl

fclose(fp)
fclose(fp3)
```

Output:

```ring
1
0
```


# setpointer() function

Set the pointer address to another address

Syntax:

```ring
setptr(pointer,nNewAddress)		# Short name
setpointer(pointer,nNewAddress)		# Long name
```

> **Note:**

# getpointer() function

Get the pointer address

Syntax:

```ring
getptr(pointer) ---> nAddress		# Short name
getpointer(pointer) ---> nAddress	# Long name
```

Example:

```ring
? "Sample about using setPointer() and getPointer() functions"
? copy("=",50)
pointer = NULLPOINTER()
? pointer
? "Type: " + type(pointer)
? "Address: " + Upper(hex(getpointer(pointer)))
? copy("=",50)
name = "ring"
pointer = varptr(:name,:char)
? pointer
? "Type: " + type(pointer)
? "Address: " + Upper(hex(getpointer(pointer)))
? copy("=",50)
setpointer(pointer, getpointer(pointer) + 1 )
? "After Update"
? "Address: " + Upper(hex(getpointer(pointer)))
? copy("=",50)
```

Output:

```ring
==================================================
00000000
NULLPOINTER
0

Type: NULLPOINTER
Address: 0
==================================================
026E2BA8
char
0

Type: char
Address: 26E2BA8
==================================================
After Update
Address: 26E2BA9
==================================================
```


# pointer2string() function

Convert a pointer to a string of binary data

If you want to convert the string to a pointer again use VarPtr() function

Syntax:

```ring
ptr2str(pointer,nStart,nCount) ---> cString		# Short name
pointer2string(pointer,nStart,nCount) ---> cString	# Long name
```

> **Note:**

> **Note:**

Example:

```ring
name = "ring"
pointer = varptr(:name,:char)
? pointer
? "Type: " + type(pointer)
? "Address: " + Upper(hex(getpointer(pointer)))

? "Get 4 bytes starting from the pointer address"
mystring = Pointer2String(pointer,0,4)
? mystring

? "Get 2 bytes starting from the pointer address + 1"
mystring2 = Pointer2String(pointer,1,2)
? mystring2
```

Output:

```ring
01E03380
char
0

Type: char
Address: 1E03380
Get 4 bytes starting from the pointer address
ring
Get 2 bytes starting from the pointer address + 1
in
```


# memcpy() function

Syntax:

```ring
memcpy(pDestinationPointer,cSourceString,nSize)		# Short name
memorycopy(pDestinationPointer,cSourceString,nSize)	# Long name
```

Example:

```ring
str = space(9)
pointer = varptr(:str,"char")
memcpy(pointer,"one",3)
? str
setPointer(pointer,getPointer(pointer)+3)
memcpy(pointer,"one",3)
? str
setPointer(pointer,getPointer(pointer)+3)
memcpy(pointer,"one",3)
? str
```

Output:

```ring
one
oneone
oneoneone
```


# ringvm_cfunctionslist() function

The Function return a list of functions written in C.

Syntax:

```ring
RingVM_CFunctionsList() ---> List
```

Example:

```ring
See RingVM_CFunctionsList()
```


# ringvm_functionslist() function

The Function return a list of functions written in Ring.

Each List Member is a list contains the next items

- Function Name
- Program Counter (PC) - Function Position in Byte Code.
- Source Code File Name
- Private Flag (For Private Methods in Classes)

Syntax:

```ring
RingVM_FunctionsList() ---> List
```

Example:

```ring
test()

func test
	see ringvm_functionslist()
```

Output:

```ring
test
8
B:/ring/tests/scripts/functionslist.ring
0
```


# ringvm_classeslist() function

The Function return a list of Classes.

Each List Member is a list contains the next items

- Class Name
- Program Counter (PC) - Class Position in Byte Code.
- Parent Class Name
- Methods List
- Flag (Is parent class information collected)
- Pointer to the package (or NULL if no package is used)

Syntax:

```ring
RingVM_ClassesList() ---> List
```

Example:

```ring
see ringvm_classeslist()

class class1
	func f1
class class2 from class1
class class3 from class1
```

Output:

```ring
class1
9

f1
13
B:/ring/tests/scripts/classeslist.ring
0
0
00000000
class2
16
class1
0
00000000
class3
20
class1
0
00000000
```


# ringvm_packageslist() function

The Function return a list of Packages.

Each List Member is a list contains the next items

- Package Name
- Classes List

Syntax:

```ring
RingVM_PackagesList() ---> List
```

Example:

```ring
see ringvm_packageslist()

package package1
	class class1

package package2
	class class1

package package3
	class class1
```

Output:

```ring
package1
class1
11

0
00FEF838
package2
class1
17

0
00FEF978
package3
class1
23

0
00FEFF68
```


# ringvm_memorylist() function

The Function return a list of Memory Scopes and Variables.

Each List Member is a list contains variables in a different scope.

Each Item in the scope list is a list contains the next items

- Variable Name
- Variable Type
- Variable Value
- Pointer Type (List/Item) if the value is a list
- Private Flag (if the variable is an attribute in a Class)

Syntax:

```ring
RingVM_MemoryList() ---> List
```

Example:

```ring
x = 10
test()
func test
	y = 20
	see ringvm_memorylist()
```

Output:

```ring
true
2
1
0
0
false
2
0
0
0
nl
1


0
0
null
1

0
0
ring_gettemp_var
4
00000000
0
0
ccatcherror
1
NULL
0
0
ring_settemp_var
4
00000000
0
0
ring_tempflag_var
2
0
0
0
stdin
3
50512DB8
file
0
0
0
stdout
3
50512DD8
file
0
0
0
stderr
3
50512DF8
file
0
0
0
this
4
00000000
0
0
sysargv
3
B:\ring\bin/ring
B:/ring/tests/scripts/memorylist.ring
0
0
x
2
10
0
0
y
2
20
0
0
```


# ringvm_calllist() function

The Function return a list of the functions call list.

Each List Member is a list contains the next items

- Function Type
- Function Name
- Program Counter (PC)
- Stack Pointer (SP)
- Method or Function Flag
- Caller PC
- Caller Line Number
- Parameters Count

Syntax:

```ring
RingVM_CallList() ---> List
```

Example:

```ring
hello()
func hello
	test()

func test
	mylist = ringvm_calllist()
	for t in mylist see t[2] + nl next
```

Output:

```ring
hello
test
ringvm_calllist
```


# ringvm_fileslist() function

Function return a list of the Ring Files.

Syntax:

```ring
RingVM_FilesList() ---> List
```

Example:

```ring
load "stdlib.ring"
see ringvm_fileslist()
```

Output:

```ring
B:/ring/tests/scripts/fileslist.ring
B:\ring\bin\stdlib.ring
eval
stdlib.ring
stdlib.rh
stdclasses.ring
stdfunctions.ring
stdbase.ring
stdstring.ring
stdlist.ring
stdstack.ring
stdqueue.ring
stdmath.ring
stddatetime.ring
stdfile.ring
stdsystem.ring
stddebug.ring
stddatatype.ring
stdconversion.ring
stdodbc.ring
stdmysql.ring
stdsecurity.ring
stdinternet.ring
stdhashtable.ring
stdtree.ring
```


# ringvm_settrace()

The function ringvm_settrace() determine the Trace function name

The trace function is a Ring
function that will be called for each event

Syntax:

```ring
RingVM_SetTrace(cCode)
```


# ringvm_tracedata()

Inside the function that we will use for tracing events

We can use the ringvm_tracedata() function to get the event
data.

The event data is a list contains the next items

- The Source Code Line Number
- The Source File Name
- The Function/Method Name
- Method or Function (Bool : True=Method, False=Function/File)

Syntax:

```ring
RingVM_TraceData() ---> aDataList
```


# ringvm_traceevent()

Inside the function that we will use for tracing events

We can use ringvm_traceevent() to know the event type

- New Line
- Before Function
- After Function
- Runtime Error
- Before C Function
- After C Function

Syntax:

```ring
RingVM_TraceEvent() ---> nTraceEvent
```


# ringvm_tracefunc()

The function return the name of the function that we
are using for tracing events.

Syntax:

```ring
RingVM_TraceEvent() ---> cCode
```


# ringvm_scopescount()

We can use the RingVM_ScopesCount() function to know
the number of scopes used in the application.

In the start of the program, We have the (global scope only)

When we call a function, A new scope is created.

When the function execution is done, the function scope is deleted.

Syntax:

```ring
RingVM_ScopesCount() ---> nScopes
```


# ringvm_evalinscope()

This function is similar to the eval() function

Unlike eval() which execute the code in the current scope

Using this function we can execute the code in a specific scope.

The code that will be evaluated does not respect try/catch/done.

Also, we cannot return a value using the return command.

Instead, we must either use a global variable to pass back a value

We can use an object that defines braceerror() method and access that object before
calling RingVM_EvalInScope() to handle errors.

Syntax:

```ring
RingVM_EvalInScope(nScope,cCode)
```


# ringvm_passerror()

When we have runtime error, After printing the Error message, Ring
will end the execution of the program.

Using ringvm_passerror() we can avoid that, and continue the
execution of our program.

Syntax:

```ring
RingVM_PassError()
```


# ringvm_hideerrormsg()

We can disable/enable displaying the runtime error messages using the
RingVM_HideErrorMsg() function.

Syntax:

```ring
RingVM_HideErrorMsg(lStatus)
```


# ringvm_callfunc()

We can call a function from a string without using eval() using
the ringvm_callfunc()

Syntax:

```ring
RingVM_CallFunc(cFuncName)
```


# Example - Using the Trace Functions

The next example use the Trace Functions to trace the program Events!

In practical, We will use the Trace Library instead of
these low level functions!

```ring
load "tracelib.ring"

ringvm_settrace("mytrace()")

see "Hello, world!" + nl
see "Welcome" + nl
see "How are you?" +nl
mytest()
new myclass { mymethod() }

func mytest
	see "Message from mytest" + nl

func mytrace
	see "====== The Trace function is Active ======" + nl +
		"Trace Function Name : " + ringvm_TraceFunc() + nl +
		"Trace Event : "
	switch ringvm_TraceEvent()
		on TRACEEVENT_NEWLINE 		see "New Line"
		on TRACEEVENT_NEWFUNC		see "New Function"
		on TRACEEVENT_RETURN		see "Return"
		on TRACEEVENT_ERROR		see "Error"
		on TRACEEVENT_BEFORECFUNC	see "Before C Function"
		on TRACEEVENT_AFTERCFUNC	see "After C Function"
	off
	see nl +
		"Line Number : " + ringvm_tracedata()[TRACEDATA_LINENUMBER] + nl +
		"File Name   : " + ringvm_tracedata()[TRACEDATA_FILENAME] + nl +
		"Function Name : " + ringvm_tracedata()[TRACEDATA_FUNCNAME] + nl +
		"Method or Function : "
		if ringvm_tracedata()[TRACEDATA_METHODORFUNC] =
				 TRACEDATA_METHODORFUNC_METHOD
			see "Method"
		else
			if ringvm_tracedata()[TRACEDATA_FUNCNAME] = NULL
				see "Command"
			else
				see "Function"
			ok
		ok
		see nl + Copy("=",42) + nl

class myclass
	func mymethod
		see "Message from mymethod" + nl
```

Output:

```ring
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : After C Function
Line Number : 3
File Name   : test1.ring
Function Name : ringvm_settrace
Method or Function : Function
==========================================
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : New Line
Line Number : 5
File Name   : test1.ring
Function Name :
Method or Function : Command
==========================================
Hello, world!
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : New Line
Line Number : 6
File Name   : test1.ring
Function Name :
Method or Function : Command
==========================================
Welcome
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : New Line
Line Number : 7
File Name   : test1.ring
Function Name :
Method or Function : Command
==========================================
How are you?
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : New Line
Line Number : 8
File Name   : test1.ring
Function Name :
Method or Function : Command
==========================================
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : New Function
Line Number : 8
File Name   : test1.ring
Function Name : mytest
Method or Function : Function
==========================================
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : New Line
Line Number : 12
File Name   : test1.ring
Function Name : mytest
Method or Function : Function
==========================================
Message from mytest
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : New Line
Line Number : 14
File Name   : test1.ring
Function Name : mytest
Method or Function : Function
==========================================
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : Return
Line Number : 8
File Name   : test1.ring
Function Name :
Method or Function : Command
==========================================
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : New Line
Line Number : 9
File Name   : test1.ring
Function Name :
Method or Function : Command
==========================================
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : New Line
Line Number : 43
File Name   : test1.ring
Function Name :
Method or Function : Command
==========================================
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : Before C Function
Line Number : 9
File Name   : test1.ring
Function Name : ismethod
Method or Function : Function
==========================================
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : After C Function
Line Number : 9
File Name   : test1.ring
Function Name : ismethod
Method or Function : Function
==========================================
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : New Function
Line Number : 9
File Name   : test1.ring
Function Name : mymethod
Method or Function : Method
==========================================
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : New Line
Line Number : 44
File Name   : test1.ring
Function Name : mymethod
Method or Function : Method
==========================================
Message from mymethod
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : Return
Line Number : 9
File Name   : test1.ring
Function Name :
Method or Function : Command
==========================================
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : Before C Function
Line Number : 9
File Name   : test1.ring
Function Name : ismethod
Method or Function : Function
==========================================
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : After C Function
Line Number : 9
File Name   : test1.ring
Function Name : ismethod
Method or Function : Function
==========================================
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : Before C Function
Line Number : 9
File Name   : test1.ring
Function Name : ismethod
Method or Function : Function
==========================================
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : After C Function
Line Number : 9
File Name   : test1.ring
Function Name : ismethod
Method or Function : Function
==========================================
====== The Trace function is Active ======
Trace Function Name : mytrace()
Trace Event : New Line
Line Number : 11
File Name   : test1.ring
Function Name :
Method or Function : Command
==========================================
```


# Example - The Trace Library

The next example uses the Trace functions provided by the Ring language
to create the Trace library.

Using the Trace library we have nice Tracing
tools and Interaction debugger too.

```ring
# Trace Events
TRACEEVENT_NEWLINE 	= 1
TRACEEVENT_NEWFUNC 	= 2
TRACEEVENT_RETURN 	= 3
TRACEEVENT_ERROR 	= 4
TRACEEVENT_BEFORECFUNC 	= 5
TRACEEVENT_AFTERCFUNC 	= 6

# Trace Data
TRACEDATA_LINENUMBER  	= 1
TRACEDATA_FILENAME 	= 2
TRACEDATA_FUNCNAME 	= 3
TRACEDATA_METHODORFUNC 	= 4

# Method of Function
TRACEDATA_METHODORFUNC_METHOD 		= TRUE
TRACEDATA_METHODORFUNC_NOTMETHOD	= FALSE

TRACE_BREAKPOINTS = TRUE

TRACE_TEMPLIST = []

func Trace cType
	switch trim(lower(cType))
	on :AllEvents
		ringvm_settrace("TraceLib_AllEvents()")
	on :Functions
		ringvm_settrace("TraceLib_Functions()")
	on :PassError
		ringvm_settrace("TraceLib_PassError()")
	on :Debugger
		ringvm_settrace("TraceLib_Debugger()")
	on :LineByLine
		ringvm_settrace("TraceLib_LineByLine()")
	off

func TraceLib_AllEvents
	if right(ringvm_tracedata()[TRACEDATA_FILENAME],13) = "tracelib.ring"
		return
	ok
	see "====== The Trace function is Active ======" + nl +
		"Trace Function Name : " + ringvm_TraceFunc() + nl +
		"Trace Event : "
	switch ringvm_TraceEvent()
		on TRACEEVENT_NEWLINE 		see "New Line"
		on TRACEEVENT_NEWFUNC		see "New Function"
		on TRACEEVENT_RETURN		see "Return"
		on TRACEEVENT_ERROR		see "Error"
		on TRACEEVENT_BEFORECFUNC	see "Before C Function"
		on TRACEEVENT_AFTERCFUNC	see "After C Function"
	off
	see nl +
		"Line Number : " + ringvm_tracedata()[TRACEDATA_LINENUMBER] + nl +
		"File Name   : " + ringvm_tracedata()[TRACEDATA_FILENAME] + nl +
		"Function Name : " + ringvm_tracedata()[TRACEDATA_FUNCNAME] + nl +
		"Method or Function : "
		if ringvm_tracedata()[TRACEDATA_METHODORFUNC] =
				 TRACEDATA_METHODORFUNC_METHOD
			see "Method"
		else
			if ringvm_tracedata()[TRACEDATA_FUNCNAME] = NULL
				see "Command"
			else
				see "Function"
			ok
		ok
		see nl + Copy("=",42) + nl

func TraceLib_Functions
	if right(ringvm_tracedata()[TRACEDATA_FILENAME],13) = "tracelib.ring"
		return
	ok
	switch ringvm_TraceEvent()
		on TRACEEVENT_NEWFUNC
			see "Open Func : " +
			ringvm_TraceData()[TRACEDATA_FUNCNAME] + nl
		on TRACEEVENT_RETURN
			see "Return to Func : " +
			ringvm_TraceData()[TRACEDATA_FUNCNAME] + nl
	off

func TraceLib_PassError
	if right(ringvm_tracedata()[TRACEDATA_FILENAME],13) = "tracelib.ring"
		return
	ok
	switch ringvm_TraceEvent()
		on  TRACEEVENT_ERROR
			see nl
			see "TraceLib : After Error !" + nl
			ringvm_passerror()
	off

func TraceLib_Debugger
	if right(ringvm_tracedata()[TRACEDATA_FILENAME],13) = "tracelib.ring"
		return
	ok
	switch ringvm_TraceEvent()
		on  TRACEEVENT_ERROR
			_BreakPoint()
	off

func TraceLib_LineByLine
	if right(ringvm_tracedata()[TRACEDATA_FILENAME],13) = "tracelib.ring" or
		ringvm_TraceEvent() != TRACEEVENT_NEWLINE
		return
	ok
	aList = ringvm_tracedata()
	see "Before Line : " + aList[TRACEDATA_LINENUMBER] + nl
	_BreakPoint()

func BreakPoint
	if not TRACE_BREAKPOINTS
		return
	ok
	_BreakPoint()

func _BreakPoint
	see nl+nl+Copy("=",60) + nl +
	Copy(" ",20)+"Interactive Debugger" + nl +
	Copy("=",60) + nl +
	"Command (Exit)        : End Program" + nl +
	"Command (Cont)        : Continue Execution" + nl +
	"Command (Locals)      : Print local variables names" + nl +
	"Command (LocalsData)  : Print local variables data" + nl +
	"Command (Globals)     : Print global variables names" + nl +
	"We can execute Ring code" + nl +
	Copy("=",60) + nl
	while true
			see nl + "code:> "
			give cCode
		cmd = trim(lower(cCode))
		if cmd = "exit" or cmd = "bye"
			shutdown()
		ok
		nScope = ringvm_scopescount()-2
		switch cmd
			on "locals"
				ringvm_EvalInScope(nScope,"see locals() callgc()")
				loop
			on "localsdata"
				PrintLocalsData(nScope)
				loop
			on "globals"
				ringvm_EvalInScope(nScope,"see globals() callgc()")
				loop
			on "cont"
				ringvm_passerror()
				exit
		off
		Try
			ringvm_EvalInScope(nScope,cCode)
			catch
					see cCatchError
			done
	end

func NoBreakPoints
	TRACE_BREAKPOINTS = FALSE


func PrintLocalsData nScope
	if nScope = 1	# Global
		ringvm_Evalinscope(nScope,'TRACE_TEMPLIST = globals()')
	else
		ringvm_Evalinscope(nScope,'TRACE_TEMPLIST = locals() callgc()')
	ok
	see nl
	aTempList = TRACE_TEMPLIST
	TRACE_TEMPLIST = []
	nSpaces = 5
	for TRACE_ITEM in aTempList
		if len(TRACE_ITEM) + 5 > nSpaces
			nSpaces = len(TRACE_ITEM) + 5
		ok
	next
	for TRACE_ITEM in aTempList
		see "Variable : " +  TRACE_ITEM
		cVarName = TRACE_ITEM
		see copy(" ",nSpaces-len(cVarName)) + " Type : "
		ringvm_Evalinscope(nScope,"see type(" +  TRACE_ITEM +")")
		ringvm_Evalinscope(nScope,"see Copy(' ',fabs(15-len(type(" +
					  TRACE_ITEM +"))))")
		see " Value : "
		ringvm_Evalinscope(nScope,"see " +  TRACE_ITEM)
		see nl
	next
```


# ringvm_see() function

Using the ringvm_see() function we can redefine the behavior of the See command

Also we can use ring_see() to have the original behavior

Example:

```ring
see "Hello world" + nl
see 123 + nl
see ["one","two","three"]
see new point {x=10 y=20 z=30}

func ringvm_see t
	ring_see("We want to print: ")
	ring_See(t)

class point x y z
```

Output:

```ring
We want to print: Hello world
We want to print: 123
We want to print: one
two
three
We want to print: x: 10.000000
y: 20.000000
z: 30.000000
```


# ringvm_give() function

Using the ringvm_give() function we can redefine the behavior of the Give command

Example:

```ring
see "Name: " give name
see "Hello " + name

func ringvm_give
	see "Mahmoud" + nl
	return "Mahmoud"
```

Output:

```ring
Name: Mahmoud
Hello Mahmoud
```


# ringvm_errorhandler() function

If this function is defined in Ring code, it will be called when an error occurs, provided
the error is not handled by try/catch/done.

Example:

```ring
1 / 0
? :done

func ringvm_errorhandler

	? "we have an error!"

	? "Error msg: " + cCatchError

	ringvm_passerror()
```

Output:

```ring
we have an error!
Error msg: Error (R1) : Can't divide by zero
done
```


# ringvm_codelist() function

The Function return a list contains the Byte Code of the current program.

Each item is a sub list that represent an instruction

This sub list starts with the operation code (A Number) then the parameters

# ringvm_info() function

The ringvm_info() is an internal function that return a list of information about the Ring VM structure.

It's used only by the Ring Team in advanced tests to check the VM status.

Syntax:

```ring
ringvm_info() ---> List of information about the VM structure
```


# ringvm_ismempool() function

Check if we still have items in the memory pool or not

This function is used to write tests that could detect a memory leak

Syntax:

```ring
ringvm_ismempool() ---> lStatus
```


# ringvm_runcode() function

Similar to the Eval() function

1 - Used for GUI events like RingQt applications

2 - Execute the Main Loop (i.e. Eval + MainLoop in one function)

3 - Maximum nested events is 255 events

This function is used to write tests that contains events

Syntax:

```ring
ringvm_runcode(cCode)
```


# ringvm_ringolists() function

This function parses a Ring Object File (*.ringo) string and returns its contents as Ring lists.

The function's output is a list containing five sublists:

- List of files
- List of functions
- List of classes
- List of packages
- List of bytecode instructions

Syntax:

```ring
ringvm_ringolists(cFileContent) --> aList
```

Example:

```ring
C_LINESIZE = 40
cFile      = read("pwct.ringo")
aList      = ringvm_ringolists(cFile)

? copy("=",C_LINESIZE)
? "List Size: " + len(aList)
? copy("=",C_LINESIZE)
? "Files count: " + len(aList[1])
? "Functions count: " + len(aList[2])
? "Classes count: " + len(aList[3])
? "Packages count: " + len(aList[4])
? "Instructions count: " + len(aList[5])
? copy("=",C_LINESIZE)
```

Output:

```ring
========================================
List Size: 5
========================================
Files count: 1352
Functions count: 306
Classes count: 1434
Packages count: 2
Instructions count: 782280
========================================
```


# ringvm_translatecfunction() function

This new function introduces dynamic renaming (aliasing) of built‑in C functions inside the Ring VM.

This happens at the VM level, not at the script level, so it’s fast and transparent.

Example:

```ring
RingVM_TranslateCFunction("len","length")
RingVM_TranslateCFunction("length","mylength")

cStr = "welcome"

? len(cStr)
? length(cStr)
? mylength(cStr)
```

Output:

```ring
7
7
7
```


# ringvm_writeringo() function

This function writes a Ring Object File (*.ringo) from a Ring list.

The list contains five sublists:

- List of files
- List of functions
- List of classes
- List of packages
- List of bytecode instructions

Syntax:

```ring
ringvm_writeringo(cFileName,aList)
```

Example:

```ring
cFileName    = "pwct.ringo"
cFileContent = read(cFileName)
cOutputFile  = "mypwct.ringo"

? "Read the object file..."
aList = ringvm_ringolists(cFileContent)

? "Write another object file..."
ringvm_writeringo(cOutputFile,aList)
```


## operators

# =
# Operators

In this chapter we will introduce the operators provided by the Ring programming language.

# Arithmetic Operators

The next table presents all of the arithmetic operators
provided by the Ring language. Assume variable X=50 and variable Y=10 then:

+------------+---------------+----------+---------+
| Operator   | Description   | Example  | Result  |
+============+===============+==========+=========+
| \+	     |  Add	     |  x+y     |  60     |
+------------+---------------+----------+---------+
| \-         |	Subtract     |	x-y     |  40     |
+------------+---------------+----------+---------+
| \*	     |  Multiplies   |	x*y     |  500    |
+------------+---------------+----------+---------+
| /          |  Divide	     |	x/y     |  5      |
+------------+---------------+----------+---------+
| %          |  Modulus	     |	x%y     |  0      |
+------------+---------------+----------+---------+
| ++         |  Increment    |	x++     |  51     |
+------------+---------------+----------+---------+
| \- \-      |  Decrement    |	x\- \-  |  49     |
+------------+---------------+----------+---------+
| ** OR ^^   |  Power        |	x**3    |  125000 |
+------------+---------------+----------+---------+

# Relational Operators

The next table presents all of the relational operators
provided by the Ring language. Assume variable X=50 and variable Y=10 then:

+------------+---------------------+-------------+---------+
| Operator   | Description         | Example     | Result  |
+============+=====================+=============+=========+
| =	     |  Equal	           |    x = y    |  False  |
+------------+---------------------+-------------+---------+
| !=         |	Not Equal          |	x != y   |  True   |
+------------+---------------------+-------------+---------+
| >	     |  Greater than       |	x > y    |  True   |
+------------+---------------------+-------------+---------+
| <          |  Less than 	   |	x < y    |  False  |
+------------+---------------------+-------------+---------+
| >=         |  Greater or Equal   |	x >= y   |  True   |
+------------+---------------------+-------------+---------+
| <=         |  Less than or Equal |	x <= y   |  False  |
+------------+---------------------+-------------+---------+

# Logical Operators

The next table presents all of the logical operators
provided by the Ring language. Assume variable X=True and variable Y=False then:

+------------+---------------------+-------------+---------+
| Operator   | Description         | Example     | Result  |
+============+=====================+=============+=========+
| and	     |  Logical AND        |    x and y  |  False  |
+------------+---------------------+-------------+---------+
| or         |	Logical OR         |	x or y   |  True   |
+------------+---------------------+-------------+---------+
| not	     |  Logical Not        |	not x    |  False  |
+------------+---------------------+-------------+---------+

Another style

+------------+---------------------+-------------+---------+
| Operator   | Description         | Example     | Result  |
+============+=====================+=============+=========+
| &&	     |  Logical AND        |    x && y   |  False  |
+------------+---------------------+-------------+---------+
| ||         |	Logical OR         |	x || y   |  True   |
+------------+---------------------+-------------+---------+
| !	     |  Logical Not        |	! x      |  False  |
+------------+---------------------+-------------+---------+

# Bitwise Operators

The next table presents all of the bitwise operators
provided by the Ring language. Assume variable X=8 and variable Y=2 then:

+------------+-----------------------------+-------------+---------+
| Operator   | Description                 | Example     | Result  |
+============+=============================+=============+=========+
| &	     |  Binary AND                 |    x & y    |  0      |
+------------+-----------------------------+-------------+---------+
| \|         |	Binary OR                  |	x \| y   |  10     |
+------------+-----------------------------+-------------+---------+
| ^	     |  Binary XOR                 |	x ^ y    |  10     |
+------------+-----------------------------+-------------+---------+
| ~          |  Binary Ones Complement 	   |	~x       |  -9     |
+------------+-----------------------------+-------------+---------+
| <<         |  Binary Left Shift          |	x << y   |  32     |
+------------+-----------------------------+-------------+---------+
| >>         |  Binary Right Shift         |	x >> y   |  2      |
+------------+-----------------------------+-------------+---------+

# Assignment Operators

The next table presents all of the assignment operators
provided by the Ring language.

Assume variable X=8 then:

+------------+-----------------------------+-------------+---------+
| Operator   | Description                 | Example     | Result  |
+============+=============================+=============+=========+
| =	     |  Assignment                 |    x = 10   |  x=10   |
+------------+-----------------------------+-------------+---------+
| +=         |	Add AND assignment         |	x += 5   |  x=13   |
+------------+-----------------------------+-------------+---------+
| -=	     |  Subtract AND assignment    |	x -= 3   |  x=5    |
+------------+-----------------------------+-------------+---------+
| \*=        |  Multiply AND assignment    |	x \*= 2  |  x=16   |
+------------+-----------------------------+-------------+---------+
| /=         |  Divide AND assignment      |	x /= 3   |  x=2.67 |
+------------+-----------------------------+-------------+---------+
| %=         |  Modulus AND assignment     |	x %= 2   |  x=0    |
+------------+-----------------------------+-------------+---------+
| <<=        |	Left shift AND assignment  |	x <<= 2  |  x=32   |
+------------+-----------------------------+-------------+---------+
| >>=	     |  Right shift AND assignment |	x >>= 2  |  x=2    |
+------------+-----------------------------+-------------+---------+
| &=         |  Bitwise AND assignment     |	x &= 4   |  x=0    |
+------------+-----------------------------+-------------+---------+
| \|=        |  Bitwise OR and assignment  |	x \|= 3  |  x=11   |
+------------+-----------------------------+-------------+---------+
| ^=         |  Bitwise XOR and assignment |	x ^= 4   |  x=12   |
+------------+-----------------------------+-------------+---------+

# Misc Operators

# =
Operator	Description
# =
:literal	using : before identifier mean literal
Start:End	create list contains items from start to end
[list items]	define list items
list[index]	access list item
obj.name	using the dot operator to access object members (attributes/methods).
obj {stmts}	execute statements with direct access to object attributes & methods
func(para,...)	call function using parameters separated by comma
? <expr>	Print expression then new line
# =

# Operators Precedence

The next table present operators from higher precedence (Evaluated first) to
lower precedence.

+----------------------------------------------------------------+
| Operator							 |
+================================================================+
| .  []   ()     {}	 	 				 |
+----------------------------------------------------------------+
| \~  :Literal  [list items]					 |
+----------------------------------------------------------------+
| ++   \- \-							 |
+----------------------------------------------------------------+
| \- (Unary negative) \+ (Unary positive)			 |
+----------------------------------------------------------------+
| Start:End							 |
+----------------------------------------------------------------+
| \* /  %							 |
+----------------------------------------------------------------+
| \+ \-								 |
+----------------------------------------------------------------+
| <<   >>							 |
+----------------------------------------------------------------+
| &								 |
+----------------------------------------------------------------+
| \|  ^								 |
+----------------------------------------------------------------+
| <  >  <=  >= 							 |
+----------------------------------------------------------------+
| =  !=								 |
+----------------------------------------------------------------+
| not	!							 |
+----------------------------------------------------------------+
| and   &&						         |
+----------------------------------------------------------------+
| or   ||						         |
+----------------------------------------------------------------+
| Assignment = += -= \*= /= %=>>= <<= &= ^= \|= 		 |
+----------------------------------------------------------------+
| ?						 		 |
+----------------------------------------------------------------+

Example (1):

```ring
? 3+5*4				# prints 23
? True or False and False	# prints 1 (True)
```


# Mixing Arithmetic Operators and Types

The next table demonstrates what happens when mixing arithmetic operators and different types

# ============ ============== ============================
First Type  Operator	  Second Type    Output Type OR Behavior     Example
# ============ ============== ============================
Number      "+"          Number         Number                       5+5
Number      "+"          String         Number                       5+"5"
String      "+"          Number         String                       "5"+5
String      "+"          String         String                       "5"+"5"
List        "+"          Number         Add number to List           [1,2,3] + 4
List        "+"          String         Add string to List           [1,2,3] + "four"
List        "+"          List           Add list to List             [1,2,3] + ["sub"]
List        "+"          Object         Add object to List           [1,2,3] + new Point
Number      "+"          List           Runtime Error                4 + [1,2,3]
Number      "+"          Object         Check Operator Overloading   4 + new point
String      "+"          List           Runtime Error                "4" + [1,2,3]
String      "+"          Object         Check Operator Overloading   "4" + new point
Object      "+"          Number         Check Operator Overloading   new point + 1
Object      "+"          String         Check Operator Overloading   new point + "test"
Object      "+"          List           Check Operator Overloading   new point + [10,10]
Object      "+"          Object         Check Operator Overloading   new point + new point

Number      "-"          Number         Number                       5-5
Number      "-"          String         Number                       5-"5"
String      "-"          Number         Number                       "5"-5
String      "-"          String         Number                       "5"-"5"
List        "-"          Number         Runtime Error                [1,2,3] - 4
List        "-"          String         Runtime Error                [1,2,3] - "four"
List        "-"          List           Runtime Error                [1,2,3] - ["sub"]
List        "-"          Object         Check Operator Overloading   [1,2,3] - new Point
Number      "-"          List           Runtime Error                4 - [1,2,3]
Number      "-"          Object         Check Operator Overloading   4 - new point
String      "-"          List           Runtime Error                "4" - [1,2,3]
String      "-"          Object         Check Operator Overloading   "4" - new point
Object      "-"          Number         Check Operator Overloading   new point - 1
Object      "-"          String         Check Operator Overloading   new point - "test"
Object      "-"          List           Check Operator Overloading   new point - [10,10]
Object      "-"          Object         Check Operator Overloading   new point - new point

Number      "*"          Number         Number                       5*5
Number      "*"          String         Number                       5*"5"
String      "*"          Number         Number                       "5"*5
String      "*"          String         Number                       "5"*"5"
List        "*"          Number         Runtime Error                [1,2,3] * 4
List        "*"          String         Runtime Error                [1,2,3] * "four"
List        "*"          List           Runtime Error                [1,2,3] * ["sub"]
List        "*"          Object         Check Operator Overloading   [1,2,3] * new Point
Number      "*"          List           Runtime Error                4 * [1,2,3]
Number      "*"          Object         Check Operator Overloading   4 * new point
String      "*"          List           Runtime Error                "4" * [1,2,3]
String      "*"          Object         Check Operator Overloading   "4" * new point
Object      "*"          Number         Check Operator Overloading   new point * 1
Object      "*"          String         Check Operator Overloading   new point * "test"
Object      "*"          List           Check Operator Overloading   new point * [10,10]
Object      "*"          Object         Check Operator Overloading   new point * new point

Number      "/"          Number         Number                       5/5
Number      "/"          String         Number                       5/"5"
String      "/"          Number         Number                       "5"/5
String      "/"          String         Number                       "5"/"5"
List        "/"          Number         Runtime Error                [1,2,3] / 4
List        "/"          String         Runtime Error                [1,2,3] / "four"
List        "/"          List           Runtime Error                [1,2,3] / ["sub"]
List        "/"          Object         Check Operator Overloading   [1,2,3] / new Point
Number      "/"          List           Runtime Error                4 / [1,2,3]
Number      "/"          Object         Check Operator Overloading   4 / new point
String      "/"          List           Runtime Error                "4" / [1,2,3]
String      "/"          Object         Check Operator Overloading   "4" / new point
Object      "/"          Number         Check Operator Overloading   new point / 1
Object      "/"          String         Check Operator Overloading   new point / "test"
Object      "/"          List           Check Operator Overloading   new point / [10,10]
Object      "/"          Object         Check Operator Overloading   new point / new point

Number      "%"          Number         Number                       5%5
Number      "%"          String         Number                       5%"5"
String      "%"          Number         Number                       "5"%5
String      "%"          String         Number                       "5"%"5"
List        "%"          Number         Runtime Error                [1,2,3] % 4
List        "%"          String         Runtime Error                [1,2,3] % "four"
List        "%"          List           Runtime Error                [1,2,3] % ["sub"]
List        "%"          Object         Check Operator Overloading   [1,2,3] % new Point
Number      "%"          List           Runtime Error                4 % [1,2,3]
Number      "%"          Object         Check Operator Overloading   4 % new point
String      "%"          List           Runtime Error                "4" % [1,2,3]
String      "%"          Object         Check Operator Overloading   "4" % new point
Object      "%"          Number         Check Operator Overloading   new point % 1
Object      "%"          String         Check Operator Overloading   new point % "test"
Object      "%"          List           Check Operator Overloading   new point % [10,10]
Object      "%"          Object         Check Operator Overloading   new point % new point

Number      "++"         ...            Number                       5++
String      "++"         ...            Syntax Error/Runtime Error   x="5"  x++
List        "++"         ...            Syntax Error/Runtime Error   x=[1,2,3]  x++
Object      "++"         ...            Syntax Error/Runtime Error   x=new point x++

Number      "--"         ...            Number                       5--
String      "--"         ...            Syntax Error/Runtime Error   x="5"  x--
List        "--"         ...            Syntax Error/Runtime Error   x=[1,2,3]  x--
Object      "--"         ...            Syntax Error/Runtime Error   x=new point x--
# ============ ============== ============================

> **Note:**

# Mixing Relational Operators and Types

Using Relational Operators like <, <=, >, >= could produce True, False OR runtime error.

When mixing Strings and Numbers with these operators, The string will be converted to a number.

Example (2):

```ring
? 5 < 7		# 1 (True)
? "5" < 7	# 1 (True)
? 5 < "7"	# 1 (True)
? "5" < "7"	# 1 (True)
? "test" < 5	# Runtime Error (Invalid numeric string)
```

> **Note:**

Using relational operators like = or != will only produce True OR False (i.e. no runtime error)

Also, when mixing Strings and Numbers with these operators, The string will be converted to a number.

Example (3):

```ring
? "5" = 5	# 1 (True)
? 5 = "5"	# 1 (True)
? 5 = 5		# 1 (True)
? "5" = "5"	# 1 (True)
? 5 = 7		# 0 (False)
? "5" = 7	# 0 (False)
? 5 = "7"	# 0 (False)
? "5" = "7"	# 0 (False)
? "test" = 5	# 0 (False)

? "5" != 5	# 0 (False)
? 5 != "5"	# 0 (False)
? 5 != 5	# 0 (False)
? "5" != "5"	# 0 (False)
? 5 != 7	# 1 (True)
? "5" != 7	# 1 (True)
? 5 != "7"	# 1 (True)
? "5" != "7"	# 1 (True)
? "test" != 5	# 1 (True)
```

Example (4):

```ring
? 12500 = "0012500"		# 1 (True)
? 12500 = "0012500-PRY-09"	# 0 (False)

# When we compare between number and a string
# If we found the number --> Then we ignore Space, Tab, \n, \r after that number
# We consider "" to be like Zero but we don't do that for Space, Tab, \n and \r
# Note: if 0 -> False while if " " -> True

? 1 =  "1  x"			# 0 (False)
? 1 = "1     "			# 1 (True)
? 0 = ""			# 1 (True)
? 0 = "       0        "	# 1 (True)
? 1 = "       1       "		# 1 (True)
? 0 = "000000"			# 1 (True)
? 0 = "00000
"				# 1 (True)
? 1 = "       1
"				# 1 (True)

? 0 = " "			# 0 (False)

if 0				# False
	? :fail
else
	? :pass
ok				# pass

if ""				# False
	? :fail
else
	? :pass
ok				# pass

if " "				# True
	? :pass
else
	? :fail
ok				# pass
```

> **Note:**

Example (5):

```ring
aList    = [1,2,3]
aList2   = [1,2,3]
? aList  = aList	# 1 (True)
? aList  = aList2	# 0 (False)

aList3   = ref(aList)
? aList3 = aList	# 1 (True)
```


# Mixing Logical Operators and Types

We have the next rules:

- Logical operators always produce True/False
- The Zero number is considered False
- The Empty string is considered False
- The Empty list is considered False
- The list that wrap C pointer is considered False if the pointer is NULL
- All other values are True

Example (6):

```ring
? 1 and 1			# 1 (True)
? "test" and "test"		# 1 (True)
? [1,2,3] and "test"		# 1 (True)
? 1 and "test" and [1,2,3]	# 1 (True)
? 1 and new point		# 1 (True)
? 1 and 0			# 0 (False)
? 1 and ""			# 0 (False)
? 1 and []			# 0 (False)
? 1 and NULLPointer()		# 0 (False)

class point
```


# Mixing Bitwise Operators and Types

These operators support numbers. Also, it will automatically convert strings to numbers if this is possible or produce a runtime error if the string can't be converted.

Using these operators with lists or objects produce a runtime error with an exception to this rule.

The exception is using objects that support operator overloading where the object comes first before the operator.

Example (7):

```ring
? 1 & 1			# 1
? "1" & 1		# 1
? 1 & "3"		# 1
? "3" & "3"		# 3
? "123" & "123"		# 123
```


# Mixing Assignment Operators and Types

Using assignment we can assign any value to any variable.

Using += support Strings & Numbers and will produce a runtime error if used with other types

Using other assignment operators like -=, *=, /=, %=, <<=, >>=, etc. support only numbers and will produce a runtime error if used with other types.

Example (8):

```ring
cStr = "one"
cStr += " two"
? cStr		# one two
nNum = 100
nNum += 200
? nNum		# 300
```


# Unary Positive and Unary Negative

Rules:

- Using unary positive (+) before any number/variable does nothing.

- Using unary negative (-) before any number will negate the number.

- Using unary negative (-) before a string will convert it to a number then negate the number.

- Using unary negative (-) before a list/object will produce a runtime error.

Example (9):

```ring
x = +10
? x		# 10
? +x		# 10
y = "10"
? +y		# 10
? type(+y)	# STRING

x = 10
? -x		# -10
y = "10"
? -y		# -10
? type(-y)	# NUMBER

aList = [1,2,3]
? - aList	# RUNTIME ERROR
```
