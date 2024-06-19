-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

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
                darker_black = "#000000",
                black = "#000000",
                black2 = "#000000",
                one_bg = "#000000",
                one_bg2 = "#000000",
                one_bg3 = "#000000",
                statusline_bg = "#000000",
                lightbg = "#000000",
                pmenu_bg = "#000000",
            },
            base_16 = {
                base00 = "#000000",
                base01 = "#000000",
                base02 = "#000000",
                base03 = "#000000",
                base04 = "#000000",
            },
        },
    },
}

return M
