#!/bin/bash

#run this after fluo init

accumulo shell -u root -p secret -e 'config -t stress -s table.balancer=accumulo.balancer.StressBalancer'

