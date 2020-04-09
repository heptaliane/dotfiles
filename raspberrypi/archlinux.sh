#!/usr/bin/sh

if [[ $EUID -ne 0 ]]; then
    echo 'Root required.'
    exit 1
fi

# TODO add username and password

pacman-key --init
pacman-key --populate archlinuxarm

pacman -Syu --noconfirm

pacman -S --noconfirm sudo fakeroot gcc clang cmake samba zsh git wget dpkg\
                      usbutils python python-pip vim neovim xorg

pip install neovim

# Add group wheel to sudoer
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

# Download samba configration
wget "https://git.samba.org/samba.git/?p=samba.git;a=blob_plain;f=examples/smb.conf.default;hb=HEAD" -O /etc/samba/smb.conf
systemctl start smb
if [[ $? -eq 0 ]]; then
    systemctl enable smb
fi

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

trizen -S --noconfirm nvm pcsc-tools
