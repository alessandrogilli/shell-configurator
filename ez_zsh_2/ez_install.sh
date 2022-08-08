#!/bin/bash
# Install dependencies
#echo "When installation of zsh is complete, a zsh shell will be open. When it occurs, please type \"exit\" to proceed configuration."
#read -p "Press \"Enter\" to continue..."

sudo apt update -y
sudo apt install git curl wget zsh exa -y 

# Oh-my-zsh
if curl -fsLO https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
then
    sed -i 's/exec zsh -l/#exec zsh -l/g' ./install.sh
    sh ./install.sh
    rm ./install.sh
fi

# Theme
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

if [ -f .zshrc ]
then
    echo "Restoring .zshrc"
    if [ -f ~/.zshrc ]
        then
            cp ~/.zshrc ~/.zshrc_bckp
        fi
    cp .zshrc ~/.zshrc
    if [ -f .p10k.zsh ]
        then
            echo "Restoring .p10k.zsh"
            if [ -f ~/.p10k.zsh ]
            then
                cp ~/.p10k.zsh ~/.p10k.zsh_bckp
            fi
            cp .p10k.zsh ~/.p10k.zsh
        else
            echo "Error restoring .p10k.zsh"
        fi
else
    echo "Error restoring .zshrc"
fi

echo "Installation complete. Run \"zsh\" and have a nice day!"

