alias venv="source .venv/bin/activate"
function mkvenv {
    virtualenv -p "python$1" .venv && source .venv/bin/activate && pip install -U pip
}
# alias mkvenv="python -m venv .venv && source .venv/bin/activate && pip install -U pip"
alias pipu="python -m pip install --user"
if [ `uname` = "Darwin" ]; then
    alias oracle="cd /Applications/SQLDeveloper.app/Contents/Resources/sqldeveloper/ && JAVA_HOME= sh sqldeveloper.sh"
fi

alias rcat='rich --theme=monokai'
alias rmore='rich --theme=monokai --pager'

# function script_dir {
#     echo `SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"`
# }
