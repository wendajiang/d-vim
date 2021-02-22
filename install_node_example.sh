#!/bin/bash

#example install node from bin archive
# url from https://github.com/nodejs/help/wiki/Installation

wget https://nodejs.org/dist/v10.16.0/node-v10.16.0-linux-x64.tar.xz
VERSION=v10.16.0 DISTRO=linux-x64
sudo mkdir -p /usr/local/lib/nodejs
sudo tar -xJvf node-$VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs

# add env to .zshrc as follow##
##VERSION=v10.16.0
##DISTRO=linux-x64
##export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH