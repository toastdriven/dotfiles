function fish_right_prompt
    set git_branch (git_prompt)
    set _result $status

    if test -z "$git_branch"
        echo ""
        return
    end

    switch $_result
        case 0
            set_color -o green
            echo "$git_branch✓"
            set_color normal
        case 1
            set_color -o red
            echo "$git_branch✖"
            set_color normal
        case '*'
            set_color -o yellow
            echo "$git_branch?"
            set_color normal
    end
end
