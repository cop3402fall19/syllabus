# Git Basics

## Setting up GitHub Clasrooms

First complete HW 1 in Webcourses to setup your GitHub classroom's repositories.

## Getting the Syllabus

Do one of the following:

1. Clone the syllabus (this will not be possible if your host machine does not have git)

        git clone https://github.com/cop3402fall19/syllabus.git

2. Download the syllabus zipfile from GitHub and unzip it

        https://github.com/cop3402fall19/syllabus/archive/master.zip

    
## Setting Up Your Repository

Change directory to the projects directory wherever you downloaded the syllabus.

    cd syllabus/projects
    
Then from this directory enter the virtual machine

    vagrant ssh
    
Once in the VM, run

    cd /vagrant
    
to access the projects folder.

(Note that if you are not using vagrant, you do not need to clone your repository in the projects directory.)
    
Then clone your project repo (_you must first setup GitHub Classrooms by completing homework 1_)

    git clone https://github.com/cop3402fall19/project-USERID.git  # or use git@github.com:cop3402fall19/project-USERID.git

Change directory to your project directory

    cd project-USERID

## `git config`

Setup your name and email (use the email associated with your GitHub account).

    git config --global user.email "you@example.com"
    git config --global user.name "Your Name"
    
Set your editor for commit messages

    git config --global core.editor "
    "

For vagrant users, `nano` should already be installed.  Confirm this is the case for your installation by typing `nano`.  `ctrl-x` will escape.  If `nano` is not found, run the following to install it.

    sudo apt-get install nano

## Basic `git` Commands

Make some changes to a file

    echo "test" >> README.md
    
Check the status of the repository.  You should see that `README.md` has changed

    git status
    
Use the following to see the changes (`q` to quit)

    git diff
    
Commit the changes to the file

    git commit README.md

Add a message describe the change to the editor that appears.  Save and exit the editor.  For the `nano` editor, exit using `ctrl-x`, then hit `y` to confirm saving, and finally hit `<enter>` to confirm the file name.

Check the status of the repository.  You should see that there are no local changes, but you are out of sync with the remote repo

    git status

To save your changes on the remote repo

    git push
    
Check the status of the repository again.

    git status
    
To add a new file do

    echo "my new file" > test
    git status
    git add test
    git status
    git commit test
    
Then push as before to sync with GitHub

    git push
    
To remove a file

    git rm test
    git status
    git commit test
    git status

Then push as before to sync with GitHub

    git push
    
(Only if you are working on multiple machines.)  If you need to update your local repo

    git pull

## Submitting Your Project

You will submit your project using tags.  _Be sure to first commit any changes you have pending_.

Check for any pending changes first

    git status
    
Commit any pending changes

    git commit file1 file2 etc
    
Tag the commit

    git tag test_tag
    
Check the log to see the new tag (`q` to quit)

    git log
    
Push the tag to GitHub

    git push --tags

Double-check that your tag is visible on GitHub.  <https://github.com/cop3402fall19/project-USERID/tags>, where USERID is your GitHub ID.  This is how we will know you have submitted your project.


Use these tags for each project:

| Project | Tag   |
|---------|-------|
| 0       | proj0 |
| 1       | proj1 |
| 2       | proj2 |
| 3       | proj3 |
| 4       | proj4 |
| 5       | proj5 |


## Resubmitting a Project

If you would like to resubmit your project for grading, you can retag it.  _Note that retagging after the deadline will be considered a late submission per the grading scheme on the syllabus._

Double-check that there are not any pending changes

    git status
    
git will complain about an existing tag, so use `-f` to force it

    git tag -f proj0

Similarly, use `-f` when pushing the tag to force GitHub to accept it
    
    git push -f --tags
