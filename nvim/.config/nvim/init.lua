vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- Disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Hide statusline
vim.opt.laststatus = 0
vim.opt.showmode = false
vim.opt.ruler = false

-- Line wrapping
vim.wo.wrap = false

-- Enable mouse for all modes
vim.opt.mouse = "a"

-- Sync clipboard with OS
-- vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Indentations
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

-- Delete to void register
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Del>", '"_x', { noremap = true, silent = true })

-- Cut with leader+d
vim.api.nvim_set_keymap("n", "<leader>d", '"+d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>d", '"+y"_d', { noremap = true, silent = true })

-- Yank to system clipboard
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true })

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
vim.opt.timeoutlen = 200

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

-- Reset cursor style on exit
vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    callback = function()
        vim.opt.guicursor = ""
        vim.fn.chansend(vim.v.stderr, "\x1b[ q")
    end,
})

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
