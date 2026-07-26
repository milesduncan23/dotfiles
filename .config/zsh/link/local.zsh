# Temporary fix due to neovim versioning in debian package libraries
export PATH="/opt/nvim-linux-x86_64/bin:$PATH"
export EDITOR=/opt/nvim-linux-x86_64/bin/nvim
export VISUAL=/opt/nvim-linux-x86_64/bin/nvim

# Vaultwarden
alias vw='sudo docker compose -f /srv/vaultwarden/compose.yaml'

vw-on() (
        sudo systemctl start docker.service
        vw up -d
)

vw-off() (
        vw down
        sudo systemctl stop docker.socket docker.service containerd.service
)
