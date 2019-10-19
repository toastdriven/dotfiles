git_prompt() {
    _git_info=""
    _git_branch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"

    if [[ $? != 0 ]]; then
        echo $_git_info
        return 0
    fi

    _git_status="$(git status -s)"

    if [[ $? != 0 ]]; then
        echo $_git_info
        return 0
    fi

    echo "${_git_branch}"

    if [[ -z $_git_status ]]; then
        return 0
    else
        return 1
    fi

    return 2
}

git_prompt_zsh() {
    git_branch="$(git_prompt)"
    _result=$?

    if [[ -z $git_branch ]]; then
        echo ""
        return
    fi

    case $_result in
    0)
        echo "%{$fg_bold[green]%}${git_branch}✓%{$reset_color%}"
        ;;
    1)
        echo "%{$fg_bold[red]%}${git_branch}✖%{$reset_color%}"
        ;;
    *)
        echo "%{$fg_bold[yellow]%}${git_branch}?%{$reset_color%}"
        ;;
    esac
}
