#!/bin/bash

echo "Linking tconf"

mkdir -p ~/.config
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/colors
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/alacritty/themes
mkdir -p ~/.config/scripts

ln -f nvim/init.lua ~/.config/nvim/init.lua
ln -f nvim/colors/sunbather.vim ~/.config/nvim/colors/sunbather.vim

ln -f tmux/tmux.conf ~/.tmux.conf

ln -f alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -f alacritty/themes/*.toml ~/.config/alacritty/themes/

ln -f bash/bash_aliases ~/.bash_aliases
ln -f bash/bashrc ~/.bashrc
ln -f bash/bash_profile ~/.bash_profile
ln -f bash/zshrc ~/.zshrc

ln -f scripts/block_host.sh ~/.config/scripts/block_host.sh
ln -f scripts/eject_cd.sh ~/.config/scripts/eject_cd.sh
ln -f scripts/start_superdrive.sh ~/.config/scripts/start_superdrive.sh

. ~/.bashrc
