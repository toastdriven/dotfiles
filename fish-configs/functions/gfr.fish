function gfr -a branch --description 'Git Fetch & Reset (+ stashing)'
    git stash && \
    git co $branch && \
    git fetch && \
    git reset --hard origin/$branch && \
    git stash pop
end
