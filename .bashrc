#
# ~/.bashrc
#
# Fallback Config

export EDITOR=nvim
export VISUAL=nvim
export PATH="$HOME/.local/bin:$PATH"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias awake='systemd-inhibit --what=idle:sleep --mode=block --why="User Sleep Inhibit" sleep infinity'

# Fallback Shell Prompt
PS1='[\u@\h \W]\$ '
