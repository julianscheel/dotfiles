
set nocompatible
set dir=~/.vim/swapfiles " Save swapfile in a central place

if &shell =~# 'fish$'
  set shell=sh
endif

" Setup plugins
filetype off
call plug#begin('~/.vim/plugins')
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'

Plug 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1

Plug 'scrooloose/syntastic'
let g:syntastic_cpp_checkers = ['clang_check']
let g:syntastic_cpp_clang_check_post_args = ''

Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'

Plug 'scrooloose/nerdtree'
nmap <silent> <S-TAB> :NERDTreeToggle<CR>

Plug 'bling/vim-airline'
let g:airline_exclude_preview = 1
let g:airline_powerline_fonts = 1

Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'Lokaltog/vim-easymotion'
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'sjl/gundo.vim'
Plug 'wting/rust.vim'
Plug 'mhinz/vim-startify'
Plug 'dag/vim-fish'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

call plug#end()
filetype plugin indent on

" General settings
set encoding=utf-8
set shortmess=at " avoid some of those annoying "Press enter ..." messages
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set nobackup " No backups but versions
set history=50 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching
set listchars=tab:»\ ,trail:·
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
syntax on

" Keymappings
let mapleader = "ß"
noremap j gj
noremap k gk
nmap <Leader>w :w<CR>
nmap <Leader>n :noh<CR>
nmap <Leader>p :CtrlP<CR>
nmap <Leader>b :CtrlPBuffer<CR>
vnoremap > >gv
vnoremap < <gv
nnoremap <f5> :GundoToggle<cr>
nnoremap Q <nop>
nmap <leader>ss :setl spell!<cr>
nmap <leader>se :setl spelllang=en<cr>
nmap <leader>sd :setl spelllang=de<cr>

" Commands
com RC e ~/.vimrc

" GUI settings
if has("gui_running")
    set guioptions-=m " Disable menu
    set guioptions-=T " Disable toolbar
    set guioptions-=r " Disable right scroll bar
    set guioptions-=L " Disable left scroll bar
    set guioptions-=e " Terminal style tabline
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
endif

" Colorscheme
set background=dark
if has("gui_running") || (&t_Co == 256)
    colorscheme gruvbox
endif

