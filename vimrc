" vim: fdm=marker foldlevel=0

set nocompatible
set dir=~/.vim/swapfiles " Save swapfile in a central place

if &shell =~# 'fish$'
  set shell=sh
endif

" {{{ Plugins
filetype off
call plug#begin('~/.vim/plugins')
Plug 'Shougo/vimproc.vim'
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/unite.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'Lokaltog/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'wting/rust.vim', { 'for': 'rust' }
Plug 'mhinz/vim-startify'
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'alx741/vinfo', { 'on': 'Vinfo' }
Plug 'chrisbra/vim-diff-enhanced', { 'on': 'PatienceDiff' }
call plug#end()
filetype plugin indent on
" }}}

" {{{ General settings
set encoding=utf-8
set shortmess=at " avoid some of those annoying "Press enter ..." messages
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set nobackup " No backups but versions
set history=50 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching
set listchars=tab:»\ ,
set list
set laststatus=2 " Always show status line
set hlsearch
set number
set scrolloff=12
set wrap
set linebreak
set showbreak=...\ \  " Make broken lines more explicit
set shiftwidth=4
set tabstop=4
set expandtab
set ignorecase
set smartcase
set noshowmode
set wildmode=longest,list
set splitbelow
set splitright
set spelllang=en
set foldmethod=syntax
set foldlevelstart=99
syntax on
" }}}

" {{{ Keymappings
let mapleader = "ß"
nnoremap <cr> :
vnoremap <cr> :
noremap j gj
noremap k gk
nmap <leader>w :w<cr>
nmap <leader>n :noh<cr>
vnoremap > >gv
vnoremap < <gv
nnoremap Q <nop>
nmap <leader>ss :setl spell!<cr>
nmap <leader>se :setl spelllang=en<cr>
nmap <leader>sd :setl spelllang=de<cr>
nmap <silent> du :<c-u>diffupdate<cr>
" }}}

" {{{ Commands
com RC e ~/dotfiles/vimrc
" }}}

" {{{ GUI settings
if has("gui_running")
    set guioptions-=m " Disable menu
    set guioptions-=T " Disable toolbar
    set guioptions-=r " Disable right scroll bar
    set guioptions-=L " Disable left scroll bar
    set guioptions-=e " Terminal style tabline
    set guifont=Terminess\ Powerline\ 10
endif
" }}}

" {{{ Plugin settings and keymappings

" {{{ 'scrooloose/syntastic'
let g:syntastic_cpp_checkers = ['clang_check']
let g:syntastic_cpp_clang_check_post_args = ''
" }}}

" {{{ 'scrooloose/nerdtree'
nmap <silent> <s-tab> :NERDTreeToggle<cr>
" }}}

" {{{ 'bling/vim-airline'
let g:airline_exclude_preview = 1
let g:airline_powerline_fonts = 1
" }}}

" {{{ 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
" }}}

" {{{ 'Shougo/unite.vim'
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>u :<c-u>Unite -start-insert -ignorecase<cr>
nnoremap <leader>p :<c-u>Unite -start-insert -ignorecase buffer file_rec/async<cr>
" }}}

" {{{ 'bronson/vim-trailing-whitespace'
let g:extra_whitespace_ignored_filetypes = ["unite"]
" }}}

" {{{ 'sjl/gundo.vim'
nnoremap <f5> :GundoToggle<cr>
" }}}

" }}}

" {{{ Colorscheme
set background=dark
if has("gui_running") || (&t_Co == 256)
    colorscheme gruvbox
endif
" }}}
