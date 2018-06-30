#!/bin/bash
set -e;
set -u;

cd /home/vagrant;
# config server
mkdir -p config/;
mongod --configsvr --replSet config --dbpath config/ --port 2999 --logpath config/log.log --fork;
# init the config server replset
mongo --port 2999 << EOF
  rs.initiate();
EOF

sleep 5;

# mongos server
mkdir -p mongos/;
mongos --configdb config/localhost:2999 --logpath mongos/log.log --fork;
