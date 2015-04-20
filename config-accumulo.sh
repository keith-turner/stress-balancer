#!/bin/bash

#run this after fluo init

FLUO_PROPS=$1

function echo_prop() {
  prop=$1
  echo "`grep $prop $FLUO_PROPS | cut -d = -f 2- | grep -v $prop`"
}

ACCUMULO_USER=`echo_prop io.fluo.client.accumulo.user`
ACCUMULO_PASS=`echo_prop io.fluo.client.accumulo.password`
ACCUMULO_TABLE=`echo_prop io.fluo.client.application.name`

accumulo shell -u $ACCUMULO_USER -p $ACCUMULO_PASS -e "config -t $ACCUMULO_TABLE -s table.balancer=accumulo.balancer.StressBalancer"

