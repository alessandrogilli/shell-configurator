# Shell configurator

This repository contains an automated setup process for basic configuration that I primarily use in my shell. The installation process is designed to quickly replicate my setup on a Debian-based distribution. It begins with the installation of [zsh](https://zsh.sourceforge.io/), followed by the [oh-my-zsh](https://ohmyz.sh/) framework with the [powerlevel10k theme](https://github.com/romkatv/powerlevel10k), applying my current layout in the .p10k.zsh file. Subsequently, it installs several programs ([eza](https://github.com/eza-community/eza), [bat](https://github.com/sharkdp/bat), [most](https://www.jedsoft.org/most/), [nvim](https://neovim.io/)) and appropriately configures aliases in the .zshrc file.

Additionally, it installs (NerdFonts MesloLGS NF)[https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Meslo] and, if gnome-terminal is detected, attempts to import the profile configuration.


## Running the script
Open a terminal and make the file executable:
- `chmod u+x install.sh`

Then, run the installation script:
- `./install.sh`

Follow the prompted instructions.
