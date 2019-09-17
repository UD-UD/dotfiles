#!/bin/bash

# Zsh is a powerful shell and an alternative to MacOS’s default Bash. This will be covered in more detail in part 3.
# Tmux is a terminal multiplexer. Using some keyboard hotkeys you can use tabs and split panes for better multitasking.
# NeoVim is a modern alternative to Vim, a terminal based code editor with efficiency and code reading in mind. This will be covered in more detail in part 2. NeoVim has a strange path due to being in active development at the moment.
# Python is installed to extend NeoVim’s plugin support.
# Ag is a code-searching tool similar to Ack but faster.
# Reattach-to-user-namespace is a MacOS Sierra fix to ensure the workflow has access to the clipboard so share copy and paste functionality as one would expect in the correct namespace.

brew install zsh tmux neovim python3 node ag reattach-to-user-namespace
brew tap caskroom/cask

# vim-plug is installed as a package manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install neovim

# using Pure Prompt
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
fpath+=("$HOME/.zsh/pure")

# Fonts
# brew tap caskroom/fonts
# brew cask install font-fira-code

# Setting ZSH as Default Shell
chsh -s /usr/local/bin/zsh

# TODO: Move to .dotfiles_bkp
# remove existing dotfiles
rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.config/nvim 2> /dev/null

# Make necessary files

mkdir -p ~/.config ~/.config/nvim

# Symlinks can allow the file system point from where configs are expected to be to this repo.
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim


