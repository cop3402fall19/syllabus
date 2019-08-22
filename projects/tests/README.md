Each project will be graded against a set of public and secret test
cases.  This directory contains the public test cases.  The test files
have the following extensions:

- `.simplec` is a source program in SimpleC.  Compile these to `.ll` files with your compiler.
- `.groundtruth` is the expected output of running the corresponding compiled `.simplec` file

The included `compile.sh` script will use your compiler to compile and save the resulting file to a `.ll` for a given test case:

    tests/compile.sh ./project-USERID/simplec tests/proj0/all.simplec
    
The included `run.sh` script can automatically take your compiler's resulting `.ll` file and run it.  The `.ll` file is itself compiled to machine using `clang` and executed.  It's output is saved to a `.out`

    tests/run.sh tests/all.ll
