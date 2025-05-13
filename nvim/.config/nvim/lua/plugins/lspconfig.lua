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
            { "folke/neodev.nvim", opts = {} },
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

                    -- The following two autocommands are used to highlight references of the
                    -- word under your cursor when your cursor rests there for a little while.
                    -- When you move your cursor, the highlights will be cleared (the second autocommand).
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.server_capabilities.documentHighlightProvider then
                        local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd("LspDetach", {
                            group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
                            end,
                        })
                    end
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
                        "javascript",
                        "javascriptreact",
                        "less",
                        "sass",
                        "scss",
                        "php",
                        "vue",
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
                ts_ls = {
                    init_options = {
                        plugins = {
                            {
                                name = "@vue/typescript-plugin",
                                location = vim.fn.expand(
                                    "$MASON/packages/vue-language-server/node_modules/@vue/language-server"
                                ),
                                languages = { "vue" },
                            },
                        },
                    },
                    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
                },
            }

            local ensure_installed = vim.tbl_keys(servers)
            vim.list_extend(ensure_installed, { "prettier", "volar" })

            for k, v in pairs(servers) do
                vim.lsp.config(k, v)
            end

            require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
        end,
    },
}
