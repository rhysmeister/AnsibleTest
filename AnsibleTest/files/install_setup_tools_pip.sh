#!/bin/bash
set -e;
set -u;
wget https://bootstrap.pypa.io/get-pip.py
wget https://bootstrap.pypa.io/2.6/get-pip.py -O get-pip2.6.py
/usr/local/bin/python2.6 get-pip2.6.py;
/usr/local/bin/python3.5 get-pip.py;
/usr/local/bin/pip2.6 install virtualenv pymongo;
/usr/local/bin/pip3.5 install virtualenv pymongo;
/usr/local/bin/virtualenv --python=/usr/local/bin/python2.6 py26env;
/usr/local/bin/virtualenv --python=/usr/local/bin/python3.5 py35env;
chown vagrant:vagrant /home/vagrant/py26env;
chown vagrant:vagrant /home/vagrant/py35env;
rm get-pip2.6.py;
rm get-pip.py;
PS1='\s-\v\$';
source /home/vagrant/py26env/bin/activate;
pip install pymongo;
source /home/vagrant/py35env/bin/activate;
pip install pymongo;
touch /home/vagrant/py_setuptools_pip.success;
