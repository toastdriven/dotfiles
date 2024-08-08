# So ssh-agent behaves itself.
if test -f ~/.ssh/id_rsa
    ssh-add ~/.ssh/id_rsa
end

if test -f ~/.ssh/id_ed25519
    ssh-add ~/.ssh/id_ed25519
end

# Bump dat ulimit.
ulimit -n 4096

# Ensure pyenv is working.
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# Mighty tmux environments are MIGHTY!
#
# The following code grabs all the files in the user's `$HOME/tmux-envs`
# directory & creates a dynamic Fish function for each.
#
# This allows spinning up a whole tmux session w/ multiple prepared tabs,
# accessed from anywhere by the short-name of the "tmux-env".
set -l env_root "$HOME/tmux-envs"
set -l envs (ls $env_root | string split " ")

for env_name in $envs
    set -l short_name (echo $env_name | string split -m 1 -n -r ".sh")
    set -l full_path "$env_root/$env_name"

    function $short_name --inherit-variable full_path
        source $full_path
    end
end

# Created by `userpath` on 2020-02-24 20:21:47
set PATH $PATH /Users/daniel/.local/bin
set BREW_PATH /opt/homebrew

if test -d /opt/homebrew
    fish_add_path -g -p /opt/homebrew/bin /opt/homebrew/sbin
    set BREW_PATH /opt/homebrew
end

if test -d /usr/local/Homebrew
    fish_add_path -g -p /usr/local/bin /usr/local/sbin
    set BREW_PATH /usr/local
end

source $BREW_PATH/opt/asdf/libexec/asdf.fish
