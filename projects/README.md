# The SimpleC Compiler Project

In this project, you will be writing your own compiler for a simplified C-like language called SimpleC.  A compiler translates program written a _source language_ such as C to a _target language_, such as Intel x86 machine code.  Our compiler's source language is SimpleC, defined over the semester in five projects, and its target language the [intermediate representation](https://llvm.org/docs/LangRef.html#integer-type) (IR) of the LLVM compiler framework.  LLVM is an industry-standard compiler framework that backs the `clang` C/C++ compiler, `swift`, and several other projects.  The LLVM IR bridges the gap between source language and machine code, allowing new languages to be developed more rapidly by exploiting existing optimization and machine code generation.

## Requirements for grading

Your compiler must

- be submitted using GitHub classrooms
- be written in C and compileable with the `clang` C compiler
- be built by running `make` from root of your repository
- produce LLVM IR compliant with clang version 6
- be executed by running

        ./simplec program.simplec > program.ll

    where

    - your compiler is called `simplec`, 
    - it takes a single argument, which is the name of a SimpleC source file, and
    - it emits the resulting LLVM IR to standard out, e.g., with `printf`.  (Note that `> program.ll` means the output gets redirected and written to the file `program.ll`, instead of your terminal window).

Since grading is automated, any projects that do not follow these standards for building and running may not get credit.

## Project descriptions

![toolchain](https://raw.githubusercontent.com/cop3402fall19/syllabus/master/projects/toolchain.png)

The [grammar overview](grammar_overview.md) and [lexical specification](lexical_specification.md) provide an overview of the language specification used in each project.

- [Project 0 -- Simple Arithmetic](project0.md)

- [Project 1 -- Expressions](project1.md)

- [Project 2 -- Variables](project2.md)

- [Project 3 -- Control Flow](project3.md)

- [Project 4 -- The Function Abstraction](project4.md)

- [(Bonus) Project 5 -- Arrays](project5bonus.md)

### Other Bonus Project Ideas

- Implement constant propagation and folding
- Add a Boolean type
- Perform dead code elimination
- Implement for loops
- Check that arithmetic and Boolean operations are not mixed
- Check that all paths of a function have a return statement
- Check for unreachable code in a function (after a return statement)

## Guide to the Command Line

This guide is for those using Ubuntu 18.04.  If you do not have this installed, you can use a virtual machine in Linux or MacOS (use VirtualBox and download an Ubuntu 18 virtual machine or use the provided [Vagrantfile](./Vagrantfile) with vagrant), or Windows Subsystem for Linux for Windows (download Ubuntu 18 from the app store).

### Setting up vagrant

Vagrant installation varies depending on your machine.  Download Vagrant here: <https://www.vagrantup.com/downloads.html>.

_WARNING_: vagrant should not be installed on windows subsystem for linux.  You can download the Ubuntu 18 app from the windows store instead and follow the directions for non-vagrant users

You will also need Virtual Box, which is the virtual machine software: <https://www.virtualbox.org>

Copy this Vagrantfile to a directory and navigate that directory on the command-line.

Run the following the setup your virtual machine (this may take while)

    vagrant up

Run the following the enter your virtual machine

    vagrant ssh
    
### Installing the required packages for non-vagrant users

(This step is not needed for vagrant users).

You will need the `git` command-line tool to manage your source code repository and `clang` and `make` to build your project and its output programs.

    sudo apt-get update
    sudo apt-get install clang llvm git make python3 python3-distutils

### Configuring `git`

Setup your name and email (use the email associated with your GitHub account).

    git config --global user.email "you@example.com"
    git config --global user.name "Your Name"
    
Set your editor for commit messages

    sudo apt-get install nano
    git config --global core.editor "nano"

### Setting up your repository

This section assumes you have completed Homework 1, in which you sign up for the project with GitHub classrooms.

First open a shell session.  For native installations of Ubuntu, navigate to the applications and select terminal or hit ctrl-alt-T.  For remote or virtual machine installations, `ssh` into the Ubuntu machine.

Go to your home directory.  Running `cd`, i.e., "change directory", goes to your home directory by default.  If you have vagrant setup, go to the mapped `/vagrant` directory (this is mapped to your host machine's syllabus/projects directory)

    cd /vagrant # for vagrant users
    cd ~/ # otherwise

Clone your GitHub classrooms repository, where USERID is your GitHub user ID.  You will need to type your GitHub user name and password.

    git clone https://github.com/cop3402fall19/project-USERID.git

If this step does not work, check the error message for a reason.  If you have not completed Homework 1 yet, then your repository will not yet exist.  Complete Homework 1 first.  If you have already cloned your repository, then there is no need to do this again.

If you get an authentication error, double-check your user name and password, as well as the URL.  Be sure to replace `USERID` in the URL with your actual GitHub ID.

### Getting the course syllabus

You should also clone the course syllabus, which will have the project's test cases.  If you already have it on your host machine, clone it again under vagrant.

Go to your home directory 

    cd

Clone the repository

    git clone https://github.com/cop3402fall19/syllabus.git

### Getting the grading scripts

Go to your home directory 

    cd

Clone the repository

    git clone https://github.com/cop3402fall19/grader-scripts.git

#### Updating your copies of the syllabus and grader-scripts

Go to your local clone and pull

    cd ~/syllabus
    git pull
    cd ~/grader-scripts
    git pull

### File system structure

If you are using vagrant, you should have these directories:

    /vagrant/project-USERID
    /home/vagrant/syllabus
    /home/vagrant/grader-scripts

Otherwise you should have these:

    /home/USER/project-USERID
    /home/USER/syllabus
    /home/USER/grader-scripts

You can view these with `ls`, where `~/` is special syntax for referring to your home directory.

    ls ~/

### Setting up your project Makefile

Your project needs a Makefile for automatic grading.  This will allow your software to be built by running `make` at the root of your project.  The provided Makefile will compile and link all .c files in the root of your project repository and produce an executable called `simplec`.  The names of your .c files are irrelevant.

First go to your repo.

    cd /vagrant/project-USERID # for vagrant users
    cd ~/project-USERID # otherwise

Copy the provided Makefile into your source code repository.

    cp ~/syllabus/projects/make/Makefile ./

Commit the Makefile to your repository.  A commit saves changes to the source repository in a log.

    git add Makefile
    git commit Makefile

`git commit` will open an editor.  Enter a message at the top describing the change.  Exit using `ctrl-x`, then hit `y` to confirm saving, and finally hit the `enter` key to confirm the file name.

### Adding your source code

Create your C source code

    touch simplec.c

Then add it to the repository

    git add simplec.c
    git commit simplec.c

`git commit` will open an editor.  Enter a message at the top describing the change.  Exit using `ctrl-x`, then hit `y` to confirm saving, and finally hit the `enter` key to confirm the file name.

### Syncing your changes with GitHub

At this point, all changes have been logged only to your local repository and will not be visible on GitHub.  You can view the status of your repository like this:

    git status

At the top, it will tell you that your local version is ahead of the remote repository call "origin".

Synced the local copy of the repository with the remote GitHub repository.

    git push

Type your GitHub user name and password to complete the push.

### Saving changes to your source code

As you program, periodically commit these changes to your local repository and sync them to GitHub.  Ideally, commits record a log of well-defined, incremental changes to your software, but for now, think of commiting as "saving" your changes and pushing as "backing up" your software.  To "save", use a commit

    git commit simplec.c

`git commit` will open an editor.  Enter a message at the top describing the change.  Exit using `ctrl-x`, then hit `y` to confirm saving, and finally hit the `enter` key to confirm the file name.

"Back up" to GitHub

    git push

Type your GitHub user name and password to complete the push.

### Running your compiler

Every time you make changes to your source code, run `make` to recompile it.

    make

Your compiler is required to take the name of its input file as a command-line argument and then write its output to standard out.  Standard out will be your terminal window by default.

Run your project like this

    ./simplec ~/syllabus/projects/tests/proj0/all.simplec

This should take the `all.simplec` test file and print the resulting LLVM IR to your terminal window.

### Running the output of your compiler

Recall that your program is a compiler that takes a SimpleC program and produces an equivalent LLVM IR program.  To test the output program, convert the LLVM IR to machine code like this:

    ./simplec ~/syllabus/projects/tests/proj0/all.simplec > /tmp/all.ll

The `> /tmp/all.ll` means the output will be written, i.e., redirected, to the `all.ll` file in the `/tmp` directory and will not show up in your terminal window.  You can quickly view the contents of this file with `cat`

    cat /tmp/all.ll

Since the output of your compiler is LLVM IR, you need to first convert it to machine code in order to run the output program.  

    clang -o /tmp/all /tmp/all.ll  # convert to machine code
    /tmp/all # run the program

All test cases given in the syllabus are paired with a corresponding file that contains the expected output of the SimpleC program.  You can view this with `cat`

    cat ~/syllabus/projects/tests/proj0/all.groundtruth

You can automatically compare the ground truth output with the output your compiled program produces using `diff`.

    /tmp/all > /tmp/all.out  # save the output to all.out
    diff ~/syllabus/projects/tests/proj0/all.groundtruth /tmp/all.out

The complete set of instructions to compile and run a SimpleC program using your compiler is this

    ./simplec ~/syllabus/projects/tests/proj0/all.simplec > /tmp/all.ll
    clang -o /tmp/all /tmp/all.ll
    /tmp/all > /tmp/all.out
    diff ~/syllabus/projects/tests/proj0/all.groundtruth /tmp/all.out

If the final `diff` showed no differences or no errors, that means your compiler worked correctly on that specific test case.

### Run the Grader Script for all test cases

Go to your project's local clone, replacing USERID with your GitHub ID.

    cd /vagrant/project-USERID # for vagrant users
    cd ~/project-USERID # otherwise

Be sure to first clear out any stale output from prior runs (change proj to the project you want to clear)

    proj=proj3; rm -f ~/syllabus/projects/tests/$proj/*.{out,err,ll} $(ls ~/syllabus/projects/tests/$proj/ | grep -v "\.");

Run the grader script, which takes the path to your repository (`./` in this case) and the path to the test programs.

    python3 ~/grader-scripts/testcasesScript.py ./ ~/syllabus/projects/tests/proj0/

Your output will look something like this

    # the following are all the commands run by this test script.  you can cut-and-paste them to run them by hand.
    # building your simplec compiler
    make

    # TESTING ../syllabus/projects/tests/proj0/all.simplec
    /home/paul/research/teaching/cop3402fall19/grader-scripts/compile.sh ./simplec ../syllabus/projects/tests/proj0/all.simplec
    # PASSED
    /home/paul/research/teaching/cop3402fall19/grader-scripts/run.sh ../syllabus/projects/tests/proj0/all.ll
    # PASSED

    # TESTING ../syllabus/projects/tests/proj0/sub.simplec
    /home/paul/research/teaching/cop3402fall19/grader-scripts/compile.sh ./simplec ../syllabus/projects/tests/proj0/sub.simplec
    # PASSED
    /home/paul/research/teaching/cop3402fall19/grader-scripts/run.sh ../syllabus/projects/tests/proj0/sub.ll
    # ERROR run.sh failed on ../syllabus/projects/tests/proj0/sub.ll

If any stage of the testing fails, you will get a `ERROR` message.
Each line (that doesn't start with `#`) is the actual command run by
the test script.  You can copy and paste this into your command-line
to try running it yourself for debugging.

### Using the provided `compile.sh` and `test.sh` scripts

The individual parts of the grading scripts can also be performed
using the included helper scripts.  Begin in your repo, replacing
USERID with your GitHub ID.

    cd /vagrant/project-USERID # for vagrant users
    cd ~/project-USERID # otherwise

This will use your `simplec` program to compile a SimpleC program to LLVM IR.

    ~/grader-scripts/compile.sh project-USERID/simplec ~/syllabus/projects/tests/proj0/all.simplec 

The output will be in `all.ll` in the same path as the `all.simplec`.

    ~/grader-scripts/run.sh ~/syllabus/projects/tests/proj0/all.ll
    
The output will be in `all.out` in the same path as the `all.simplec`.  `run.sh` will automatically compare `all.out` to `all.groundtruth` if available.

### Testing a particular version of your project

Go to your project's local clone, replacing USERID with your GitHub ID.

    cd /vagrant/project-USERID # for vagrant users
    cd ~/project-USERID # otherwise

Use `git checkout` to get a specific version, e.g., project 0.
    
    git checkout proj0

Then run the grader scripts as above

Don't forget to return to your latest source when done

    git checkout master

### Submitting your project

Because you have been logging all changes to your source and syncing these changes to the GitHub copy of your repository, there is no need to package and send your software via webcourses or email.  The GitHub version of your repository is accessible to the course instructors and graders.

You will use git's ability to "tag", i.e., mark, a specific point in the history of changes to the software in order to submit it for grading.  In practice, git's tags are used to release a new version of the software while still allowing continuous develop on the same repository.  New commits can be added to the log, while prior versions can always be accessed using the tag.

For this course, we give you a well-defined tag name for each project submission

| Project | Tag   |
|---------|-------|
| 0       | proj0 |
| 1       | proj1 |
| 2       | proj2 |
| 3       | proj3 |
| 4       | proj4 |
| 5       | proj5 |

Before proceeding, be sure you do not have any uncommitted changes to your source code.  Checking the `status` will tell you whether there are any untracked files or uncommitted file modifications.

    git status

If there are changes, commit and push them first

    git commit simplec.c
    git push

Type your GitHub user name and password to complete the push.

Once you have committed and pushed all changes to your source code, tag the commit

    git tag proj0

(Note that this does not tag any particular file, but the current version of the software, including any previously committed changes.)

If git complains that you already have a tag, then see the section below on resubmitting your project.

Use this special version of the push command to sync the tag to the GitHub copy of your repository.

    git push --tags

Type your GitHub user name and password to complete the push.

### To verify your submission

View your project on GitHub by visiting its URL, replacing USERID with your GitHub ID.

    https://github.com/cop3402fall19/project-USERID

Above the directory listing, you should see a link to "Releases".  Click that link.  You can also go directly to the releases URL for your project (replacing USERID with your GitHub ID).

    https://github.com/cop3402fall19/project-USERID/releases

This will show you the list of releases.  Ensure that your tag name is listed and that it is spelled correctly.  If there are no releases, then you have not completed the tagging process.  Double-check that you followed all the directions in the section above on submitting your project.

You can view the tagged version of the repository by clicking on the random-looking string of seven characters beneath the tag name.  This will take you to a diff of the latest commit from that version of the source code.  Click "Browse Files" on the right to browse the tagged version of the source code.

You can also view the source code from your repo's homepage by clicking the drop down just above the file listing, selecting tags, then selecting the tag you want to view.

### Resubmitting your project

If you would like to resubmit your project for grading, you can retag it.  _Note that retagging after the deadline will be considered a late submission per the grading scheme on the syllabus._

The tagging process is the same, but you need to add the `-f` flag in order to force git to apply and push the new tag.

Use `-f` to force the new tag.

    git tag -f proj0

Use `-f` to force GitHub to accept to new tag.
    
    git push -f --tags

### Sanity check your repository

We will be cloning your project and building it with `make`.  You can sanity check your repo by cloning a fresh copy.

    git clone https://github.com/cop3402fall19/project-USERID.git /tmp/test-project
    cd /tmp/test-project
    git checkout proj0  # use the appropriate tag for the project
    make
    # run tests
    cd
    rm -rf /tmp/test-project # this will destroy the temporary copy, so do not put anything important in here
