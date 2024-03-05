#!/usr/bin/env bash
export NVM_DIR=$HOME/.nvm;
NVM_INSTALL_SCRIPT_URL="https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh"

. $DOTFILES_PATH/shell/01-utils.sh
function node_install {
  # install nvm if doesn't exist
  [ ! -f "${NVM_DIR}/nvm.sh" ] && curl -o- $NVM_INSTALL_SCRIPT_URL | bash

  # change default packages
  default_packages_path="$DOTFILES_PATH/scripts/node/default-packages"
  if [ ! -f "${NVM_DIR}/default-packages" ] || ! cmp -s "${NVM_DIR}/default-packages" $default_packages_path; then
    cp $default_packages_path "${NVM_DIR}/default-packages"
  fi
  . $NVM_DIR/nvm.sh;

  for node_version in $@
  do
    local_version=`nvm version $node_version`
    remote_version=`nvm version-remote $node_version`
    if [ $remote_version != "N/A" ]; then
        last_remote_version=$remote_version
        if [ $local_version != $remote_version ]; then
            nvm install $node_version
            nvm uninstall $local_version
        fi
    fi
  done
  nvm alias default node
  nvm use default
}
