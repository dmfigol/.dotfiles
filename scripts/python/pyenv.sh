#!/usr/bin/env bash
PYENV_MACOS_PATCH_URL="https://github.com/python/cpython/commit/8ea6353.patch\?full_index\=1"

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
    # if [ `uname` = "Darwin" ] && [ $python_version = "3.6" ]; then
    #   # patch for macOS
    #   pyenv install -s --patch $python_version:latest < <(curl -sSL $PYENV_MACOS_PATCH_URL)
    # else
      pyenv install -s $python_version:latest
    # fi
    pyenv_global+="$(pyenv versions --bare | grep ${python_version} | tail -1) "
    python$python_version -m pip install -U pip
  done
  pyenv global $pyenv_global;
}