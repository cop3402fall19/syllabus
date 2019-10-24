## Lexical Specification (Tokens)

A _token_ is a symbol that abstracts away sequences of characters in
the source file, akin to words in a sentence.  A _lexeme_ is sequence
of characters corresponding to a token.  A token's lexemes can be
specified using pattern matching languages, such as regular
expressions.  The following describes the tokens of our source
language, i.e., the _lexical specification_.  The left-hand side is
the name of the token and is given in all caps.  The right-hand side
is the pattern of lexemes.  For tokens with only a single lexeme, the
lexeme is given within double-quotes.  Tokens with multiple possible
lexemes, such as an identifier, are specified using regular
expressions.

### Keywords

Keywords are denoted by a quoted string and are a sequence of alphabetic characters.  These are the reserved words of the language, so no variables may be named them.  Assume keywords are followed by whitespace.

    PRINT      "print"
    READ       "read"
    INT        "int"
    RETURN     "return"

### Symbols

Symbols, like keywords, are quoted strings, but in this case use puncutation symbols, so they could not be used as variable names in our language.  The symbols in our language are either a single character, e.g., `;`, or two characters, e.g., `==`.

    SEMI       ";"
    PLUS       "+"
    MINUS      "-"
    TIMES      "*"
    DIVIDE     "/"
    MOD        "%"
    LPAREN     "("
    RPAREN     ")"
    ASSIGN     "="
    EQUALS     "=="
    NEQUALS    "!="
    LT         "<"
    GT         ">"
    AND        "&&"
    OR         "||"
    NOT        "!"
    LCURLY     "{"
    RCURLY     "}"
    COMMA      ","
    LBRACE     "["
    RBRACE     "]"

### Tokens with Attributes

Unlike the above tokens, which only have a single lexeme, integer and
identifier tokens fit a pattern of possible lexemes. Regular
expressions are specified with three operations over sets of character
sequences: _concatenation_, _alternation_, and _closure_.
Concatenation two patterns appear in one after another and is written
by writing the patterns adjacent to each other.  Alternation means one
or other pattern is matched, but not both as is specified using a pipe
character `|`.  Closure means zero or more instances of the pattern
and is specified using an asterisk `*`.  Parentheses, as in arithmetic
expressions, enforce order of operations.  In the compiler, tokens
with attributes are represented as a pair containing the token symbol
and the value of the token taken from the lexeme.

Real-world regular expression implementations provide extra operations
for ease-of-use, i.e., _syntactic sugar_, that make writing regular
expressions more concise, but can always be written using the three
canonical operations.

A Character class defines a set possible of character alternatives,
e.g., `[a4]` means `a` _or_ `4`, while `[0-9]` means
`0|1|2|3|4|5|6|7|8|9`.  We use the following character classes on the
right-hand side of our patterns.

    DIGIT      [0-9]
    LETTER     [A-Za-z]

Integers and identifiers are the only two tokens that have attributes. 

    NUMBER      MINUS? DIGIT DIGIT*
    IDENTIFIER  LETTER (LETTER|DIGIT)*

By convention, IDENTIFER matches the longest possible sequence, so `integer` is a single identifier, not the INT keyword followed by an identifier. 

### Whitespace

Whitespace (spaces, newlines, tabs, etc) can appear between any tokens and should be ignored.  This means that a newline can appear between any tokens, and not necessarily at the end of a statement.  All other nonprintable characters are a lexer errors.

### Lexeme size

All lexemes are ASCII.  The maximum lexeme size is 4095 characters.
