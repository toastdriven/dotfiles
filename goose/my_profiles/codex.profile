# Ref: https://block.github.io/goose/docs/getting-started/providers/#configure-provider-and-model
set -x GOOSE_PROVIDER "chatgpt_codex"
set -x GOOSE_MODEL "gpt-5.2-codex"

# Ref: https://block.github.io/goose/docs/guides/environment-variables
# set -x GOOSE_TEMPERATURE 0.7
# set -x GOOSE_MAX_TOKENS 16000

set -x CONTEXT_FILE_NAMES '["AGENTS.md", "CLAUDE.md", ".goosehints"]'

set -x GOOSE_MODE "smart_approve"
set -x GOOSE_RANDOM_THINKING_MESSAGES true

# set -x GOOSE_CLI_SHOW_COST false
# set -x GOOSE_MAX_TURNS 25
