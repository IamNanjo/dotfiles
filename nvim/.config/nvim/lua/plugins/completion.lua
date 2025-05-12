if vim.g.vscode then
    return {}
end

---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "saghen/blink.cmp",
        version = "1.*",

        ---@module "blink.cmp"
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = "none",

                ["<C-p>"] = { "select_prev" },
                ["<C-n>"] = { "select_next" },

                ["<C-space>"] = { "show" },
                ["<C-e>"] = { "cancel" },
                ["<C-f>"] = { "select_and_accept" },
            },

            cmdline = {
                keymap = { preset = "inherit" },
                completion = { menu = { auto_show = true } },
            },

            completion = {
                menu = {
                    border = "rounded",
                    draw = {
                        columns = {
                            { "kind_icon", "label", "label_description" },
                            { "kind" },
                        },
                        components = {
                            kind_icon = {
                                text = function(ctx)
                                    return " " .. ctx.kind_icon .. "  "
                                end,
                            },
                        },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 0,
                    window = { border = "rounded" },
                },
            },

            sources = { default = { "lsp", "path", "snippets", "buffer" } },

            fuzzy = {
                implementation = "prefer_rust",
                sorts = { "exact", "score", "sort_text" },
            },
        },
        opts_extend = { "sources.default" },
    },
}
