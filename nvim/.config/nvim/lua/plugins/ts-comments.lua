if vim.g.vscode then
    return {}
end

---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "folke/ts-comments.nvim",
        event = "VeryLazy",
        opts = {},
    },
}
