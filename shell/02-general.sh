eval "$(pyenv init -)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# if [ -s "$HOME/.nvm/nvm.sh" ]; then
#   export NVM_DIR="$HOME/.nvm"
#  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
#  alias nvm='unalias nvm node npm yarn && . "$NVM_DIR"/nvm.sh && nvm'
#  alias node='unalias nvm node npm yarn && . "$NVM_DIR"/nvm.sh && node'
#  alias npm='unalias nvm node npm yarn && . "$NVM_DIR"/nvm.sh && npm'
#   alias yarn='unalias nvm node npm yarn && . "$NVM_DIR"/nvm.sh && yarn'
# fi
# zprof
# zmodload -u zsh/zprof
