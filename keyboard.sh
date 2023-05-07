#!/bin/bash

id=$(xinput list | grep AT | grep -o 'id=[0-9]*' | cut -c 4-)
status=$(xinput list | grep AT | grep -o floating)

if [ "$status" = "floating" ]
	then 
		notify-send "Enabling keyboard..." \ "ON - Keyboard connected!";
		echo "enabling keyboard..."
		xinput reattach $id 3
		echo "enabled"
	elif [ -z $status ]
	then
		notify-send "Disabling keyboard..." \ "OFF - Keyboard disconnected!";
		echo "disabling keyboard..."
		xinput float $id
		echo "disabled"
fi
