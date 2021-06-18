syntax on
filetype plugin indent on
set nocompatible
set spelllang=en,cjk

call plug#begin('~/.vim/plugged')
" asthetics
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'vim-airline/vim-airline'
" syntax
Plug 'preservim/tagbar'
Plug 'vim-syntastic/syntastic'
Plug 'ycm-core/YouCompleteMe'
Plug 'honza/vim-snippets'
" langauge support
Plug 'neovimhaskell/haskell-vim' 
Plug 'dag/vim-fish'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'gko/vim-coloresque'
Plug 'stephpy/vim-yaml'
Plug 'plasticboy/vim-markdown'
Plug 'othree/html5.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ekalinin/dockerfile.vim'
" extras
Plug 'mhinz/vim-startify'
Plug 'thaerkh/vim-workspace'
Plug 'mg979/vim-visual-multi', {'branch': 'master'} 
" directory navigation NERDtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

if (has('termguicolors'))
  set termguicolors
endif

let g:material_theme_style = 'darker'
let g:lightline = { 'colorscheme': 'material_vim' }
au ColorScheme * hi Normal ctermbg=none guibg=none              "transparent back
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red  "transparent back
colorscheme material

" tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line

" ui
set hidden
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
                    " case-sensitive otherwise
" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" nerdtree
nnoremap <C-b> :NERDTreeToggle<CR>
