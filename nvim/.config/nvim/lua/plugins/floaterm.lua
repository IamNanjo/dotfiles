return {
    {
        "IamNanjo/floaterm.nvim",
        name = "floaterm",
        dev = true,
        lazy = true,
        cmd = "Floaterm",
        keys = {
            {
                "<space>tt",
                ":Floaterm<CR>",
                desc = "Toggle floating terminal",
            },
        },
        opts = {},
    },
}
