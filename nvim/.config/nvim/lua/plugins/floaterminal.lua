return {
    {
        url = "https://github.com/IamNanjo/floaterm.nvim",
        name = "floaterminal",
        dev = true,
        event = "VeryLazy",
        keys = {
            {
                "<space>tt",
                ":Floaterminal<CR>",
                { "n", "t" },
                desc = "Toggle floating terminal",
            },
        },
        opts = {},
    },
}
