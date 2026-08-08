#!/bin/sh
tmux start-server
tmux new-session -d -s watchlist -n git
tmux new-window -twatchlist:1 -n compose
tmux new-window -twatchlist:2 -n test
tmux new-window -twatchlist:3 -n run

tmux send-keys -twatchlist:0 'cd ~/Code/watchlist; clear' C-m
tmux send-keys -twatchlist:1 'cd ~/Code/watchlist; clear' C-m
tmux send-keys -twatchlist:1 'dc up'
tmux send-keys -twatchlist:2 'cd ~/Code/watchlist; clear' C-m
tmux send-keys -twatchlist:2 'dc run --rm web bash -c "uv run src/manage.py test"'
tmux send-keys -twatchlist:3 'cd ~/Code/watchlist; clear' C-m
tmux send-keys -twatchlist:3 ''

tmux select-window -twatchlist:0
tmux attach-session -d -twatchlist
