#!/bin/sh
tmux start-server
tmux new-session -d -s Tastypie -n git
tmux new-window -tTastypie:1 -n test
tmux new-window -tTastypie:2 -n docs

tmux send-keys -tTastypie:0 'cd ~/Code/Python/django-tastypie; clear' C-m
tmux send-keys -tTastypie:1 'cd ~/Code/Python/django-tastypie; export PYTHONPATH=`pwd`:`pwd`/tests; cd tests; clear' C-m
tmux send-keys -tTastypie:2 'cd ~/Code/Python/django-tastypie/docs; clear' C-m

tmux select-window -tTastypie:0
tmux attach-session -d -tTastypie