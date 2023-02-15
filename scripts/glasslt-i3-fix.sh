#!/bin/bash

codeIds=(`pgrep 'code'`)

echo "codeIds: ${codeIds[@]}"

IFS=', '
windowIds=`xprop -root  |  grep '_NET_CLIENT_LIST(WINDOW)'`
windowIds=(${windowIds#*#})
echo "windowIds : ${windowIds[@]}"

pids=()
targets=()
for wid in  ${windowIds[@]}; do
  pid=`xprop -id ${wid} _NET_WM_PID`
  pid=${pid#*= }
  pids+=($pid)
  for code in ${codeIds[@]}; do
    if [[ $pid == $code ]]; then
      targets+=($wid)
    fi
  done
done

echo "pids : ${pids[@]}"

echo "targets : ${targets[@]}"

xprop -id ${targets[0]}  -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY $(( 0xffffffff * 200 / 256 ))
