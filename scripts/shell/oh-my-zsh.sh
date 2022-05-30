#!/usr/bin/env bash
# oh-my-zsh
DOTFILES_PATH="${HOME}/dotfiles"
ln -s "${DOTFILES_PATH}/shell/.zshrc" ~/.zshrc
if [[ ! -d ~/.oh-my-zsh ]] then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  chsh -s /usr/local/bin/zsh
fi
# use powerlevel10k theme for oh my zsh
POWERLEVEL10K_THEME_DIR="$ZSH_CUSTOM/themes/powerlevel10k"
[ -d $POWERLEVEL10K_THEME_DIR ] || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $POWERLEVEL10K_THEME_DIR
ln -s "${DOTFILES_PATH}/shell/.p10k.zsh" ~/.p10k.zsh

source "${DOTFILES_PATH}/shell/import.sh"

# sed -i.bak "s/robbyrussell/powerlevel10k\/powerlevel10k/g" "${HOME}/.zshrc"
# TODO: add zsh autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
ZSH_AUTO_SUGG_DIR="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
[ -d $ZSH_AUTO_SUGG_DIR ] || git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTO_SUGG_DIR

# LINES_TO_ADD=(
#   'export DOTFILES_PATH="${HOME}/dotfiles"'
#   '. "${DOTFILES_PATH}/scripts/import.sh"'
# )
# for line in "${LINES_TO_ADD[@]}"
# do
#   if ! grep "$line" ~/.zshrc &> /dev/null; then
#     echo $line >> ~/.zshrc
#   fi
# done

FONT_DIR="/Library/Fonts"
# TMP_DIR="/tmp"
[ ! -f "${FONT_DIR}/MesloLGS NF Regular.ttf" ] && wget -P $FONT_DIR "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
[ ! -f "${FONT_DIR}/MesloLGS NF Bold.ttf" ] && wget -P $FONT_DIR "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
[ ! -f "${FONT_DIR}/MesloLGS NF Italic.ttf" ] && wget -P $FONT_DIR "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
[ ! -f "${FONT_DIR}/MesloLGS NF Bold Italic.ttf" ] && wget -P $FONT_DIR "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"