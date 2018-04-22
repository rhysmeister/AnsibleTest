# AnsibleTest
An environment to test Ansible modules based on the following guidelines; http://docs.ansible.com/ansible/latest/dev_guide/developing_modules.html

This VM will setup an environment that makes it simple to switch between Python versions 2.6 and 3.5 and work with the version of Ansible you have forked to develop your own custom modules.

# Requirements

```
ansible 2.4.3.0
Vagrant 2.0.2
Virtualbox 5.2.6
```

# Getting started

```Bash
git clone https://github.com/rhysmeister/AnsibleTest.git
cd AnsibleTest
vagrant up
```

Then you can login to the environment;

```Bash
vagrant ssh
```

# Python Virtual Environments

Python 2.6 and 3.5 environments are provided. They can be activated as follows...

```Bash
cd /home/vagrant
source py26env/bin/activate
source py35env/bin/activate
```

Both of these have been aliased in the .bash_profile for the vagrant user as follows;

```Bash
py26
py35
```

This aliases also do some additional things to setup the Ansible environment.

# Ansible Git Repository

By default the Ansible git Repository cloned is https://github.com/rhysmeister/ansible.git

Change this in vars/main.yml file if desired.
