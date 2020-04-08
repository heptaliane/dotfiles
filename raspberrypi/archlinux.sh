#!/usr/bin/sh

if [[ $EUID -ne 0 ]]; then
    echo 'Root required.'
    exit 1
fi

pacman-key --init
pacman-key --populate archlinuxarm

pacman -Syu --noconfirm

pacman -S --noconfirm sudo cmake samba zsh git neovim python python-pip
pip install neovim

exit

git clone https://aur.archlinux.org/trizen.git
cd trizen
makepkg -si --noconfirm
cd ../
rm -rf trizen/

mkdir repos
cd repos
git clone https://github.com/heptaliane/dotfiles.git
cd dotfiles
ln .zshrc ~/
cp -r .config/ ~/

trizen -S nvm pcsc-utils
