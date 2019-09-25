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
      = INT IDENTIFIER SEMI

    statement
      = PRINT expression SEMI
      | IDENTIFIER ASSIGN expression SEMI

    expression
      = expression PLUS expression
      | expression MINUS expression
      | expression TIMES expression
      | expression DIVIDE expression
      | expression MOD expression
      | LPAREN expression RPAREN
      | NUMBER
      | IDENTIFIER

### What Has Changed?

- There are identifier and declaration productions
- A new statement for assigning values to variables
- The program now consists of a list of declarations followed by a list of statements

### Notes on Semantics

- Identifiers must be declared before usage and can only be defined once.

- Assigning a value to an identifier changes its value from that point onward.  This will be implemented by allocating a memory location to each identifier.

- The value of an expression is computed before assigning it to an identifier.
