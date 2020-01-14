function git_prompt
    set _git_info ""
    set _git_branch (git rev-parse --abbrev-ref HEAD 2> /dev/null)

    if test $status -ne 0
        echo $_git_info
        return 0
    end

    set _git_status (git status -s)

    if test $status -ne 0
        echo $_git_info
        return 0
    end

    echo $_git_branch

    if test -z "$_git_status"
        return 0
    else
        return 1
    end

    return 2
end
