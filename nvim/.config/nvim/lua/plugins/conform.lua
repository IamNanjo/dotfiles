if vim.g.vscode then
    return {}
end

---@module "lazy"
---@type LazyPluginSpec[]
return {
    { -- Autoformat
        "stevearc/conform.nvim",
        lazy = false,
        keys = {
            {
                "<A-S-f>",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                desc = "Format buffer",
            },
        },
        init = function()
            local mason_registry = require("mason-registry")

            local opts = {
                notify_on_error = false,
                format_on_save = false,
                formatters_by_ft = { lua = { "stylua" } },
                formatters = {},
            }

            if mason_registry.is_installed("prettier") then
                local prettier = { "prettier" }
                local prettier_langs = { "json", "jsonc", "javascript", "typescript", "vue", "html", "css", "scss" }

                for _, lang in ipairs(prettier_langs) do
                    opts.formatters_by_ft[lang] = prettier
                end

                opts.formatters.prettier = {
                    command = "prettier",
                    stdin = true,
                    -- Default config if no local .prettierrc file is found
                    -- {
                    --     "useTabs": false,
                    --     "tabWidth": 4,
                    --     "semi": true,
                    --     "singleQuote": false,
                    --     "jsxSingleQuote": false,
                    --     "bracketSpacing": true,
                    --     "bracketSameLine": false,
                    --     "quoteProps": "consistent",
                    --     "trailingComma": "all",
                    --     "arrowParens": "always"
                    --     "vueIndentScriptAndStyle": false
                    -- }
                    args = function()
                        return {
                            "--stdin-filepath",
                            vim.fn.expand("%:p"),
                            "--config-precedence",
                            "prefer-file",
                            "--tab-width",
                            "4",
                            "--quote-props",
                            "consistent",
                        }
                    end,
                }
            end

            if mason_registry.is_installed("pyright") then
                if not mason_registry.is_installed("autopep8") then
                    mason_registry.get_package("autopep8"):install()
                end

                opts.formatters_by_ft.python = { "autopep8" }
            end

            if mason_registry.is_installed("phpactor") then
                if not mason_registry.is_installed("php-cs-fixer") then
                    mason_registry.get_package("php-cs-fixer"):install()
                end

                opts.formatters_by_ft.php = { "php" }
                opts.formatters.php = {
                    command = "php-cs-fixer",
                    args = {
                        "fix",
                        "--rules=@PSR12",
                        "$FILENAME",
                    },
                    stdin = false,
                }
            end

            require("conform").setup(opts)
        end,
    },
}
