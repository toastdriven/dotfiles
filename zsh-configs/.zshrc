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

