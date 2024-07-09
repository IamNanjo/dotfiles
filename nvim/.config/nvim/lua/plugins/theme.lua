return {
  {
    "marko-cerovac/material.nvim",
    priority = 1000,
    config = function()
      require("material").setup({
        disable = {
          background = true,
          eob_lines = true,
        },
        high_visibility = {
          darker = true,
        },
      })
    end,
    init = function()
      vim.opt.termguicolors = true
      vim.g.material_style = "darker"

      vim.cmd([[colorscheme material]])

      vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
      vim.cmd([[highlight NonText guibg=NONE ctermbg=NONE]])
      vim.cmd([[highlight SpecialKey guibg=NONE ctermbg=NONE]])
      vim.cmd([[highlight String guibg=NONE ctermbg=NONE]])
      vim.cmd([[highlight NormalNC guibg=NONE ctermbg=NONE]])
      vim.cmd([[highlight EndOfBuffer guibg=NONE ctermbg=NONE]])
    end,
  },
}
