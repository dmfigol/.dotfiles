source ~/.iterm2_shell_integration.zsh
unsetopt prompt_cr prompt_sp
eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
eval "$(rbenv init -)"
eval "$(direnv hook zsh)"
fpath=(/usr/local/share/zsh-completions /Users/dmfigol/projects/forks/taskfile-zsh-autocompletion/src $fpath)
fpath+=~/.zfunc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dmfigol/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dmfigol/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dmfigol/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dmfigol/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="${HOME}/.local/bin:$PATH"


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
