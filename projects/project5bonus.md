## (Bonus) Project 5 -- Arrays

Objectives:

- Learn how arrays are implemented
- Learn about pointers
- Learn more about memory allocation
- Learn about the memory bound problem for arrays, when array size is not known at compile-time

### Grammar

    program
      = function*

    function
      = INT IDENTIFIER LPAREN IDENTIFIER (COMMA IDENTIFIER)* RPAREN LCURLY declaration* statement* RCURLY

    declaration
      = INT IDENTIFIER SEMI
      | INT IDENTIFIER LBRACE NUMBER RBRACE SEMI

    statement
      = PRINT expression SEMI
      | READ IDENTIFIER SEMI
      | IDENTIFIER ASSIGN expression SEMI
      | IDENTIFIER LBRACE NUMBER RBRACE ASSIGN expression SEMI
      | IF LPAREN expression RPAREN statement
      | IF LPAREN expression RPAREN statement ELSE statement
      | WHILE LPAREN expression RPAREN statement
      | LCURLY statement* RCURLY

    expression
      = expression PLUS NUMBER
      | expression MINUS NUMBER
      | expression TIMES NUMBER
      | expression DIVIDE NUMBER
      | expression EQUALS NUMBER
      | expression MOD NUMBER
      | expression AND NUMBER
      | expression OR NUMBER
      | NOT expression
      | LPAREN expression RPAREN
      | NUMBER
      | IDENTIFIER
      | IDENTIFIER LBRACE NUMBER RBRACE
      | IDENTIFIER LPAREN ( expression (COMMA expression)* )? RPAREN


### What Has Changed?

- There is a new declaration for fixed-sized arrays
- There is a new assignment for elements in arrays
- There is a new expression for indexing into an array
