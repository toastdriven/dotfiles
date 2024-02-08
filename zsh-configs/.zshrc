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

# Enable incremental history.
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh-configs/.zsh_history
bindkey -v
bindkey '^R' history-incremental-search-backward

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

# So ssh-agent behaves itself.
if [[ -e ~/.ssh/id_ed25519 ]]; then
    ssh-add ~/.ssh/id_ed25519
fi

if [[ -e ~/.ssh/id_rsa ]]; then
    ssh-add ~/.ssh/id_rsa
fi

# Conveniences.
alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code -n'
alias dc="docker compose"
alias destroy-all-pyc="find . -name \*.pyc -delete"
alias git-blame="echo It\'s your fault, idiot."
alias git-cleanup="python ~/Code/dotfiles/bin/git-cleanup"
alias ipy="ipython"
alias ls="ls -G"
alias r="cd (git root)"
alias reset-spotify="rm -rf ~/Library/Application\ Support/Spotify"

# gfr <branch_name>
function gfr {
    readonly branch=${1:?"Branch name is required."}

    git stash && \
    git co $branch && \
    git fetch && \
    git reset --hard origin/$branch && \
    git stash pop
}

# Bump dat ulimit.
ulimit -n 4096

# Mighty tmux environments are MIGHTY!
for file in ~/tmux-envs/*.sh
do
    filename=$(basename "$file")
    filename="${filename%.*}"
    alias $filename=$file
done
