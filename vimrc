
set nocompatible

set dir=~/.vim/swapfiles " Save swapfile in a central place

" Setup Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles
Bundle 'tpope/vim-fugitive'

Bundle 'Valloric/YouCompleteMe'
let g:ycm_confirm_extra_conf=0
"let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1

Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'

filetype plugin indent on

set shortmess=at " avoid some of those annoying "Press enter ..." messages
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set nobackup " No backups but versions
set history=50 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching
set listchars=tab:\.\  " highlight tabs
set list

map Q gq " Don't use Ex mode, use Q for formatting

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

colorscheme wombat256
syntax on
set hlsearch
set number

" Highlight whitespace errors
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted

" GUI settings
set guioptions-=T "disable toolbar
set guifont=DejaVu\ Sans\ Mono\ 10

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \     exe "normal! g`\"" |
        \ endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif

" Keep a context of 16 lines around curser
set scrolloff=12

" Setup line wrapping
set wrap
set linebreak
set showbreak=...\ \ 

" Only use tabs of size 4
set shiftwidth=4
set tabstop=4
set expandtab

" Let jk move in screen-space
noremap j gj
noremap k gk

" Ignore case in searches except when an uppercase character is used
set ignorecase
set smartcase

" Setup vim-latexsuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor="latex"
let g:Tex_CompileRule_pdf="pdflatex -interaction=nonstopmode -shell-escape $*"

