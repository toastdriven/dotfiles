function git-master
    git co master && git fetch && git reset --hard origin/master
end
