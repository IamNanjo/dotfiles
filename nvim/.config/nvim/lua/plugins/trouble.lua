---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "folke/trouble.nvim",
        ---@module "trouble"
        ---@type trouble.Config
        opts = {
            auto_close = true,
            auto_jump = true,
            focus = true,
        },
        cmd = "Trouble",
        keys = {
            {
                "[d",
                "<cmd>Trouble diagnostics prev<cr>",
                desc = "Go to previous [D]iagnostic message",
            },
            {
                "]d",
                "<cmd>Trouble diagnostics next<cr>",
                desc = "Go to next [D]iagnostic message",
            },
            {
                "<leader>cx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
        },
    },
}
