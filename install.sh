#!/bin/bash

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo apt-get install -y snapd universal-ctags ranger
sudo snap install node --classic
sudo snap install --beta nvim --classic
mkdir -p ~/.config
mkdir -p ~/.config/nvim

ln -f nvim/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/nvim/colors
ln -f nvim/colors/sunbather.vim ~/.config/nvim/colors/sunbather.vim
