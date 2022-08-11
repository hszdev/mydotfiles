#!/bin/bash

# Displays all colors that can be used for PS1 prompt

color=16;

while [ $color -lt 245 ]; do
    echo -e "$color: \\033[38;5;${color}mhello\\033[48;5;${color}mworld\\033[0m"
    ((color++));
done  
