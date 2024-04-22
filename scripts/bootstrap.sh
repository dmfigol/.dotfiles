#!/usr/bin/env bash
DOTFILES_PATH="${HOME}/.dotfiles"

. ${DOTFILES_PATH}/scripts/versions.sh

# . ${DOTFILES_PATH}/shell/import.sh
. ${DOTFILES_PATH}/shell/env_vars.sh
# MacOS specific stuff
if [ `uname` = "Darwin1" ]; then
  # disable font smoothing
  defaults -currentHost write -g AppleFontSmoothing -int 0
  # disable autocorrection
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
  # software updates
  softwareupdate --all --install --force
  # dev tools
  if ! xcode-select --print-path &> /dev/null; then
    xcode-select --install &> /dev/null
  fi

  # homebrew
  if [ ! -x /opt/homebrew/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew bundle --file="${DOTFILES_PATH}/homebrew/Brewfile"

  # download iterm integration
  if [ ! -f ~/.iterm2_shell_integration.zsh  ]; then
    curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
    echo "Downloaded iterm2 shell integration into ~/.iterm2_shell_integration.zsh"
  fi

  # git config
  git config --global push.autoSetupRemote true
  git config --global user.name "Dmitry Figol"
fi

bash $DOTFILES_PATH/scripts/oh-my-zsh.sh

. $DOTFILES_PATH/scripts/python/pyenv.sh
python_install $PYTHON_VERSIONS

. $DOTFILES_PATH/scripts/node/nvm.sh
node_install $NODE_VERSIONS

# pipx
$DOTFILES_PATH/scripts/python/pipx.sh

if command -v poetry &> /dev/null; then
  poetry config virtualenvs.in-project true
  ZSH_CUSTOM="/Users/dmfigol/.oh-my-zsh/custom"
  mkdir -p $ZSH_CUSTOM/plugins/poetry
  poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
fi
