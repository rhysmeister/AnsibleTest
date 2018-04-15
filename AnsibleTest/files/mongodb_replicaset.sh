#!/bin/bash
set -e;
set -u;

START_PORT=$1;
REPLSET=$2;

cd /home/vagrant
mkdir -p mongo_$(($((START_PORT + 1))));
mkdir -p mongo_$(($((START_PORT + 2))));
mkdir -p mongo_$(($((START_PORT + 3))));

mongod --shardsvr --smallfiles --nojournal --storageEngine wiredTiger --wiredTigerEngineConfigString="cache_size=200M" --dbpath mongo_$((START_PORT + 1)) --port $((START_PORT + 1)) --replSet "$REPLSET" --logpath mongo_$((START_PORT + 1))/log.log --fork;
mongod --shardsvr --smallfiles --nojournal --storageEngine wiredTiger --wiredTigerEngineConfigString="cache_size=200M" --dbpath mongo_$((START_PORT + 2)) --port $((START_PORT + 2)) --replSet "$REPLSET" --logpath mongo_$((START_PORT + 2))/log.log --fork;
mongod --shardsvr --smallfiles --nojournal --storageEngine wiredTiger --wiredTigerEngineConfigString="cache_size=200M" --dbpath mongo_$((START_PORT + 3)) --port $((START_PORT + 3)) --replSet "$REPLSET" --logpath mongo_$((START_PORT + 3))/log.log --fork;
