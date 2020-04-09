#!/usr/bin/sh

sudo apt update
sudo apt upgrade

sudo apt install -y cmake automake autoconf zsh samba neovim
sudo systemctl start smbd.service
if [[ $? -eq 0 ]]
then
    sudo systemctl enable smbd.service
fi

# Load my configuration
mkdir repos
cd repos
git clone https://github.com/heptaliane/dotfiles.git
cd dotfiles
ln .zshrc ~/
cp -r .config/ ~/

# Install nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc
source ~/.zshrc
nvm install --lts

# Inhibit root login via ssh
cp /etc/ssh/sshd_config sshd_config
echo "PermitRootLogin no" >> sshd_config
sudo mv sshd_config /etc/ssh/sshd_config

# ===================
# Setup for TV tuner
# ===================
# TV tuner driver
wget http://plex-net.co.jp/plex/px-s1ud/PX-S1UD_driver_Ver.1.0.1.zip
unzip PX-S1UD_driver_Ver.1.0.1.zip
sudo cp PX-S1UD_driver_Ver.1.0.1/x64/amd64/isdbt_rio.inp /lib/firmware/
rm PX-S1UD_driver_Ver.1.0.1.zip
rm -rf PX-S1UD_driver_Ver.1.0.1/

# Card reader
sudo apt-get install pcscd libpcsclite-dev libccid pcsc-tools
sudo systemctl start pcscd.service
sudo systemctl enable pcscd.service

# Install libarib25
wget https://github.com/stz2012/libarib25/archive/master.zip -O libarib25.zip
unzip libarib25.zip
mkdir libarib25-master/build/
cd libarib25-master/build/
cmake ..
make
sudo make install
cd ../../
rm libarib25.zip
rm -rf libarib25-master/

# Record programs
wget http://www13.plala.or.jp/sat/recdvb/recdvb-1.3.2.tgz
tar xzf recdvb-1.3.2.tgz
cd recdvb-1.3.2/
./autogen.sh
./configure --enable-b25
EXTRA_SID=1 make
sudo make install
cd ..
rm recdvb-1.3.2.tgz
rm -rf recdvb-1.3.2/

# Setup schedular
sudo npm install -g pm2
sudo pm2 startup
sudo npm install -g --unsafe --production mirakurun
sudo npm install -g --unsafe arib-b25-stream-test

# ==========================================
# 3.5-inch raspberry pi case display driver
# ==========================================
git clone https://github.com/goodtft/LCD-show.git
chmod -R 755 LCD-show
cd LCD-show/
sudo ./MHS35-show
