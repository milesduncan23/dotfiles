MACHINE="$(hostname -s)"

# Prompt
PROMPT='%F{blue}%n@%m%f %F{green}%~%f %# '

# Environment variables
export EDITOR=nvim
export VISUAL=nvim

# Fastfetch on source
fastfetch

# -----------------------------
# Opts
# -----------------------------

# History
HISTFILE="$HOME/.config/zsh/$MACHINE/.history"
HISTSIZE=50000
SAVEHIST=50000

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY

# Smart CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt AUTO_CD

# Globbing
setopt EXTENDED_GLOB
setopt NULL_GLOB
