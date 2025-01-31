#!/bin/sh
cd Code/django-dash

tmux start-server
tmux new-session -d -s django-dash -n git
tmux new-window -tdjango-dash:1 -n docker
tmux new-window -tdjango-dash:2 -n frontend
tmux new-window -tdjango-dash:3 -n test

tmux send-keys -tdjango-dash:0 'clear' C-m
tmux send-keys -tdjango-dash:1 'dc up'
tmux send-keys -tdjango-dash:2 'cd frontend; npm run dev'
tmux send-keys -tdjango-dash:3 'just test'

tmux select-window -tdjango-dash:0
tmux attach-session -d -tdjango-dash
