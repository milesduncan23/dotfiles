# ~/.zshrc

typeset -U path PATH
CONFIG="$HOME/.config/zsh"

# SSH Agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# zsh Config Loading
source "$CONFIG/common.zsh"
source "$CONFIG/alias.zsh"

machine="$(hostname -s)"
[[ -f "$CONFIG/${machine}/local.zsh" ]] &&
    source "$CONFIG/${machine}/local.zsh"

source "$CONFIG/plugins.zsh"

# Fetch on source
unifetch
