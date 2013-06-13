#!/bin/sh
tmux start-server
tmux new-session -d -s Django -n git
tmux new-window -tDjango:1 -n py2
tmux new-window -tDjango:2 -n py3
tmux new-window -tDjango:3 -n pypy
tmux new-window -tDjango:4 -n test2
tmux new-window -tDjango:5 -n test3
tmux new-window -tDjango:6 -n docs

tmux send-keys -tDjango:0 'cd ~/Code/Python/django; clear' C-m
tmux send-keys -tDjango:1 'cd ~/Code/Python/django; . env2/bin/activate; clear' C-m
tmux send-keys -tDjango:2 'cd ~/Code/Python/django; . env3/bin/activate; clear' C-m
tmux send-keys -tDjango:3 'cd ~/Code/Python/django; . envpy/bin/activate; clear' C-m
tmux send-keys -tDjango:4 'cd ~/Code/Python/django; . env2/bin/activate; cd tests; clear' C-m
tmux send-keys -tDjango:5 'cd ~/Code/Python/django; . env3/bin/activate; cd tests; clear' C-m
tmux send-keys -tDjango:6 'cd ~/Code/Python/django; . env2/bin/activate; cd /docs; clear' C-m

tmux select-window -tDjango:0
tmux attach-session -d -tDjango
