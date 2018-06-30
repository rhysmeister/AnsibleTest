#!/bin/bash
set -e;
set -u;

/home/vagrant/bash/config_mongos_server.sh;

mkdir /home/vagrant/mongo_3001;
mkdir /home/vagrant/mongo_3002;
cd;

echo "randomlongstring" > mongo.key;
chmod 600 mongo.key;

mongod --auth --keyFile mongo.key --shardsvr --smallfiles --nojournal --storageEngine wiredTiger --wiredTigerEngineConfigString="cache_size=200M" --dbpath mongo_3001 --port 3001 --replSet rs0 --logpath mongo_3001/log.log --fork;
mongod --auth --keyFile mongo.key --shardsvr --smallfiles --nojournal --storageEngine wiredTiger --wiredTigerEngineConfigString="cache_size=200M" --dbpath mongo_3002 --port 3002 --replSet rs1 --logpath mongo_3002/log.log --fork;

sleep 10;

mongo admin --port 3001 << EOF
  rs.initiate();
EOF

mongo admin --port 3002 << EOF
  rs.initiate();
EOF

sleep 10;

mongo admin --port 3001 << EOF
db.createUser({user:"admin",pwd:"secret", roles:[{role:"root",db:"admin"}]})
EOF

mongo admin --port 3002 << EOF
db.createUser({user:"admin",pwd:"secret", roles:[{role:"root",db:"admin"}]})
EOF
