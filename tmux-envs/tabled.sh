#!/bin/sh
tmux start-server
tmux new-session -d -s tabled -n git
tmux new-window -ttabled:1 -n test
tmux new-window -ttabled:2 -n run

tmux send-keys -ttabled:0 'cd ~/Code/tabled; clear' C-m
tmux send-keys -ttabled:1 'cd ~/Code/tabled; . env/bin/activate.fish; clear' C-m
tmux send-keys -ttabled:1 'pytest tests'
tmux send-keys -ttabled:2 'cd ~/Code/tabled; . env/bin/activate.fish; clear' C-m
tmux send-keys -ttabled:2 'python tabled.py'

tmux select-window -ttabled:0
tmux attach-session -d -ttabled
