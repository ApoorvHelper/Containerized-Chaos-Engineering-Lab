#!/bin/bash

check=$(cat hosts.txt)
comp="Alive"

#echo "$check"
if [[ "$check" == "$comp" ]]; then
    echo "The machine is alive"
else
        echo "The machine is not alive |Dead|Unreachable|"
fi
