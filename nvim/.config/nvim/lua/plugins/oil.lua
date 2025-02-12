return {
    {
        "stevearc/oil.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>e", "<CMD>Oil<CR>", desc = "Oil file explorer" },
        },
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
            columns = {
                "icon",
                "permissions",
                "size",
            },
            watch_for_changes = true,
            view_options = {
                show_hidden = true,
                natural_order = true,
                case_insensitive = true,
            },
        },
    },
}
