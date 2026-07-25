In order to enable ssh-agent.service with systemd:

systemctl --user daemon-reload
systemctl --user enable --now ssh-agent.service
