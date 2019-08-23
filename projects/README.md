# The SimpleC Compiler Project

In this project, you will be writing your own compiler for a simplified C-like language called SimpleC.  A compiler translates program written a _source language_ such as C to a _target language_, such as Intel x86 machine code.  Our compiler's source language is SimpleC, defined over the semester in five projects, and its target language the [intermediate representation](https://llvm.org/docs/LangRef.html#integer-type) (IR) of the LLVM compiler framework.  LLVM is an industry-standard compiler framework that backs the `clang` C/C++ compiler, `swift`, and several other projects.  The LLVM IR bridges the gap between source language and machine code, allowing new languages to be developed more rapidly by exploiting existing optimization and machine code generation.

__Use the virtual machine__.  To standardize the development and grading environment, we provide a Vagrant virtual machine configuration.  The included `Vagrantfile` defines a virtual machine containing the necessary libraries needed to develop your compiler.  Follow the [vagrant setup](vagrant_setup.md) directions to install Vagrant and Virtual Box.   Your project will be graded using this environment.  The virtual machine is an 64-bit x86 machine running Ubuntu 18 with LLVM v6, so those running a similar setup may not need the virtual machine.  Please verify before submitting your project.

__Requirements for grading__.  Your compiler should be written in and compiled with `gcc` C and be able to be built from root of your repository by running `make`.  It should be run by executing `./simplec program.simplec > program.ll`, where your compiler is called `simplec`, it takes a single argument, which is the name of a SimpleC source file, and it emits the resulting LLVM IR to standard out, e.g., with `printf`.  (Note that `> program.ll` means the output of the compiler is written to the file `program.ll`).  Since grading using automation, any projects that do not follow these standards for building and running may not get credit.

__Running the output of your compiler__.  One challenge to compiler development is that the compiler itself is a program that needs to be compiled.  In our case, our SimpleC compiler is written in C and compiled with the `gcc` compiler.   Once compiled, the SimpleC compiler can then take SimpleC programs and compile them.  The SimpleC compiler produces LLVM IR code, e.g., `program.ll`.  In order to execute LLVM IR, you can use the `clang` compiler: `clang -o program program.ll`.  This will produce an executable that can be run with `./program`.  There are helper scripts that you may use in [tests/](tests).

__Submitting your project__. The project should be submitted via [git](git.md) to your GitHub classroom's repository with `git tag`.  See the first homework in webcourses for setting up GitHub Classroom.  Read this [git tutorial](git.md) to see how to use git.  These are the tags for each project: `proj0`, `proj1`, `proj2`, `proj3`, `proj4`, `proj5`.

## Project Descriptions

The [grammar overview](grammar_overview.md) and [lexical specification](lexical_specification.md) provide an overview of the language specification used in each project.

- [Project 0 -- Simple Arithmetic](project0.md)

- [Project 1 -- Expressions](project1.md)

- [Project 2 -- Variables](project2.md)

- [Project 3 -- Control Flow](project3.md)

- [Project 4 -- The Function Abstraction](project4.md)

- [(Bonus) Project 5 -- Arrays](project5bonus.md)

## Important documents

- [vagrant setup](vagrant_setup.md)
- [git tutorial](git.md)
- [test cases](tests/)
- [LLVM IR template](template.ll)
- [external tutorials](tutorials.md) on git, bash, etc.
