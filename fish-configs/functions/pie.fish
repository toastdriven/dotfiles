function pie -a profile --wraps="pi" --description 'A profile-based version of pi'
    set pi_bin "/opt/homebrew/bin/pi"
    set -l oauth_profile_names "personal" "codex"
    set is_oauth 0
    # Oauth credentials
    set orig_auth_path "$HOME/.pi/agent/auth.json"
    set bak_auth_path "$HOME/.pi/agent/nope.auth.json"

    # Clear the variables.
    set -u ANTHROPIC_API_KEY
    set -u ANTHROPIC_OAUTH_TOKEN

    # Determine if the profile is API Key-based or Oauth-based.
    if contains "$profile" $oauth_profile_names
        set is_oauth 1
    end

    if test $is_oauth -eq 0
        # For non-Oauth profiles.
        echo "Shuffling away the Oauth credentials..."
        mv $orig_auth_path $bak_auth_path

        set -x ANTHROPIC_API_KEY "$(get-api-key $profile)"
        echo "Using profile: Claude ($profile)."
    else
        echo "Restoring the Oauth credentials..."
        # Copy them over only if they're not already there.
        # If it's there, assume it's more current.
        cp $bak_auth_path $orig_auth_path

        echo "Using profile: Claude (Oauth-based)."
    end

    $pi_bin $argv[2..-1]
    return $status
end
