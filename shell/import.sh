DOTFILES_PATH="${HOME}/.dotfiles"
if [ "${SHELL##*/}" = "zsh" ]; then
  for file in $DOTFILES_PATH/shell/[0-9]*.*sh; do
    . "$file"
  done
else
  for file in $DOTFILES_PATH/shell/[0-9]*.sh; do
    . "$file"
  done
fi

[ -d "${HOME}/.secrets.d" ] && for file in $HOME/.secrets.d/*.*sh; do
  . "$file"
done
