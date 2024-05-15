#!/bin/bash
# install dependencies

packages='universal-ctags ranger make cmake gettext tmux xclip gcc-multilib'

if [ -x "$(command -v apt-get)" ]; then sudo apt-get install -y $packages
elif [ -x "$(command -v brew)" ]; then brew install $packages
elif [ -x "$(command -v yay)" ]; then yay -S $packages
else echo "Failed to install packages: Package manager not found! could not install ($packages)" >&2;fi
# install node using nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

echo "Linking"
/bin/bash link.sh
source ~/.bashrc

echo "Installing node"
nvm install v16.20.2

echo "Installing rust"
curl https://sh.rustup.rs -sSf | sh

echo "Downloading neovim source"
git clone https://github.com/neovim/neovim
echo "Building neovim"
(cd neovim && make && sudo make install)

echo "Installing plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Installing neovim plugins"
nvim +PlugInstall
