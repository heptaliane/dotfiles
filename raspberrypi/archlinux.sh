#!/usr/bin/sh

if [[ $EUID -ne 0 ]]; then
    echo 'Root required.'
    exit 1
fi

if [[ -n $1 ]]
then
    read -p 'Username? > ' username
    read -sp 'pasword? > ' password
fi

pacman-key --init
pacman-key --populate archlinuxarm
pacman -Syu --noconfirm

# Install packages
packages=("sudo" "gcc" "clang" "fakeroot" "cmake" "zsh" "git" "wget"
          "usbutils" "python" "python-pip" "vim" "neovim" "xorg")
for i in `seq 1 ${#packages[@]}`
do
    if [[ -z `pacman -Qi ${packages[$i]} 2>&1 > /dev/null` ]]
    then
        packages[$i]=""
    fi
done
packages=(${packages[@]})
if [[ ${#packages[@]} -gt 0 ]]
then
    echo pacman -S --noconfirm ${packages[@]}
fi

# Add group wheel to sudoer
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

# Setup login user
useradd -g wheel -s /bin/zsh $username
echo $password | passwd $username
echo $password | su $username
cd

echo $password | sudo pip install neovim

# Download samba configration
sudo wget "https://git.samba.org/samba.git/?p=samba.git;a=blob_plain;f=examples/smb.conf.default;hb=HEAD" -O /etc/samba/smb.conf
sudo systemctl start smb
if [[ $? -eq 0 ]]; then
    sudo systemctl enable smb
fi

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
source ~/.zshrc

trizen -S --noconfirm nvm pcsc-tools
