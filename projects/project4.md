## Project 4 -- The Function Abstraction

Objectives:

- Learn about the function abstraction for imperative programming languages
- Learn how the stack is used to "freeze" functions using stack frames that record function state
- Learn about parameter passing and linking
- Learn more about type checking

Skills needed:

- Symbol table usage to store functions and variable scope
- Type checking to distinguish functions from variables
- Using the stack to store variables and save registers
- LLVM implementation of a function calls, parameter passing, return value (and basic knowledge Intel x86 application binary interface (ABI), saving and restoring registers)

### Grammar

    program
      = function function*

    function
      = INT IDENTIFIER LPAREN ( INT IDENTIFIER (COMMA INT IDENTIFIER)* )? RPAREN LCURLY declaration* statement* RCURLY

    declaration
      = INT IDENTIFIER SEMI

    statement
      = PRINT expression SEMI
      | READ IDENTIFIER SEMI
      | IDENTIFIER ASSIGN expression SEMI
      | IF LPAREN expression RPAREN statement
      | IF LPAREN expression RPAREN statement ELSE statement
      | WHILE LPAREN expression RPAREN statement
      | LCURLY statement* RCURLY
      | RETURN expression SEMI

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

- A program can now have function definitions after declarations
- A new function non-terminal defines syntax of function definitions.  Like the previous program, it contains a list of declarations followed by a list of statements.  The `?` means that the parenthesized part of the production is optional, i.e., it either doesn't appear or appears once.
- There is a new expression production for function application.

### Notes on Semantics

- There are no global variables, only global function names.  It is left as a bonus exercise to implement global variables.

- Functions should be defined before they are used.

- There should one function named "main" of type () -> int.

- Functions must end with a return statement.

- Functions have their own scope, that is the same identifier can be used in different function bodies and refer to different memory locations.

- Functions may call other functions.  The state of the function should be saved and restored when leaving and reentering the calling function.  Recursion is permitted and each function instance has its own state.

- A function always has a return value that is initialized to zero.  A function call is evaluated and its value replaces the call in the expression before continuing to evaluate the expression.

- The parameters to a function call are fully evaluated before binding to its formal parameters.


## New template

Since this version of the compiler can support defining functions, there is no need for the template to explicitly emit a main method.  Instead use the new [template](template.h) macro `PROJ4_PROLOGUE`.

## Example of code generation for functions

This [SimpleC program](examples/functions_example.simplec) is translated to this [LLVM program](examples/functions_example.ll). 
