if vim.g.vscode then
    return {}
end

---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "lilibyte/tabhula.nvim",
        opts = {
            tabkey = "<Tab>",
            backward_tabkey = "<S-Tab>",
            evil_tabkey = "",
            evil_backward_tabkey = "",
            completion = nil,
            range = nil,
            forward_characters = {
                ["("] = function()
                    return 1
                end,
                [")"] = function()
                    return 1
                end,
                ["["] = function()
                    return 1
                end,
                ["]"] = function()
                    return 1
                end,
                ["{"] = function()
                    return 1
                end,
                ["}"] = function()
                    return 1
                end,
                ['"'] = function()
                    return 1
                end,
                ["'"] = function()
                    return 1
                end,
                ["`"] = function()
                    return 1
                end,
                ["<"] = function()
                    return 1
                end,
                [">"] = function()
                    return 1
                end,
                [","] = function()
                    return 1
                end,
                [";"] = function()
                    return 1
                end,
            },
            backward_characters = {
                ["("] = function()
                    return 1
                end,
                [")"] = function()
                    return 1
                end,
                ["["] = function()
                    return 1
                end,
                ["]"] = function()
                    return 1
                end,
                ["{"] = function()
                    return 1
                end,
                ["}"] = function()
                    return 1
                end,
                ['"'] = function()
                    return 1
                end,
                ["'"] = function()
                    return 1
                end,
                ["`"] = function()
                    return 1
                end,
                ["<"] = function()
                    return 1
                end,
                [">"] = function()
                    return 1
                end,
                [","] = function()
                    return 1
                end,
                [";"] = function()
                    return 1
                end,
            },
        },
    },
}
