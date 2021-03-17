#!/bin/bash

lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
}

CURRENT_DIR=`pwd` 
git submodule update --init

# echo "install tmux conf "
rm -f $HOME/.tmux.conf
rm -f $HOME/.tmux.conf.local
lnif $CURRENT_DIR/tmux/.tmux.conf $HOME/.tmux.conf
lnif $CURRENT_DIR/tmux/.tmux.conf.local $HOME/.tmux.conf.local
cd tmux
git checkout master
cd ../
echo "install tmux conf complete"

