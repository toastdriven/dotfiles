#!/bin/sh
tmux start-server
tmux new-session -d -s Boto -n git
tmux new-window -tBoto:1 -n shell
tmux new-window -tBoto:2 -n test
tmux new-window -tBoto:3 -n docs

tmux send-keys -tBoto:0 'cd ~/Code/Python/boto; clear' C-m
tmux send-keys -tBoto:1 'cd ~/Code/Python/boto; . venv/bin/activate; clear' C-m
tmux send-keys -tBoto:2 'cd ~/Code/Python/boto; . venv/bin/activate; cd tests/; clear' C-m
tmux send-keys -tBoto:3 'cd ~/Code/Python/boto/docs; clear' C-m

tmux select-window -tBoto:0
tmux attach-session -d -tBoto
