function pie -a profile --wraps="pi" --description 'A profile-based version of pi'
    set pi_bin "/opt/homebrew/bin/pi"
    # Due to potential Nix interference...
    set stat_bin "/usr/bin/stat"
    set cat_bin "/bin/cat"
    set -l oauth_profile_names "personal" "codex"
    set is_oauth 0

    # (Potential) Oauth credentials
    set orig_auth_path "$HOME/.pi/agent/auth.json"
    set orig_auth_mtime 0
    set orig_contents "{}"
    set bak_auth_path "$HOME/.pi/agent/nope.auth.json"
    set bak_auth_mtime 1
    set bak_contents "{}"

    # Clear the variables.
    set -u ANTHROPIC_API_KEY
    set -u ANTHROPIC_OAUTH_TOKEN

    # Determine if the profile is API Key-based or Oauth-based.
    if contains "$profile" $oauth_profile_names
        set is_oauth 1
    end

    # Determine if the Auth file should be backed up.
    if test -f $orig_auth_path
        set orig_auth_mtime ($stat_bin -f %m $orig_auth_path)
        set orig_contents (string trim (command $cat_bin $orig_auth_path))
    end

    if test -f $bak_auth_path
        set bak_auth_mtime ($stat_bin -f %m $bak_auth_path)
        set bak_contents (string trim (command $cat_bin $bak_auth_path))
    end

    # echo "Orig: $orig_contents"
    # echo "Bak: $bak_contents"

    if test $is_oauth -eq 0
        # For non-Oauth profiles.
        # Only backup the auth file if it's newer & non-empty (so we don't
        # overwrite creds).
        if test $orig_auth_mtime -gt $bak_auth_mtime
            if test "$orig_contents" != "{}"
                echo "Shuffling away the Oauth credentials..."
                mv $orig_auth_path $bak_auth_path
            end
        end

        set -x ANTHROPIC_API_KEY "$(get-api-key $profile)"
        echo "Using profile: Claude ($profile)."
    else
        # Only restore creds if the backup is non-empty & the orig is empty.
        if test "$bak_contents" != "{}"
            if test "$orig_contents" = "{}"
                echo "Restoring the Oauth credentials..."
                cp $bak_auth_path $orig_auth_path
            end
        end

        echo "Using profile: Claude (Oauth-based)."
    end

    $pi_bin $argv[2..-1]
    return $status
end
