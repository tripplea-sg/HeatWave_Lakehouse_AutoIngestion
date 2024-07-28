#!/bin/bash

if [ $(ps -ef | grep c_instance | grep -v grep | wc -l) -eq 0 ]; then
	echo "Instance $instance_name is already down"
else
	kill -9 $(ps -ef | grep c_instance | grep -v grep | awk '{print $2}')
	echo "Instance $instance_name is down"
fi
