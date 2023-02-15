#!/bin/sh


for ((i = 0; i < 10; i++)); do
	output=$(kubectl describe nodes node$i)
	echo "$output";
	first=$(wc -l < "$output")
	snd=$(grep -C 2 "Total limits may")
	echo tail -n $(($first - $snd)) $output
done;

