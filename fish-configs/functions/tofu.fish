function tofu --wraps="tofu" --description 'tofu, but checking AWS_PROFILE first'
    if test "$AWS_PROFILE" = ""
        echo "No AWS_PROFILE set!"
        return 1
    end

    echo "Using profile '$AWS_PROFILE'."

    /opt/homebrew/bin/tofu $argv;
end
