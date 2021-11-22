#! /usr/bin/env fish
# Make sure Xcode build for the right OS.
set -x -U MACOSX_DEPLOYMENT_TARGET "10.15"

set -x -U PATH "(pyenv root)/shims:/usr/local/bin:/usr/local/go/bin:/usr/local/sbin:$PATH"

# tmux needs ``TERM=screen`` to play nice.
set -x -U TERM "screen"
set -x -U EDITOR "vim"
set -x -U RUBYOPT "rubygems"
set -x -U PIP_DOWNLOAD_CACHE '/tmp/pip'
set -x -U NODE_PATH '/usr/local/lib/node'
set -x -U ARCHFLAGS '-arch x86_64'
set -x -U COPYFILE_DISABLE true
set -x -U WORKON_HOME "$HOME/.virtualenvs"

# For Go.
set -x -U GOPATH $HOME/Code/go
set -x -U PATH "$PATH:/usr/local/go/bin:$GOPATH/bin"

# For faster Docker builds.
set -x -U COMPOSE_DOCKER_CLI_BUILD "1"
set -x -U DOCKER_BUILDKIT "1"

# For Sublime Text.
set -x -U PATH "$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin"

