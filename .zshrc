# ~/.zshrc

CONFIG="$HOME/.config/zsh"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

machine="$(hostname -s)"
[[ -f "$CONFIG/${machine}.zsh" ]] &&
    source "$CONFIG/${machine}.zsh"

source "$CONFIG/common.zsh"
source "$CONFIG/alias.zsh"
source "$CONFIG/plugins.zsh"
