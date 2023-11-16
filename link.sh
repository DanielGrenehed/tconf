#!/bin/bash

echo "Linking tconf"

mkdir -p ~/.config
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/colors

ln -f nvim/init.vim ~/.config/nvim/init.vim
ln -f nvim/colors/sunbather.vim ~/.config/nvim/colors/sunbather.vim
ln -f tmux/tmux.conf ~/.tmux.conf
ln -f bash/bash_aliases ~/.bash_aliases
ln -f bash/bashrc ~/.bashrc

. ~/.bashrc
