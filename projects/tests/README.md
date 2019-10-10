Each project will be graded against a set of public and secret test
cases.  This directory contains the public test cases.  The test files
have the following extensions:

- `.simplec` is a source program in SimpleC.  Compile these to `.ll` files with your compiler.
- `.groundtruth` is the expected output of running the corresponding compiled `.simplec` file
- `.in` is corresponding input file for a test, if needed for the test
- `.groundtrutherr` is the corresondping error output for a test, if needed for the test

Please find scripts for automatically running tests here: <https://github.com/cop3402fall19/grader-scripts/>
