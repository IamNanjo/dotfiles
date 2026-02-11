if vim.g.vscode then
    return {}
end

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
                    blink_cmp = { style = "bordered" },
                    gitsigns = true,
                    lsp_trouble = true,
                    mason = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                            ok = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                            ok = { "underline" },
                        },
                        inlay_hints = {
                            background = true,
                        },
                    },
                    neogit = true,
                    rainbow_delimiters = true,
                    render_markdown = true,
                    telescope = true,
                    treesitter = true,
                    which_key = true,
                },
            })
        end,
        init = function()
            vim.opt.termguicolors = true
            vim.cmd([[colorscheme catppuccin-mocha]])
        end,
    },
}
