## Project 3 -- Control Flow

Objectives

- Learn how control flow is implemented
- Learn about comparisons and branching in LLVM
- Further understand how nesting in grammars enables the expression of computation

Skills needed:

- LLVM instructions for comparing and branching
- Implementation of control structures
- Predictive parsing (recursive descent), using a lookahead to distinguish grammar productions
- Left factoring and the dangling-else problem

### Grammar

    program
      = declaration* statement*

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

    expression
       = expression PLUS expression
      | expression MINUS expression
      | expression TIMES expression
      | expression DIVIDE expression
      | expression MOD expression
      | expression EQUALS expression
      | expression AND expression
      | expression OR expression
      | NOT expression
      | LPAREN expression RPAREN
      | INTEGER
      | IDENTIFIER


### What Has Changed?

- There are three new productions for a statement, if, if-then-else, and while.
- There are new operators on expressions for the logical connectives

### Notes on Semantics

- Operators have precedence, highest to lowest.  Same line is equal precedence

        *  /
        +  -
        ==
        && ||
        
    Parenthesized expressions have highest precedence.
    
    Precedence is not "built in" to this grammar.  It is left as an
    exercise to implement operator precedence, e.g., by modifying the
    grammar to have nonterminals for terms and factors.
    
    Note that equality has higher precedence than `&&` and `||`, just
    like in C.  This can be counterintuitive and requires wrapping
    logical expressions in parentheses before testing equality.

- Use the underlying LLVM integer for logical operations.  A non-zero value means true while a zero value means false.

- All variable declarations are in the same scope, i.e., any declarations inside of a compound statement must be unique for the entire program.

- For both if statements and while loops, the conditional expressions is first computed and then tested to determine whether the enter the branch.  For while loops, the conditional expression is also recomputed before reentering the body.  If false, the body is not reentered.  For if-then-else, the else body is entered if the result of the conditional expression is false.  Only one of the then branch or the else branch can be executed.

- Resolve the dangling-else problem by associating an ELSE branch with the closest previous IF branch.
