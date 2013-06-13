# MAH PROMPTS!
export PS1="\[\033[G\][\u@\h:\W] "

# Make sure Xcode build for the right OS.
export MACOSX_DEPLOYMENT_TARGET=10.8

# Ugh. This is ugly & sucks.
# History is painful.
PATH="/usr/local/Cellar/python/2.7/bin:/usr/local/lib/luarocks/bin:/usr/local/Cellar/node/0.4.8/bin:/usr/local/texlive/2011/bin/x86_64-darwin:/usr/local/share/python:/usr/local/bin:/usr/local/sbin:${PATH}"
export PATH

# tmux needs ``TERM=screen`` to play nice.
export EDITOR="vim"
export TERM="screen"
export VIM_APP_DIR="/Applications/MyApplications/Programming"
export RUBYOPT=rubygems
export PIP_DOWNLOAD_CACHE='/tmp/pip'
export NODE_PATH='/usr/local/lib/node'
export ARCHFLAGS='-arch x86_64'
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin

# For ghetto-git bits.
source ~/gitprompt.sh
export WORKON_HOME=$HOME/.virtualenvs

# So ssh-agent behaves itself.
ssh-add ~/.ssh/id_rsa

# Conveniences.
alias ls="ls -G"
alias ipy="ipython"
alias destroy-all-pyc="find . -name \*.pyc -delete"
alias mate='open -a TextMate.app'
alias gitx='open -a GitX.app'
alias mvim='open -a MacVim.app'
alias st='subl -n'
# RunSnakeRun is a PITA on OS X. Make it work.
alias runsnake='VERSIONER_PYTHON_PREFER_32_BIT=yes /usr/local/bin/runsnake'

# Mighty tmux environments are MIGHTY!
for file in ~/tmux-envs/*.sh
do
    filename=$(basename "$file")
    filename="${filename%.*}"
    alias $filename=$file
done
