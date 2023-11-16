#!/bin/bash

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo apt-get install -y universal-ctags ranger make cmake gettext tmux
#sudo apt-get install snapd
#sudo snap install node --classic

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install v16.20.2

git clone https://github.com/neovim/neovim
(cd neovim && make && sudo make install)
mkdir -p ~/.config
mkdir -p ~/.config/nvim

ln -f nvim/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/nvim/colors
ln -f nvim/colors/sunbather.vim ~/.config/nvim/colors/sunbather.vim

ln -f tmux/tmux.conf ~/.tmux.conf
