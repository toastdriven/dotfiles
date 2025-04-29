#!/bin/sh
cd ~/Code/mealplanner

tmux start-server
tmux new-session -d -s mealplanner -n git
tmux new-window -tmealplanner:1 -n docker
tmux new-window -tmealplanner:2 -n test

tmux send-keys -tmealplanner:0 'clear' C-m
tmux send-keys -tmealplanner:1 'clear' C-m
tmux send-keys -tmealplanner:1 'just up'
tmux send-keys -tmealplanner:2 'clear' C-m
tmux send-keys -tmealplanner:2 'just test'

tmux select-window -tmealplanner:0
tmux attach-session -d -tmealplanner
