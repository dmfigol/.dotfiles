#!/usr/bin/env bash
PYTHON_VERSIONS="3.6.13 3.7.10 3.8.9 3.9.4"
PIPX_PACKAGES="black flake8 pyre-check pytype tox nox virtualenv mypy pyang cmlutils"
NODE_VERSIONS="14 15"
RUBY_VERSIONS="3.0.1 2.7.3"
DOTFILES_REPO_PATH="${HOME}/dotfiles"

if [ "$(uname)" = "Darwin" ]; then
  source "${DOTFILES_REPO_PATH}/dotfiles/env_vars.zsh"
  # dev tools
  if ! xcode-select --print-path &> /dev/null; then
    xcode-select --install &> /dev/null
  fi

  # homebrew
  if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  brew bundle --file="${DOTFILES_REPO_PATH}/Brewfile"

  # iterm integration
  if [[ ! -f ~/.iterm2_shell_integration.zsh  ]]; then
    curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
  fi
fi 

# oh-my-zsh
if [[ ! -f ~/.zshrc ]] || ! grep "oh-my-zsh" ~/.zshrc &> /dev/null; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  chsh -s /usr/local/bin/zsh
fi
sed -i '' "s/robbyrussell/candy/g" "${HOME}/.zshrc"
LINES_TO_ADD=('DOTFILES_REPO_PATH="${HOME}/dotfiles"'
'source ~/.iterm2_shell_integration.zsh'
'source "${DOTFILES_REPO_PATH}/dotfiles/env_vars.zsh"'
'source "${DOTFILES_REPO_PATH}/dotfiles/.secrets.zsh"'
'source "${DOTFILES_REPO_PATH}/dotfiles/aliases.zsh"'
'source "${DOTFILES_REPO_PATH}/dotfiles/general.zsh"')
for line in "${LINES_TO_ADD[@]}"
do
  if ! grep "$line" ~/.zshrc &> /dev/null; then
    echo $line >> ~/.zshrc
  fi
done

# pyenv
if ! command -v pyenv &> /dev/null; then
  curl https://pyenv.run | bash 
fi
pyenv update
for python_version in $PYTHON_VERSIONS
do
  if ! pyenv versions | grep $python_version &> /dev/null; then
    if [ "$(uname)" = "Darwin" ] && [[ $python_version == "3.6."* ]]; then
      # macOS is a joke and Big Sur broke python installations from source again
      pyenv install --patch $python_version < <(curl -sSL https://github.com/python/cpython/commit/8ea6353.patch\?full_index\=1)
    else
      pyenv install $python_version
    fi
  fi
done
pyenv global $PYTHON_VERSIONS

# poetry
if ! command -v poetry &> /dev/null; then
  curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3.6 - --no-modify-path
fi
poetry config virtualenvs.in-project true
poetry self update

# pipx
if ! command -v pipx &> /dev/null; then
  python3.6 -m pip install --user pipx
  python3.6 -m pipx ensurepath
fi
for pipx_package in $PIPX_PACKAGES
do
  if ! pipx list | grep $pipx_package  &> /dev/null; then
    pipx install --python python3.6 $pipx_package
  fi
done

# nvm
if [[ ! -f ~/.nvm/nvm.sh ]]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
fi
. ~/.nvm/nvm.sh
for node_version in $NODE_VERSIONS
do
  if ! nvm ls | grep $node_version  &> /dev/null; then
    nvm install $node_version
    nvm use $node_version
    npm install -g yarn
  fi
done

# ruby
for ruby_version in $RUBY_VERSIONS
do
  if ! rbenv versions | grep $ruby_version &> /dev/null; then
    rbenv install $ruby_version
    rbenv global $ruby_version
  fi
done
