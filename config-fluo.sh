#!/bin/bash

#run this script before initializing fluo

FLUO_PROPS=$1

mvn package

hadoop fs -copyFromLocal target/stress-balancer-0.0.1-SNAPSHOT.jar /fluo/lib

if ! grep -q stress-balancer $FLUO_PROPS
then
  sed -i 's/io.fluo.admin.accumulo.classpath=\(.*\)/io.fluo.admin.accumulo.classpath=\1,\${io.fluo.admin.hdfs.root}\/fluo\/lib\/stress-balancer-0.0.1-SNAPSHOT.jar/' $FLUO_PROPS
fi

