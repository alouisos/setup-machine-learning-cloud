#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# Special thanks to coursera start up engineering course for the inspiration for this script

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/alouisos/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .

sudo apt-get install -y apache2 

sudo apt-get install -y mysql-server libapache2-mod-auth-mysql php5-mysql
sudo mysql_install_db
sudo mysql_secure_installation

rm -rf setup 
rm setup_server.sh 


# add screen to protect long octave building from sudden connection interruption. 
# if you lose connection to the server then reconnect and type screen -r to resume the screen of octave building 
wget ftp://ftp.gnu.org/gnu/octave/octave-3.8.0.tar.bz2
screen 
tar -xvf octave-3.8.0.tar.bz2
cd octave-3.8.0
sudo apt-get build-dep octave -y 
./configure
make
sudo make install

sudo apt-get install octave-statistics -y 
sudo apt-get istall octave-io -y 

#install sci-py num-py and pandas thanks to Ippei from CambridgeEnergyDataLab for the Idea 
sudo apt-get install python-numpy -y 
sudo apt-get install cython -y 
sudo apt-get install python-pandas -y



cd ~
rm octave-3.8.0.tar.bz2
