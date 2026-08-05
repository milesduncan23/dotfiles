# Temporary fix due to neovim versioning in debian package libraries
export PATH="/opt/nvim-linux-x86_64/bin:$PATH"
export EDITOR=/opt/nvim-linux-x86_64/bin/nvim
export VISUAL=/opt/nvim-linux-x86_64/bin/nvim

export PATH="/usr/local/bin:$PATH"
# Note to self: do we actually need this path line above? it might already be loaded by default!
