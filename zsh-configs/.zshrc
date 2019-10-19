# Include the custom prompts.
fpath=("$HOME/.zprompts" "$fpath[@]")

autoload -Uz colors compinit promptinit vcs_info
colors
compinit
promptinit

# Set up the version control prompt.
source $HOME/.zsh-configs/git_prompt.sh
setopt prompt_subst
precmd_functions+=( git_prompt )

# Set my custom Zsh prompt.
# prompt toastdriven
PROMPT="%F{blue}[%f%n@%m:%F{green}%1~%F{cyan}%F{blue}]%f: "
# Single quotes are important here!
RPROMPT='${_git_info}'

# Add menu-select style completions
zstyle ':completion:*' menu select
# Try to add completions for aliases.
setopt COMPLETE_ALIASES
# Allow `sudo ...` to try to provide completions as well.
zstyle ':completion::complete:*' gain-privileges 1

# Make sure Xcode build for the right OS.
export MACOSX_DEPLOYMENT_TARGET=10.15

# Ugh. This is ugly & sucks.
# History is painful.
PATH="/Users/daniel/Library/Python/3.7/bin:/Users/daniel/Library/Python/2.7/bin:/usr/local/bin:/usr/local/Cellar/python/2.7/bin:/usr/local/packer:/usr/local/sbin:${PATH}"
export PATH
export PATH=$PATH:/usr/local/Cellar/go/1.2.1/libexec/bin

# tmux needs ``TERM=screen`` to play nice.
export EDITOR="vim"
export TERM="screen"
export VIM_APP_DIR="/Applications/MyApplications/Programming"
export RUBYOPT=rubygems
export PIP_DOWNLOAD_CACHE='/tmp/pip'
export NODE_PATH='/usr/local/lib/node'
export ARCHFLAGS='-arch x86_64'
export COPYFILE_DISABLE=true
export WORKON_HOME=$HOME/.virtualenvs

# For Go.
# export GOROOT=/usr/local/go
export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin

# So ssh-agent behaves itself.
ssh-add ~/.ssh/id_rsa

# Conveniences.
alias ls="ls -G"
alias ipy="ipython"
alias destroy-all-pyc="find . -name \*.pyc -delete"
alias mate='open -a TextMate.app'
alias gitx='open -a GitX.app'
alias mvim='open -a MacVim.app'
alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code -n'
# RunSnakeRun is a PITA on OS X. Make it work.
alias runsnake='VERSIONER_PYTHON_PREFER_32_BIT=yes /usr/local/bin/runsnake'
alias git-blame="echo It\'s your fault, idiot."
alias git-master="git co master && git fetch && git reset --hard origin/master"
alias make-lock="pip freeze -r requirements.txt > requirements-lock.txt"


# Bump dat ulimit.
ulimit -n 4096

# Mighty tmux environments are MIGHTY!
for file in ~/tmux-envs/*.sh
do
    filename=$(basename "$file")
    filename="${filename%.*}"
    alias $filename=$file
done
