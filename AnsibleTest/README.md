Role Name
=========

An Ansible role to create a test environment for custom Ansible modules. Python version 2.6 and 3.5 and setup and you cassandra
easily switch between the two (See aliases). MongoDB and Cassandra version are installed as they are the area the role author is most interested in developing for. It should be simple enough to repurpose the role for other types of modules.

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

Role Aliases
-------------

cass2   - Kill java process and start Cassandra 2 standalone instance.
cass3   - Kill java process and start Cassandra 3 standalone instance.
py26    - Setup environment to run Ansible using Python 2.6.
py35    - Setup environment to run Ansible using Python 3.5.

License
-------

BSD

Author Information
------------------

Rhys Campbell <rhys.james.campbell@googlemail.com>
https://github.com/rhysmeister
