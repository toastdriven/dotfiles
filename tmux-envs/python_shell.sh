#!/bin/sh
tmux start-server
tmux new-session -d -s shell -n git
tmux new-window -tshell:1 -n test2
tmux new-window -tshell:2 -n test3
tmux new-window -tshell:3 -n docs

tmux send-keys -tshell:0 'cd ~/Code/Python/shell; clear' C-m
tmux send-keys -tshell:1 'cd ~/Code/Python/shell; . env/bin/activate; clear' C-m
tmux send-keys -tshell:1 'nosetests tests.py'
tmux send-keys -tshell:2 'cd ~/Code/Python/shell; . env3/bin/activate; clear' C-m
tmux send-keys -tshell:2 'nosetests tests.py'
tmux send-keys -tshell:3 'cd ~/Code/Python/shell/docs; clear' C-m

tmux select-window -tshell:0
tmux attach-session -d -tshell
