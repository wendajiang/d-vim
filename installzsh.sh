#!/bin/bash
# sh -x installzsh.sh

# cp zshrc to ~/.zshrc
mv ~/.zshrc ~/.zshrc.bak
cp ./zshrc ~/.zshrc
cp ./.p10k.zsh ~/.p10k.zsh

# 安装oh-my-zsh到 ~/.oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew cask install font-firacode-nerd-font

# install autojump
sysOS=`uname -s`
if [ "$sysOS" = "Darwin" ];then
	# macos
    brew install autojump
    echo '[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh' >> ~/.zshrc
    echo 'source $ZSH/oh-my-zsh.sh' >> ~/.zshrc
elif [ "$sysOS" = "Linux" ];then
	#linux 
    git clone git://github.com/joelthelion/autojump.git
    cd autojump
    ./install.py
    echo '[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh' >> ~/.zshrc
else
	echo "Other OS: $sysOS"
fi

ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
# install zsh-autosuggestion
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions


# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# install powerlevel9k/powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git $ZSH_CUSTOM/themes/powerlevel9k

# install powerlevel10k/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


