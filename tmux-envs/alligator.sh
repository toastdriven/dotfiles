#!/bin/sh
tmux start-server
tmux new-session -d -s alligator -n git
tmux new-window -talligator:1 -n test
tmux new-window -talligator:2 -n run

tmux send-keys -talligator:0 'cd ~/Code/alligator; clear' C-m
tmux send-keys -talligator:1 'cd ~/Code/alligator; . env/bin/activate.fish; clear' C-m
tmux send-keys -talligator:1 'pytest tests'
tmux send-keys -talligator:2 'cd ~/Code/alligator; . env/bin/activate.fish; clear' C-m
tmux send-keys -talligator:2 ''

tmux select-window -talligator:0
tmux attach-session -d -talligator
