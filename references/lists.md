# Lists

In Ring, lists are 1-based dynamic arrays used for arrays, lists, hash tables, and matrices.

# Create Lists

```ring
aList  = [1, 2, 3, 4, 5]
aRange = 1:5              # [1, 2, 3, 4, 5]
aAlpha = "a":"z"
a2D    = list(5, 4)       # 5 rows x 4 columns
```

# 1-Based Indexing & Access

```ring
aList = ["Cairo", "Riyadh", "London"]

see aList[1]              # First item: "Cairo"
aList[1] = "Alexandria"   # Modify item
```

> **Warning (R2):** `aList[0]` is invalid and raises Runtime Error (R2). First item is `aList[1]`.

# Add & Delete Items

```ring
aList = ["one", "two"]

add(aList, "three")       # Append item
aList + "four"            # Append using + operator

del(aList, 2)             # Delete 2nd item ("two")
insert(aList, 1, "start") # Insert after index 1
```

# Search in Lists

```ring
aList = ["one", "two", "three", "four", "five"]

nIdx = find(aList, "three")              # returns 3 (0 if not found)
nIdx = binarysearch(aList, "three")      # fast search on sorted list
```

# Sorting and Reversing

```ring
aList = [10, 12, 3, 5, 31, 15]
aList = sort(aList)                      # [3, 5, 10, 12, 15, 31]
aList = reverse(aList)

# Sort 2D list by column index
aTable = [ ["mahmoud", 15000], ["ahmed", 14000] ]
aSorted = sort(aTable, 2)                # sort by 2nd column
```

# Hash Tables / Associative Lists (Key-Value)

Lists can act as hash tables using `:key = value` syntax or pairs:

```ring
aUser = [ :name = "Mahmoud", :role = "Admin", :id = 101 ]

see aUser[:name]          # "Mahmoud"
see aUser["role"]         # "Admin"

aUser[:active] = true     # Add new key-value pair
```

# Named Parameters Using Lists

Ring functions commonly accept hash lists as named parameter bags:

```ring
func connect aParams {
    cHost = aParams[:host]
    nPort = aParams[:port]
    see "Connecting to " + cHost + ":" + nPort + nl
}

connect([:host = "localhost", :port = 8080])
```

# Passing Lists to Functions

Lists are passed to functions **by reference**. Any modification inside the function affects the caller's list:

```ring
func appendNumbers aList {
    aList + 100
}

aData = [1, 2, 3]
appendNumbers(aData)
# aData is now [1, 2, 3, 100]
```
