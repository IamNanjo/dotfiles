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
        violet = "#d183e8",
        grey = "#303030",
      }

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
          lualine_a = { { "mode", left_padding = 2, right_padding = 2 } },
          lualine_b = { "filename", "branch", { "diagnostics", sections = { "error", "warn" } } },
          lualine_c = { "%=" },
          lualine_x = {},
          lualine_y = { "filetype" },
          lualine_z = {
            { "progress", left_padding = 2, right_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
        tabline = {},
        extensions = {},
      })
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      { "<leader>e", ":Neotree reveal<CR>", { desc = "NeoTree reveal" } },
    },
    opts = {
      window = { position = "current" },
      filesystem = {
        window = {
          mappings = {
            ["q"] = "close_window",
          },
        },
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_hidden = false,
        },
        follow_current_file = {
          enabled = true,
        },
        hijack_netrw_behavior = "open_current",
      },
    },
  },
}
