#!/bin/sh
tmux start-server
tmux new-session -d -s helm -n git
tmux new-window -thelm:1 -n test
tmux new-window -thelm:2 -n runserver
tmux new-window -thelm:3 -n redis
tmux new-window -thelm:4 -n listener

tmux send-keys -thelm:0 'cd ~/Work/helm/; clear' C-m
tmux send-keys -thelm:1 'cd ~/Work/helm/; . env/bin/activate; clear' C-m
tmux send-keys -thelm:2 'cd ~/Work/helm/; . env/bin/activate; clear' C-m
tmux send-keys -thelm:2 './manage.py runserver'
tmux send-keys -thelm:3 'cd ~/Work/helm/redis/src; clear; ./redis-server' C-m
tmux send-keys -thelm:4 'cd ~/Work/helm/; . env/bin/activate; clear' C-m
tmux send-keys -thelm:4 'python general/listener.py'

tmux select-window -thelm:0
tmux attach-session -d -thelm