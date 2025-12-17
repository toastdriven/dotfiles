#!/bin/sh
cd ~/Code/td_v4

tmux start-server
tmux new-session -d -s toastdriven -n git
tmux new-window -ttoastdriven:1 -n docker
tmux new-window -ttoastdriven:2 -n shell

tmux send-keys -ttoastdriven:0 'clear' C-m
tmux send-keys -ttoastdriven:1 'clear' C-m
tmux send-keys -ttoastdriven:1 'just serve'
tmux send-keys -ttoastdriven:2 'clear' C-m
tmux send-keys -ttoastdriven:2 'just shell'

tmux select-window -ttoastdriven:0
tmux attach-session -d -ttoastdriven
