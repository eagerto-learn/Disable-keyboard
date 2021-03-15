#!/bin/bash

Icon="/home/user/Pictures/keyboard_on.png"
Icoff="/home/user/Pictures/keyboard_off.png"
fconfig="/home/user/Scripts/.keyboard"

xinput list | grep AT | grep -o 'id=[0-9]*' | cut -c 4- > ~/Scripts/.keyboardcheck
keyboardcheck="/home/user/Scripts/.keyboardcheck"
id=$(cat "$keyboardcheck")

if [ ! -f $fconfig ];
	then
		echo "Creating config file"
		echo "enabled" > $fconfig
		var="enabled"
	else
		read -r var< $fconfig
		echo "keyboard is: $var"
fi

if [ $var = "disabled" ];
	then
		notify-send -i $Icon "Enabling keyboard..." \ "ON - Keyboard connected!";
		echo "enable keyboard..."
		xinput reattach $id 3
		echo "enabled" > $fconfig
	elif [ $var = "enabled" ];
	then
		notify-send -i $Icoff "Disabling keyboard..." \ "OFF - Keyboard disconnected!";
		echo "disable keyboard..."
		xinput float $id
		echo "disabled" > $fconfig
fi
