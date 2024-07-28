#!/bin/bash

instance_name=$(cat $PFILE | grep instance_name | sed 's/=/ /g' | awk '{print $2}')
worker_dir=$(cat $PFILE | grep worker_dir | sed 's/=/ /g' | awk '{print $2}')

x=`ps -ef | grep c_instance | grep -v grep | wc -l | awk '{print $1}'`

if [ $x -eq 0 ]; then
	echo "Starting up instance: $instance_name" 
	$worker_dir/c_instance $instance_name &
else
	echo "Instance $instance_name is running"
fi
