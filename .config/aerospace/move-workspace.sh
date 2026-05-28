#!/bin/bash
offset=${1:-1}

workspaces=($(aerospace list-workspaces --all))
current=$(aerospace list-workspaces --focused)
len=${#workspaces[@]}

for i in ${!workspaces[@]}; do
    if [[ "${workspaces[$i]}" == "$current" ]]; then
        next=$(( ($i + $offset % $len + $len) % $len ))
        aerospace workspace "${workspaces[$next]}"
        exit 0
    fi
done
