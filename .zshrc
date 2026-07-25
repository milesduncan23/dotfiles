# ~/.zshrc

CONFIG="$HOME/.config/zsh"

source "$CONFIG/common.zsh"
source "$CONFIG/alias.zsh"

machine="$(hostname -s)"
[[ -f "$CONFIG/${machine}.zsh" ]] &&
    source "$CONFIG/${machine}.zsh"

source "$CONFIG/plugins.zsh"
