#!/bin/bash

set -e

sudo apt update -y
sudo apt install curl wget zsh -y

# Install EZA
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

# Install Batcat
sudo apt install -y bat

# Install Most
sudo apt install -y most

# Install Neovim
echo "Would you like to install neovim at the latest version, with lazyvim configuration? [y|n]"

while :
do
    read res
    case $res in
        y)
            sh ./nvim.sh
            break
        ;;
        n)
            break
        ;;
        *)
        echo "Please type 'y' or 'n'"
    esac
done

# Oh-my-zsh
if curl -fsLO https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh; then
    sed -i 's/exec zsh -l/#exec zsh -l/g' ./install.sh
    sh ./install.sh
    rm ./install.sh
fi

# Theme
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Setting .zshrc file
if [ -f .zshrc ]; then
    echo "Restoring .zshrc"
    if [ -f $HOME/.zshrc ]; then
        cp $HOME/.zshrc $HOME/.zshrc_bckp
    fi
    cp .zshrc $HOME/.zshrc
    if [ -f .p10k.zsh ]; then
        echo "Restoring .p10k.zsh"
        if [ -f $HOME/.p10k.zsh ]; then
            cp $HOME/.p10k.zsh $HOME/.p10k.zsh_bckp
        fi
        cp .p10k.zsh $HOME/.p10k.zsh
    else
        echo "Error restoring .p10k.zsh"
    fi
else
    echo "Error restoring .zshrc"
fi

# Fonts
sh ./font.sh

echo "Installation complete. Close and re-open the terminal. Then Run \"zsh\" and have a nice day!"

