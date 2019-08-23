## Using Vagrant for Your Project

### Vagrant Setup

Vagrant installation varies depending on your machine.  Download Vagrant here: <https://www.vagrantup.com/downloads.html>

You will also need Virtual Box, which is the virtual machine software: <https://www.virtualbox.org>

### Creating the Virtual Machine

Be sure that you are in the directory that contains the courses `Vagrantfile` (it is the same directory as this guide, `syllabus/projects`).

    cd syllabus/projects # if you are not here already

Creat the virtual machine

    vagrant up
    
This will download and provision the virtual machine.  The `provision.sh` script installs the necessary packages for your project.

### Using the Virtual Machine

To use the virtual machine (from the directory containing the `Vagrantfile`), ssh in

    vagrant ssh
    
You should see a command prompt
    
    vagrant@ubuntu-bionic:~$

You are now using the virtual machine.  It is a Linux-based operating system.  For more information on using the command-line, please see the links in the [tutorials](tutorials.md).

Once in the virtual machine, you can clone your git project's repository.  The directory containing the `Vagrantfile` is mapped to `/vagrant` so that you can access the compiler test files.  The virtual machine only provides a command-line interface, so you can clone your repository in `/vagrant/ in order to edit your project on your host machine.  Then compiler and run it in the virtual machine.

### More Commands

If at some point `provision.sh` is updated by the instructor, re-provision with

    # only if provision.sh has changed
    vagrant provision
    
To stop the machine use

    sudo shutdown -hP now # from the guest
    vagrant halt  # from the host

To destroy and recreate the machine use the following. WARNING: you may lose any unsaved data in the machine.  Be sure to push any changes to your project repo.

    # WARNING: be sure you have saved any data from the virtual machine
    vagrant destroy

### Troubleshooting

Please ask for more help from faculty and students, e.g., on Piazza if you are stuck on getting the virtual machine running.
