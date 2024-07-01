---@type ChadrcConfig
local M = {}

M.ui = {
    theme = "material-darker",

    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },

    changed_themes = {
        ["material-darker"] = {
            base_30 = {
                darker_black = "#000000", -- e.g. nvim-tree and telescope bg
                black2 = "#000000", -- Current line highlight
                statusline_bg = "#000000",
                pmenu_bg = "#ff6961",
            },
            base_16 = {
                base00 = "#000000",
            },
        },
    },
}

return M
