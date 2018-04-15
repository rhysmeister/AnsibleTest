#!/bin/bash
set -e;
set -u;

# Destroy all test mongo stuff

pkill mongod || true;
pkill mongos || true;

cd /home/vagrant;
rm -Rf mongo_*/;
rm -Rf config/;
rm -Rf mongos/;
