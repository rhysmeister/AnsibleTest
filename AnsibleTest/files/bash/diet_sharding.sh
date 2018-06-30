#!/bin/bash
set -e;
set -u;

/home/vagrant/bash/config_mongos_server.sh;

mkdir /home/vagrant/mongo_3001;
mkdir /home/vagrant/mongo_3002;
cd;

mongod --shardsvr --smallfiles --nojournal --storageEngine wiredTiger --wiredTigerEngineConfigString="cache_size=200M" --dbpath mongo_3001 --port 3001 --replSet rs0 --logpath mongo_3001/log.log --fork;
mongod --shardsvr --smallfiles --nojournal --storageEngine wiredTiger --wiredTigerEngineConfigString="cache_size=200M" --dbpath mongo_3002 --port 3002 --replSet rs1 --logpath mongo_3002/log.log --fork;
