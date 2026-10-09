# Aliases
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias cls='clear'

dots-pull() (
        dots pull origin main || return
        dots submodule update --init --recursive
)

dots-check() (
        dots fetch -q origin
        dots log --oneline main..origin/main
)
