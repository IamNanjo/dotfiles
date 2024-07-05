return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "intelephense",
        "php-debug-adapter",
        "tlint",
        "phpcs",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
      },
    },
  },
  {
    "derektata/lorem.nvim",
    config = function()
      require("lorem").setup {
        sentenceLength = "medium",
        comma_chance = 0,
        max_commas_per_sentence = 0,
      }
    end,
  },
}
