function get-api-key -a job_code --description "Pull an AI API key from 1Password"
    set upper_profile "$(string upper $job_code)"
    # echo "$upper_profile"

    set OP_VAULT "Employee"
    set OP_ENTRY "Anthropic - $upper_profile"
    set OP_FIELD "credential"

    set OP_URL "op://$OP_VAULT/$OP_ENTRY/$OP_FIELD"
    # echo "Attempting to read secret from $OP_URL..."

    echo "$(op read $OP_URL)"

    # set api_key_start (string shorten --char="" -m12 "$ANTHROPIC_API_KEY")
    # set api_key_end (string shorten -N -l --char="" -m8 "$ANTHROPIC_API_KEY")
    # echo "Using key '$api_key_start…$api_key_end'."
    # echo "Using profile: $OP_ENTRY."
end
