vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- Disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Dynamic window title ([Modified flag][read-only flag][filetype] - File path without protocol)
-- :h titlestring
vim.opt.title = true
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        vim.opt.titlestring = "%m%r%y - " .. string.gsub(vim.fn.expand("%:p#"), "^.*://", "")
    end,
})

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Hide statusline
vim.opt.laststatus = 0
vim.opt.showmode = false
vim.opt.ruler = false

-- Hide cmdline when not in use
vim.opt.cmdheight = 0

-- Line wrapping
vim.wo.wrap = false

-- Enable mouse for all modes
vim.opt.mouse = "a"

-- Enable break indent
vim.opt.breakindent = true

-- Indentations
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

-- Ignore shift+space
vim.api.nvim_set_keymap("", "<S-space>", "<space>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<S-space>", "<space>", { noremap = true, silent = true })

-- Center cursor on scroll
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Scroll down" })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Scroll up" })
vim.api.nvim_set_keymap("n", "<C-f>", "<C-f>zz", { noremap = true, silent = true, desc = "Scroll up" })
vim.api.nvim_set_keymap("n", "<C-b>", "<C-b>zz", { noremap = true, silent = true, desc = "Scroll up" })

-- Delete to void register
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true, desc = "Delete" })
vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true, silent = true, desc = "Delete" })
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true, desc = "Delete" })
vim.api.nvim_set_keymap("n", "<Del>", '"_x', { noremap = true, silent = true, desc = "Delete" })

-- Substitute and change to void register
vim.api.nvim_set_keymap("n", "s", '"_s', { noremap = true, silent = true, desc = "Substitute" })
vim.api.nvim_set_keymap("n", "S", '"_S', { noremap = true, silent = true, desc = "Substitute" })
vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true, silent = true, desc = "Change" })
vim.api.nvim_set_keymap("n", "C", '"_C', { noremap = true, silent = true, desc = "Change" })
vim.api.nvim_set_keymap("v", "s", '"_s', { noremap = true, silent = true, desc = "Substitute" })
vim.api.nvim_set_keymap("v", "S", '"_S', { noremap = true, silent = true, desc = "Substitute" })
vim.api.nvim_set_keymap("v", "c", '"_c', { noremap = true, silent = true, desc = "Change" })
vim.api.nvim_set_keymap("v", "C", '"_C', { noremap = true, silent = true, desc = "Change" })

-- Cut
vim.api.nvim_set_keymap("n", "<leader>d", "d", { noremap = true, silent = true, desc = "Cut" })
vim.api.nvim_set_keymap("v", "<leader>d", "d", { noremap = true, silent = true, desc = "Cut" })

-- Yank to system clipboard
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Copy to system clipboard" })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Copy to system clipboard" })

-- Line swaps
vim.keymap.set("n", "<A-k>", ":move .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })
vim.keymap.set("n", "<A-k>", ":move .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })
vim.keymap.set("i", "<A-k>", "<Esc>:move .-2<CR>==a", { noremap = true, silent = true, desc = "Move line up" })
vim.keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move line down" })

vim.keymap.set("n", "<A-j>", ":move .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("i", "<A-j>", "<Esc>:move .+1<CR>==a", { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move line up" })

-- Line duplicate
vim.keymap.set("n", "<A-S-k>", "mzyyp`z", { noremap = true, silent = true, desc = "Duplicate line up" })
vim.keymap.set("i", "<A-S-k>", "<Esc>mzyyp`za", { noremap = true, silent = true, desc = "Duplicate line up" })
vim.keymap.set("v", "<A-S-k>", "ygv'><Esc>pgv", { noremap = true, silent = true, desc = "Duplicate selection up" })

vim.keymap.set("n", "<A-S-j>", "mzyyp`zj", { noremap = true, silent = true, desc = "Duplicate line down" })
vim.keymap.set("i", "<A-S-j>", "<Esc>mzyyp`zja", { noremap = true, silent = true, desc = "Duplicate line down" })
vim.keymap.set("v", "<A-S-j>", "ykpgv", { noremap = true, silent = true, desc = "Duplicate selection down" })

-- Buffer navigation
vim.keymap.set("n", "<C-Tab>", ":bnext<CR>", { remap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<C-S-Tab>", ":bprevious<CR>", { remap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { remap = true, silent = true, desc = "Delete buffer" })

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

-- Cursor shape
vim.opt.guicursor = "n-v-c:block,i-ci-ve-t:ver25,r-cr:hor20,o:hor50"

-- Fill chars
vim.opt.fillchars = { eob = " " }

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Comments
vim.keymap.set("n", "<leader>/", "gcc", { desc = "comment toggle", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "comment toggle", remap = true })

-- Diagnostic keymaps
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
    change_detection = {
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "2html_plugin",
                "gzip",
                "man",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "rplugin",
                "spell",
                "spellfile_plugin",
                "syntax",
                "tarPlugin",
                "terminal",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
    dev = {
        path = vim.fn.stdpath("config") .. "/dev",
        fallback = true,
    },
    ui = {
        wrap = false,
        border = "rounded",
        icons = vim.g.have_nerd_font and {} or {
            cmd = " ",
            config = "",
            event = " ",
            favorite = " ",
            ft = " ",
            init = " ",
            import = " ",
            keys = " ",
            lazy = "󰒲 ",
            loaded = "●",
            not_loaded = "○",
            plugin = " ",
            runtime = " ",
            require = "󰢱 ",
            source = " ",
            start = " ",
            task = "✔ ",
            list = {
                "●",
                "➜",
                "★",
                "‒",
            },
        },
    },
})
