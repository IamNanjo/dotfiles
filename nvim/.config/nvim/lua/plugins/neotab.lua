return {
    {
        "kawre/neotab.nvim",
        event = "InsertEnter",
        opts = {
            tabkey = "<Tab>",
            act_as_tab = false,
            behavior = "nested",
            pairs = {
                { open = "(", close = ")" },
                { open = "[", close = "]" },
                { open = "{", close = "}" },
                { open = "'", close = "'" },
                { open = '"', close = '"' },
                { open = "`", close = "`" },
                { open = "<", close = ">" },
                { open = ";", close = ";" },
            },
            smart_punctuators = {
                enabled = true,
                escape = {
                    enabled = true,
                },
            },
        },
    },
}
