#!/bin/bash

xinput list | grep AT | grep -o 'id=[0-9]*' | cut -c 4- > ~/Scripts/.keyboardcheck
keyboardcheck="/home/user/Scripts/.keyboardcheck"
id=$(cat "$keyboardcheck")

xinput float $id
