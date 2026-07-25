# Aliases
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias cls='clear'

alias awake='systemd-inhibit --what=idle:sleep --mode=block --why="User Sleep Inhibit" sleep infinity'
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
