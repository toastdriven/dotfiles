#!/bin/sh
tmux start-server
tmux new-session -d -s pysolr -n git
tmux new-window -tpysolr:1 -n test2
tmux new-window -tpysolr:2 -n test3
tmux new-window -tpysolr:3 -n solr4

tmux send-keys -tpysolr:0 'cd ~/Code/Python/pysolr; clear' C-m
tmux send-keys -tpysolr:1 'cd ~/Code/Python/pysolr; . env2/bin/activate; clear' C-m
tmux send-keys -tpysolr:1 'python -m unittest2 tests'
tmux send-keys -tpysolr:2 'cd ~/Code/Python/pysolr; . env3/bin/activate; clear' C-m
tmux send-keys -tpysolr:2 'python -m unittest tests'
tmux send-keys -tpysolr:3 'cd ~/Code/Python/pysolr/solr4; clear; java -jar start.jar' C-m

tmux select-window -tpysolr:0
tmux attach-session -d -tpysolr
