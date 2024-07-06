require "nvchad.options"

local o = vim.o

vim.o.mouse = ""

o.cursorlineopt = "both" -- to enable cursorline!

vim.g.have_nerd_font = true

-- Clipboard
vim.o.clipboard = "unnamedplus"

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

-- Indentations
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Colors
vim.opt.termguicolors = true

vim.cmd [[highlight Normal guibg=NONE ctermbg=NONE]]
vim.cmd [[highlight NonText guibg=NONE ctermbg=NONE]]
vim.cmd [[highlight SpecialKey guibg=NONE ctermbg=NONE]]
vim.cmd [[highlight String guibg=NONE ctermbg=NONE]]
