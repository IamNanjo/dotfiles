if vim.g.vscode then
    return {}
end

---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            local ts = require("nvim-treesitter")
            ts.setup({
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
            ts.install({
                "bash",
                "comment",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "go",
                "javascript",
                "jsdoc",
                "json",
                "markdown",
                "markdown_inline",
                "query",
                "regex",
                "sql",
                "templ",
                "typescript",
                "vim",
                "vimdoc",
            })
        end,
    },
}
