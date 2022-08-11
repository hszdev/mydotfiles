#!/bin/bash

while true;
do
	declare -i data=$((20 + $RANDOM));
	curl -X POST -H "Content-Type: application/json" -d '{"data": 20}' http://localhost:5000/api/dataset/618f1db286d5d561c3529005/add_data;
	sleep 10;
done
