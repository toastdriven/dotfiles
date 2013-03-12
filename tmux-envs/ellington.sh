#!/bin/sh
tmux start-server
tmux new-session -d -s Ellington -n runserver
tmux new-window -tEllington:1 -n git
tmux new-window -tEllington:2 -n test
tmux new-window -tEllington:3 -n solr
tmux new-window -tEllington:4 -n redis
tmux new-window -tEllington:5 -n hosted
tmux new-window -tEllington:6 -n marketplace

tmux send-keys -tEllington:0 'e-me; clear' C-m
tmux send-keys -tEllington:1 'cd ~/Code/Python/M4M/ellington; clear' C-m
tmux send-keys -tEllington:2 'e-me; clear' C-m
tmux send-keys -tEllington:3 'cd ~/Code/Python/M4M/new-solr/1.3.0; clear; ./run-solr.sh' C-m
tmux send-keys -tEllington:4 'cd ~/Code/Python/M4M/redis-0.900; clear; ./redis-server' C-m
tmux send-keys -tEllington:5 'cd ~/Code/Python/M4M/hosted; clear' C-m
tmux send-keys -tEllington:6 'cd ~/Code/Python/M4M/marketplace; clear' C-m

tmux select-window -tEllington:0
tmux attach-session -d -tEllington