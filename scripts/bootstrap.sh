#!/usr/bin/env bash
PYTHON_VERSIONS="3.6.13 3.8.9 3.9.4"
NODE_VERSIONS="14 15"
RUBY_VERSIONS="3.0.1 2.7.3"
DOTFILES_REPO_PATH="${HOME}/dotfiles" 
if [ "$(uname)" == "Darwin" ]; then
  source "${DOTFILES_REPO_PATH}/dotfiles/env_vars.zsh"
  # dev tools
  if ! xcode-select --print-path &> /dev/null; then
    xcode-select --install &> /dev/null
  fi

  # homebrew
  if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  brew bundle

  # iterm integration
  curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh 

fi 

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s /usr/local/bin/zsh
sed -i '' "s/robbyrussell/candy/g" "${HOME}/.zshrc"
cat <<EOT >> ~/.zshrc
source ~/.iterm2_shell_integration.zsh
source ~/env_vars.zsh
source ~/.secrets.zsh
source ~/aliases.zsh
source ~/general.zsh
EOT

# pyenv
if ! command -v pyenv &> /dev/null; then
  curl https://pyenv.run | bash 
fi
pyenv update
for python_version in $PYTHON_VERSIONS
do
  pyenv install $python_version
done

# nvm
if ! command -v nvm &> /dev/null; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
fi
nvm install node

for ruby_version in $RUBY_VERSIONS
do
  rbenv install $ruby_version
done
