#!/usr/bin/env bash
. ${DOTFILES_PATH}/shell/env_vars.sh
. ${DOTFILES_PATH}/scripts/versions.sh

. ${DOTFILES_PATH}/scripts/python/pyenv.sh
python_install $PYTHON_VERSIONS

. ${DOTFILES_PATH}/scripts/node/nvm.sh
node_install $NODE_VERSIONS

brew update && brew upgrade
$ZSH/tools/upgrade.sh
zsh -c "pipx upgrade-all" # this does work properly without zsh -c
# poetry self update
git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull
git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions pull
exit 0
