#!/bin/bash
if(test -f ~/.zshrc)
then
	cp ~/.zshrc ~/.zshrc_bckp
	sed 's/plugins=(git)/plugins=(git timer)/g' ~/.zshrc_bckp > ~/.zshrc
	rm ~/.zshrc_bckp
else
	echo "Please run \"ez_install.sh\" first."
	exit 1
fi
