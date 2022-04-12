#!/bin/bash
# sh -x installzsh.sh
# lnif() {
#     if [ -e "$1" ]; then
#         ln -sf "$1" "$2"
#     fi
# }

# 安装oh-my-zsh到 ~/.oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# cp zshrc to ~/.zshrc
mv ~/.zshrc ~/.zshrc.bak
ln -sf ~/d-vim/zshrc ~/.zshrc
mv ~/.pathrc ~/.pathrc.bak
ln -f ~/d-vim/pathrc ~/.pathrc

# install autojump
sysOS=$(uname -s)
if [ "$sysOS" = "Darwin" ]; then
    # macos
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
    brew install autojump
    brew install starship
    echo '[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh' >>~/.zshrc
    echo 'source $ZSH/oh-my-zsh.sh' >>~/.zshrc
elif [ "$sysOS" = "Linux" ]; then
    #linux
    git clone git://github.com/joelthelion/autojump.git
    cd autojump
    ./install.py
    echo '[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh' >>~/.zshrc
else
    echo "Other OS: $sysOS"
fi

ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
# install zsh-autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# install fzf-tab
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

# install powerlevel9k/powerlevel9k
# git clone https://github.com/bhilburn/powerlevel9k.git $ZSH_CUSTOM/themes/powerlevel9k

# install powerlevel10k/powerlevel10k
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# reference
# see: https://www.zrahh.com/archives/167.html
