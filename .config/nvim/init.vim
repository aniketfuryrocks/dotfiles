syntax on
filetype plugin indent on

set autoindent
set encoding=UTF-8
set clipboard+=unnamedplus
set nocompatible
set spelllang=en,cjk

" Sane splits
set splitright
set splitbelow

" tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set copyindent      " copy indent from the previous line
 
" ui
set number                   " show line number
set showcmd                  " show command in bottom bar
set cursorline               " highlight current line
set wildmenu                 " visual autocomplete for command menu
set showmatch                " highlight matching brace
set laststatus=2             " window will always have a status line
 
" search
set incsearch       " search as characters are entered
set hlsearch        " highlight matche
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is lower case

" hybrid line numbers
set number relativenumber

" term colors
if (has('termguicolors'))
    set termguicolors
endif

"Turn on backup and undo option
set backup
set undofile 

"Where to store backups
set backupdir=~/.vim/backup
set undodir=~/.vim/undodir

"Make backup before overwriting the current buffer
set writebackup

"Overwrite the original backup file
set backupcopy=yes

"Meaningful backup name, ex: filename@2015-04-05.14:59
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

" coc extensions
let g:coc_global_extensions = [
      \'coc-snippets',
      \'coc-markdownlint',    
      \'coc-vetur',
      \'coc-go',
      \'coc-python',
      \'coc-flutter', 
      \'coc-json', 
      \'coc-fzf-preview',
      \'coc-fish',
      \'coc-lua',
      \'coc-emoji',
      \'coc-spell-checker',
      \'coc-cspell-dicts',
      \'coc-rust-analyzer',
      \'coc-toml',
      \'coc-prettier',
      \'coc-marketplace'
      \]

call plug#begin('~/.vim/plugged')

" asthetics
Plug 'mhinz/vim-startify'   " start page
Plug 'kaicataldo/material.vim', { 'branch': 'main' } " theme
Plug 'ryanoasis/vim-devicons'                       " icons
Plug 'vim-airline/vim-airline'                      " bottom bar
Plug 'vim-airline/vim-airline-themes'               " airline themes
Plug 'gko/vim-coloresque' " show colors for hex values #000000

" syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " language server support
Plug 'sheerun/vim-polyglot'                         " syntax highlight

" langauge support
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'} " preview markdown
Plug 'dart-lang/dart-vim-plugin'

" better editing
Plug 'tpope/vim-surround'       " change parens 
Plug 'mg979/vim-visual-multi'   " multi line editing

" tools
Plug 'junegunn/fzf.vim'         " fzf
Plug 'airblade/vim-rooter'      " cd to nearest .git root
Plug 'andymass/vim-matchup'     " use % better
Plug 'liuchengxu/vista.vim'     " symbol search
Plug 'nvim-lua/plenary.nvim'    " required for todo
Plug 'folke/todo-comments.nvim' " better todo comments
Plug 'airblade/vim-gitgutter'   " shows changed lines
Plug 'tpope/vim-fugitive'       " git tooling
Plug 'preservim/nerdtree'       " directory navigation

" nerd tree plugins
Plug 'Xuyuanp/nerdtree-git-plugin'  
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

" theme
let g:material_theme_style = 'darker-community'
let g:airline_theme = 'material'

au ColorScheme * hi Normal ctermbg=none guibg=none              "transparent back
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red  "transparent back
colorscheme material

" nerdtree
nnoremap <M-1> :NERDTreeToggle<CR>

" todo comments
lua << EOF
  require("todo-comments").setup {}
EOF

" coc vim

" commands
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" auto
autocmd CursorHold * silent call CocActionAsync('highlight')

" ctrl + space auto complete
inoremap <silent><expr> <c-space> coc#refresh()
" fix box
nnoremap <M-Enter> :CocAction<CR>
" goto definition
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gt <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" list errors
nnoremap <leader>dig :CocList diagnostics<CR>
nnoremap <leader>err :lopen<CR>
" fmt
nnoremap <leader>fmt :Format<CR>


" fzf
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
" list of open tabs
nnoremap <leader>st :W<CR>
" list of open buffers
nnoremap <leader>sb :Buffers<CR>
" search in all files
nnoremap <leader>fl :Lines<CR> 
" ripgrep search inside all files
nnoremap <leader>rg :Rg<CR>


" vista.vim

" keybinds
" find symbols in current file
nnoremap <leader>fs :Vista finder<CR> 
" find symbols in all files
nnoremap <leader>fas :Vista finder!<CR>

" todo vim
nnoremap <leader>to :TodoLocList<CR>
