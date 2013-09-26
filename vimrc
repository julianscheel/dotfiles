
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Save swapfile in a central place
set dir=~/.vim/swapfiles

" avoid some of those annoying "Press enter bla bla" messages
set shortmess=at

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
    set nobackup      " do not keep a backup file, use versions instead
else
    set backup        " keep a backup file
    set backupdir=~/.vim/backups
endif
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch       " do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Enable vim-pathogen
call pathogen#infect()

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 88 || has("gui_running")
    colorscheme wombat256
    syntax on
    set hlsearch
    set number
endif

" GUI settings
set guioptions-=T "disable toolbar
set guifont=ProggyTinyTTSZ\ 12


" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

else

    set autoindent        " always set autoindenting on

endif " has("autocmd")

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

