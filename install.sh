#!/bin/bash

# cd ~ && rm -rf .vim .vimrc .vimrc.plugged && cd -

# refer  spf13-vim bootstrap.sh`
BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`

# parse arguments
function show_help
{
    echo "install.sh [option]
    --for-vim       Install configuration files for vim, default option
    --for-neovim    Install configuration files for neovim
    --for-all       Install configuration files for vim & neovim
    --help          Show help messages
For example:
    install.sh --for-vim
    install.sh --help"
}
FOR_VIM=true
FOR_NEOVIM=false
if [ "$1" != "" ]; then
    case $1 in
        --for-vim)
            FOR_VIM=true
            FOR_NEOVIM=false
            shift
            ;;
        --for-neovim)
            FOR_NEOVIM=true
            FOR_VIM=false
            shift
            ;;
        --for-all)
            FOR_VIM=true
            FOR_NEOVIM=true
            shift
            ;;
        *)
            show_help
            exit
            ;;
    esac
fi

lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
}

# install vim from source 
# install on centos (tlinux)
# ./configure --with-features=huge --enable-python3interp --enable-pythoninterp --with-python-config-dir=/usr/lib64/python2.7/config/ --enable-rubyinterp --with-python3-config-dir=/usr/lib64/python3.6/config-3.6m-x86_64-linux-gnu/ --enable-multibyte --enable-cscope      --prefix=/usr/local/vim/


echo "Step0.1: install tmux conf "
git submodule update --init
lnif $CURRENT_DIR/tmux/.tmux.conf $HOME/.tmux.conf
lnif $CURRENT_DIR/tmux/.tmux.conf.local $HOME/.tmux.conf.local
cd tmux 
git checkout master
cd ../
mkdir -p $HOME/.tmux

echo "Step0.2: install fzf with git"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Step0.3: install universal ctags and binary"
sysOS=`uname -s`
if [ "$sysOS" = "Darwin" ];
then
    brew install --HEAD universal-ctags/universal-ctags/universal-ctags

    brew install shellcheck
    brew install nodejs
    brew install global 
    brew install ripgrep 
    brew install fd 
    brew install rust-analyzer 
    brew install yarn 
    brew install llvm
elif [ "$sysOS" = "Linux" ];
then
    mkdir -p ./tmp
    cd tmp
    git clone https://github.com/universal-ctags/ctags
    cd ctags
    ./autogen.sh
    ./configure & make 
    sudo make install 
    cd ../../
    rm -rf tmp
    echo "@finish install universal-ctags from source"
else
    echo "Other OS: $sysOS"
fi

echo "Step1: backing up current vim config"
today=`date +%Y%m%d`
if $FOR_VIM; then
    for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.vimrc.plugged; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
    for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.vimrc.plugged; do [ -L $i ] && unlink $i ; done
fi
if $FOR_NEOVIM; then
    for i in $HOME/.config/nvim $HOME/.config/nvim/init.vim; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
    for i in $HOME/.config/nvim/init.vim $HOME/.config/nvim; do [ -L $i ] && unlink $i ; done
fi

echo "Step2: setting up symlinks"
if $FOR_VIM; then
    lnif $CURRENT_DIR/vimrc $HOME/.vimrc
    lnif $CURRENT_DIR/vimrc.plugged $HOME/.vimrc.plugged
    lnif "$CURRENT_DIR/" "$HOME/.vim"
fi
if $FOR_NEOVIM; then
    lnif "$CURRENT_DIR/" "$HOME/.config/nvim"
    lnif $CURRENT_DIR/vimrc $CURRENT_DIR/init.vim
fi

echo "Step3: update/install plugins using Vim-plug"
system_shell=$SHELL
export SHELL="/bin/sh"
if $FOR_VIM; then
    vim -u $HOME/.vimrc.plugged +PlugInstall! +PlugClean! +qall
else
    nvim -u $HOME/.vimrc.plugged +PlugInstall! +PlugClean! +qall
fi
export SHELL=$system_shell

echo "install finished ^_^"

