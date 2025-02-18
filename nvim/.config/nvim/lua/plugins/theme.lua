---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                background = {
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = true,
                show_end_of_buffer = false,
                term_colors = false,
                styles = {
                    comments = { "italic" },
                },
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    mason = true,
                    neogit = true,
                    nvimtree = true,
                    telescope = true,
                    treesitter = true,
                    which_key = true,
                },
            })
        end,
        init = function()
            vim.opt.termguicolors = true
            vim.cmd([[colorscheme catppuccin]])
        end,
    },
}
