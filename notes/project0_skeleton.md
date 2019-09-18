# Project 0 Implemention Suggestions

- one function per token
- return the lexeme (true) or NULL (false)
  - semicolon has no token attribute, i.e., it doesn't contribute to the meaning of the target program
- engineering tip: make sure each function is _fully-defined_
  - account for all possible inputs
  - account for all possible outputs (and check them at the callsite)
- first try _recognizing_ the source language
  - create a statement function that checks the tokens in order of the statement patterns
- be sure to account for whitespace
  - can treat as another token, zero-or-more whitespace characters
- once recognitition works, emit (print) the LLVM IR target code
  - identify the output statement pattern
  - automatically fill in the pieces using the recognized lexemes
  - generate new temporary variables for each LLVM IR assignment statement (can only assign once)

## Motivating questions

- Once we have one function per token, how do we recognize an entire statement?
- How do make sure the input source file is valid?
- How do we generate new temporary variables?
- What parts of the generated IR output are boilerplate and which change depending on the source statement?
- How do we distinguish the two statement patterns?
- How can we use a format string to emit LLVM IR easily?

## Pseudo-code

    // one function per token
    // one function for statement
    // save lexemes
    // emit LLVM IR, filling in the template


    // true if recognized, false otherwise
    printT() {
      c = fgetc(file);
      // method #1 read in a sequence of alphabetic characters
      // malloc a buffer
      while isalpha
        add each c to the buffer
        c = fgetc(file);
      strncmp to check for print

      // method #2 read one character at a time and check
      if ('p' == c) {
      }
      c = fgetc();
      if ('r' == c) {
      } else {
       // do error handling
       return false;
      }
      'i'
      // etc..
    }

    // check for EOF
    if (EOF == c)

    // lexeme string or NULL
    numberT() {
      c = fgetc(file);
      // is it a minus sign?
      isdigit()
      ungetc(c, file)
    }

    // function for each tokens

    // whitespace


    statement() {
      // at the beginning of the file
      printT();
      // check if recognized
      OP1 = numberT();

      c = fgetc(file);
      if (c the beginning of number) {
        oplexeme = operatorT();
        // convert from simplec operator to LLVM operator, e.g., '+' "add nsw"
        OP2 = numberT();
        semicolonT();
        "\%t%d = %s i32 %s, %s", gettempvar(), operatorstring, op1, op2
        // VARNAME = OPNAME i32 OP1, OP2
        // emit LLVM instruction
        // emit the call to print
      }
      if (c a semicolon) {
        semicolon();
      }


    }

    #define NUMBER 1
    #define PRINT 2
    ...


    struct token {
      char *lexeme;
      int tokenid;
    };

    // takes a file, returns an array of tokens
    lex()
