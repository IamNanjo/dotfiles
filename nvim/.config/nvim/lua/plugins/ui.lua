return {
    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },

    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local bl = require("bufferline")
            bl.setup({
                options = {
                    diagnostics_update_in_insert = true,
                    mode = "buffers",
                    numbers = "none",
                    separator_style = { "", "" },
                    style_preset = bl.style_preset.no_italic,
                    show_buffer_close_icons = false,
                    always_show_bufferline = true,
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "",
                            text_align = "center",
                            separator = false,
                        },
                    },
                },
            })
        end,
    },

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
