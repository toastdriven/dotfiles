RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_YELLOW="\[\033[1;33m\]"
LIGHT_GREEN="\[\033[1;32m\]"
LIGHT_BLUE="\[\033[1;34m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
COLOR_NONE="\[\e[0m\]"

function parse_git_branch () {
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^# On branch ([^${IFS}]*)"
  remote_pattern="# Your branch is (.*) of"
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ! ${git_status}} =~ "working directory clean" ]]; then
    # state="${RED} ✕"
    state=$RED
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    # if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
    #   remote="${YELLOW} ↑"
    # else
    #   remote="${YELLOW} ↓"
    # fi
    state=$YELLOW
  fi
  # if [[ ${git_status} =~ ${diverge_pattern} ]]; then
  #   remote="${YELLOW} ↕"
  # fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo " ${state}(${branch})${COLOR_NONE}${remote}"
  fi
}

function prompt_func () {
    previous_return_value=$?;
    # prompt="${TITLEBAR}$BLUE[$RED\w$GREEN$(__git_ps1)$YELLOW$(git_dirty_flag)$BLUE]$COLOR_NONE "
    # prompt="${TITLEBAR}${BLUE}[${LIGHT_GRAY}\u@\h:${RED}\w${GREEN}$(__git_ps1)${BLUE}]${LIGHT_GRAY}:${COLOR_NONE} "
    prompt="${TITLEBAR}${BLUE}[${LIGHT_GRAY}\u@\h:${GREEN}\W${GREEN}$(parse_git_branch)${BLUE}]${LIGHT_GRAY}:${COLOR_NONE} "
    # if test $previous_return_value -eq 0
    # then
    #     PS1="${GREEN}☮ ${prompt}"
    # else
    #     PS1="${RED}✖ ${prompt}"
    # fi
    PS1=$prompt
}

PROMPT_COMMAND=prompt_func