#!/usr/bin/env bash
# oh-my-zsh
FMT_GREEN=$(printf '\033[32m')
FMT_YELLOW=$(printf '\033[33m')
FMT_RESET=$(printf '\033[0m')
DOTFILES_PATH="${HOME}/.dotfiles"
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  # chsh -s `which zsh`
fi

if [ -f ~/.zshrc ] && [ ! -L ~/.zshrc ]; then
  rm ~/.zshrc
fi
ln -ns "${DOTFILES_PATH}/shell/.zshrc" ~/.zshrc || true
echo "${FMT_YELLOW}Created symlink for .zshrc${FMT_RESET}"

if [ -f ~/.zprofile ] && [ ! -L ~/.zprofile ]; then
  rm ~/.zprofile
fi
ln -ns "${DOTFILES_PATH}/shell/.zprofile" ~/.zprofile || true
echo "${FMT_YELLOW}Created symlink for .zprofile${FMT_RESET}"



# use powerlevel10k theme for oh my zsh
POWERLEVEL10K_THEME_DIR="${HOME}/.oh-my-zsh/custom/themes/powerlevel10k"
if [ ! -d $POWERLEVEL10K_THEME_DIR ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $POWERLEVEL10K_THEME_DIR
  echo "${FMT_YELLOW}Downloaded powerlevel10k theme${FMT_RESET}"
fi
ln -ns "${DOTFILES_PATH}/shell/.p10k.zsh" ~/.p10k.zsh || true
echo "${FMT_YELLOW}Created symlink for .p10k.zsh${FMT_RESET}"

# sed -i.bak "s/robbyrussell/powerlevel10k\/powerlevel10k/g" "${HOME}/.zshrc"

# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
ZSH_AUTO_SUGG_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
echo "ZSH_AUTO_SUGG_DIR is set to ${ZSH_AUTO_SUGG_DIR}"
if [ ! -d $ZSH_AUTO_SUGG_DIR ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTO_SUGG_DIR
  echo "${FMT_YELLOW}Downloaded ZSH autosuggestions plugin${FMT_RESET}"
fi
# LINES_TO_ADD=(
#   'export DOTFILES_PATH="${HOME}/.dotfiles"'
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
