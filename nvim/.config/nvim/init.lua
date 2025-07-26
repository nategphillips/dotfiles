-- basics
vim.o.number = true         -- line numbers
vim.o.relativenumber = true -- relative line numbers
vim.o.cursorline = true     -- highlight the line and line number the cursor is on
vim.o.scrolloff = 10        -- minimum number of lines before scrolling up and down
vim.o.sidescrolloff = 10    -- minimum number of lines before scrolling left and right
vim.o.mouse = 'a'           -- enable mouse

-- diagnostics
vim.o.signcolumn = "auto"                           -- enable the sign column only when necessary
vim.keymap.set({ 'i', 'n', 'v' }, "<C-c>", "<Esc>") -- make <C-c> trigger the InsertLeave command
vim.diagnostic.config({
    virtual_text = true,                            -- enable virtual text popups for LSP warnings, etc.
    update_in_insert = true,                        -- update diagnostics while in insert mode
    underline = true,                               -- underline code where warnings appear
    severity_sort = true,                           -- sort popups by severity
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
        }
    }
})

-- leader keys
vim.g.mapleader = ' '      -- global leader key
vim.g.maplocalleader = ' ' -- local (to a buffer) leader key

-- indentation
vim.o.expandtab = true   -- expand tabs to spaces
vim.o.tabstop = 4        -- set width of tabs
vim.o.shiftwidth = 4     -- number of spaces to use for autoindent
vim.o.softtabstop = 4    -- number of spaces that tab counts for
vim.o.smartindent = true -- smart autoindenting when starting a new line
vim.o.autoindent = true  -- copy indent from current line when starting a new line

-- search
vim.o.ignorecase = true -- ignore case when searching
vim.o.smartcase = true  -- if search contains a capital, don't ignore case

-- visual
vim.o.termguicolors = true -- ensure 24-bit color
vim.o.colorcolumn = "100"  -- set ruler at 100 characters

-- files
vim.o.undofile = true -- enable persistant undo history for each file

-- exit terminal mode easier
vim.keymap.set('t', "<C-/>", [[<C-\><C-n>:q<CR>]], { noremap = true, silent = true })

-- don't exit visual mode after indenting
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })

-- autocommands
local augroup
vim.api.nvim_create_augroup("UserConfig", {})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text.",
    group = augroup,
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- lazy
require("config.lazy")
