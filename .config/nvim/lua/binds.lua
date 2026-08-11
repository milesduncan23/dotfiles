vim.keymap.set(
    "n",
    "<leader>p",
    "<cmd>NeovimProjectDiscover history<CR>",
    { desc = "Projects" }
)

vim.keymap.set("n", "R", function()
    if vim.bo.buftype ~= "" then
        return
    end

    vim.cmd("SudaRead")
end, { desc = "Read file with sudo" })

vim.keymap.set(
    "n",
    "<leader>W",
    "<cmd>SudaWrite<CR>",
    { desc = "Write" }
)

vim.api.nvim_create_autocmd("User", {
    pattern = "SessionLoadPost",
    callback = function()
        vim.cmd("Neotree filesystem show left")
    end,
})
