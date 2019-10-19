git_prompt() {
    _git_info=""
    _git_branch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"

    if [[ $? != 0 ]]; then
        return
    fi

    _git_status="$(git status -s)"

    if [[ $? != 0 ]]; then
        return
    fi

    if [[ -z $_git_status ]]; then
        _git_info="%F{cyan}${_git_branch}%f"
    else
        _git_info="%F{red}${_git_branch}✖%f"
    fi
}
