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
      | READ IDENTIFIER SEMI
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
- A new statement for reading values from input and storing them in a variable
- A new statement for assigning values to variables
- The program now consists of a list of declarations followed by a list of statements

### Notes on Semantics

- Identifiers must be declared before usage and can only be defined once.

- Assigning a value to an identifier changes its value from that point onward.  This will be implemented by allocating a memory location to each identifier and using stores and loads to update and read variable values.

- The value of an expression is computed before assigning it to an identifier.  This means that the variable being assigned can appear on the right-hand side of an assignment. 

## Implementing Variables

Variables are implemented by associating the identifier with a location in memory.  The compiler allocates space in memory for each declared variable.  For our implementation, we will use stack-allocated variables.  In LLVM IR, stack allocations are performed with the `alloca` instruction, e.g., if we declare `x` with `int x;`, we emit

    ; "int x;"
    %t1 = alloca i32
    
`alloca` takes the data-type, which for our compiler is always `i32`, and creates a new entry on the stack.  The resulting value, e.g., here in `%t1`, contains a pointer to memory location of this new stack entry.  The initial value can be arbitrary data, as in many implementations of C, so it is up to the programmer to initialize it.

The compiler keeps track of what memory locations are associated with what variables using a symbol table.  A symbol table maps variable names to memory locations.  For our LLVM IR implementation, the memory location is stored in a temporary variable, e.g., `%t1`.  Variables are assigned with a `stored` to the memory location associated wtih the variable:

    ; "x = 7;"
    store i32 7, i32* %t1
    
Accessing a variable's value is done via a `load` to the memory location associated with the variable:

    ; "print x;"
    %t2 = load i32, i32* %t1 ; get value of x
    call void @print_integer(i32 %t2) ; print the value

## Basic type-checking

Consider the full program below:

    int x;
    x = 1 + y;
    
Line two refers to a variable `y` that has not yet been declared.  Our compiler should produce an error informing the programer of the use of an undefined variable `y`.  The compiler should print to standard error,

    error: use of undeclared variable y

Printing to standard error can be acheived with

    fprintf(stderr, "error: ...");
    
Redirecting standard error is like redirecting standard output, except we use `2>` to explicitly ask for the file descriptor, "2", for the output file.

## The symbol table

The compiler should maintain a table mapping variable names to memory locations, i.e., for LLVM IR temporary variables that hold the memory address of the variable's corresponding stack allocation.  There are many ways to implement a hash table.  One of the simplest, though it has poor lookup performance, is a linkedlist, where each node contains both the variable' name and the corresponding LLVM IR variable that holds the its memory location.

Both type-checking and code generation are enabled by the symbol table:

- When a new variable is declared, the compiler generates a stack allocation, then records a mapping from the variable name to the address of the stack allocation, i.e., the LLVM register name.
- When a variable is assigned or read in, the compiler generates a `store` (after computing the right-hand side or calling the read_integer function), using the symbol table to remember where to store the value to
- When a variable is used, the compiler generates a `load`, using the symbol table to remember where to load from
- When a variable that hasn't been declared is used, the compiler knows this because there is no symbol table entry and generates a type error


## Reading from Input

The <template.ll> now contains an implementation of `read_integer` which reads a single integer from standard input.  Your compiler should now emit this extra code before `main`:

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

    %struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
    %struct._IO_marker = type opaque
    %struct._IO_codecvt = type opaque
    %struct._IO_wide_data = type opaque

    @stderr = external dso_local global %struct._IO_FILE*, align 8
    @.str.1 = private unnamed_addr constant [25 x i8] c"please enter an integer\0A\00", align 1
    @.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
    @.str.3 = private unnamed_addr constant [6 x i8] c"scanf\00", align 1
    @.str.4 = private unnamed_addr constant [24 x i8] c"no matching characters\0A\00", align 1

    declare i32* @__errno_location() #2
    declare i32 @__isoc99_scanf(i8*, ...) #1
    declare void @perror(i8*) #1
    declare void @exit(i32) #3
    declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

    define i32 @read_integer() #0 {
      %1 = alloca i32, align 4
      %2 = alloca i32, align 4
      %3 = call i32* @__errno_location() #4
      store i32 0, i32* %3, align 4
      %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
      %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i32 0, i32 0))
      %6 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %1)
      store i32 %6, i32* %2, align 4
      %7 = load i32, i32* %2, align 4
      %8 = icmp eq i32 %7, 1
      br i1 %8, label %9, label %11

    ; <label>:9:                                      ; preds = %0
      %10 = load i32, i32* %1, align 4
      ret i32 %10

    ; <label>:11:                                     ; preds = %0
      %12 = call i32* @__errno_location() #4
      %13 = load i32, i32* %12, align 4
      %14 = icmp ne i32 %13, 0
      br i1 %14, label %15, label %16

    ; <label>:15:                                     ; preds = %11
      call void @perror(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0))
      call void @exit(i32 1) #5
      unreachable

    ; <label>:16:                                     ; preds = %11
      %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
      %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.4, i32 0, i32 0))
      call void @exit(i32 1) #5
      unreachable
    }


Use the `read_integer` method like this:

    %t1 = call i32 @read_integer()
    
This will take a single integer followed by a newline character and store the result in `%t1`.  For instance, we can combine this with `print_integer`.  Take the example <examples/read_integer.ll>.  The body of its main contains

    %t1 = call i32 @read_integer()
    call void @print_integer(i32 %t1)
    %t2 = call i32 @read_integer()
    call void @print_integer(i32 %t2)
    %t3 = call i32 @read_integer()
    call void @print_integer(i32 %t3)

This reads three integers from standard input one-at-a-time and prints them out.  You can run the example after building it, or redirect a file as input:

    cd examples/
    clang -o read_integer read_integer.ll
    ./read_integer # this will hang, waiting for you to type an integer and hit enter
    ./read_integer < read_integer.in # this gets input from file instead of console

## Larger Example

The following program requires:

- declaring variables
- loading variable values
- storing variable values

    int x;
    int y;
    x = 2;
    y = x + 1;
    print y;

Here is the what the symbol table will look like by the end of the program

variable     |   address
-------------|-------------
`x`          |     `%t1`
`y`          |     `%t2`

    
Here is an equivalent LLVM IR program, annotated with the original source code in IR comments:

    ; "int x;" allocate space for x
    %t1 = alloca i32

    ; "int y;" allocate space for y
    %t2 = alloca i32

    ; "x = 2;" assign x
    store i32 2, i32* %t1

    ; "y = x + 1;"
    ; first evaluate the expression
    %t3 = load i32, i32* %t1 ; get value of x
    %t4 = add nsw i32 %t3, 1 ; do the addition
    store i32 %t4, i32* %t2 ; assign result to y

    ; "print y;"
    ; first evaluate the expression
    %t5 = load i32, i32* %t2 ; get value of y
    call void @print_integer(i32 %t5) ; print the result

## Example with Input

The following program requires:

- declaring variables
- reading variables from input
- loading variable values
- storing variable values

        int x;
        int y;
        read x;
        y = x + 1;
        print y;
    
    
Here is an equivalent LLVM IR program, annotated with the original source code in IR comments:

    ; "int x;" allocate space for x
    %t1 = alloca i32

    ; "int y;" allocate space for y
    %t2 = alloca i32

    ; "read x;" read x from input
    %t3 = call i32 @read_integer()
    store i32 %t3, i32* %t1

    ; "y = x + 1;"
    ; first evaluate the expression
    %t4 = load i32, i32* %t1 ; get value of x
    %t5 = add nsw i32 %t4, 1 ; do the addition
    store i32 %t5, i32* %t2 ; assign result to y

    ; "print y;"
    ; first evaluate the expression
    %t6 = load i32, i32* %t2 ; get value of y
    call void @print_integer(i32 %t6) ; print the result
