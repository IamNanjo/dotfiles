---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "folke/trouble.nvim",
        ---@module "trouble"
        ---@type trouble.Config
        opts = {
            auto_close = true,
            auto_open = false,
            auto_preview = true,
            auto_refresh = true,
            auto_jump = true,
            focus = true,
            restore = true,
            follow = true,
            indent_guides = false,
            max_items = 50,
            multiline = false,
            pinned = false,
            warn_no_results = false,
            open_no_results = false,
        },
        cmd = "Trouble",
        keys = {
            {
                "[d",
                "<CMD>Trouble diagnostics prev<CR>",
                desc = "Go to previous [D]iagnostic message",
            },
            {
                "]d",
                "<CMD>Trouble diagnostics next<CR>",
                desc = "Go to next [D]iagnostic message",
            },
        },
    },
}
