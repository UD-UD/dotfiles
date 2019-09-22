#!/bin/bash

# Zsh is a powerful shell and an alternative to MacOS’s default Bash. This will be covered in more detail in part 3.
# Tmux is a terminal multiplexer. Using some keyboard hotkeys you can use tabs and split panes for better multitasking.
# NeoVim is a modern alternative to Vim, a terminal based code editor with efficiency and code reading in mind. This will be covered in more detail in part 2. NeoVim has a strange path due to being in active development at the moment.
# Python is installed to extend NeoVim’s plugin support.
# Ag is a code-searching tool similar to Ack but faster.
# Reattach-to-user-namespace is a MacOS Sierra fix to ensure the workflow has access to the clipboard so share copy and paste functionality as one would expect in the correct namespace.

# update_shell() {
#   local shell_path;
#   shell_path="$(command -v zsh)"

#   echo "Changing your shell to zsh ..."
#   if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
#     echo "Adding '$shell_path' to /etc/shells"
#     sudo sh -c "echo $shell_path >> /etc/shells"
#   fi
#   sudo chsh -s "$shell_path" "$USER"
# }

# # ***************************

# brew install zsh neovim python3 node ag reattach-to-user-namespace
# brew tap caskroom/cask

# # vim-plug is installed as a package manager
# curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# pip3 install neovim
# pip3 install pynvim

# # TODO Move to .dotfiles_bkp
# mkdir -p ~/.dotfiles_bkp
# mv -f ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~./config  ~/.dotfiles_bkp

# remove existing dotfiles
rm -rf ~/.zsh ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.config 2> /dev/null


# Install oh my zsh
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# # Install Pure Prompt
# if [ ! -d $HOME/.zsh/pure ] 
# then
#     mkdir -p "$HOME/.zsh"
#     git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
# fi


# # Install Syntax HighLighter
# if [ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] 
# then
#     git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# fi

# # Fonts
# brew tap caskroom/fonts
# brew cask install caskroom/fonts/font-lekton-nerd-font

# # Setting ZSH as Default Shell
# case "$SHELL" in
#   */zsh)
#     if [ "$(command -v zsh)" != '/usr/local/bin/zsh' ] ; then
#       update_shell
#     fi
#     ;;
#   *)
#     update_shell
#     ;;
# esac

# Make necessary files

mkdir -p ~/.config ~/.config/nvim

# copy necessary files
config_files=$( find "$PWD/dotfiles/configs" -d 1 2>/dev/null )
echo $config_files
for config in $config_files; do
    target="$HOME/.config/$( basename "$config" )"
    echo "~${target#$HOME}"
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


