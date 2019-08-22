## Lexical Specification (Tokens)

### Character Classes

The character class is syntax sugar for regular expressions used in many implementations of regular expressions.  Intuitively, it defines a range of character alternatives, e.g., `[a4]` means `a` _or_ `4`, while `[0-9]` means `0|1|2|3|4|5|6|7|8|9`.

    DIGIT      [0-9]
    LETTER     [A-Za-z]

### Keywords

Keywords are denoted by a quoted string and are a sequence of alphabetic characters.  These are the reserved words of the language, so no variables may be named them.

    PRINT      "print"
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
    AND        "&&"
    OR         "||"
    NOT        "!"
    LCURLY     "{"
    RCURLY     "}"
    COMMA      ","
    LBRACE     "["
    RBRACE     "]"

### Whitespace

All whitespace (spaces, newlines, tabs, etc) should be ignored.  All other nonprintable characters are a lexer errors, except for end-of-file.
