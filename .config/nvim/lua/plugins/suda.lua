return {
    "lambdalisue/vim-suda",

    cmd = {
        "SudaRead",
        "SudaWrite",
    },

    init = function()
        vim.g["suda#noninteractive"] = 1
    end,
}
