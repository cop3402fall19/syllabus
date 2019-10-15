# Project 0 -- Simple Arithmetic

Objectives:

- Learn about lexing
- Gain intuition about the parsing problem
- Generating boilerplate LLVM for printing/linking
- Organizing compiler to separate source processing from code generation

Skills needed:

- A basic LLVM template
- Knowledge of basic LLVM instructions
- Knowledge of linking
- Reading and checking one character at-a-time
- Handling whitespace
- Emitting LLVM instructions
- Using an intermediate value

## Grammar

    program
      = statement*

    statement
      = PRINT expression SEMI

    expression
      = NUMBER PLUS NUMBER
      | NUMBER MINUS NUMBER
      | NUMBER TIMES NUMBER
      | NUMBER DIVIDE NUMBER
      | NUMBER MOD NUMBER
      | NUMBER

This grammar means program will only look something like the following:

    print 432 + 2;
    print 58 * 95;

No more arithmetic then a single operation, and every statement is a print statement.

### Notes on Semantics

We will be using signed, 32-bit integers for our compiler.  `print` is
a built-in operation that writes one integer to standard out.
Overflows of integer operations result in undefined behavior, i.e.,
there is no protection from overflows.

## Target Language 

Please see a [template](template.ll) for the LLVM IR output that your compiler can use.

In order to translate the print statements, use the following templates:

- `call void @print_integer(i32 2)` for some constant integer, in this case `2`.
- `call void @print_integer(i32 %named_identifier)` for some identifier, in this case `%named_identifier`

There are only five arithmetic operations you need to support, `add nsw`, `sub nsw`, `mul nsw`, `sdiv`, and `srem`.  (Technically `srem` is remainder, not modulo).  For example

    print 2 + 3;
    print 2 - 3;
    
Can be translated to

    %t1 = add nsw i32 2, 3
    call void @print_integer(i32 %t1)
    %t2 = sub nsw i32 2, 3
    call void @print_integer(i32 %t2)

There are a number of important aspects of LLVM IR to keep in mind:

- Variables in LLVM IR are denoted by a `%`, e.g., `%t1`.
- Variables can only be assigned _once_.  Therefore, your compiler can increment a counter to generate new variable names.
- `i32` denotes a 32-bit integer type (in two's complement).
- Arithmetic instructions indicate the type of the operands, e.g., `add nsw i32`.
- Functions (and global variables) are denoted by `@`, e.g., `@print_integer`.
- The function call is given both the return type, e.g., `void`, and the parameter types along with the parameters, e.g., `i32 %t1`.

## Compiling, Running, and Testing a SimpleC Program

To compile and run the resulting LLVM IR do the following, replacing program with the name of your LLVM file:

    clang -o program program.ll
    ./program

There is a helper program, `tests/compile.sh`, that will use your compiler to compile and save the resulting file for a given test:

    tests/compile.sh ./project-USERID/simplec tests/proj0/all.simplec
    
There is also a helper program to run the resulting program and compare its output to the correct output:

    tests/run.sh tests/all.ll

## A Complete Example

The test case [all.simplec](tests/proj0/all.simplec) has an example of
each kind of statement from the source language.  A compiled version
of this program should result in LLVM IR similar to the following:

    target triple = "x86_64-pc-linux-gnu"

    declare i32 @printf(i8*, ...) #1
    @.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

    define void @print_integer(i32) #0 {
      %2 = alloca i32, align 4
      store i32 %0, i32* %2, align 4
      %3 = load i32, i32* %2, align 4
      %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %3)
      ret void
    }

    define i32 @main() #0 {
      %t1 = add nsw i32 2, 3
      call void @print_integer(i32 %t1)
      %t2 = sub nsw i32 2, 3
      call void @print_integer(i32 %t2)
      %t3 = mul nsw i32 2, 3
      call void @print_integer(i32 %t3)
      %t4 = sdiv i32 10, 3
      call void @print_integer(i32 %t4)
      %t5 = srem i32 10, 3
      call void @print_integer(i32 %t5)
      call void @print_integer(i32 2)
      ret i32 0
    }

## Submitting Projects

As described in the [git](git.md) tutorial, tag the project with `proj0` and push the tags.

    git tag proj0
