# Set my custom Zsh prompt.
PROMPT="%F{blue}[%f%n@%m:%F{green}%1~%F{cyan}%F{blue}]%f: "
# Single quotes are important here!
RPROMPT='$(git_prompt_zsh)'
