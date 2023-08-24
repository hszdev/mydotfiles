#!/bin/sh

if [ "$CODE_MODE" = "1" ]; then
    export CODE_MODE="0"
    setxkbmap -layout dk -option
    echo "CODE MODE DEACTIVATED"
else 
    export CODE_MODE="1"
    setxkbmap -option caps:swapescape -layout us
    echo "CODE MODE ACTIVE"
fi
