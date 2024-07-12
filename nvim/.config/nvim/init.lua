vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- Disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Disable mouse
vim.opt.mouse = ""

-- Don"t show the mode, since it"s already in the status line
vim.opt.showmode = false

-- Sync clipboard with OS
-- vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Indentations
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

-- Indent with Tab
vim.keymap.set("n", "<Tab>", ">>", { remap = true, silent = true })
vim.keymap.set("v", "<Tab>", ">gv", { remap = true, silent = true })
vim.keymap.set("i", "<S-Tab>", "<nop>", { remap = true, silent = true })

-- Outdent with Shift+Tab
vim.keymap.set("n", "<S-Tab>", "<<", { remap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { remap = true, silent = true })
vim.keymap.set("i", "<S-Tab>", "<nop>", { remap = true, silent = true })

-- Line swaps
vim.keymap.set("n", "<A-Up>", "<Up>ddp<Up>", { remap = false, desc = "Move line up", silent = true })
vim.keymap.set("i", "<A-Up>", "<Esc><Up>ddp<Up>", { remap = false, desc = "Move line up", silent = true })

vim.keymap.set("i", "<A-Down>", "<Esc>ddpA", { remap = false, desc = "Move line up", silent = true })
vim.keymap.set("n", "<A-Down>", "ddp", { remap = false, desc = "Move line up", silent = true })

-- Line duplicate
vim.keymap.set("n", "<A-S-Up>", "yyp<Up>", { remap = false, desc = "Duplicate line up", silent = true })
vim.keymap.set("i", "<A-S-Up>", "<Esc>yyp<Up>", { remap = false, desc = "Duplicate line up", silent = true })

vim.keymap.set("n", "<A-S-Down>", "yyp", { remap = false, desc = "Duplicate line down", silent = true })
vim.keymap.set("i", "<A-S-Down>", "<Esc>yyp", { remap = false, desc = "Duplicate line down", silent = true })

-- Terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<A-i>", ":ToggleTerm<CR>", { remap = false, desc = "Toggle terminal window", silent = true })

-- Buffer navigation
vim.keymap.set("n", "<C-Tab>", ":bnext<CR>", { remap = true, desc = "Next buffer", silent = true })
vim.keymap.set("n", "<C-S-Tab>", ":bprevious<CR>", { remap = true, desc = "Previous buffer", silent = true })
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { remap = true, desc = "Delete buffer", silent = true })

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 100

-- Displays which-key popup sooner
vim.opt.timeoutlen = 250

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = false

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = false

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Fill chars
vim.opt.fillchars = { eob = " " }

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Comments
vim.keymap.set("n", "<leader>/", "gcc", { desc = "comment toggle", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "comment toggle", remap = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})
