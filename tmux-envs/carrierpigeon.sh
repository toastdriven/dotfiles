#!/bin/sh
tmux start-server
tmux new-session -d -s carrierpigeon -n git
tmux new-window -tcarrierpigeon:1 -n test
tmux new-window -tcarrierpigeon:2 -n run

tmux send-keys -tcarrierpigeon:0 'cd ~/Code/carrierpigeon; clear' C-m
tmux send-keys -tcarrierpigeon:1 'cd ~/Code/carrierpigeon; poetry shell' C-m
tmux send-keys -tcarrierpigeon:1 'pytest tests'
tmux send-keys -tcarrierpigeon:2 'cd ~/Code/carrierpigeon; poetry shell' C-m
tmux send-keys -tcarrierpigeon:2 ''

tmux select-window -tcarrierpigeon:0
tmux attach-session -d -tcarrierpigeon
