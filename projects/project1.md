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
      = expression PLUS expression
      | expression MINUS expression
      | expression TIMES expression
      | expression DIVIDE expression
      | expression MOD expression
      | LPAREN expression RPAREN
      | NUMBER

### What Has Changed?

- The expression now allows nested expressions to be the operands.

### Notes on Semantics

- Expressions are arithmetic expressions with the usual definitions of addition, subtraction, etc.  These will be translated to the corresponding underlying LLVM language arithmetic operations.

- Use a single integer precision (no need to worry about large integers or overflows)

- Operators have precedence, highest to lowest.  Same line is equal precedence

        * / %
        + -

    Multiplication, division, and remainder have the same precedence, so they are processed left-to-right.  These three all have higher precedence than addition and subtraction, which have the same precendence as each other.

    Parenthesized expressions have highest precedence.
    
    Precedence is not "built in" to this grammar.  It is left as an exercise to implement operator precedence, e.g., by modifying the grammar to have nonterminals for terms and factors.

## Operator Precedence

The grammar, as written, is ambiguous, i.e., there are multiple
possible left-most deriviations (or parse trees) for expressions
involving two or more different operators.  It is left for in-class
discussion, homework, and lab to handle operator precedence by
rewriting the grammar.

## Recursive Descent Parsing

The grammar, as written, will not support recursive descent parsing
because it is left-recursive.  It is left for in-class discussion,
homework, and lab to support recursive descent (and predictive
parsing) by rewriting the grammar.

## Target Language

The necessary IR is basically the same as that for [project 0](project0.md).  The only difference is that now we need to compute multiple operations for each statement, storing intermediate results.  For instance, the following SimpleC statement contains a single arithmetic expression comprising two separate arithmetic operations:

    print -5 + 2 * 3;
    
Since SimpleC respects order of operations, the multiplication should happen first, followed by the addition.  In LLVM, this would be

    %t1 = mul nsw i32 2, 3
    %t2 = add nsw i32 -5, %t1
    call void @print_integer(i32 %t2)

(Keep in mind that this resulting statements still need to be emitted
within the provided [template](template.ll) as in project 0 in order
to be compiled into machine code by LLVM.)

Notice that the first operation, two multiplied by three, is computed
and stored in a temporary variable, `%t1`, as in project 0.  Then this
value is used in the next line to compute the rest of the expression,
negative five plus the value stored in `%t1`.  This result is stored
in `%t2` and then printed.

The grammar of arithmetic expressions allows for arbitrarily large
expressions.  There is no limit in the language on the depth of nested
expessions (though the machine may run out of memory eventually).  Here is another example:

    print 3 * ((4 - 1) * (7) + 50 / (2 - 4));
    
A corresponding LLVM IR program looks like this:

    %t1 = sub nsw i32   4, 1
    %t2 = mul nsw i32 %t1, 7
    %t3 = sub nsw i32   2, 4
    %t4 = sdiv    i32  50, %t3
    %t5 = add nsw i32 %t2, %t4
    %t6 = mul nsw i32   3, %t5
    call void @print_integer(i32 %t6)

Note again that order of operations is respected, e.g., the division happens before the addition, and that parentheses override this order., e.g., `(4 - 1)` happens before the multiplications.
