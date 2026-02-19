# To start with, silence any errors when accidentally trying to tab-complete.
# This will also exclude current working directory files.
complete -c honk -f

# Set a couple useful variables.
set my_profiles_path "$HOME/.config/goose/my_profiles/"
set -l commands help

# Now, if I tab-complete anything other than `help`, it'll pull the list of
# "profiles" from my setup for choosing between.
complete -c honk -n "not __fish_seen_subcommand_from $commands" \
    -a '(ls -1 $my_profiles_path | string replace ".profile" "")'
