
set nocompatible
set dir=~/.vim/swapfiles " Save swapfile in a central place

" Setup Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Bundles
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'

Plugin 'scrooloose/nerdtree'
nmap <silent> <S-TAB> :NERDTreeToggle<CR>

Plugin 'bling/vim-airline'
let g:airline_exclude_preview = 1
let g:airline_powerline_fonts = 1

Plugin 'morhetz/gruvbox'
Plugin 'airblade/vim-gitgutter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

Plugin 'tpope/vim-surround'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'sjl/gundo.vim'

call vundle#end()
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

