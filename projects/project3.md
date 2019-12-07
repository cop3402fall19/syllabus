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
      | expression NEQUALS expression
      | expression LT expression
      | expression GT expression
      | expression AND expression
      | expression OR expression
      | NOT expression
      | LPAREN expression RPAREN
      | NUMBER
      | IDENTIFIER


### What Has Changed?

- There are three new productions for a statement, if, if-then-else, and while.
- There are new operators on expressions for the logical connectives

### Notes on Semantics

- Operators have precedence, highest to lowest.  Same line is equal precedence

        !
        * / %
        + -
        > <
        == !=
        &&
        ||
        
    Parenthesized expressions have highest precedence.
    
    Precedence is not "built in" to this grammar.  It is left as an
    exercise to implement operator precedence, e.g., by modifying the
    grammar to have nonterminals for terms and factors.
    
    Note that equality has higher precedence than `&&` and `||`, just
    like in C.  This can be counterintuitive and requires wrapping
    logical expressions in parentheses before testing equality.
    
- Mixing of Boolean and integer types is not permitted.  These are the types of each operator

        !  : (bool) -> bool
        +  : (int, int) -> int (same for -, *, /, and %)
        == : (int, int) -> bool (same for !=, >, and <)
        && | (bool, bool) -> bool (same for ||)

- Use the underlying LLVM 1-bit integer for Boolean values.  A non-zero value means true while a zero value means false.

- All variable declarations are in the same scope, i.e., any declarations inside of a compound statement must be unique for the entire program.

- For both if statements and while loops, the conditional expressions is first computed and then tested to determine whether the enter the branch.  For while loops, the conditional expression is also recomputed before reentering the body.  If false, the body is not reentered.  For if-then-else, the else body is entered if the result of the conditional expression is false.  Only one of the then branch or the else branch can be executed.

- Resolve the dangling-else problem by associating an ELSE branch with the closest previous IF branch.

## Compare and branch in LLVM IR


Altering control-flow can be done with LLVM's branch instruction `br` instruction.  There are two kinds of branches

1. Conditional branches decide between two different locations in the program to jump to, given the result of a comparison instruction.
2. Unconditional branches always jump to the given program point.

### Labels

Given the program point to jump to using a _label_.  The following is an example of an unconditional branch to a label called `ifbranch1`.

      br label %ifbranch1  ; the unconditional branch instruction
      ; ... 
    ifbranch1:  ; the label to jump to
      ret i32 0 ; a return instruction

The label is defined with an identifier followed by a colon, e.g., `ifbranch1`, and appears before the first instruction to execute after calling the branch.  Labels are like other LLVM registers, but they are intended to hold an address in the code segment.  To refer to a label, use this syntax: `label %ifbranch1`.

### Conditional branches

A conditional branch takes three arguments

1. A condition value
2. A label to jump to if the condition is true
3. A label to jump to if the condition is false

Here is an example.  Assume the `%cond` register already hold a 1-bit value.

      br i1 %cond, label %ifbranch2, %elsebranch2
    ifbranch2:
      ret i32 1
    elsebranch2:
      ret i32 0
      
In this example, when the `%cond` register holds `1` at runtime, the branch will jump to first instruction after the `%ifbranch2` label..  If it is `0`, then the branch will jump to the first instruction after the `%elsebranch2` label.

### Comparisons

The condition value can be set using an comparison instruction.  For SimpleC, which only has a signed `int` type, we will use the `icmp` instruction, which compares integers.  `icmp` requires three things

1. The comparison to perform, e.g., `eq` for equals and `slt` for signed less than.
2. The first operand to compare
3. The second operand to compare

Here is an example.  Assume there are two temporary registers have already been created, `%t1` and `%t2`.  The example will compare the registers for integer equality.

    %t3 = icmp eq i32 %t1, %t2
    
The result of the comparison is a 1-bit value, i.e., `1` for true and `0` for false.  This result can then be used for the condition of a conditional branch.

The `eq` argument checks for integer equality between the operands.  The following match SimpleC's comparison operators:

- `eq` for `==` (`EQUALS`)
- `ne` for `!=` (`NEQUALS`)
- `slt` for `<` (`LT`)
- `sgt` for `>` (`GT`)

The `s` in `slt` and `sgt` means a signed inequality, since SimpleC values are signed integers.

### A full example of compare and branch

This program

        %t1 = alloca i32  ; allocate space for x
        %t2 = call i32 @read_integer()  ; read an integer from stdin
        store i32 %t2, i32* %t1  ; store the result of read_integer
        %t3 = load i32, i32* %t1  ; get value of x
        %cond = icmp eq i32 %t3, 10
        br i1 %cond, label %ifbranch, label %elsebranch
    ifbranch:
        %t4 = load i32, i32* %t1 ; get value of x
        call void @print_integer(i32 %t4) ; print the value of x
        br label %end
    elsebranch:
        call void @print_integer(i32 0) ; print 0
        br label %end
    end:
        ret i32 0

## Boolean operations

Boolean `and` and `not` work just like arithmetic instructions.  For SimpleC, however, we will assume Boolean values are always 1-bit integers, i.e., the `i1` type in LLVM.

    %t3 = and i1 %t1, %t2
    %t4 = or i1 %t3, %t1

LLVM does not have a unary negation.  One solution is to use `xor` instead:

    %t5 = xor i1 %t4, 1

As long as Boolean and integer types are not mixed in operations, you may assume that Boolean operations are always `i1` and arithmetic operations are always `i32`.  It is left as a bonus exercise to write a type-checker that checks whether this is the case for the input program.

### Combining Boolean and comparison operations

For instance, the following Boolean expression can be expressed in LLVM instructions as follows.  Assume that the address of `x` is stored in `%t1`, and the address of `y` in `%t2`.

    (x * 3 != 0) && (y < 10)

Equivalent LLVM instructions.

    %t3 = load i32, i32* %t1  ; get value of x
    %t4 = mul nsw i32 %t3, 3
    %t5 = icmp eq i32 %t4, 0  ; returns an i1 value
    %t6 = load i32, i32* %t2  ; get value of y
    %t7 = icmp slt i32, %t6, 10  ; returns an i1 value
    %t8 = and i1 %t5, %t7
    
The final result in `%t8` can then be used in a subsequent branch instruction, for instance, in the implementation of an if statement.


### Type errors

The following would be type errors.


Assuming x and y are already defined

    x = 3 < y;
    
Without type-checking, the above expression might be naively translated to


    (10 - foo) || (bar == 4)

As mentioned above, it is left as a bonus exercise to handle type errors.  Otherwise, such type-unsafe programs will not be given as test cases.

## Implementing if statements

    int x;
    read x;
    if (x == 10) {
      print x;
    }
    print 0;
    

This would look in LLVM like:

        ; "int x;" allocate space for x
        %t1 = alloca i32  ; allocate space for x

        ; "read x;" read x from input
        %t2 = call i32 @read_integer()  ; read an integer from stdin
        store i32 %t2, i32* %t1  ; store the result of read_integer
        
        ; compute x == 10
        %t3 = load i32, i32* %t1  ; get value of x
        %cond = icmp eq i32 %t3, 10  ; do comparison

        ; if (x == 10)
        br i1 %cond, label %label1, label %label2

    label1:  ; body of the if statement
        %t4 = load i32, i32* %t1 ; get value of x
        call void @print_integer(i32 %t4) ; print the value of x
        br label %label2
        
    label2:  ; after the if statement
        call void @print_integer(i32 0) ; print 0
        ret i32 0
        
        
See the slides for pseudocode, including if-then-else statements.        
        

### Handling Boolean operations and comparisons

In project 2, we parse and generate code for arithmetic expressions.  The expression parsing function returns a new temporary register (or constant depending on how you implemented it).  This integrates into the Boolean operations and comparison operations nicely.


## Implementing while loops

While loops are just like if statements, except they also have a unconditional branch that jumps back to where the conditional expression is evaluated.

      br label %head // explicit branch to head
    head:
      ; condition expression
      ; ...
      %t3 = icmp slt i32 %t2, 5
      br i1 %t3, label %body, label %exit
    body:
      ; body of while loop
      ; ...
      br label %head
    exit:
      ; code after the while loop
