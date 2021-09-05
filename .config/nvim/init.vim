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

" tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
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

" term colors
if (has('termguicolors'))
    set termguicolors
endif

" ale
let g:ale_disable_lsp = 1 " disable ale lsp, to work with coc https://github.com/dense-analysis/ale#5iii-how-can-i-use-ale-and-cocnvim-together

" incremental backups
"Turn on backup option
set backup

"Where to store backups
set backupdir=~/.vim/backup//

"Make backup before overwriting the current buffer
set writebackup

"Overwrite the original backup file
set backupcopy=yes

"Meaningful backup name, ex: filename@2015-04-05.14:59
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

call plug#begin('~/.vim/plugged')
" asthetics
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'vim-airline/vim-airline'
" syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'
Plug 'dense-analysis/ale'
" langauge support
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}
Plug 'neovimhaskell/haskell-vim' 
" rust
Plug 'rust-lang/rust.vim'
Plug 'rhysd/rust-doc.vim'
" tools
Plug 'junegunn/fzf.vim'
Plug 'andymass/vim-matchup' " use % better
Plug 'airblade/vim-rooter' " cd to nearest .git root
Plug 'gko/vim-coloresque' " show colors for hex values #000000
" extras
Plug 'liuchengxu/vista.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'airblade/vim-gitgutter' " git 
Plug 'mhinz/vim-startify'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" directory navigation NERDtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

let g:material_theme_style = 'darker'
let g:airline_theme = 'material'
au ColorScheme * hi Normal ctermbg=none guibg=none              "transparent back
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red  "transparent back
colorscheme material

" nerdtree
nnoremap <M-1> :NERDTreeToggle<CR>
nnoremap <M-Enter> :CocAction<CR>
nnoremap <C-B> :call CocActionAsync('jumpDefinition')<CR>

" todo comments
lua << EOF
  require("todo-comments").setup {}
EOF

" coc vim
autocmd CursorHold * silent call CocActionAsync('highlight')
" ctrl + space auto complete
inoremap <silent><expr> <c-space> coc#refresh()
" goto definition
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gt <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" commands
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" fmt
nnoremap <leader>fmt :Format<CR>

" ale 
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

" fzf
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
" search <leader>in all files
nnoremap <leader>fl :Lines<CR> 

" hybrid line numbers
:set number relativenumber

" vista.vim

" keybinds
" show symbol sidebar
nnoremap <leader>ss :Vista coc!<CR>
" find symbols in current file
nnoremap <leader>fs :Vista finder<CR> 
" find symbols in all files
nnoremap <leader>fas :Vista finder!<CR>
