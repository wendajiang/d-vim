#!/bin/bash

# cp zshrc to ~/.zshrc
mv ~/.zshrc ~/.zshrc.bak
cp ./zshrc ~/.zshrc

# 安装oh-my-zsh到 ~/.oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install autojump
sysOS=`uname -s`
if [ $sysOS == "Darwin" ];then
	# macos
    brew install autojump
    echo '[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh' >> ~/.zshrc
    echo 'source $ZSH/oh-my-zsh.sh' >> ~/.zshrc
elif [ $sysOS == "Linux" ];then
	#linux 
    git clone git://github.com/joelthelion/autojump.git
    cd autojump
    ./install.py
    echo '[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh' >> ~/.zshrc
else
	echo "Other OS: $sysOS"
fi

# install zsh-autosuggestion
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions


# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting



