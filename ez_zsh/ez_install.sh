#!/bin/bash
sudo apt update -y && sudo apt upgrade -y
sudo apt install git curl wget zsh terminator -y
sudo update-alternatives --config x-terminal-emulator
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

