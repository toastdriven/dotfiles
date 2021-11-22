#!/bin/sh
tmux start-server
tmux new-session -d -s pylev -n git
tmux new-window -tpylev:1 -n test
tmux new-window -tpylev:2 -n run

tmux send-keys -tpylev:0 'cd ~/Code/pylev; clear' C-m
tmux send-keys -tpylev:1 'cd ~/Code/pylev; . env/bin/activate.fish; clear' C-m
tmux send-keys -tpylev:1 'pytest tests'
tmux send-keys -tpylev:2 'cd ~/Code/pylev; . env/bin/activate.fish; clear' C-m
tmux send-keys -tpylev:2 ''

tmux select-window -tpylev:0
tmux attach-session -d -tpylev
