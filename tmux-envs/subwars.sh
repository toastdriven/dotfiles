#!/bin/sh
tmux start-server
tmux new-session -d -s subwars -n git
tmux new-window -tsubwars:1 -n serve

tmux send-keys -tsubwars:0 'cd ~/Desktop/subwars; clear' C-m
tmux send-keys -tsubwars:1 'cd ~/Desktop/subwars; clear; python -m SimpleHTTPServer' C-m

tmux select-window -tsubwars:0
tmux attach-session -d -tsubwars
