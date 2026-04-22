#!/bin/bash
# sh -x installzim.sh
# lnif() {
#     if [ -e "$1" ]; then
#         ln -sf "$1" "$2"
#     fi
# }

curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

# cp zshrc to ~/.zshrc
mv ~/.zshrc ~/.zshrc.bak
ln -sf ~/d-vim/zshrc ~/.zshrc
mv ~/.pathrc ~/.pathrc.bak
ln -f ~/d-vim/pathrc ~/.pathrc
ln -f ~/d-vim/zimrc ~/.zimrc

# install autojump
sysOS=$(uname -s)
if [ "$sysOS" = "Darwin" ]; then
    # macos
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
    brew install starship
elif [ "$sysOS" = "Linux" ]; then
    #linux
else
    echo "Other OS: $sysOS"
fi

# ZSH_CUSTOM=$HOME/.zim
# install zsh-autosuggestion
# git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/modules/zsh-autosuggestions
# 
# # install zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/modules/zsh-syntax-highlighting
# 
# # install fzf-tab
# git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM}/modules/fzf-tab

# install powerlevel9k/powerlevel9k
# git clone https://github.com/bhilburn/powerlevel9k.git $ZSH_CUSTOM/themes/powerlevel9k

# install powerlevel10k/powerlevel10k
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# reference
# see: https://www.zrahh.com/archives/167.html
