return {
    {
        "coffebar/neovim-project",

        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "Shatur/neovim-session-manager",
        },

        opts = {
            projects = {
                "~/.projects/*",
                "~/.config/*",
                "~/.local",
                "~/.ssh",
                "/etc/nginx/",
                "/etc/wireguard/",
            },

            picker = {
                type = "telescope",
            },

            last_session_on_startup = false,
        },

        init = function()
            vim.opt.sessionoptions:append("globals")
        end,

        lazy = false,
        priority = 100,
    },
}
