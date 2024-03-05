[ `uname` = "Darwin" ] && . ~/.iterm2_shell_integration.zsh
unsetopt prompt_cr prompt_sp
(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv export zsh)"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv hook zsh)"
# fpath=(/usr/local/share/zsh-completions /Users/dmfigol/projects/forks/taskfile-zsh-autocompletion/src $fpath)
# fpath+=~/.zfunc
