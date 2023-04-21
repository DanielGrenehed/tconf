#!/bin/bash

mkdir -p ~/.config
mkdir -p ~/.config/nvim

ln -f nvim/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/nvim/colors
ln -f nvim/colors/sunbather.vim ~/.config/nvim/colors/sunbather.vim
