#!/usr/bin/env bash

echo -e "\\n\\nInstalling VIM dependency"
echo "=============================="

# vim-plug is installed as a package manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install neovim
pip3 install pynvim

echo -e "Linking vim configs"
ln -s ~/dotfiles/configs/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/configs/nvim ~/.config/nvim
ln -s ~/dotfiles/configs/nvim/init.vim ~/.vimrc
ln -s ~/dotfiles/configs/nvim ~/.config/.vim