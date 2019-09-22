
update_shell() {
  local shell_path;
  shell_path="$(command -v zsh)"

  echo "Changing your shell to zsh ..."
  if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
    echo "Adding '$shell_path' to /etc/shells"
    sudo sh -c "echo $shell_path >> /etc/shells"
  fi
  sudo chsh -s "$shell_path" "$USER"
}


echo -e "\\n\\nConfiguring ZSH Shell"
echo "=============================="

echo -e "\\n -> oh-my-zsh"

if [ ! -d $HOME/.oh-my-zsh ] 
then
    sh -c ". ./_var.sh && $(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo -e "\\n -> Pure Prompt"

# Modifying prompt
if [ ! -d $HOME/.zsh/pure ] 
then
    mkdir -p "$HOME/.zsh"
    git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
fi

echo -e "\\n -> Auto Suggestion"
if [ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] 
then
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

echo -e "\\n -> Syntax Highlighter"
if [ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] 
then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

echo -e "\\n -> Defaulting to ZSH Shell"
# Setting ZSH as Default Shell
case "$SHELL" in
  */zsh)
    if [ "$(command -v zsh)" != '/usr/local/bin/zsh' ] ; then
      update_shell
    fi
    ;;
  *)
    update_shell
    ;;
esac

ln -s $PWD/configs/zshrc ~/.zshrc
ln -sf $HOME/.zsh/pure/pure.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup

echo -e "\\nZSH Shell setup complete"