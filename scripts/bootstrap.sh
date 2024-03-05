#!/usr/bin/env bash
DOTFILES_PATH="${HOME}/.dotfiles"

. ${DOTFILES_PATH}/scripts/versions.sh

. ${DOTFILES_PATH}/shell/import.sh
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
  if [ ! -x /opt/homebrew/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew bundle --file="${DOTFILES_PATH}/homebrew/Brewfile"

  # download iterm integration
  if [ ! -f ~/.iterm2_shell_integration.zsh  ]; then
    curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
  fi

  # git config
  git config --global push.autoSetupRemote true
  git config --global user.name "Dmitry Figol"
fi

$DOTFILES_PATH/scripts/oh-my-zsh.sh


. $DOTFILES_PATH/scripts/python/pyenv.sh
python_install $PYTHON_VERSIONS

. $DOTFILES_PATH/scripts/node/nvm.sh
node_install $NODE_VERSIONS



# pipx
$DOTFILES_PATH/scripts/python/pipx.sh

# poetry is now installed with pipx
# if ! command -v poetry &> /dev/null; then
  # curl -sSL https://install.python-poetry.org  | python${POETRY_PYTHON_VERSION} -
# fi
if command -v poetry &> /dev/null; then
  poetry config virtualenvs.in-project true
  ZSH_CUSTOM="/Users/dmfigol/.oh-my-zsh/custom"
  mkdir -p $ZSH_CUSTOM/plugins/poetry
  poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
fi

# ruby
# for ruby_version in $RUBY_VERSIONS
# do
#   if ! rbenv versions | grep $ruby_version &> /dev/null; then
#     rbenv install $ruby_version
#     rbenv global $ruby_version
#   fi
# done

task --dir $DOTFILES_PATH update
