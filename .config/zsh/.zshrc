# ~/.zshrc

typeset -U path PATH
CONFIG="$HOME/.config/zsh"
MACHINE="$(hostname -s)"

# SSH Agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# zsh Config Loading
source "$CONFIG/common.zsh"
source "$CONFIG/alias.zsh"

[[ -f "$CONFIG/profiles/${MACHINE}/local.zsh" ]] &&
    source "$CONFIG/profiles/${MACHINE}/local.zsh"

source "$CONFIG/plugins.zsh"
