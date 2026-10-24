vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

vim.opt.backspace = 'indent,eol,start'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.wo.relativenumber = true;
-- Indention
vim.opt.autoindent = true
vim.opt.filetype.indent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Prevent shift-z from saving and exiting
vim.keymap.set('n', '<C-z>', '<Nop>', {noremap = true, silent=true});
vim.keymap.set('n', 'ZZ', '<Nop>', {noremap = true, silent=true});
-- Terminal Mode
vim.keymap.set('t', "<C-q>", [[<C-\><C-n>]])

-- Resizing Split Views
vim.keymap.set("n", "<A-S-->", '[[<cmd>vertical resize -3<cr>]]') -- Make window bigger vertically
vim.keymap.set("n", "<A-S-=>", '[[<cmd>vertical resize +3<cr>]]') -- Make window bigger vertically
vim.keymap.set("n", "<A-S-_>", '[[<cmd>horizontal resize -3<cr>]]') -- Make window bigger vertically
vim.keymap.set("n", "<A-S-+>", '[[<cmd>horizontal resize +3<cr>]]') -- Make window bigger vertically

-- Focusing Split views
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-l>", "<C-w>l")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-j>", "<C-w>j")

-- Moving Split Views
vim.keymap.set("n", "<A-S-h>", "<C-w>H")
vim.keymap.set("n", "<A-S-j>", "<C-w>J")
vim.keymap.set("n", "<A-S-k>", "<C-w>K")
vim.keymap.set("n", "<A-S-l>", "<C-w>L")

-- Normal Mode
vim.keymap.set("i", 'jk', '<Esc>', {noremap=true, silent=true,desc="Exit Insert Mode with jk"});

-- LSP
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Show documentation" })
vim.keymap.set('n', 'gR', vim.lsp.buf.references, { desc = "Show references" })
vim.keymap.set('n', 'gw', vim.diagnostic.setqflist, { desc = "Show diagnostics" })
vim.keymap.set('n', 'gn', function ()
    vim.dim.diagnostic.jump({count=-1, float=true})
end, { desc = "Show diagnostics" })
vim.keymap.set('n', 'gp', function()
    vim.dim.diagnostic.jump({count=1, float=true})
end, { desc = "Show diagnostics" })
