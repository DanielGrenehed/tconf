#!/bin/bash

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo apt-get install -y snapd universal-ctags ranger make cmake gettext
sudo snap install node --classic

git clone https://github.com/neovim/neovim
(cd neovim && make && sudo make install)
mkdir -p ~/.config
mkdir -p ~/.config/nvim

ln -f nvim/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/nvim/colors
ln -f nvim/colors/sunbather.vim ~/.config/nvim/colors/sunbather.vim
