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
      = INT identifier LPAREN identifier (COMMA identifier)* RPAREN LCURLY declaration* statement* RCURLY

    declaration
      = INT identifier SEMI
      | INT identifier LBRACE integer RBRACE SEMI

    statement
      = PRINT expression SEMI
      | identifier ASSIGN expression SEMI
      | identifier LBRACE integer RBRACE ASSIGN expression SEMI
      | IF LPAREN expression RPAREN statement
      | IF LPAREN expression RPAREN statement ELSE statement
      | WHILE LPAREN expression RPAREN statement
      | LCURLY statement* RCURLY

    expression
      = expression PLUS integer
      | expression MINUS integer
      | expression TIMES integer
      | expression DIVIDE integer
      | expression EQUALS integer
      | expression AND integer
      | expression OR integer
      | NOT expression
      | LPAREN expression RPAREN
      | integer
      | identifier
      | identifier LBRACE integer RBRACE
      | identifier LPAREN ( expression (COMMA expression)* )? RPAREN

    integer
      = DIGIT DIGIT*

    identifier
      = LETTER LETTER*

### What Has Changed?

- There is a new declaration for fixed-sized arrays
- There is a new assignment for elements in arrays
- There is a new expression for indexing into an array
