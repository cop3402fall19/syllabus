## (Bonus) Project 5 -- Arrays

Objectives:

- Learn how arrays are implemented
- Learn about pointers
- Learn more about memory allocation
- Learn about the memory bound problem for arrays, when array size is not known at compile-time

### Grammar

    program
      = declaration* function* statement*

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
      = expression PLUS expression
      | expression MINUS expression
      | expression TIMES expression
      | expression DIVIDE expression
      | expression MOD expression
      | expression EQUALS expression
      | expression LT expression
      | expression AND expression
      | expression OR expression
      | NOT expression
      | LPAREN expression RPAREN
      | NUMBER
      | IDENTIFIER
      | IDENTIFIER LPAREN ( expression (COMMA expression)* )? RPAREN


### What Has Changed?

- There is a new declaration for fixed-sized arrays
- There is a new assignment for elements in arrays
- There is a new expression for indexing into an array
