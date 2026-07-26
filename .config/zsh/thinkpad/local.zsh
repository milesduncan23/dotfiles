MACHINE="$(hostname -s)"

# -----------------------------
# Aliases
# -----------------------------

# Misc. Aliases
alias ts-on='sudo systemctl start tailscaled && sudo tailscale up'
alias ts-off='sudo tailscale down && sudo systemctl stop tailscaled'

# LLM Aliases
LLM_DIR="$HOME/Applications/llm"

alias llm='cd -- "$LLM_DIR"'

llm-on() (
        cd -- "$LLM_DIR"
        sudo systemctl start docker.service
        docker compose up -d
)

llm-off() (
        cd -- "$LLM_DIR"
        docker compose down
        sudo systemctl stop docker.socket docker.service containerd.service
)

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

# Conda completion
if [[ -r "$HOME/Applications/anaconda3/etc/profile.d/conda.sh" ]]; then
    source "$HOME/Applications/anaconda3/etc/profile.d/conda.sh"
fi
