#!/bin/bash

echo "Linking tconf"

mkdir -p ~/.config
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/colors
mkdir -p ~/.config/alacritty

ln -f nvim/init.lua ~/.config/nvim/init.lua
ln -f nvim/colors/sunbather.vim ~/.config/nvim/colors/sunbather.vim

ln -f tmux/tmux.conf ~/.tmux.conf

ln -f alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

ln -f bash/bash_aliases ~/.bash_aliases
ln -f bash/bashrc ~/.bashrc
ln -f bash/bash_profile ~/.bash_profile
ln -f bash/zshrc ~/.zshrc

. ~/.bashrc
