# ================
# repo pull
# ================

git clone --bare https://github.com/milesduncan23/dotfiles.git "$HOME/.dotfiles"
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

mkdir -p "$HOME/.dotfiles-backup"
dots checkout 2>&1 | grep -E '^\s+\.' | awk '{print $1}' | \
  xargs -I{} sh -c 'mkdir -p "$HOME/.dotfiles-backup/$(dirname {})"; mv "$HOME/{}" "$HOME/.dotfiles-backup/{}"'
dots checkout

dots config status.showUntrackedFiles no
dots config pull.ff only
dots branch --set-upstream-to=origin/main main
dots remote set-url --push origin DISABLED

dots submodule update --init --recursive

mkdir -p "$HOME/.config/zsh/.local"
printf 'export PROFILE="server"\n' > "$HOME/.config/zsh/.local/profile.zsh"

dots pull

# ================
# nvim install
# ================

cd /tmp
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
