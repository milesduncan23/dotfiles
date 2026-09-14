# Path
export PATH="$HOME/.local/bin:$PATH"

export QSYS_ROOTDIR="/home/miles/.altera_lite/25.1std/quartus/sopc_builder/bin"

# -----------------------------
# Aliases
# -----------------------------

# Misc. Aliases
alias ts-on='sudo systemctl start tailscaled && sudo tailscale up'
alias ts-off='sudo tailscale down && sudo systemctl stop tailscaled'

alias bt-on='sudo systemctl start bluetooth && { blueman-applet >/dev/null 2>&1 &!; }'
alias bt-off='pkill -x blueman-applet 2>/dev/null; sudo systemctl stop bluetooth'

# Temporary one-shot fix for the ethernet adapter
alias eth='sudo ethtool enp72s0u2c2'

# -----------------------------
# CUPS printer stack controls
# -----------------------------

cups-off() {
    sudo systemctl disable --now cups.service cups.socket cups.path 2>/dev/null
    sudo systemctl disable --now cups-browsed.service 2>/dev/null
    sudo systemctl disable --now avahi-daemon.service avahi-daemon.socket 2>/dev/null

    echo "-------- CUPS Stack Status --------"
    systemctl is-enabled cups.service cups.socket cups.path 2>/dev/null
    systemctl is-active cups.service cups.socket cups.path 2>/dev/null
    echo "-------- Discovery Status --------"
    systemctl is-enabled cups-browsed.service avahi-daemon.service avahi-daemon.socket 2>/dev/null
    systemctl is-active cups-browsed.service avahi-daemon.service avahi-daemon.socket 2>/dev/null
}

cups-on() {
    sudo systemctl enable --now cups.socket
    sudo systemctl enable --now cups.path 2>/dev/null
    # Leaving cups.service disabled so it only starts when needed.
    sudo systemctl disable cups.service 2>/dev/null

    echo "-------- CUPS status --------"
    systemctl is-enabled cups.service cups.socket cups.path 2>/dev/null
    systemctl is-active cups.service cups.socket cups.path 2>/dev/null
}

cups-on-full() {
    sudo systemctl enable --now cups.socket cups.path 2>/dev/null
    sudo systemctl enable --now cups.service
    sudo systemctl enable --now cups-browsed.service 2>/dev/null
    sudo systemctl enable --now avahi-daemon.service avahi-daemon.socket 2>/dev/null

    echo "-------- CUPS Stack Status --------"
    systemctl is-enabled cups.service cups.socket cups.path cups-browsed.service avahi-daemon.service avahi-daemon.socket 2>/dev/null
    systemctl is-active cups.service cups.socket cups.path cups-browsed.service avahi-daemon.service avahi-daemon.socket 2>/dev/null
}

cups-status() {
    systemctl status cups.service cups.socket cups.path 2>/dev/null

    echo "-------- CUPS Browsing / Discovery --------"
    systemctl status cups-browsed.service avahi-daemon.service avahi-daemon.socket 2>/dev/null
    echo "-------- Listening Sockets --------"
    ss -ltnup 2>/dev/null | grep -Ei 'cups|:631' || true
    ss -lx 2>/dev/null | grep -Ei 'cups|ipp' || true
}

# -----------------------------
# Application Completions
# -----------------------------

# Set func path
fpath=("$HOME/.config/zsh/$MACHINE/zfunc" $fpath)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/miles/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/miles/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/miles/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/miles/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
