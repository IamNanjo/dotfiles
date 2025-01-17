return {
    { -- Fuzzy Finder (files, lsp, etc)
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        keys = {
            { "<leader>sf", require("telescope.builtin").find_files, desc = "[S]earch [F]iles" },
            { "<leader>ss", require("telescope.builtin").builtin, desc = "[S]earch [S]elect Telescope" },
            { "<leader>sw", require("telescope.builtin").grep_string, desc = "[S]earch current [W]ord" },
            { "<leader>sg", require("telescope.builtin").git_files, desc = "[S]earch [G]it" },
            { "<leader>sG", require("telescope.builtin").live_grep, desc = "[S]earch [G]rep" },
            { "<leader>sd", require("telescope.builtin").diagnostics, desc = "[S]earch [D]iagnostics" },
            {
                "<leader>s/",
                function()
                    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({}))
                end,
                desc = "[/] Fuzzily search in current buffer",
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
            -- {
            --     "nvim-telescope/telescope-fzf-native.nvim",
            --
            --     build = "make",
            --
            --     cond = function()
            --         return vim.fn.executable("make") == 1
            --     end,
            -- },
            -- { "nvim-telescope/telescope-ui-select.nvim" },
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            })

            -- Enable Telescope extensions if they are installed
            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")
        end,
    },
}
