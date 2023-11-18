#!/bin/bash

echo "Installing Fonts"

mkdir font_tmp
cd font_tmp

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

mkdir ~/.local/share/fonts

mv *.ttf ~/.local/share/fonts

fc-cache -f -v

fc-list | grep -i "meslo"

cd ..

rm -r font_tmp

if command -v gnome-terminal > /dev/null; then

    # dumped with: dconf dump /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ > gterminal.preferences

    dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ < gterminal.preferences
    echo ""
    echo ""
    echo "Fonts installed. Close and re-open this terminal."
    

else

    echo ""
    echo ""
    echo "Fonts installed. Close and re-open this terminal, open the preferences of your terminal and choose 'MesloLGS NF' as font."

fi

