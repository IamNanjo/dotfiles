local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { { "prettierd", "prettier" } },
    html = { { "prettierd", "prettier" } },
    js = { { "prettierd", "prettier" } },
    ts = { { "prettierd", "prettier" } },
  },

  format_on_save = {
    timeout_ms = 250,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
