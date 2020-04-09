#!/usr/bin/sh

if [[ $EUID -ne 0 ]]; then
    echo 'Root required.'
    exit 1
fi

if [[ -z $1 ]]
then
    read -p 'Username? > ' username
    read -sp 'Password? > ' password
fi

pacman-key --init
pacman-key --populate archlinuxarm
pacman -Syu --noconfirm

# Install packages
packages=("sudo" "gcc" "clang" "fakeroot" "make" "cmake" "zsh" "git" "wget"
          "usbutils" "python" "python-pip" "vim" "neovim" "xorg" "xorg-drivers")
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
    pacman -S --noconfirm ${packages[@]}
fi

# Add group wheel to sudoer
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

# Setup login user
useradd -g wheel -s /bin/zsh $username
echo "$username:$password" | chpasswd
su $username
cd

# Download samba configration
sudo wget "https://git.samba.org/samba.git/?p=samba.git;a=blob_plain;f=examples/smb.conf.default;hb=HEAD" -O /etc/samba/smb.conf
sudo systemctl start smb
if [[ $? -eq 0 ]]; then
    sudo systemctl enable smb
fi

# Install trizen
git clone https://aur.archlinux.org/trizen.git
cd trizen
makepkg -si --noconfirm
cd ../
rm -rf trizen/

# Load my configuration
mkdir repos
cd repos
git clone https://github.com/heptaliane/dotfiles.git
cd dotfiles
ln .zshrc ~/
cp -r .config/ ~/

trizen -S --noconfirm nvm
source ~/.zshrc

# Setup for TV tuner
trizen -S --noconfirm ccid pcsc-tools pt3_drv-dkms-git
sudo modprobe -r earth-pt3
sudo echo "blacklist earth-pt3" >> /etc/modprobe.d/earth-pt3.conf
sudo modprobe pt3_drv
nvm install --lts

# Install arib25
git clone https://github.com/stz2012/libarib25.git
mkdir libarib25/build/
cd libarib25/build/
cmake ..
make
sudo make install
cd ../../
rm -rf libarib25/

# Install recpt1
git clone https://github.com/epgdatacapbon/recpt1.git
cd recpt1/recpt1/
./autogen.sh
./configure --enable-b25
make
sudo make install

# Install mirakurun
sudo npm install -g pm2
sudo pm2 startup
sudo npm install -g --unsafe --production mirakurun
sudo npm install -g --unsafe arib-b25-stream-test

sudo pip install neovim
