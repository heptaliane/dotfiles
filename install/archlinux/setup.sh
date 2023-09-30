#!/bin/bash

which trizen > /dev/null
if [ $? -eq 1 ]; then
    git clone https://aur.archlinux.org/trizen.git
    cd trizen/
    makepkg -si
fi

packages=()
while IFS= read -r line; do
    if [[ ${line} != "#"* ]] && [[ -n ${line} ]]; then
	packages+=(${line})
    fi
done < "install.txt"
trizen -S --noconfirm --needed ${packages[@]}

while IFS= read -r line; do
    if [[ ${line} != "#"* ]] && [[ -n ${line} ]]; then
	sudo systemctl enable ${line}
	sudo systemctl start ${line}
    fi
done < "service.txt"
