function honk -a profile --wraps="goose" --description 'A profile-based version of goose'
    set goose_bin "$HOME/.local/bin/goose"
    set profile_dir "$HOME/.config/goose/my_profiles/"
    set -l oauth_profile_names "personal" "codex"
    set is_oauth 0

    if test -z "$profile"
        $goose_bin $argv
        return $status
    end

    # Determine if the profile is API Key-based or Oauth-based.
    if contains "$profile" $oauth_profile_names
        set is_oauth 1
    end

    # Load the profile file, if found.
    set profile_path "$profile_dir/$profile.profile"

    if test -f "$profile_path"
        source $profile_path
    end

    # Either set the API Key or not, & provided helpful messages about what's being used.
    if test $is_oauth -eq 0
        # For non-Oauth profiles.
        set -x ANTHROPIC_API_KEY "$(get-api-key $profile)"

        set api_key_start (string shorten --char="" -m12 "$ANTHROPIC_API_KEY")
        set api_key_end (string shorten -N -l --char="" -m8 "$ANTHROPIC_API_KEY")
        echo "Using profile: $profile ('$api_key_start…$api_key_end')."
    else
        if test "$profile" = "codex"
            echo "Using profile: Codex (Oauth-based)."
        else
            echo "Using profile: Claude (Oauth-based)."
        end
    end

    $goose_bin $argv[2..-1]
    return $status
end
