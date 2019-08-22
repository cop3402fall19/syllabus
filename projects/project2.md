## Project 2 -- Variables

Objectives:

- Learn how variables are implemented
- Learn about symbol tables and type-checking
- Learn about memory management on the stack

Skills needed:

- Using a symbol table to assign memory addresses for variables
- Using the stack to allocate space for variables
- Simple type checking to prevent uninitialized variable usage and duplicate declarations

### Grammar

    program
      = declaration* statement*

    declaration
      = INT identifier SEMI

    statement
      = PRINT expression SEMI
      | identifier ASSIGN expression SEMI

    expression
      = expression PLUS integer
      | expression MINUS integer
      | expression TIMES integer
      | expression DIVIDE integer
      | LPAREN expression RPAREN
      | integer
      | identifier

    integer
      = DIGIT DIGIT*

    identifier
      = LETTER LETTER*


### What Has Changed?

- There are identifier and declaration productions
- A new statement for assigning values to variables
- The program now consists of a list of declarations followed by a list of statements

### Notes on Semantics

- Identifiers must be declared before usage and can only be defined once.

- Assigning a value to an identifier changes its value from that point onward.  This will be implemented by allocating a memory location to each identifier.

- The value of an expression is computed before assigning it to an identifier.
