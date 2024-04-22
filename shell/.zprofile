eval "$(/opt/homebrew/bin/brew shellenv)"
PYENV_ROOT="${HOME}/.pyenv"
PATH="${PYENV_ROOT}/bin:$PATH"
eval "$(pyenv init --path)"
