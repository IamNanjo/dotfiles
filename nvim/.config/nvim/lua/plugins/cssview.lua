if vim.g.vscode then
    return {}
end

---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "hat0uma/csvview.nvim",
        ---@module "csvview"
        ---@type CsvView.Options
        opts = {
            parser = {
                --- @type integer
                async_chunksize = 50,

                --- @type CsvView.Options.Parser.Delimiter
                delimiter = {
                    ft = {
                        csv = ",",
                        tsv = "\t",
                    },
                    fallbacks = {
                        ",",
                        "\t",
                        ";",
                        "|",
                        ":",
                        " ",
                    },
                },

                --- @type string
                quote_char = '"',

                --- @type string[]
                comments = { "#", "//" },

                --- @type integer
                max_lookahead = 50,
            },
            view = {
                --- @type integer
                min_column_width = 5,

                --- @type integer
                spacing = 2,

                ---@type CsvView.Options.View.DisplayMode
                display_mode = "border",

                --- See also: `view.sticky_header`
                --- @type integer|false|true
                header_lnum = true,

                sticky_header = {
                    --- @type boolean
                    enabled = true,

                    --- @type string|false
                    separator = "─",
                },
            },

            --- @type CsvView.Options.Keymaps
            keymaps = {},

            ---@type CsvView.Options.Actions
            actions = {},
        },
        cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
    },
}
