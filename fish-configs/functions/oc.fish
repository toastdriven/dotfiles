function oc -a profile --description 'opencode wrapper with profile support'
    # Handle help flag
    if contains -- --help $argv; or contains -- -h $argv
        echo "Usage: oc [PROFILE]"
        echo ""
        echo "Options:"
        echo "  PROFILE    Use a specific opencode profile from ~/.config/opencode/my_profiles/"
        echo "  -h, --help Show this help message"
        echo ""
        echo "Examples:"
        echo "  oc              # Run opencode with default config"
        echo "  oc work         # Run opencode with ~/.config/opencode/my_profiles/work.jsonc"
        return 0
    end

    # Unset OPENCODE_CONFIG to ensure clean state
    set -e OPENCODE_CONFIG

    # If profile is provided
    if test -n "$profile"
        set config_path "$HOME/.config/opencode/my_profiles/$profile.jsonc"

        # Validate that the profile file exists
        if not test -f "$config_path"
            echo "Error: Profile '$profile' not found at $config_path"
            return 1
        end

        # Set the config path and run opencode
        set -x OPENCODE_CONFIG "$config_path"
        echo "Using profile '$profile' ($config_path)"
        opencode $argv[2..-1]
    else
        # No profile, just run opencode
        opencode $argv
    end
end
