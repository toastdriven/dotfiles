function goose --wraps="goose" --description 'goose, but checking API keys first'
    if test "$ANTHROPIC_API_KEY" = ""
        echo "No Anthropic key set!"
        return 1
    end

    $HOME/.local/bin/goose $argv;
end
