# So ssh-agent behaves itself.
ssh-add ~/.ssh/id_rsa

# Bump dat ulimit.
ulimit -n 4096

# Ensure pyenv is working.
pyenv init - | source

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
    set -l short_name (echo $env_name | string trim -r -c ".sh")
    set -l full_path "$env_root/$env_name"

    function $short_name --inherit-variable full_path
        source $full_path
    end
end
