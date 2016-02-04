#!/usr/bin/env bash

VHOME=/home/vagrant
OPT=$VHOME/opt
PROJECT_HOME=$VHOME/sites/reactjs
NODE_HOME=$OPT/nodejs/bin
NODE_MODULE=$PROJECT_HOME/node_modules

echo "Creating Dirs"
mkdir -p ${PROJECT_HOME}
sudo apt-get update
#echo "Upgrading system"
#sudo apt-get update && sudo apt-get dist-upgrade -y

echo "Installing programs"
sudo apt-get install vim git git-core g++ wget unzip -y

mkdir ${OPT}
cd ${OPT}

echo "Downloading node and npm"
cd ${OPT} && wget https://nodejs.org/dist/v5.5.0/node-v5.5.0-linux-x64.tar.xz && tar xf node-v5.5.0-linux-x64.tar.xz
sudo rm -rf ${OPT}/node-v5.5.0-linux-x64.tar.xz
mv ${OPT}/node-v5.5.0-linux-x64 ${OPT}/nodejs
sudo echo "PATH=\$PATH:$VHOME/opt/nodejs/bin/" | tee -a /etc/bash.bashrc

sudo chown -R vagrant:vagrant ${OPT}

cd ${PROJECT_HOME} && ${NODE_HOME}/npm install && ./node_modules/.bin/webpack
