#!/bin/bash

# read input
read -p 'Enter the service name: ' service_name

service_name="${service_name}.service"

# store the output of the command in a variable
services=$(systemctl list-units --type=service --all)

# for loop
for service in $(echo "$services" | awk '{print $1}')
do
	if [[ $service == $service_name ]]; then
		echo "$services" | awk -v service="$service" '$1 == service {print $3}'
	fi
done
