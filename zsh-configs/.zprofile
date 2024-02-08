# Make sure Xcode build for the right OS.
# export MACOSX_DEPLOYMENT_TARGET=10.15
# export ARCHFLAGS '-arch x86_64'

export PATH="/usr/local/bin:/usr/local/sbin:${PATH}"

# tmux needs ``TERM=screen`` to play nice.
export EDITOR="vim"
export TERM="screen"
export RUBYOPT=rubygems
export PIP_DOWNLOAD_CACHE='/tmp/pip'
export NODE_PATH="$HOME/.asdf/shims/node"
export COPYFILE_DISABLE=true
export WORKON_HOME=$HOME/.virtualenvs

# For Homebrew.
if [[ -d /opt/homebrew/bin ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# For pyenv.
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# For Go.
export GOPATH=$HOME/Code/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# For Docker & Compose.
export COMPOSE_DOCKER_CLI_BUILD="1"
export DOCKER_BUILDKIT="1"

# For asdf.
if [[ -d $HOMEBREW_PREFIX/opt/asdf ]]; then
    source $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh
else
    echo "Skipping asdf setup. Please install asdf as needed."
fi
