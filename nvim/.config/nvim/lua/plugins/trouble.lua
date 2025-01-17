return {
    {
        "folke/trouble.nvim",
        opts = {
            auto_close = true,
            auto_jump = true,
            focus = true,
        },
        cmd = "Trouble",
        keys = {
            {
                "[d",
                "<cmd>Trouble diagnostics prev<cr>",
                desc = "Go to previous [D]iagnostic message",
            },
            {
                "]d",
                "<cmd>Trouble diagnostics next<cr>",
                desc = "Go to next [D]iagnostic message",
            },
            {
                "<leader>cx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>cX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>cL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>cQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
}
