return {
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {
            bind = true,
            floating_window = true,
            hint_enable = false,
            handler_opts = {
                border = "rounded",
            },
            always_trigger = true,
        },
        config = function(_, opts)
            require("lsp_signature").setup(opts)
        end,
    },
}
