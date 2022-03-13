#!/bin/bash

# Load list of droplets ID
DROPLETS=$(doctl compute droplet list --format ID,Name | grep learn_docker_sr | awk '{print $1}')

echo $DROPLETS

# Deleting all found
doctl compute droplet delete $DROPLETS -f
