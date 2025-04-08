if vim.g.vscode then
    return {}
end

---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "IamNanjo/floaterm.nvim",
        name = "floaterm",
        dev = true,
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
