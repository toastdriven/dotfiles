#!/bin/sh
tmux start-server
tmux new-session -d -s Haystack -n git
tmux new-window -tHaystack:1 -n test
tmux new-window -tHaystack:2 -n solr
tmux new-window -tHaystack:3 -n spatial-solr
tmux new-window -tHaystack:4 -n elasticsearch
tmux new-window -tHaystack:5 -n docs
tmux new-window -tHaystack:6 -n runserver
tmux new-window -tHaystack:7 -n utility
tmux new-window -tHaystack:8 -n xapian_haystack
tmux new-window -tHaystack:9 -n xapian_test

tmux send-keys -tHaystack:0 'cd ~/Code/Python/django-haystack; clear' C-m
tmux send-keys -tHaystack:1 'cd ~/Code/Python/django-haystack/tests/; export PYTHONPATH=`pwd`; clear' C-m
tmux send-keys -tHaystack:2 'cd ~/Code/solr-3.5; clear; ./run-solr.sh' C-m
tmux send-keys -tHaystack:3 'cd ~/Code/solr-3.5-spatial; clear; ./run-solr.sh' C-m
tmux send-keys -tHaystack:4 'elasticsearch -f -D es.config=/Users/daniel/Code/elasticsearch.yml' C-m
tmux send-keys -tHaystack:5 'cd ~/Code/Python/django-haystack/docs; clear' C-m
tmux send-keys -tHaystack:6 'cd ~/Code/Python/all_django_projects/ds_recipe_testbed; clear; . env/bin/activate; ./env/bin/python manage.py runserver'
tmux send-keys -tHaystack:7 'cd ~/Code/Python/all_django_projects/ds_recipe_testbed; clear' C-m
tmux send-keys -tHaystack:8 'cd ~/Code/Python/xapian-haystack; clear' C-m
tmux send-keys -tHaystack:9 'cd ~/Code/Python/xapian-django-haystack/tests/; export PYTHONPATH=`pwd`; clear' C-m

tmux select-window -tHaystack:0
tmux attach-session -d -tHaystack
