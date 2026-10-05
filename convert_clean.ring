# ====================================================================
# RST to Markdown Converter for Ring Documentation
# Rewritten in Native Ring Language (Ring 1.25)
# ====================================================================

load "stdlibcore.ring"

cSrcDir = "C:/ring/documents/build/html/_sources/"
cOutDir = "./"

if len(sysargv) >= 3 {
    cSrcDir = sysargv[3]
}
if len(sysargv) >= 4 {
    cOutDir = sysargv[4]
}

func main
    ? "===================================================="
    ? " Ring RST -> Markdown Documentation Converter "
    ? "===================================================="

    # 1. Process Primary Reference Files
    aPrimary = [
        ["reference.txt", "reference/core.md"],
        ["strings.txt",   "reference/strings.md"],
        ["functions.txt", "reference/functions.md"],
        ["lists.txt",     "reference/lists.md"],
        ["oop.txt",       "reference/oop.md"]
    ]

    for aItem in aPrimary
        processFile(cSrcDir + aItem[1], cOutDir + aItem[2])
    next

    # 2. Process other.md (Key Additional Chapters)
    aKeyOther = [
        "scope.txt", "scope2.txt", "metaprog.txt", "declarative.txt",
        "natural.txt", "naturallibrary.txt", "syntaxflexibility.txt",
        "typehints.txt", "debug.txt", "ringemb.txt", "extension.txt",
        "extension_tutorial.txt", "embedding.txt", "codegenerator.txt",
        "compiler.txt", "distribute.txt", "distribute_ring2exe.txt",
        "sourcecode.txt", "faq.txt", "introduction.txt", "getting_started.txt",
        "getting_started2.txt", "getting_started3.txt", "controlstructures.txt",
        "controlstructures2.txt", "controlstructures3.txt", "getinput.txt",
        "functions2.txt", "functions3.txt", "programstructure.txt",
        "dateandtime.txt", "checkandconvert.txt", "mathfunc.txt", "files.txt",
        "systemfunc.txt", "evaldebug.txt", "fp.txt", "mysql.txt", "sqlite.txt",
        "postgresql.txt", "secfunc.txt", "web.txt", "csvlib.txt", "jsonlib.txt",
        "httplib.txt"
    ]

    cOtherContent = ""
    for cFile in aKeyOther
        cFilePath = cSrcDir + cFile
        if fexists(cFilePath)
            cContent = read(cFilePath)
            cMd = convertRstToMd(cContent)
            cHeaderName = substr(cFile, ".txt", "")
            cOtherContent += "## " + cHeaderName + nl + nl + trim(cMd) + nl + nl
        ok
    next

    if cOtherContent != ""
        write(cOutDir + "reference/other.md", cOtherContent)
        ? "  ✅ Generated reference/other.md (" + len(cOtherContent) + " chars)"
    ok

    # 3. Process Categorized Archive Files
    if direxists(cSrcDir)
        aFiles = dir(cSrcDir)
        aSeen = []
        for aItem in aPrimary
            add(aSeen, substr(aItem[1], ".txt", ""))
        next
        for cFile in aKeyOther
            add(aSeen, substr(cFile, ".txt", ""))
        next

        # Categories Definition
        aCategories = [
            ["gui_qt.md",       ["qt", "qtclassesdoc", "qt3d", "qtmobile", "qtwebassembly", "formdesigner"]],
            ["games.md",        ["gameengine", "gameengineandorid", "allegro", "libsdl", "goldmagic800"]],
            ["c_extensions.md", ["lowlevel", "libcurl", "libui", "libuv", "operators", "foxringfuncsdoc"]],
            ["databases.md",    ["odbc"]],
            ["tools_cloud.md",  ["ring_cloud", "ring_cloud_cgi", "deployincloud", "codeeditors", "demo", "contribute", "generalinfo", "languagedesign", "performancetips", "resources", "bignumber", "multilanguage"]]
        ]

        # Initialize Category Buckets
        aCatOutputs = []
        for aCat in aCategories
            add(aCatOutputs, [aCat[1], ""])
        next
        cMiscOutput = ""

        for aFileItem in aFiles
            cFileName = aFileItem[1]
            if endsWith(lower(cFileName), ".txt")
                cStem = lower(substr(cFileName, ".txt", ""))
                if find(aSeen, cStem) = 0
                    cFilePath = cSrcDir + cFileName
                    cContent = read(cFilePath)
                    cMd = convertRstToMd(cContent)

                    # Find matching category
                    bMatched = false
                    for i = 1 to len(aCategories)
                        aSecList = aCategories[i][2]
                        if find(aSecList, cStem) > 0
                            aCatOutputs[i][2] += "## " + cStem + nl + nl + trim(cMd) + nl + nl
                            bMatched = true
                            exit
                        ok
                    next

                    if not bMatched
                        cMiscOutput += "## " + cStem + nl + nl + trim(cMd) + nl + nl
                    ok
                ok
            ok
        next

        # Write Archive Files
        for aCatOut in aCatOutputs
            if aCatOut[2] != ""
                write(cOutDir + "archive/" + aCatOut[1], aCatOut[2])
                ? "  ✅ Generated archive/" + aCatOut[1] + " (" + len(aCatOut[2]) + " chars)"
            ok
        next

        if cMiscOutput != ""
            write(cOutDir + "archive/misc.md", cMiscOutput)
            ? "  ✅ Generated archive/misc.md (" + len(cMiscOutput) + " chars)"
        ok
    ok

    ? nl + "🎉 All reference files processed successfully using Ring!"

# ── Converter Logic ──────────────────────────────────────────────────

func convertRstToMd cText
    aLines = str2list(cText)
    aOut = []
    nI = 1
    nN = len(aLines)

    while nI <= nN
        cRaw = aLines[nI]
        cLine = trim(cRaw)

        # 1. Empty lines
        if cLine = ""
            if len(aOut) > 0 and aOut[len(aOut)] != ""
                add(aOut, "")
            ok
            nI++
            loop
        ok

        # 2. Index directives (.. index::, single:, pair:, triple:)
        if startsWith(cLine, ".. index::") or startsWith(cLine, "single:") or startsWith(cLine, "pair:") or startsWith(cLine, "triple:")
            nI++
            while nI <= nN
                cNextRaw = aLines[nI]
                cNextTrim = trim(cNextRaw)
                if startsWith(cNextRaw, " ") or startsWith(cNextRaw, "\t") or startsWith(cNextTrim, "single:") or startsWith(cNextTrim, "pair:")
                    nI++
                else
                    exit
                ok
            end
            loop
        ok

        # 3. Code block (.. code-block::)
        if startsWith(cLine, ".. code-block::")
            cLang = trim(substr(cLine, ".. code-block::", ""))
            if cLang = "" or cLang = "none"
                cLang = "ring"
            ok
            nI++
            aRes = extractIndentedBlock(aLines, nI)
            aCodeLines = aRes[1]
            nI = aRes[2]

            add(aOut, "```" + cLang)
            for cCL in aCodeLines
                add(aOut, cCL)
            next
            add(aOut, "```" + nl)
            loop
        ok

        # 4. Admonitions (.. note:: / .. tip:: / .. warning:: / .. important::)
        if startsWith(cLine, ".. note::") or startsWith(cLine, ".. tip::") or startsWith(cLine, ".. warning::") or startsWith(cLine, ".. important::")
            cType = "Note"
            if startsWith(cLine, ".. tip::") cType = "Tip" ok
            if startsWith(cLine, ".. warning::") cType = "Warning" ok
            if startsWith(cLine, ".. important::") cType = "Important" ok

            nI++
            aRes = extractIndentedBlock(aLines, nI)
            aAdmLines = aRes[1]
            nI = aRes[2]

            if len(aAdmLines) > 0
                add(aOut, "> **" + cType + ":**")
                for cAL in aAdmLines
                    add(aOut, "> " + cAL)
                next
                add(aOut, "")
            ok
            loop
        ok

        # 5. Ignore other RST directives
        if startsWith(cLine, "..") or (startsWith(cLine, ":") and endsWith(cLine, ":")) or startsWith(cLine, ":field:") or startsWith(cLine, ":param:")
            nI++
            loop
        ok

        # 6. Underline Headings (===, ---, ~~~, ^^^)
        if nI + 1 <= nN
            cNextLine = trim(aLines[nI + 1])
            if len(cNextLine) >= 3 and isUnderlineHeader(cNextLine)
                cChar = left(cNextLine, 1)
                cLevel = "## "
                if cChar = "=" cLevel = "# " ok
                if cChar = "-" cLevel = "## " ok
                if cChar = "~" cLevel = "### " ok
                if cChar = "^" cLevel = "#### " ok

                add(aOut, cLevel + cLine)
                nI += 2
                loop
            ok
        ok

        # 7. Enclosed Headings (= Title = or - Title -)
        if startsWith(cLine, "=") and endsWith(cLine, "=")
            cTitle = trim(substr(cLine, "=", ""))
            if cTitle != ""
                add(aOut, "# " + cTitle)
                nI++
                loop
            ok
        ok

        # 8. Bullet Lists (*, -, +)
        if startsWith(cLine, "* ") or startsWith(cLine, "- ") or startsWith(cLine, "+ ")
            cContent = trim(substr(cLine, 3, len(cLine)))
            add(aOut, "- " + cleanInlineRst(cContent))
            nI++
            loop
        ok

        # 9. Regular text lines
        add(aOut, cleanInlineRst(cLine))
        nI++
    end

    cResult = ""
    for cL in aOut
        cResult += cL + nl
    next
    return cResult

func extractIndentedBlock aLines, nStartIdx
    aBlockLines = []
    nBaseIndent = -1
    nI = nStartIdx
    nN = len(aLines)

    # Skip initial empty lines
    while nI <= nN and trim(aLines[nI]) = ""
        nI++
    end

    while nI <= nN
        cRawLine = aLines[nI]
        cStripped = trim(cRawLine)

        if cStripped = ""
            add(aBlockLines, "")
            nI++
            loop
        ok

        nIndent = getIndentLevel(cRawLine)

        if nIndent = 0 and not startsWith(cRawLine, tab)
            exit
        ok

        if nBaseIndent = -1
            nBaseIndent = nIndent
        ok

        cCleanLine = cRawLine
        if len(cRawLine) >= nBaseIndent
            cCleanLine = substr(cRawLine, nBaseIndent + 1, len(cRawLine))
        else
            cCleanLine = cStripped
        ok

        add(aBlockLines, cCleanLine)
        nI++
    end

    # Remove trailing empty lines
    while len(aBlockLines) > 0 and aBlockLines[len(aBlockLines)] = ""
        del(aBlockLines, len(aBlockLines))
    end

    return [aBlockLines, nI]

func cleanInlineRst cText
    # Replace ``code`` with `code`
    cText = substr(cText, "``", "`")
    return cText

func processFile cSrc, cDst
    if not fexists(cSrc)
        ? "  ⚠️  Skip (not found): " + cSrc
        return
    ok
    cContent = read(cSrc)
    cMd = convertRstToMd(cContent)
    write(cDst, cMd)
    ? "  ✅ Generated " + cDst + " (" + len(cMd) + " chars)"

# ── Helper Utilities ──────────────────────────────────────────────────

func getIndentLevel cLine
    nIndent = 0
    for i = 1 to len(cLine)
        if cLine[i] = " " or cLine[i] = "\t"
            nIndent++
        else
            exit
        ok
    next
    return nIndent

func isUnderlineHeader cLine
    if len(cLine) < 3 return false ok
    cChar = cLine[1]
    if cChar != "=" and cChar != "-" and cChar != "~" and cChar != "^"
        return false
    ok
    for i = 1 to len(cLine)
        if cLine[i] != cChar return false ok
    next
    return true

