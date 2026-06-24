#!/bin/bash
# install dependencies

packages='universal-ctags ranger make cmake gettext tmux xclip gcc-multilib silversearcher-ag'

if [ -x "$(command -v apt-get)" ]; then sudo apt-get install -y $packages
elif [ -x "$(command -v brew)" ]; then brew install $packages
elif [ -x "$(command -v yay)" ]; then yay -S $packages
elif [ -x "$(command -v dnf)" ]; then sudo dnf install ranger make cmake gettext tmux xclip gcc the_silver_searcher
else echo "Failed to install packages: Package manager not found! could not install ($packages)\n" >&2;fi


read -sp "Install node (y/N)? " choice
case "$choice" in
  y|Y ) 
    # install node using nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    echo "Installing node"
    nvm install v16.20.2;;
esac
echo "\n"

read -sp "Install rust (Y/n)? " choice 
case "$choice" in 
  n|N ) ;;
  y|Y|* )
    echo "Installing rust"
    curl https://sh.rustup.rs -sSf | sh
  ;;
esac 
echo "\n"

echo "Linking"
/bin/bash link.sh
source ~/.bashrc

# Installing neovim
read -sp "Build neovim (Y/n)? " choice
case "$choice" in 
  n|N ) ;;
  y|Y|* )
    echo "Downloading neovim source"
    git clone https://github.com/neovim/neovim
    echo "Building neovim"
    (cd neovim && make && sudo make install)

    echo "Installing plug"
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    echo "Installing neovim plugins"
    nvim +PlugInstall
esac 
echo "\n"
