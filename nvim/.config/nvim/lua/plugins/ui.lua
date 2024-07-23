return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local bl = require("bufferline")
      bl.setup({
        options = {
          diagnostics_update_in_insert = true,
          mode = "buffers",
          numbers = "none",
          separator_style = { "", "" },
          style_preset = bl.style_preset.no_italic,
          show_buffer_close_icons = false,
          always_show_bufferline = true,
          offsets = {
            {
              filetype = "neo-tree",
              text = "",
              text_align = "center",
              separator = false,
            },
          },
        },
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local colors = {
        blue = "#80a0ff",
        cyan = "#79dac8",
        black = "#080808",
        white = "#ffffff",
        red = "#ff5189",
        violet = "#cb99c9",
        grey = "#121212",
      }

      local function notNvimTree()
        return vim.bo.filetype ~= "NvimTree"
      end

      require("lualine").setup({
        options = {
          icons_enabled = vim.g.have_nerd_font,
          component_separators = "",

          theme = {
            normal = {
              a = { fg = colors.black, bg = colors.violet },
              b = { fg = colors.white, bg = colors.grey },
              c = { fg = colors.white },
            },

            insert = { a = { fg = colors.black, bg = colors.blue } },
            visual = { a = { fg = colors.black, bg = colors.cyan } },
            replace = { a = { fg = colors.black, bg = colors.red } },

            inactive = {
              a = { fg = colors.white, bg = colors.black },
              b = { fg = colors.white, bg = colors.black },
              c = { fg = colors.white },
            },
          },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              left_padding = 2,
              right_padding = 2,
              cond = notNvimTree,
            },
          },
          lualine_b = {
            { "filename", cond = notNvimTree },
            { "branch", cond = notNvimTree },
            { "diagnostics", sections = { "error", "warn" }, cond = notNvimTree },
          },
          lualine_c = {
            { "%=", cond = notNvimTree },
          },
          lualine_x = {},
          lualine_y = {
            { "filetype", cond = notNvimTree },
          },
          lualine_z = {
            {
              "progress",
              left_padding = 2,
              right_padding = 2,
              cond = notNvimTree,
            },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      })
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>e", ":NvimTreeOpen<CR>", { desc = "Open NvimTree" } },
    },
    config = function()
      require("nvim-tree").setup({})
    end,
  },
}
