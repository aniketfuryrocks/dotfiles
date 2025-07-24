-- neovide
vim.cmd "set guifont=FiraCode\\ Nerd\\ Font:h13"
vim.opt.termguicolors = true
vim.g.neovide_opacity = 0.9

-- enforce cd
vim.o.shell = "/bin/bash"

-- general
--
vim.o.modifiable = true
vim.o.syntax = 'on'
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.spell = true
vim.o.spelllang = 'en_us'
vim.cmd "set clipboard+=unnamedplus"

-- indent
vim.bo.autoindent = true
vim.bo.smartindent = true

-- mouse
vim.cmd "set mouse+=a"

-- tabs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- js tabs
vim.cmd [[
  autocmd FileType javascript,typescript,typescriptreact,javascriptreact,yaml setlocal shiftwidth=2 tabstop=2 expandtab
]]

-- UI
vim.wo.number         = true
vim.wo.relativenumber = true
vim.wo.signcolumn     = 'yes'
vim.wo.wrap           = false
vim.o.cursorline      = true -- highlight current line
vim.o.wildmenu        = true -- auto complete in command mode

-- search
vim.o.hlsearch        = true -- highlight match
vim.o.incsearch       = true -- search as you type
vim.o.ignorecase      = true -- ignore case
vim.o.smartcase       = true -- smart case

-- splits
vim.o.splitright      = true
vim.o.splitbelow      = true

-- save work
vim.o.backup          = true
vim.o.undofile        = true
vim.o.writebackup     = true

vim.cmd "set backupdir=~/.vim/backup"
vim.cmd "set undodir=~/.vim/undo"
vim.cmd "set backupcopy=yes"
vim.cmd "set noswapfile"
vim.cmd "au BufWritePre * let &bex = '@' . strftime('%F.%H:%M')" -- backup file name

-- terminal fix
vim.cmd "tnoremap <Esc> <C-\\><C-n>"

-- fix paste
vim.cmd "cnoremap <c-v> <c-r>+"

-- vim rooter
vim.g.rooter_patterns = {
    'Makefile',
    'init.vim',
    'node_modules',
    'target',
    'Cargo.toml',
    '.git'
}
vim.g.rooter_manual_only = 1

-- copilot
vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
