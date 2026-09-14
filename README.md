In order to enable ssh-agent.service with systemd:

systemctl --user daemon-reload
systemctl --user enable --now ssh-agent.service

To install nvim latest release (for non-arch package databases)

cd /tmp
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
