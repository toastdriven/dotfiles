#!/bin/sh
tmux start-server
tmux new-session -d -s rose -n git
tmux new-window -trose:1 -n test
tmux new-window -trose:2 -n docs

tmux send-keys -trose:0 'cd ~/Code/Python/rose; clear' C-m
tmux send-keys -trose:1 'cd ~/Code/Python/rose; . env/bin/activate.fish; clear' C-m
tmux send-keys -trose:1 'pytest -s tests'
tmux send-keys -trose:2 'cd ~/Code/Python/rose/docs; clear' C-m

tmux select-window -trose:0
tmux attach-session -d -trose
