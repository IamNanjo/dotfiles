---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "davidosomething/format-ts-errors.nvim",
        ---@module "format-ts-errors"
        ---@type Settings
        opts = {
            add_markdown = true,
            start_indent_level = 0,
        },
    },
}
