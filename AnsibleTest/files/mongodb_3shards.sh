#!/bin/bash
set -e;
set -u;

/home/vagrant/bash/config_mongos_server.sh;

/home/vagrant/bash/mongodb_replicaset.sh 3000 rs0;
/home/vagrant/bash/mongodb_replicaset.sh 3003 rs1;
/home/vagrant/bash/mongodb_replicaset.sh 3006 rs2;
