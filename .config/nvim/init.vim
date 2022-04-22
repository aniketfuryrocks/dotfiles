filetype plugin on
syntax on

set guifont=FiraCode\ NF:h11
set spell 
set spelllang=en_us
set autoindent
set encoding=UTF-8
set clipboard+=unnamedplus
set nocompatible

" Sane splits
set splitright
set splitbelow

" tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for auto indent
set expandtab       " tabs are space
set copyindent      " copy indent from the previous line
 
" ui
set number                   " show line number
set showcmd                  " show command in bottom bar
set cursorline               " highlight current line
set wildmenu                 " visual auto-complete for command menu
set showmatch                " highlight matching brace
set laststatus=2             " window will always have a status line
 
" search
set incsearch       " search as characters are entered
set hlsearch        " highlight match
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is lower case

" hybrid line numbers
set number relativenumber
set completeopt=menuone,noinsert,noselect
set shortmess+=c

set signcolumn=yes
set updatetime=300

" term colors
if (has('termguicolors'))
    set termguicolors
endif

" Backup
set backup
set undofile 
set writebackup
set backupdir=~/.vim/backup
set undodir=~/.vim/undo
set backupcopy=yes
"Meaningful backup name, ex: filename@2015-04-05.14:59
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")




"
"                   Plugins
"

call plug#begin('~/.vim/plugged')

" asthetics
Plug 'mhinz/vim-startify'   " start page

Plug 'kaicataldo/material.vim', { 'branch': 'main' } " theme
Plug 'ryanoasis/vim-devicons'                       " icons
Plug 'kyazdani42/nvim-web-devicons'                 " icons
Plug 'vim-airline/vim-airline'                      " bottom bar
Plug 'vim-airline/vim-airline-themes'               " airline themes
Plug 'gko/vim-coloresque' " show colors for hex values #000000

" themes
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'projekt0n/github-nvim-theme'


" in built terminal
Plug 's1n7ax/nvim-terminal'

" deps
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'


" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim' " lua
Plug 'hrsh7th/nvim-cmp' " auto completion framework
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip'
Plug 'simrat39/rust-tools.nvim'
Plug 'saecki/crates.nvim'
Plug 'j-hui/fidget.nvim' " progress bar
Plug 'williamboman/nvim-lsp-installer'
Plug 'gfanto/fzf-lsp.nvim'


" syntac highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lewis6991/spellsitter.nvim'

" format
Plug 'sbdchd/neoformat'

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" langauge support
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'} " preview markdown

" better editing
Plug 'tpope/vim-surround'       " change parens 
Plug 'mg979/vim-visual-multi'   " multi line editing

" tools
Plug 'junegunn/fzf.vim'         " fzf
Plug 'airblade/vim-rooter'      " cd to nearest .git root
Plug 'folke/todo-comments.nvim' " better todo comments
Plug 'airblade/vim-gitgutter'   " shows changed lines
Plug 'tpope/vim-fugitive'       " git tooling
Plug 'preservim/nerdtree'       " directory navigation

" nerd tree plugins
Plug 'Xuyuanp/nerdtree-git-plugin'  
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()




"
"                   Theme
"

let g:material_theme_style = 'darker-community'
let g:airline_theme = 'material'
colorscheme material

"  au ColorScheme * hi Normal ctermbg=none guibg=none              "transparent back
" au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red  "transparent back
" autocmd vimenter * ++nested colorscheme gruvbox 



"
"                   Shortcuts
"

" lsp shortcuts
nmap <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nmap <leader>gt <cmd>lua vim.lsp.buf.type_definition()<CR>
nmap <leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>
nmap <leader>gr <cmd>lua vim.lsp.buf.references()<CR>
nmap <leader>fs <cmd>lua vim.lsp.buf.document_symbol()<CR>
nmap <leader>fas <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nmap <leader>fmt <cmd>lua vim.lsp.buf.formatting()<CR>
nmap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <a-cr> <cmd>lua vim.lsp.buf.code_action()<CR>

" diagnostics
nnoremap <leader>dig :DiagnosticsAll<CR>
nnoremap <leader>to :TodoLocList<CR>

" files
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fh :History:<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fw :Windows<CR>

nnoremap <leader>rg :Rg<CR>
nnoremap <M-1> :NERDTreeToggle<CR>



"
"                   Plugins Init
"

" fzf
let g:fzf_buffers_jump = 1

lua << EOF
  require("todo-comments").setup {}
  require('nvim-terminal').setup {}
EOF

" rust and lsp setup
lua <<EOF
local nvim_lsp = require'lspconfig'

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true -- <= THIS LINE is the magic!
  },
  indent = {
    enable = false,
  },
  ensure_installed = { -- TSInstall all   - to install all 
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "html",
    "scss",
    "rust",
    "javascript"
  },
}


require('spellsitter').setup {
  -- Whether enabled, can be a list of filetypes, e.g. {'python', 'lua'}
  enable = true,
}

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
   		executor = require("rust-tools/executors").termopen,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    hover_with_actions = {
        auto_focus = true
    },
    server = {
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importGranularity = "module",
                    importPrefix = "self",
                },
                cargo = {
                    loadOutDirsFromCheck = true
                },
                procMacro = {
                    enable = true
                },
                checkOnSave = {
                    command = "clippy"
                },
            }
        },
    	standalone = true
    },
    dap = {
		adapter = {
			type = "executable",
			command = "lldb-vscode",
			name = "rt_lldb",
		},
	},
}

require('rust-tools').setup(opts)
require('crates').setup()

local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed
  name = "lldb"
}
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
    postRunCommands = {'process handle -p true -s false -n false SIGWINCH'}
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require("dapui").setup()

nvim_lsp.tsserver.setup {}
nvim_lsp.cssls.setup {
    capabilities = { textDocument = { completion = { completionItem = { snippetSupport = true } } } }
}
nvim_lsp.html.setup {
    capabilities = { textDocument = { completion = { completionItem = { snippetSupport = true } } } }
}
nvim_lsp.clangd.setup {}
nvim_lsp.vimls.setup {}
nvim_lsp.cssmodules_ls.setup {}
nvim_lsp.pyright.setup {}
nvim_lsp.bashls.setup {}
nvim_lsp.eslint.setup {
  packageManager = "yarn"
}    

local lsp_installer = require("nvim-lsp-installer")
-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {}
   
    server:setup(opts)
end)

EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' }
  },
})

require"fidget".setup{}
require'fzf_lsp'.setup()
EOF

" Show diagnostic popup on cursor hover
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

" terminal
tnoremap <Esc> <C-\><C-n>

" neovide
let g:neovide_transparency=0.9

"fix paste
cnoremap <c-v> <c-r>+ 

