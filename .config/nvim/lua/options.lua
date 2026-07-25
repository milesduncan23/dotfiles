local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = false

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true

-- Display
opt.wrap = false
opt.cursorline = true
opt.signcolumn = "auto"

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Misc
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.swapfile = false
opt.updatetime = 250
