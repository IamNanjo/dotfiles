return {
    { -- Autoformat
        "stevearc/conform.nvim",
        lazy = false,
        keys = {
            {
                "<A-S-f>",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                mode = "",
                desc = "Format buffer",
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = true,
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                vue = { "prettier" },
                css = { "prettier" },
            },
        },
    },
}
