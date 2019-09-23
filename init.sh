#!/bin/bash

# Zsh is a powerful shell and an alternative to MacOS’s default Bash. This will be covered in more detail in part 3.
# Tmux is a terminal multiplexer. Using some keyboard hotkeys you can use tabs and split panes for better multitasking.
# NeoVim is a modern alternative to Vim, a terminal based code editor with efficiency and code reading in mind. This will be covered in more detail in part 2. NeoVim has a strange path due to being in active development at the moment.
# Python is installed to extend NeoVim’s plugin support.
# Ag is a code-searching tool similar to Ack but faster.
# Reattach-to-user-namespace is a MacOS Sierra fix to ensure the workflow has access to the clipboard so share copy and paste functionality as one would expect in the correct namespace.

# # TODO Move to .dotfiles_bkp
mkdir -p ~/.dotfiles_bkp
cp -f ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~./config/nvim  ~/.dotfiles_bkp

# remove existing dotfiles
rm -rf ~/.zsh ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.config/nvim 2> /dev/null

# Make necessary files

mkdir -p ~/.config ~/.config/nvim

# copy necessary files
config_files=$( find "$PWD/dotfiles/configs" -d 1 2>/dev/null )
echo $config_files
for config in $config_files; do
    target="$HOME/.config/$( basename "$config" )"
    if [ -e "$target" ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $config"
        ln -s "$config" "$target"
    fi
done

# Install necessary brew packages
source install/brew.sh

# Install ZSH SHELL
source install/zsh.sh

# vim config
source install/vim.sh


echo -e "\\n\\nDot files installed successfully."
echo "Please restart your terminal"


