#!/bin/sh
tmux start-server
tmux new-session -d -s itty3 -n git
tmux new-window -titty3:1 -n test
tmux new-window -titty3:2 -n run

tmux send-keys -titty3:0 'cd ~/Code/itty3; clear' C-m
tmux send-keys -titty3:1 'cd ~/Code/itty3; . env/bin/activate.fish; clear' C-m
tmux send-keys -titty3:1 'pytest tests'
tmux send-keys -titty3:2 'cd ~/Code/itty3; . env/bin/activate.fish; clear' C-m
tmux send-keys -titty3:2 ''

tmux select-window -titty3:0
tmux attach-session -d -titty3
