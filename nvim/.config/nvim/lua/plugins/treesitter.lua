---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        ---@module "nvim-treesitter.configs"
        ---@type TSConfig
        opts = {
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "gitcommit",
                "gitignore",
                "git_config",
                "git_rebase",
                "comment",
                "markdown",
                "markdown_inline",
                "regex",
                "javascript",
                "typescript",
                "jsdoc",
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.install").prefer_git = true
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
