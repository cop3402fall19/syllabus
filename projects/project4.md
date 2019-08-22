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
      = declaration* function* statement*

    function
      = INT identifier LPAREN identifier (COMMA identifier)* RPAREN LCURLY declaration* statement* RCURLY

    declaration
      = INT identifier SEMI

    statement
      = PRINT expression SEMI
      | identifier ASSIGN expression SEMI
      | IF LPAREN expression RPAREN statement
      | IF LPAREN expression RPAREN statement ELSE statement
      | WHILE LPAREN expression RPAREN statement
      | LCURLY statement* RCURLY
      | RETURN expression SEMI

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
      | identifier LPAREN [ expression (COMMA expression)* ] RPAREN

    integer
      = DIGIT DIGIT*

    identifier
      = LETTER LETTER*

### What Has Changed?

- A program can now have function definitions after declarations
- A new function non-terminal defines syntax of function definitions.  Like the previous program, it contains a list of declarations followed by a list of statements.
- There is a new expression production for function application.

### Notes on Semantics

- There are no global variables, only global function names.  Function and variable names are in the same namespace so must be unique.

- Functions have their own scope, that is the same identifier can be used in different function bodies and refer to different memory locations.

- Functions may call other functions.  The state of the function should be saved and restored when leaving and reentering the calling function.  Recursion is permitted and each function instance has its own state.

- A function always has a return value that is initialized to zero.  A function call is evaluated and its value replaces the call in the expression before continuing to evaluate the expression.

- The parameters to a function call are fully evaluated before binding to its formal parameters.
