# Language Specification

In this chapter we will learn about

- Scanner Commands
- Language keywords
- Alias Keywords
- Language Functions
- Compiler Errors
- Runtime Errors
- Environment Errors
- Language Grammar
- Virtual Machine (VM) Instructions

# Scanner Commands

Commands Count: 5

- ChangeRingKeyword
- ChangeRingOperator
- DisableHashComments
- EnableHashComments
- LoadSyntax

Grammar:

```ring
Command ---> 'changeringkeyword' <OldKeyword> <NewKeyword>
Command ---> 'changeringoperator' <OldOperator> <NewOperator>
Command ---> 'EnableHashComments'
Command ---> 'DisableHashComments'
Command ---> 'loadsyntax' <Literal>
```


# Language Keywords

Keywords Count: 56

- again
- and
- but
- bye
- call
- case
- catch
- class
- def
- do
- done
- else
- elseif
- end
- exit
- for
- foreach
- from
- func
- get
- give
- if
- import
- in
- load
- loop
- new
- next
- not
- off
- ok
- on
- or
- other
- package
- private
- put
- return
- see
- step
- switch
- to
- try
- while
- endfunc
- endclass
- endpackage
- endif
- endfor
- endwhile
- endswitch
- endtry
- function
- endfunction
- break
- continue

# Alias Keywords

Alias Keywords Count: 14

Ring defines wrapper keywords (to enable translation) around the following internal identifiers

- This
- Self
- Super
- Main
- Init
- Operator
- BraceStart
- BraceExprEval
- BraceNewLine
- BraceError
- BraceEnd
- RingVM_See
- RingVM_Give
- RingVM_ErrorHandler

# Language Functions

Functions Count: 258

(See `references/builtins.md` for a comprehensive categorized guide of all 258 built-in functions)

# Language Grammar

Program ---> {statement}

Statement ---> 'package' <Identifier> { '.' <Identifier> } ['{' {statement} '}'] ['end'|'endpackage']

Statement ---> 'class' <Identifier> [ 'from'|':'|'<' <Identifier> ] ['{' {statement} '}']['end'|'endclass']

Statement ---> 'func'|'def'|'function' <Identifier> [ParaList] ['{' {statement} '}']['end'|'endfunc'|'endfunction']

Statement ---> 'import' <Identifier> { '.' <Identifier> }

Statement ---> 'private'

Statement ---> 'load' ['package'|'again'] <Literal>

Statement ---> 'see'|'put' <Expr>

Statement ---> 'give'|'get' <Identifier>

Statement ---> 'if' <Expr> ['{'] {statement} [ {'but'|'elseif' <Expr> {Statement} } ] ['else' {Statement} ] 'ok'|'end'|'}'|'endif'

Statement ---> 'Switch' <Expr> ['{'] { 'on'|'case' <Expr> {statement} } ['other' {Statement} ]  'off'|'end'|'}'|'endswitch'

Statement ---> 'for' <Identifier> '=' <Expr> 'to' <Expr> [ 'step' <Expr> ] ['{'] {Statement} 'next'|'end'|'}'|'endfor'

Statement ---> 'for'|'foreach' <Identifier> 'in' <Expr>  [ 'step' <Expr> ] ['{'] {statement} 'next'|'end'|'}'|'endfor'

Statement ---> 'while' <Expr> ['{'] {statement} 'end'|'}'|'endwhile'

Statement ---> 'do' {statement} 'again' <Expr>

Statement ---> 'try' {statement} ['{'] 'catch' {statement} 'done'|'end'|'}'|'endtry'

Statement ---> 'return' ['&'] <Expr>

Statement ---> 'bye'

Statement ---> 'exit'|'break'

Statement ---> 'loop'|'continue'

Statement ---> <Expr>

Statement ---> epsilon | ';' | ','

ParaList ---> epsilon

ParaList ---> ['('] <Identifier> [{ ',' <Identifier> }] [')']

Expr ---> <LogicNot> [{ 'and'|'or' <LogicNot> }]

LogicNot --> ['not'] <EqualOrNot>

EqualOrNot --> [ '='|'!=' ] <Compare>

Compare ---> <BitOrXor> [ { '<' | '>' | '<=' | '>=' <BitOrXor> } ]

BitOrXor ---> <BitAnd> [ { '|' | '^' <BitAnd> } ]

BitAnd ---> <BitShift> [ { '&' <BitShift> } ]

BitShift ---> <Arithmetic> [ { '<<' | '>>' <Arithmetic> } ]

Arithmetic ---> <Term> [ { '+' | '-'  <Term>  } ]

Term ---> <Range> [ { '*' | '/' | '%' | '**' | '^^' <Range> } ]

Range ---> <Factor> [ ':' <Factor> ]

Factor ---> <Identifier> [ {Mixer} ] [ '=' <Expr> ]

Factor ---> <Number>

Factor ---> <Literal>

Factor ---> ':' <Identifier>

Factor ---> '-' <Factor>

Factor ---> '~' <Factor>

Factor ---> '(' <Expr> ')'

Factor ---> <List>

Factor ---> 'new' ['from'] <Identifier>

Factor ---> <AnonymousFunction>

Factor ---> 'call' ['{'] <identifier> { '.' <Identifier> } '(' <Parameters> ')' ['}']

List ---> '[' [ <Expr> { ',' <Expr> } ] ']'

Mixer ---> { '.' <Identifier> }

Mixer ---> '[' <Expr> ']'

Mixer ---> '(' [ <Expr> [ { ',' <Expr> }] ]  ')'

Mixer ---> '{' {Statement} '}'

AnonymousFunction ---> 'func'|'def'|'function' [<ParaList>] '{' {Statement} '}'
