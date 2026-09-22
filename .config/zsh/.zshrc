# ~/.zshrc

typeset -U path PATH
CONFIG="$HOME/.config/zsh"

# zsh Config Loading
source "$CONFIG/common.zsh"
source "$CONFIG/alias.zsh"
source "$CONFIG/plugins.zsh"

# Profile
source "$CONFIG/.local/profile.zsh"

if [[ -n "$PROFILE" && -f "$CONFIG/profiles/$PROFILE.zsh" ]]; then
    source "$CONFIG/profiles/$PROFILE.zsh"
fi
