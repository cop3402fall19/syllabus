# The SimpleC Compiler Project

In this project, you will be writing your own compiler for a simplified C-like language called SimpleC.  A compiler translates program written a _source language_ such as C to a _target language_, such as Intel x86 machine code.  Our compiler's source language is SimpleC, defined over the semester in five projects, and its target language the [intermediate representation](https://llvm.org/docs/LangRef.html#integer-type) (IR) of the LLVM compiler framework.  LLVM is an industry-standard compiler framework that backs the `clang` C/C++ compiler, `swift`, and several other projects.  The LLVM IR bridges the gap between source language and machine code, allowing new languages to be developed more rapidly by exploiting existing optimization and machine code generation.

## Requirements for grading

Your compiler should be written in and compiled with `gcc` C and be able to be built from root of your repository by running `make`.  You can use this [Makefile](make/Makefile) to build your project.  Your compiler should be run like this:

    ./simplec program.simplec > program.ll

where

- your compiler is called `simplec`, 
- it takes a single argument, which is the name of a SimpleC source file, and
- it emits the resulting LLVM IR to standard out, e.g., with `printf`.  (Note that `> program.ll` means the output gets redirected and written to the file `program.ll`, instead of your terminal window).

Since grading is automated, any projects that do not follow these standards for building and running may not get credit.

## Running the output of your compiler

You can run the output of your compiler like this:

    # convert the .ll file to machine code
    clang -o program program.ll
    # run the resulting binary
    ./program

One challenge to compiler development is that the compiler itself is a program that needs to be compiled.  In our case, our SimpleC compiler is written in C and compiled with the `clang` compiler.   Once compiled, the SimpleC compiler can then take SimpleC programs and compile them.  The SimpleC compiler produces LLVM IR code, e.g., `program.ll`.  In order to execute LLVM IR, you can use the `clang` compiler: `clang -o program program.ll`.  This will produce an executable that can be run with `./program`.  There are helper scripts that you may use in [tests/](tests).

__Use clang version 6__.  To standardize the development and grading environment, we provide a Vagrant virtual machine configuration.  The included `Vagrantfile` defines a virtual machine containing the necessary libraries needed to develop your compiler.  Follow the [vagrant setup](vagrant_setup.md) directions to install Vagrant and Virtual Box.   Your project will be graded using this environment.  The virtual machine is an 64-bit x86 machine running Ubuntu 18 with LLVM v6, so those running a similar setup may not need the virtual machine, e.g., those already running Linux on bare metal or Windows Subsystem for Linux.  If not using vagrant, look at the [provision.sh](provision.sh) script for the packages to install.  Please verify your project works with clang v6 before submitting your project.

## Submitting your project

The project should be submitted via [git](git.md) to your GitHub classroom's repository with `git tag`.  See the first homework in webcourses for setting up GitHub Classroom.  Read this [git tutorial](git.md) to see how to use git.  These are the tags for each project: `proj0`, `proj1`, `proj2`, `proj3`, `proj4`, `proj5`.

## Sanity check your repository

We will be cloning your project and building it with `make`.  You can sanity check your repo by cloning a fresh copy.

    # be sure you are in a clean directory that does not have your project already
    git clone https://github.com/cop3402fall19/project-USERID.git  # replacing USERID with your github user id.
    cd project-USERID  # replacing USERID with your github user id.
    make
    # run your tests

## Project Descriptions

![toolchain](https://raw.githubusercontent.com/cop3402fall19/syllabus/master/projects/toolchain.png)

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
- [Makefile](make/Makefile)
- [external tutorials](tutorials.md) on git, bash, etc.
