#! /usr/bin/env fish
# Make sure Xcode build for the right OS.
# set -x -U MACOSX_DEPLOYMENT_TARGET "12.0"
# set -x -U ARCHFLAGS '-arch x86_64'

# For pyenv.
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

set -x -U PATH "(pyenv root)/shims:/usr/local/bin:/usr/local/sbin:$PATH"

# tmux needs ``TERM=screen`` to play nice.
set -x -U TERM "screen"
set -x -U EDITOR "vim"
set -x -U RUBYOPT "rubygems"
set -x -U PIP_DOWNLOAD_CACHE '/tmp/pip'
set -x -U NODE_PATH "$HOME/.asdf/shims/node"
set -x -U COPYFILE_DISABLE true
set -x -U WORKON_HOME "$HOME/.virtualenvs"

# For Go.
set -x -U GOPATH $HOME/Code/go
set -x -U PATH "$PATH:/usr/local/go/bin:$GOPATH/bin"

# For faster Docker builds.
set -x -U COMPOSE_DOCKER_CLI_BUILD "1"
set -x -U DOCKER_BUILDKIT "1"

# For Sublime Text.
# set -x -U PATH "$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin"

