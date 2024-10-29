return {
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
}
