Vim�UnDo� .�Z���x���x�L�l��,�n'��   g                                   a%b    _�                             ����                                                                                                                                                                                                                                                                                                                                                             a%q     �               r   	syntax on   filetype plugin indent on   set autoindent   set encoding=utf-8   set clipboard+=unnamedplus   set nocompatible   set spelllang=en,cjk   set autoread       " Sane splits   set splitright   set splitbelow       " Proper search   set incsearch   set ignorecase   set smartcase   set gdefault       " tabs   5set tabstop=4       " number of visual spaces per TAB   :set softtabstop=4   " number of spaces in tab when editing   <set shiftwidth=4    " number of spaces to use for autoindent   $set expandtab       " tabs are space   set autoindent   8set copyindent      " copy indent from the previous line       " ui   /set number                   " show line number   9set showcmd                  " show command in bottom bar   5set cursorline               " highlight current line   Cset wildmenu                 " visual autocomplete for command menu   7set showmatch                " highlight matching brace   Dset laststatus=2             " window will always have a status line       " search   6set incsearch       " search as characters are entered   &set hlsearch        " highlight matche   0set ignorecase      " ignore case when searching   Aset smartcase       " ignore case if search pattern is lower case       " term colors   if (has('termguicolors'))       set termguicolors   endif       " ale   �let g:ale_disable_lsp = 1 " disable ale lsp, to work with coc https://github.com/dense-analysis/ale#5iii-how-can-i-use-ale-and-cocnvim-together       " workspace   let g:workspace_autocreate = 1   #let g:workspace_autosave_always = 1       !call plug#begin('~/.vim/plugged')   " asthetics   4Plug 'kaicataldo/material.vim', { 'branch': 'main' }   Plug 'vim-airline/vim-airline'   " syntax   /Plug 'neoclide/coc.nvim', {'branch': 'release'}   Plug 'preservim/tagbar'   Plug 'dense-analysis/ale'   " langauge support   @Plug 'npxbr/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}   !Plug 'neovimhaskell/haskell-vim'    Plug 'dag/vim-fish'   Plug 'cespare/vim-toml'   Plug 'stephpy/vim-yaml'   Plug 'othree/html5.vim'   Plug 'plasticboy/vim-markdown'   Plug 'ekalinin/dockerfile.vim'   " rust   Plug 'rust-lang/rust.vim'   Plug 'rhysd/rust-doc.vim'   " tools   Plug 'junegunn/fzf.vim'   *Plug 'andymass/vim-matchup' " use % better   4Plug 'airblade/vim-rooter' " cd to nearest .git root   >Plug 'gko/vim-coloresque' " show colors for hex values #000000   " extras   $Plug 'airblade/vim-gitgutter' " git    Plug 'mhinz/vim-startify'   Plug 'thaerkh/vim-workspace'   4Plug 'mg979/vim-visual-multi', {'branch': 'master'}    " directory navigation NERDtree   Plug 'preservim/nerdtree'   "Plug 'Xuyuanp/nerdtree-git-plugin'   Plug 'ryanoasis/vim-devicons'   .Plug 'tiagofumo/vim-nerdtree-syntax-highlight'   call plug#end()       %let g:material_theme_style = 'darker'    let g:airline_theme = 'material'   Qau ColorScheme * hi Normal ctermbg=none guibg=none              "transparent back   Qau ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red  "transparent back   colorscheme material       " case-sensitive otherwise   
" nerdtree   "nnoremap <M-1> :NERDTreeToggle<CR>   nnoremap <M-Enter> :CocFix<CR>   nnoremap <S-F6> :ALERename<CR>   %nnoremap <C-B> :ALEGoToDefinition<CR>   " move lines   xnoremap <S-Up>  :m-2<CR>gv=gv    xnoremap <S-Down> :m'>+<CR>gv=gv   " ale     let g:ale_sign_column_always = 1   (let g:airline#extensions#ale#enabled = 1       " telescope   nnoremap ff :GFiles<CR>   nnoremap fb :Buffers<CR>   " search in all files   nnoremap fl :Lines<CR> 5�5�_�                    3        ����                                                                                                                                                                                                                                                                                                                                                             a%z     �   2   3          let g:workspace_autocreate = 15��    2                      Z                     5�_�                    3        ����                                                                                                                                                                                                                                                                                                                                                             a%{     �   2   3          #let g:workspace_autosave_always = 15��    2                      Z      $               5�_�                    2        ����                                                                                                                                                                                                                                                                                                                                                             a%{     �   1   2          " workspace5��    1                      N                     5�_�                    2        ����                                                                                                                                                                                                                                                                                                                                                             a%|    �   1   2           5��    1                      N                     5�_�                    N        ����                                                                                                                                                                                                                                                                                                                                                             a%�    �   M   N          Plug 'thaerkh/vim-workspace'5��    M                      �                     5�_�                    N        ����                                                                                                                                                                                                                                                                                                                                                             a%�    �   M   O   m      4Plug 'mg979/vim-visual-multi', {'branch': 'master'} 5��    M   3                  �                     5�_�      	              =        ����                                                                                                                                                                                                                                                                                                                                                             a%�     �   <   =          Plug 'dag/vim-fish'5��    <                      �                     5�_�                 	   =        ����                                                                                                                                                                                                                                                                                                                                                             a%�   	 �   <   =          Plug 'cespare/vim-toml'5��    <                      �                     5�_�   	      
          =        ����                                                                                                                                                                                                                                                                                                                                                             a%J     �   <   =          Plug 'stephpy/vim-yaml'5��    <                      �                     5�_�                    =        ����                                                                                                                                                                                                                                                                                                                                                             a%K     �   <   =          Plug 'othree/html5.vim'5��    <                      �                     5�_�                    =        ����                                                                                                                                                                                                                                                                                                                                                             a%L   
 �   <   =          Plug 'plasticboy/vim-markdown'5��    <                      �                     5�_�                     =        ����                                                                                                                                                                                                                                                                                                                                                             a%a    �   <   =          Plug 'ekalinin/dockerfile.vim'5��    <                      �                     5�_�   	             
   =        ����                                                                                                                                                                                                                                                                                                                                                             a%�     �   <   >        5��    <                      �                     5�_�   
                 =        ����                                                                                                                                                                                                                                                                                                                                                             a%�     �   <   >        5��    <                      �                     5�_�                    =        ����                                                                                                                                                                                                                                                                                                                                                             a%�    �   <   >        5��    <                      �                     5�_�                    =        ����                                                                                                                                                                                                                                                                                                                                                             a%�     �   <   >        5��    <                      �                     5�_�                    <        ����                                                                                                                                                                                                                                                                                                                                                             a%�    �   ;   =        5��    ;                      �      "               5�_�                     <        ����                                                                                                                                                                                                                                                                                                                                                             a%�    �   ;   =   f       5��    ;                      �                     5��