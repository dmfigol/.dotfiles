export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PIPENV_VENV_IN_PROJECT=True
export NET_TEXTFSM="${HOME}/projects/public/ntc-templates/templates/"
export CLOUDSDK_PYTHON=/Users/dmfigol/.pyenv/shims/python3.6
export EDITOR=vim
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="${HOME}/.local/bin:$NPM_PACKAGES/bin:${HOME}/.poetry/bin:${HOME}/.pyenv/bin:/usr/local/opt/ruby/bin:$PATH"
export MANPATH="$NPM_PACKAGES/share/man:$MANPATH"
if [ "$(uname)" = "Darwin" ]; then
    export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1"
    export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
    export LDFLAGS="-L/usr/local/opt/zlib/lib"
    export CPPFLAGS="-I/usr/local/opt/zlib/include"
    export CFLAGS="-I/usr/local/opt/zlib/include"
fi
