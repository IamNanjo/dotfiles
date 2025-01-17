require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ="both" -- to enable cursorline!

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

-- Indentations
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2


-- Colors
vim.opt.termguicolors = true

vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight NonText guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight SpecialKey guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight String guibg=NONE ctermbg=NONE]])

