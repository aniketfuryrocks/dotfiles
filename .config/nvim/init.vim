syntax on
filetype plugin indent on
set autoindent
set encoding=utf-8
set clipboard+=unnamedplus
set nocompatible
set spelllang=en,cjk
set autoread

" Sane splits
set splitright
set splitbelow

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" ale 
let g:ale_disable_lsp = 1 " disable ale lsp, to work with coc https://github.com/dense-analysis/ale#5iii-how-can-i-use-ale-and-cocnvim-together
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

call plug#begin('~/.vim/plugged')
" asthetics
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'vim-airline/vim-airline'
" syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'
Plug 'dense-analysis/ale'
" langauge support
Plug 'neovimhaskell/haskell-vim' 
Plug 'dag/vim-fish'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'othree/html5.vim'
Plug 'plasticboy/vim-markdown'
Plug 'ekalinin/dockerfile.vim'
" rust
Plug 'rust-lang/rust.vim'
Plug 'rhysd/rust-doc.vim'
" tools
Plug 'andymass/vim-matchup' " use % better
Plug 'airblade/vim-rooter' " cd to nearest .git root
Plug 'gko/vim-coloresque' " show colors for hex values #000000
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
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" nerdtree
nnoremap <C-b> :NERDTreeToggle<CR>
" move lines
" xnoremap <S-Up>  :m-2<CR>gv=gv
" xnoremap <S-Down> :m'>+<CR>gv=gv

