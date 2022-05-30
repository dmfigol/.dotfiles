#!/usr/bin/env bash
. $DOTFILES_PATH/shell/env_vars.sh

PYTHON_VERSIONS="3.6 3.7 3.8 3.9 3.10"
NODE_VERSIONS="16 17 18"

. $DOTFILES_PATH/scripts/python/pyenv.sh
python_install $PYTHON_VERSIONS

. $DOTFILES_PATH/scripts/node/nvm.sh
node_install $NODE_VERSIONS

brew upgrade
$ZSH/tools/upgrade.sh
zsh -c "pipx upgrade-all"
# pipx upgrade-all
poetry self update
git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull
git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions pull
exit 0
