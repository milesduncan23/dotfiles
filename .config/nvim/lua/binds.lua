vim.g.mapleader = ":"

vim.keymap.set(
    "n",
    "<leader>p",
    "<cmd>NeovimProjectDiscover history<CR>",
    { desc = "Projects" }
)

vim.api.nvim_create_autocmd("User", {
    pattern = "SessionLoadPost",
    callback = function()
        vim.cmd("Neotree filesystem show left")
    end,
})
