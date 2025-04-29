#!/bin/sh
cd ~/Code/anthology

tmux start-server
tmux new-session -d -s anthology -n git
tmux new-window -tanthology:1 -n test
tmux new-window -tanthology:2 -n run

tmux send-keys -tanthology:0 'clear' C-m
tmux send-keys -tanthology:1 'clear' C-m
tmux send-keys -tanthology:1 'npm test'
tmux send-keys -tanthology:2 'clear' C-m
tmux send-keys -tanthology:2 ''

tmux select-window -tanthology:0
tmux attach-session -d -tanthology
