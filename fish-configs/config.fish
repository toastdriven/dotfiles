# So ssh-agent behaves itself.
ssh-add ~/.ssh/id_rsa

# Bump dat ulimit.
ulimit -n 4096

# Ensure pyenv is working.
pyenv init - | source
