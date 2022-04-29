-- font
vim.cmd "set guifont=FiraCode\\ NF:h11"
vim.g.neovide_transparency = 0.9

-- enforce cd
vim.o.autochdir = true

-- general
vim.o.modifiable = true
vim.o.syntax = 'on'
vim.o.completeopt = 'menuone,noinsert,noselect'
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
vim.o.cursorline = true -- highlight current line
vim.o.wildmenu = true -- auto complete in command mode

-- search
vim.o.hlsearch = true -- highlight match
vim.o.incsearch = true -- search as you type
vim.o.ignorecase = true -- ignore case
vim.o.smartcase = true -- smart case

-- splits
vim.o.splitright = true
vim.o.splitbelow = true

-- save work
vim.o.backup      = true
vim.o.undofile    = true
vim.o.writebackup = true

vim.cmd "set backupdir=~/.vim/backup"
vim.cmd "set undodir=~/.vim/undo"
vim.cmd "set backupcopy=yes"
vim.cmd "au BufWritePre * let &bex = '@' . strftime('%F.%H:%M')" -- backup file name

-- terminal fix
vim.cmd "tnoremap <Esc> <C-\\><C-n>"

-- fix paste
vim.cmd "cnoremap <c-v> <c-r>+"
