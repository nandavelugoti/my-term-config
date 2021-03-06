#!/bin/sh

NAME="my-term-config"
URL="https://github.com/nandavelugoti/my-term-config.git"

# Clone the repo if didn't already 
if test ! -d $NAME/.git/; then
	git clone $URL
fi

##########################################################################################
##########################################################################################
###                         _                                             __ _         ###
###   _ __ ___  _   _      | |_ ___ _ __ _ __ ___         ___ ___  _ __  / _(_) __ _   ###
###  | '_ ` _ \| | | |_____| __/ _ | '__| '_ ` _ \ _____ / __/ _ \| '_ \| |_| |/ _` |  ###
###  | | | | | | |_| |_____| ||  __| |  | | | | | |_____| (_| (_) | | | |  _| | (_| |  ###
###  |_| |_| |_|\__, |      \__\___|_|  |_| |_| |_|      \___\___/|_| |_|_| |_|\__, |  ###
###             |___/                                                          |___/   ###
###                                                                                    ###
##########################################################################################
##########################################################################################

cat $NAME/figlet.txt

# Check for dependencies; Install if not exists
echo "Checking for dependencies ..."
for CMD in zsh tmux fonts-powerline
do
	if [ $(command -v $CMD) ]; then
		echo "$CMD is already installed"
	else
		echo "$CMD is not installed. So installing it ..."
		yes | sudo apt install $CMD
	fi
done

# Install oh-my-zsh
echo "Checking for oh-my-zsh ..."
if test -d $HOME/.oh-my-zsh; then
	echo "oh-my-zsh is already installed"
else
	echo "Installing oh-my-zsh"
	yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Change the shell to zsh
echo "Changing the system-wide default shell to zsh"
chsh -s $(which zsh)

# Install TPM
echo "Checking for TPM ..."
if test -d $HOME/.tmux/plugins/tpm/.git; then
	echo "TPM is already installed"
else
	echo "Installing TPM"
	git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

# Setup .tmux.conf
if test -f $HOME/.tmux.conf; then
	echo "Saving exitsing ~/.tmux.conf to ~/.tmux.conf.save"
	mv $HOME/.tmux.conf $HOME/.tmux.conf.save
fi

echo "Setting up new ~/.tmux.conf"
cp .tmux.conf $HOME/.tmux.conf

# Reload TMUX environment so TPM is sourced
tmux source-file $HOME/.tmux.conf

echo "Done"
