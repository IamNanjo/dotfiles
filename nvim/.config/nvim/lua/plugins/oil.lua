if vim.g.vscode then
    return {}
end

---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "stevearc/oil.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = { { "<leader>e", "<CMD>Oil<CR>", desc = "Oil file explorer" } },
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
            columns = {
                "icon",
                "permissions",
                "size",
            },
            watch_for_changes = true,
            view_options = {
                show_hidden = true,
                natural_order = true,
                case_insensitive = true,
                is_always_hidden = function(name)
                    for _, v in ipairs({
                        "..",
                        ".git",
                        "node_modules",
                        "package.lock",
                        "yarn.lock",
                        ".yarn",
                        ".yarnrc.yml",
                        "bun.lockb",
                        "bun.lock",
                        "pnpm-lock.yaml",
                    }) do
                        if name == v then
                            return true
                        end
                    end
                end,
            },
        },
    },
}
