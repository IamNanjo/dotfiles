return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { "<leader>e", ":NvimTreeOpen<CR>", { desc = "Open NvimTree" } },
        },
        config = function()
            require("nvim-tree").setup({
                view = {
                    width = {
                        min = 40,
                        max = -1,
                        padding = 2,
                    },
                },
                renderer = {
                    group_empty = false,
                    indent_width = 2,
                },
                filters = {
                    enable = false,
                },
                diagnostics = {
                    enable = true,
                    show_on_dirs = true,
                    show_on_open_dirs = false,
                },
            })
        end,
    },
}
