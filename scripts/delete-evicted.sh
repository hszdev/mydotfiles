#!/bin/sh
#set -euo pipefail # stop at error, undefined variable or pipefailure

# Force delete all pods that are in "Terminating" state.

# Read command into array with \n as delimiter
readarray -t podnames < <(kubectl get pods --all-namespaces | grep Evicted | tr -s ' ' | cut -d " " -f 2)
# Read command into array with \n as delimiter
readarray -t namespaces < <(kubectl get pods --all-namespaces | grep Evicted | tr -s ' ' | cut -d " " -f 1)
# Loop through array using the length of the array
for item in $(seq 0 ${#podnames[@]}); do
	kubectl delete pods ${podnames[$item]} --grace-period=0 --force -n ${namespaces[$item]};
done
