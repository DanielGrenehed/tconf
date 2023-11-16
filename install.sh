#!/bin/bash
# install dependencies

packages='universal-ctags ranger make cmake gettext tmux'

if [ -x "$(command -v apt-get)" ]; then sudo apt-get install -y $packages
elif [ -x "$(command -v brew)" ]; then brew install $packages
else echo "Failed to install packages: Package manager not found! could not install ($packages)" >&2;fi
# install node using nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install v16.20.2

# build and install neovim from source
git clone https://github.com/neovim/neovim
(cd neovim && make && sudo make install)

# install plug for nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

/bin/bash link.sh

nvim +PlugInstall
