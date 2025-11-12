function goose --wraps="goose" --description 'goose, but checking API keys first'
    if test "$ANTHROPIC_API_KEY" = ""
        echo "No Anthropic key set!"
        return 1
    end

    set api_key_start (string shorten --char="" -m12 "$ANTHROPIC_API_KEY")
    set api_key_end (string shorten -N -l --char="" -m8 "$ANTHROPIC_API_KEY")
    echo "Using key '$api_key_start…$api_key_end'."

    $HOME/.local/bin/goose $argv;
end
