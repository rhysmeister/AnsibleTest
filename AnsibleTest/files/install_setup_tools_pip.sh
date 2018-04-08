#!/bin/bash
set -e;
set -u;
wget https://raw.githubusercontent.com/pypa/setuptools/bootstrap/ez_setup.py;
/usr/local/bin/python2.6 ez_setup.py;
/usr/local/bin/python3.5 ez_setup.py;
/usr/local/bin/easy_install-2.6 pip;
/usr/local/bin/easy_install-3.5 pip;
/usr/local/bin/pip2.6 install virtualenv==1.9;
/usr/local/bin/pip3.5 install virtualenv;
/usr/local/bin/virtualenv2.6 py26env;
/usr/local/bin/virtualenv3.5 py35env;
rm ez_setup.py;
rm setuptools*
touch /home/vagrant/py_setuptools_pip.success;
