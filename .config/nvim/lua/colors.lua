vim.opt.termguicolors = true

vim.cmd.colorscheme("luna")

local black_bg = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "SignColumn",
    "EndOfBuffer",
}

for _, group in ipairs(black_bg) do
    vim.api.nvim_set_hl(0, group, { bg = "#000000" })
end

vim.api.nvim_set_hl(0, "WinSeparator", {
    fg = "#555555",
    bg = "#222222",
})
