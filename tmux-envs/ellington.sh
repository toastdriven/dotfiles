#!/bin/sh

# This is purely for historical records.
#
# The very first time I setup environments this way was while working on the
# Ellington CMS back in 2009. In order to work on search, a number of
# services had to be running locally.
#
# These were the days before `foreman` or `Docker`. Manually remembering &
# running them all by hand was painful. And I needed to be able to see the
# output from each at once, so just running them in the background didn't
# work.
#
# So with Alex Kritikos' (@akrito) help, I started creating these small
# scripts to run whole environments.
#
# And while I no longer have the Ellington codebase, there are many fond
# memories & some history here.

# tmux start-server
# tmux new-session -d -s Ellington -n runserver
# tmux new-window -tEllington:1 -n git
# tmux new-window -tEllington:2 -n test
# tmux new-window -tEllington:3 -n solr
# tmux new-window -tEllington:4 -n redis
# tmux new-window -tEllington:5 -n hosted
# tmux new-window -tEllington:6 -n marketplace
#
# tmux send-keys -tEllington:0 'e-me; clear' C-m
# tmux send-keys -tEllington:1 'cd ~/Code/Python/M4M/ellington; clear' C-m
# tmux send-keys -tEllington:2 'e-me; clear' C-m
# tmux send-keys -tEllington:3 'cd ~/Code/Python/M4M/new-solr/1.3.0; clear; ./run-solr.sh' C-m
# tmux send-keys -tEllington:4 'cd ~/Code/Python/M4M/redis-0.900; clear; ./redis-server' C-m
# tmux send-keys -tEllington:5 'cd ~/Code/Python/M4M/hosted; clear' C-m
# tmux send-keys -tEllington:6 'cd ~/Code/Python/M4M/marketplace; clear' C-m
#
# tmux select-window -tEllington:0
# tmux attach-session -d -tEllington

# Since there's nothing to run anymore, toss out a bit of reminiscence.
echo "BACKFILLING PUFFERFISH LOGS: ....E...F......."
