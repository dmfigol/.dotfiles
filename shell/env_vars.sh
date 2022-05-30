export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PIPENV_VENV_IN_PROJECT=1
export CLOUDSDK_PYTHON="${HOME}/.pyenv/shims/python3.6"
export EDITOR=vim
NPM_PACKAGES="${HOME}/.npm-packages"
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${HOME}/.local/bin:${NPM_PACKAGES}/bin:${HOME}/.poetry/bin:${PYENV_ROOT}/bin:${HOME}/go/bin:/usr/local/opt/ruby/bin:$PATH"
export MANPATH="$NPM_PACKAGES/share/man:$MANPATH"
if [ `uname` = "Darwin" ]; then
    export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
    export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1"
    export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
    export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib -L/usr/local/opt/openssl@1.1/lib"
    export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include -I/usr/local/opt/openssl@1.1/include"
    export CFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include -I/usr/local/opt/openssl@1.1"
fi
