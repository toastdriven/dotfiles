function fish_prompt
    set user (whoami)
    set full_host (string split -n -m 1 "." (hostname))
    set small_host $full_host[1]
    set current_dir (basename (pwd))

    set_color blue
    echo -n "["
    set_color normal
    echo -n "$user@$small_host:"
    set_color green
    echo -n "$current_dir"
    set_color blue
    echo -n "]"
    set_color normal
    echo -n ": "
end
