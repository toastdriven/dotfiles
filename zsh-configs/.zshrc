# Include the custom prompts.
fpath=("$HOME/.zprompts" "$fpath[@]")

autoload -Uz colors compinit promptinit
colors
compinit
promptinit

# Make sure the prompts will take subsitutions.
setopt prompt_subst

# Pull in my custom prompt.
source $HOME/.zsh-configs/git_prompt.sh
prompt toastdriven

# Add menu-select style completions
zstyle ':completion:*' menu select
# Try to add completions for aliases.
setopt COMPLETE_ALIASES
# Allow `sudo ...` to try to provide completions as well.
zstyle ':completion::complete:*' gain-privileges 1

# Make sure Xcode build for the right OS.
export MACOSX_DEPLOYMENT_TARGET=10.15

export PATH="$(pyenv root)/shims:/usr/local/bin:/usr/local/go/bin:/usr/local/sbin:${PATH}"

# tmux needs ``TERM=screen`` to play nice.
export EDITOR="vim"
export TERM="screen"
export RUBYOPT=rubygems
export PIP_DOWNLOAD_CACHE='/tmp/pip'
export NODE_PATH='/usr/local/lib/node'
export ARCHFLAGS='-arch x86_64'
export COPYFILE_DISABLE=true
export WORKON_HOME=$HOME/.virtualenvs

# For Go.
export GOPATH=$HOME/Code/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# So ssh-agent behaves itself.
ssh-add ~/.ssh/id_rsa

# Conveniences.
alias ls="ls -G"
alias ipy="ipython"
alias destroy-all-pyc="find . -name \*.pyc -delete"
alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code -n'
alias git-blame="echo It\'s your fault, idiot."
alias git-master="git co master && git fetch && git reset --hard origin/master"

# Bump dat ulimit.
ulimit -n 4096

# Mighty tmux environments are MIGHTY!
for file in ~/tmux-envs/*.sh
do
    filename=$(basename "$file")
    filename="${filename%.*}"
    alias $filename=$file
done
