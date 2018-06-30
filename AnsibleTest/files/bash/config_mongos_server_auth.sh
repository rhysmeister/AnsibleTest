#!/bin/bash
set -e;
set -u;

cd /home/vagrant;
# config server
mkdir -p config/;

echo "randomlongstring" > mongo.key;
chmod 600 mongo.key;

mongod  --auth --keyFile mongo.key --configsvr --replSet config --dbpath config/ --port 2999 --logpath config/log.log --fork;
# init the config server replset
mongo --port 2999 << EOF
  rs.initiate();
EOF

sleep 5;

mongo admin --port 2999 << EOF
db.createUser({user:"admin",pwd:"secret", roles:[{role:"root",db:"admin"}]})
EOF

# mongos server
mkdir -p mongos/;
mongos --keyFile mongo.key --configdb config/localhost:2999 --logpath mongos/log.log --fork;
