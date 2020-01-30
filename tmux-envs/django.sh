#!/bin/sh
tmux start-server
tmux new-session -d -s Django -n git
tmux new-window -tDjango:1 -n py3
tmux new-window -tDjango:2 -n pypy
tmux new-window -tDjango:3 -n test3
tmux new-window -tDjango:4 -n docs

tmux send-keys -tDjango:0 'cd ~/Code/Python/django; clear' C-m
tmux send-keys -tDjango:1 'cd ~/Code/Python/django; . env3/bin/activate.fish; clear' C-m
tmux send-keys -tDjango:2 'cd ~/Code/Python/django; clear' C-m
tmux send-keys -tDjango:2 '. envpy/bin/activate.fish'
tmux send-keys -tDjango:3 'cd ~/Code/Python/django; . env3/bin/activate.fish; cd tests; clear' C-m
tmux send-keys -tDjango:4 'cd ~/Code/Python/django; . env3/bin/activate.fish; cd /docs; clear' C-m

tmux select-window -tDjango:0
tmux attach-session -d -tDjango
