# ~/.zshrc

CONFIG="$HOME/.config/zsh"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

source "$CONFIG/common.zsh"
source "$CONFIG/alias.zsh"

machine="$(hostname -s)"
[[ -f "$CONFIG/${machine}/local.zsh" ]] &&
    source "$CONFIG/${machine}/local.zsh"

source "$CONFIG/plugins.zsh"
