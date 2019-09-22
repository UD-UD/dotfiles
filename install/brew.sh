#!/usr/bin/env bash

if test ! "$( command -v brew )"; then
    echo "Installing homebrew"
    ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
fi

echo -e "\\n\\nInstalling homebrew packages..."
echo "=============================="

formulas=(
    z
    zsh
    neovim
    python3
    node
    ag
    reattach-to-user-namespace
    java
)

for formula in "${formulas[@]}"; do
    formula_name=$( echo "$formula" | awk '{print $1}' )
    if brew list "$formula_name" > /dev/null 2>&1; then
        echo "$formula_name already installed... skipping."
    else
        brew install "$formula"
    fi
done

brew tap caskroom/cask

echo -e "\\n\\nInstalling Lekton font"
echo "=============================="
# Fonts
brew tap caskroom/fonts
brew cask install caskroom/fonts/font-lekton-nerd-font

