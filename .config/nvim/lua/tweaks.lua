-- font
vim.cmd "set guifont=FiraCode\\ NF:h11"
vim.g.neovide_transparency = 0.9

-- general
vim.o.syntax = 'on'
vim.o.completeopt='menuone,noinsert,noselect'
vim.o.spell = false
vim.o.spelllang = 'en_us'
vim.cmd "set clipboard+=unnamedplus"
-- indent
vim.bo.autoindent = true
vim.bo.smartindent = true

-- tabs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- UI
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.wrap = false
vim.o.cursorline = true     -- highlight current line
vim.o.wildmenu = true       -- auto complete in command mode

-- search
vim.o.hlsearch = true       -- highlight match
vim.o.incsearch = true      -- search as you type
vim.o.ignorecase = true     -- ignore case
vim.o.smartcase = true      -- smart case

-- splits 
vim.o.splitright = true
vim.o.splitbelow = true

