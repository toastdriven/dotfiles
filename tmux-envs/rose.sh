#!/bin/sh
tmux start-server
tmux new-session -d -s rose -n git
tmux new-window -trose:1 -n test2
tmux new-window -trose:2 -n test3
tmux new-window -trose:3 -n docs

tmux send-keys -trose:0 'cd ~/Code/Python/rose; clear' C-m
tmux send-keys -trose:1 'cd ~/Code/Python/rose; . env/bin/activate; clear' C-m
tmux send-keys -trose:1 'nosetests -s tests'
tmux send-keys -trose:2 'cd ~/Code/Python/rose; . env3/bin/activate; clear' C-m
tmux send-keys -trose:2 'nosetests -s tests'
tmux send-keys -trose:3 'cd ~/Code/Python/rose/docs; clear' C-m

tmux select-window -trose:0
tmux attach-session -d -trose
