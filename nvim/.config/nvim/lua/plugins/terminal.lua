return {
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    version = "*",
    config = function()
      require("toggleterm").setup({
        autochdir = false,
        hide_numbers = true,
        start_in_insert = true,
        direction = "float",
        close_on_exit = true,
        auto_scroll = true,
        float_opts = {
          border = "curved",
        },
      })
    end,
  },
}
