#!/bin/sh
# First, open up GitX
tmux start-server
tmux new-session -d -s Forkinit -n runserver
tmux new-window -tForkinit:1 -n git
tmux new-window -tForkinit:2 -n test
tmux new-window -tForkinit:3 -n solr
tmux new-window -tForkinit:4 -n compass
tmux new-window -tForkinit:5 -n redis

tmux send-keys -tForkinit:0 'cd ~/Code/Python/all_django_projects/nomnomnom; clear' C-m
tmux send-keys -tForkinit:1 'cd ~/Code/Python/all_django_projects/nomnomnom; gitx .; clear' C-m
tmux send-keys -tForkinit:2 'cd ~/Code/Python/all_django_projects/nomnomnom; clear' C-m
tmux send-keys -tForkinit:3 'cd ~/Code/Python/all_django_projects/nomnomnom/solr; clear; ./run-solr.sh' C-m
tmux send-keys -tForkinit:4 'cd ~/Code/Python/all_django_projects/nomnomnom/sass; clear; compass -w' C-m
tmux send-keys -tForkinit:5 'cd ~/Code/Python/redis-1.2.2; clear; ./redis-server' C-m

tmux select-window -tForkinit:0
tmux attach-session -d -tForkinit