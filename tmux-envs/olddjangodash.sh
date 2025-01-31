#!/bin/sh
tmux start-server
tmux new-session -d -s djangodash -n runserver
tmux new-window -tdjangodash:1 -n git
tmux new-window -tdjangodash:2 -n test

tmux send-keys -tdjangodash:0 'cd ~/Code/Python/djangodash/; . env/bin/activate.fish; clear' C-m
tmux send-keys -tdjangodash:0 './manage.py runserver'
tmux send-keys -tdjangodash:1 'cd ~/Code/Python/djangodash/; clear' C-m
tmux send-keys -tdjangodash:2 'cd ~/Code/Python/djangodash/; . env/bin/activate.fish; clear' C-m

tmux select-window -tdjangodash:0
tmux attach-session -d -tdjangodash