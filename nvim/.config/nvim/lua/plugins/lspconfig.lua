if vim.g.vscode then
    return {}
end

---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "mason-org/mason.nvim",
                opts = {
                    ui = {
                        check_outdated_packages_on_open = false,
                        border = "rounded",
                    },
                },
            },
            "mason-org/mason-lspconfig.nvim",
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                    map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                    map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                    map("<C-S-Space>", vim.lsp.buf.hover, "Hover Documentation")
                    map("K", vim.lsp.buf.hover, "Hover Documentation")
                end,
            })

            ---@class LspServerConfig
            ---@property cmd table? Override the default command used to start the server
            ---@property filetypes table? Override the default list of associated filetypes for the server
            ---@property capabilities table? Override fields in capabilities. Can be used to disable certain LSP features.
            ---@property settings table? Override the default settings passed when initializing the server.

            ---@type table<string, LspServerConfig>
            local servers = {
                html = {},
                emmet_language_server = {
                    filetypes = {
                        "css",
                        "html",
                        "javascriptreact",
                        "less",
                        "sass",
                        "scss",
                        "php",
                        "templ",
                    },
                },
                cssls = {},
                css_variables = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = { callSnippet = "Replace" },
                            diagnostics = { disable = { "missing-fields" } },
                        },
                    },
                },
                vtsls = {
                    settings = {
                        vtsls = {
                            tsserver = {
                                globalPlugins = {
                                    {
                                        name = "@vue/typescript-plugin",
                                        location = vim.fn.stdpath("data")
                                            .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                                        languages = { "vue" },
                                        configNamespace = "typescript",
                                    },
                                },
                            },
                            filetypes = {
                                "javascript",
                                "javascriptreact",
                                "javascript.jsx",
                                "typescript",
                                "typescriptreact",
                                "typescript.tsx",
                                "vue",
                            },
                        },
                        vue_ls = {},
                    },
                },
            }

            local ensure_installed = vim.tbl_keys(servers)

            local next = next
            for k, v in pairs(servers) do
                if next(v) ~= nil then
                    vim.lsp.config(k, v)
                end
                vim.lsp.enable(k)
            end

            require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
        end,
    },
}
