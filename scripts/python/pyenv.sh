#!/usr/bin/env bash
function python_install {
  # install pyenv if doesn't exist
  if ! command -v pyenv &> /dev/null; then
    curl https://pyenv.run | bash
  fi
  eval "$(pyenv init -)"
  pyenv update

  pyenv_global=""
  for python_version in $@
  do
    pyenv install -s $python_version:latest
    pyenv_global+="$(pyenv versions --bare | grep ${python_version} | tail -1) "
    python$python_version -m pip install -U pip
  done
  pyenv global $pyenv_global;
}
