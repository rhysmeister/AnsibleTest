#!/bin/bash
set -e;
set -u;

START_PORT=$1;
REPLSET=$2;

cd /home/vagrant
mkdir -p mongo_$((START_PORT + 1));
mkdir -p mongo_$((START_PORT + 2));
mkdir -p mongo_$((START_PORT + 3));

mongod --shardsvr --smallfiles --nojournal --storageEngine wiredTiger --wiredTigerEngineConfigString="cache_size=200M" --dbpath mongo_$((START_PORT + 1)) --port $((START_PORT + 1)) --replSet "$REPLSET" --logpath mongo_$((START_PORT + 1))/log.log --fork;
mongod --shardsvr --smallfiles --nojournal --storageEngine wiredTiger --wiredTigerEngineConfigString="cache_size=200M" --dbpath mongo_$((START_PORT + 2)) --port $((START_PORT + 2)) --replSet "$REPLSET" --logpath mongo_$((START_PORT + 2))/log.log --fork;
mongod --shardsvr --smallfiles --nojournal --storageEngine wiredTiger --wiredTigerEngineConfigString="cache_size=200M" --dbpath mongo_$((START_PORT + 3)) --port $((START_PORT + 3)) --replSet "$REPLSET" --logpath mongo_$((START_PORT + 3))/log.log --fork;

mongo --port $((START_PORT + 1)) << EOF
  rs.initiate();
EOF

sleep 10;

mongo --port $((START_PORT + 1)) << EOF
rs.add("localhost:$((START_PORT + 2))");
rs.add("localhost:$((START_PORT + 3))");
EOF

sleep 10;

mongo admin --port $((START_PORT + 1)) << EOF
db.createUser({user:"admin",pwd:"secret", roles:[{role:"root",db:"admin"}]})
EOF

mongo admin --port $((START_PORT + 1)) << EOF
db.shutdownServer()
EOF
mongo admin --port $((START_PORT + 2)) << EOF
db.shutdownServer()
EOF
mongo admin --port $((START_PORT + 3)) << EOF
db.shutdownServer()
EOF

echo "randomlongstring" > mongo.key;
chmod 600 mongo.key;

mongod --auth --keyFile mongo.key --shardsvr --smallfiles --nojournal --storageEngine wiredTiger --wiredTigerEngineConfigString="cache_size=200M" --dbpath mongo_$((START_PORT + 1)) --port $((START_PORT + 1)) --replSet "$REPLSET" --logpath mongo_$((START_PORT + 1))/log.log --fork;
mongod --auth --keyFile mongo.key --shardsvr --smallfiles --nojournal --storageEngine wiredTiger --wiredTigerEngineConfigString="cache_size=200M" --dbpath mongo_$((START_PORT + 2)) --port $((START_PORT + 2)) --replSet "$REPLSET" --logpath mongo_$((START_PORT + 2))/log.log --fork;
mongod --auth --keyFile mongo.key --shardsvr --smallfiles --nojournal --storageEngine wiredTiger --wiredTigerEngineConfigString="cache_size=200M" --dbpath mongo_$((START_PORT + 3)) --port $((START_PORT + 3)) --replSet "$REPLSET" --logpath mongo_$((START_PORT + 3))/log.log --fork;
