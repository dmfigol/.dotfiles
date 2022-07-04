#!/usr/bin/env bash
PYTHON_VERSIONS="3.6 3.7 3.8 3.9 3.10"
NODE_VERSIONS="16 17 18"
POETRY_PYTHON_VERSION="3.9"
PIPX_PYTHON_VERSION="3.9"
# RUBY_VERSIONS="3.0.1 2.7.3"
DOTFILES_PATH="${HOME}/dotfiles"

. ${DOTFILES_PATH}/scripts/import.sh
# MacOS specific stuff
if [ `uname` = "Darwin" ]; then
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
  if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  brew bundle --file="${DOTFILES_PATH}/homebrew/Brewfile"

  # download iterm integration
  if [ ! -f ~/.iterm2_shell_integration.zsh  ]; then
    curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
  fi
fi

$DOTFILES_PATH/scripts/shell/oh-my-zsh.sh


. $DOTFILES_PATH/scripts/python/pyenv.sh
python_install $PYTHON_VERSIONS

. $DOTFILES_PATH/scripts/node/nvm.sh
node_install $NODE_VERSIONS

# poetry
if ! command -v poetry &> /dev/null; then
  curl -sSL https://install.python-poetry.org  | python${POETRY_PYTHON_VERSION} - --no-modify-path
  poetry config virtualenvs.in-project true
fi

# pipx
$DOTFILES_PATH/scripts/python/pipx.sh

# ruby
# for ruby_version in $RUBY_VERSIONS
# do
#   if ! rbenv versions | grep $ruby_version &> /dev/null; then
#     rbenv install $ruby_version
#     rbenv global $ruby_version
#   fi
# done

task update
