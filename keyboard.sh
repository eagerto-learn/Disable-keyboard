#!/bin/bash

id=$(xinput list | grep AT | grep -o 'id=[0-9]*' | cut -c 4-)

xinput float $id
