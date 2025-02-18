---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "echasnovski/mini.nvim",
        version = "*",
        config = function()
            require("mini.surround").setup()
            require("mini.ai").setup()
        end,
    },
}
