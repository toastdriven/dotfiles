# Human-readable colors.
# Per https://wiki.archlinux.org/index.php/Color_Bash_Prompt
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

# MAH PROMPTS!
export VCPROMPT_FORMAT='%b%m'
# export PS1="\[\033[G\][\u@\h:\W] \$(vcprompt) "
export PS1="\[$txtblu\][\[$txtrst\]\u@\h:\[$txtgrn\]\W \[$txtcyn\]\$(vcprompt)\[$txtblu\]]\[$txtrst\]: "
# export PS1="\[\033[4;0m\]\u@\h\[\033[0;0m\]:[\[\033[1;32m\]\w\[\033[0;0m\]] \[\033[1;36m\]\$(vcprompt)\[\033[0;0m\]\n`echo -e '\xE2\x98\x85\x0A'`  "
# export PS1="\[$txtblu\][\[$txtrst\]\u@\h:\[$txtgrn\]\W\[$txtblu\]]\[$txtrst\]: (\t) \[$txtgrn\]\$(vcprompt)\[$txtrst\]\n\[$txtgrn\]$\[$txtrst\] "

# Make sure Xcode build for the right OS.
export MACOSX_DEPLOYMENT_TARGET=10.13

# Ugh. This is ugly & sucks.
# History is painful.
PATH="/Users/daniel/Library/Python/3.7/bin:/Users/daniel/Library/Python/2.7/bin:/usr/local/bin:/usr/local/Cellar/python/2.7/bin:/usr/local/packer:/usr/local/sbin:${PATH}"
export PATH
export PATH=$PATH:/usr/local/Cellar/go/1.2.1/libexec/bin

# tmux needs ``TERM=screen`` to play nice.
export EDITOR="vim"
export TERM="screen"
export VIM_APP_DIR="/Applications/MyApplications/Programming"
export RUBYOPT=rubygems
export PIP_DOWNLOAD_CACHE='/tmp/pip'
export NODE_PATH='/usr/local/lib/node'
export ARCHFLAGS='-arch x86_64'
export PATH=$PATH:$GOROOT/bin
export COPYFILE_DISABLE=true
export WORKON_HOME=$HOME/.virtualenvs

# For Go.
# export GOROOT=/usr/local/go
export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin


# So ssh-agent behaves itself.
ssh-add ~/.ssh/id_rsa

# Conveniences.
alias ls="ls -G"
alias ipy="ipython"
alias destroy-all-pyc="find . -name \*.pyc -delete"
alias mate='open -a TextMate.app'
alias gitx='open -a GitX.app'
alias mvim='open -a MacVim.app'
alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code -n'
# RunSnakeRun is a PITA on OS X. Make it work.
alias runsnake='VERSIONER_PYTHON_PREFER_32_BIT=yes /usr/local/bin/runsnake'
alias git-blame="echo It\'s your fault, idiot."
alias git-master="git co master && git fetch && git reset --hard origin/master"
alias make-lock="pip freeze -r requirements.txt > requirements-lock.txt"


# Bump dat ulimit.
ulimit -n 4096

# Mighty tmux environments are MIGHTY!
for file in ~/tmux-envs/*.sh
do
    filename=$(basename "$file")
    filename="${filename%.*}"
    alias $filename=$file
done

. "$HOME/.cargo/env"
