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
    VERSION_SPEC=$(pyenv versions --bare | grep ${python_version} | tail -1)
    pyenv_global+="${VERSION_SPEC} "
    pyenv local ${VERSION_SPEC}
  done
  pyenv global $pyenv_global;
}
