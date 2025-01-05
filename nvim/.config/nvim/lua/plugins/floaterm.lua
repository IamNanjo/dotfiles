return {
    {
        "IamNanjo/floaterm.nvim",
        name = "floaterm",
        dev = true,
        event = "VeryLazy",
        keys = {
            {
                "<space>tt",
                ":Floaterm<CR>",
                desc = "Toggle floating terminal",
            },
        },
        opts = {},
        config = function(_, opts)
            require("floaterm").setup({})
        end,
    },
}
