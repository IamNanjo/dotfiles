return {
  "tpope/vim-sleuth", -- Automatically set indent sizes

  { -- "gc" to comment visual regions/lines
    "numToStr/Comment.nvim",
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },

  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.surround").setup()
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    -- Optional dependency
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      require("nvim-autopairs").setup({})
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  {
    "derektata/lorem.nvim",
    lazy = true,
    config = function()
      require("lorem").setup({
        sentenceLength = "medium",
        comma_chance = 0,
        max_commas_per_sentence = 0,
      })
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = false,
          enable_rename = true,
          enable_close_on_slash = true,
        },
      })
    end,
  },

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
