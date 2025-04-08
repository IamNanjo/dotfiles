if vim.g.vscode then
    return {}
end

---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "NeogitOrg/neogit",
        cmd = "Neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        keys = {
            { "<leader>g", ":Neogit<CR>", desc = "Open neogit" },
        },
        config = function()
            require("neogit").setup({
                disable_hint = true,
                kind = "floating",
                commit_editor = { kind = "floating" },
                commit_view = { kind = "floating" },
                description_editor = { kind = "floating" },
                log_view = { kind = "floating" },
                merge_editor = { kind = "floating" },
                rebase_editor = { kind = "floating" },
                tag_editor = { kind = "floating" },
            })
        end,
    },
}
