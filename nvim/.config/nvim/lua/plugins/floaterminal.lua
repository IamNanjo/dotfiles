return {
    {
        url = "https://github.com/IamNanjo/floaterm.nvim",
        name = "floaterm",
        dev = true,
        event = "VeryLazy",
        keys = {
            {
                "<space>tt",
                ":Floaterminal<CR>",
                desc = "Toggle floating terminal",
            },
        },
        opts = {},
    },
}
