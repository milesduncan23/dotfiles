#!/usr/bin/env bash
# Bootstrap miles' dotfiles on a Debian LXC. Run as user `miles` (needs sudo).
set -euo pipefail

REPO="https://github.com/milesduncan23/dotfiles.git"
dots() { git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"; }

echo "==> 1/7 packages"
sudo apt-get update -qq
sudo apt-get install -y -qq git zsh curl ca-certificates

echo "==> 2/7 neovim into /opt (server.zsh hardcodes this path)"
if [ ! -x /opt/nvim-linux-x86_64/bin/nvim ]; then
    tmp=$(mktemp -d)
    curl -fsSL -o "$tmp/nvim.tar.gz" \
        https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    sudo tar -C /opt -xzf "$tmp/nvim.tar.gz"
    rm -rf "$tmp"
fi
/opt/nvim-linux-x86_64/bin/nvim --version | head -1

echo "==> 3/7 bare clone (anonymous HTTPS)"
if [ ! -d "$HOME/.dotfiles" ]; then
    git clone --bare "$REPO" "$HOME/.dotfiles"
fi
# clone --bare sets NO fetch refspec, so origin/main would not exist
dots config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
dots config core.bare false   # git submodule refuses to run when true
dots config --local status.showUntrackedFiles no
dots config --local pull.ff only
dots remote set-url --push origin DISABLED
dots fetch origin

echo "==> 4/7 checkout, backing up any conflicts"
mkdir -p "$HOME/.dotfiles-backup"
if ! out=$(dots checkout 2>&1); then
    printf '%s\n' "$out" | grep -E '^[[:space:]]+\.' | awk '{print $1}' | while read -r f; do
        mkdir -p "$HOME/.dotfiles-backup/$(dirname "$f")"
        mv "$HOME/$f" "$HOME/.dotfiles-backup/$f"
        echo "    backed up: $f"
    done
    dots checkout
fi

echo "==> 5/7 submodules (plugins.zsh sources these unconditionally)"
cd "$HOME"
dots submodule update --init --recursive
for f in zsh-autosuggestions/zsh-autosuggestions.zsh \
         zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; do
    test -f "$HOME/.config/zsh/plugins/$f" || { echo "MISSING $f" >&2; exit 1; }
done

echo "==> 6/7 machine-local bits (never tracked, never travel)"
mkdir -p "$HOME/.config/zsh/.local"
echo 'export PROFILE="server"' > "$HOME/.config/zsh/.local/profile.zsh"
cat > "$HOME/.dotfiles/info/exclude" <<'EOF'
/.ssh
/.config/zsh/.local/
EOF

echo "==> 7/7 shell"
sudo chsh -s /usr/bin/zsh "$USER"

echo
echo "verifying..."
zsh -n "$HOME/.config/zsh/.zshrc" && echo "  .zshrc syntax OK"
zsh -i -c 'print "  PROFILE=$PROFILE"; print "  EDITOR=$EDITOR"; print "  HISTFILE=$HISTFILE"'
echo "done. log out and back in for zsh."
