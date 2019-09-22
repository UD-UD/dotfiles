#!/usr/bin/env bash

echo -e "\\n\\nInstalling NEOVIM dependency"
echo "=============================="

# vim-plug is installed as a package manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install neovim
pip3 install pynvim

ln -s $PWD/configs/nvim/init.vim ~/.config/nvim/init.vim
ln -s $PWD/configs/nvim ~/.config/nvim
ln -s $PWD/configs/nvim/init.vim ~/.vimrc
ln -s $PWD/configs/nvim ~/.config/.vim

echo -e "\\n NEO setup complete"
echo -e "\\nInstall NeoVim Plugins by runnnig [ nvim +PlugInstall ]"