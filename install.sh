#!/usr/bin/sudo /bin/sh

# Check for dependencies; Install if not exists
for CMD in zsh tmux git fonts-powerline
do
	if [ $(command -v $CMD) ]; then
		echo "$CMD is already installed"
	else
		echo "$CMD is not installed. So installing it ..."
		yes | apt install $CMD
	fi
done

# Install oh-my-zsh
if test -d ~/.oh-my-zsh; then
	echo "oh-my-zsh is already installed"
else
	echo "Installing oh-my-zsh"
	yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Change the shell to zsh
chsh -s $(which zsh)

# Install TPM
if test -d ~/.tmux/plugins/tpm/.git; then
	echo "TPM is already installed"
else
	echo "Installing TPM"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Setup .tmux.conf
if test -f ~/.tmux.conf; then
	echo "Saving exitsing ~/.tmux.conf to ~/.tmux.conf.save"
	mv ~/.tmux.conf ~/.tmux.conf.save
fi
echo "Setting up new ~/.tmux.conf"
cp .tmux.conf ~/.tmux.conf

# Reload TMUX environment so TPM is sourced
tmux source-file ~/.tmux.conf
