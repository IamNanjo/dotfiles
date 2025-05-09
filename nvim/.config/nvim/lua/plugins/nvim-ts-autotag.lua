if vim.g.vscode then
    return {}
end

---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        config = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = false,
                    enable_rename = true,
                    enable_close_on_slash = true,
                },
            })
        end,
    },
}
