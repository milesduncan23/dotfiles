MACHINE="$(hostname -s)"

# History
HISTFILE="$HOME/.config/zsh/$MACHINE/.history"
HISTSIZE=50000
SAVEHIST=50000

setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Prompt
PROMPT='%F{blue}%n@%m%f %F{green}%~%f %# '

# Environment variables
export PATH="$HOME/.local/bin:$PATH"
export SUDO_EDITOR="$HOME/.local/bin/nvim-sudoedit"
export EDITOR=nvim
export VISUAL=nvim

# Smart CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt AUTO_CD

# Globbing
setopt EXTENDED_GLOB
setopt NULL_GLOB
