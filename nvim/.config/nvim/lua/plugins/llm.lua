if vim.g.vscode then
    return {}
end

local ollama_host = os.getenv("OLLAMA_HOST") or "https://ollama.lan"

---@module "lazy"
---@type LazyPluginSpec[]
return {
    {
        "olimorris/codecompanion.nvim",
        version = "^19.0.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            adapters = {
                http = {
                    opts = {
                        allow_insecure = true
                    },
                    ollama = function()
                        return require("codecompanion.adapters").extend("ollama", {
                            env = {
                                url = ollama_host,
                            },
                            schema = {
                                model = {
                                    default = "qwen3.5:9b"
                                },
                                num_ctx = {
                                    default = 131072, -- 128k tokens
                                    -- default = 262144, -- 256k tokens
                                },
                                num_predict = {
                                    default = 4096, -- Limit response size to prevent OOM during generation
                                },
                                -- Higher temperatures can cause erratic memory usage in long contexts
                                temperature = {
                                    default = 0.2,
                                },
                            }
                        })
                    end,
                },
            },
            interactions = {
                chat = {
                    adapter = "ollama",
                },
                inline = {
                    adapter = "ollama",
                },
                cmd = {
                    adapter = "ollama",
                }
            },
        },
    },
}
