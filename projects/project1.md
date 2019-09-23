## Project 1 -- Expressions

Objectives:

- Learn about parsing, the recursive nature of language, and recursive descent parsing
- Use operator precendence and left-factoring
- Organize your compiler into functions to represent grammar productions
- Encapsulate complexities of lexing and parsing away from code generation

Skills need:

- Predictive parsing (recursive descent), using a lookahead to distinguish grammar productions
- Encoding operator precedence into the grammar
- Left-factoring the grammar
- Using new LLVM variables to store intermediate values

### Grammar

    program
      = statement*

    statement
      = PRINT expression SEMI

    expression
      = expression PLUS NUMBER
      | expression MINUS NUMBER
      | expression TIMES NUMBER
      | expression DIVIDE NUMBER
      | expression MOD NUMBER
      | LPAREN expression RPAREN
      | NUMBER

### What Has Changed?

- The expression now allows another expression to be the right operand

### Notes on Semantics

- Expressions are arithmetic expressions with the usual definitions of addition, subtraction, etc.  These will be translated to the corresponding underlying LLVM language arithmetic operations.

- Use a single integer precision (no need to worry about large integers or overflows)

- Operators have precedence, highest to lowest.  Same line is equal precedence

        * /
        + -
        
    Parenthesized expressions have highest precedence.
    
    Precedence is not "built in" to this grammar.  It is left as an exercise to implement operator precedence, e.g., by modifying the grammar to have nonterminals for terms and factors.

