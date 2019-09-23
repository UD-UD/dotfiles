# dotfiles
## Dotfiles for unix based system.

# Intallation
 ```
 https://github.com/UD-UD/dotfiles.git
 ```

 Installation Notes :
 - Backup your existing dot files.
 - Go to the directory where this repo is cloned.
 - If you have any zshrc alias copy them to `dotfiles/configs/zshrc`
 - If you want to add or remove any brew packages just update the formula list `dotfiles/install/brew.sh`
 - run `./init.sh`

 ## Package list that will be installed are :
 - Brew
    - git
    - zsh
    - neovim
    - python3
    - node
    - ag
    - reattach-to-user-namespace
    - java
    - iterm2
    - lekton-nerd-font
 - Oh My Zsh
 - Zsh Auto Suggestion
 - Zsh Syntax Highlighter
 - Pure Prompt

 By default these dot files does not change your terminal color scheme.
 I have provided a color scheme in theme folder, If you wish you can apply them. ( Its AWESOME :p )

 # TODO
 - tmux integration
 - htop integration
 - more aliases for more productivity.


