" vim: fdm=marker foldlevel=0

" {{{ Plugins
call plug#begin('~/.config/nvim/plugins')
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'chrisbra/vim-diff-enhanced', { 'on': 'PatienceDiff' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'SirVer/ultisnips'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'

Plug '~/code/darksome/vim'
call plug#end()
" }}}

" {{{ General settings
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
set cursorline
set expandtab
set foldlevel=99
set foldmethod=syntax
set grepformat=%f:%l:%c:%m
set grepprg=ag\ --vimgrep\ $*
set ignorecase
set linebreak
set nobackup
set nowritebackup
set number
set scrolloff=12
set shiftwidth=4
set showbreak=...\ \ 
set smartcase
set spelllang=en
set splitbelow
set splitright
set tabstop=4
set termguicolors
set textwidth=100
set title
set wildmode=longest,list
" }}}

" {{{ Colorscheme
set background=dark
colorscheme gruvbox
" }}}

" {{{ Plugin settings

" {{{ 'bling/vim-airline'
let g:airline_powerline_fonts = 1
" }}}

" {{{ 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = {
    \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files -co --exclude-standard'],
    \ },
    \ 'fallback': 'find %s -type f'
    \ }
" }}}

" {{{ 'mbbill/undotree'
let g:undotree_SetFocusWhenToggle = 1
" }}}

" {{{ 'scrooloose/nerdtree'
let NERDTreeChDirMode = 2
" }}}

" {{{ 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = '<C-l>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
" }}}

" {{{ 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'notes' : 1,
            \ 'markdown' : 1,
            \ 'unite' : 1,
            \ 'text' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \ 'mail' : 1
            \ }
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<C-j>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<C-k>']
" }}}

" {{{ 'vimwiki/vimwiki'
let g:vimwiki_map_prefix = '<Leader>aw'
let g:vimwiki_folding='syntax'
" autocmd FileType vimwiki inoremap <silent><buffer> <M-CR> <ESC>:VimwikiReturn 4 2<CR>
" }}}

" }}}

" {{{ Keybindings
let mapleader = "ß"

" {{{ General
nnoremap Q <nop>
noremap j gj
noremap k gk
vnoremap < <gv
vnoremap > >gv
nnoremap <leader><tab> <C-^>
noremap <A-j> <C-e>
noremap <A-k> <C-y>
nnoremap <silent> <leader>n :<C-u>nohlsearch<CR>
map <M-CR> <S-CR>
imap <M-CR> <S-CR>
" }}}

" {{{ Applications (a)
nmap <silent> <leader>au :<C-u>UndotreeToggle<CR>
nmap <silent> <leader>af :<C-u>NERDTreeToggle<CR>
" }}}

" {{{ Buffers (b)
nnoremap <leader>bb :<C-u>CtrlPBuffer<CR>
nnoremap <leader>bd :<C-u>bd<CR>
" }}}

" {{{ Files (f)
nnoremap <leader>fs :<C-u>:w<CR>
nnoremap <leader>fp :<C-u>CtrlP<CR>
" }}}

" {{{ Git (g)
nmap <silent> <leader>gs :<C-u>Gstatus<CR>
nmap <silent> <leader>gc :<C-u>Gcommit<CR>
nmap <silent> <leader>gd :<C-u>Gdiff<CR>
nmap <leader>gw :<C-u>Gwrite<CR>
" }}}

" {{{ Quit / Restart (q)
nmap <silent> <leader>qq :<C-u>qa<CR>
" }}}

" {{{ Tags (t)
noremap <leader>tt <C-]>
noremap <silent> <leader>tj :<C-u>tag<CR>
noremap <silent> <leader>tk :<C-u>pop<CR>
noremap <silent> <leader>ts :<C-u>tags<CR>
noremap <silent> <leader>tf :<C-u>CtrlPTag<CR>
" }}}

" {{{ Toggles (T)

nnoremap <silent> <leader>Tl :<C-u>setlocal number!<CR>

" {{{ Spelling (s)
nnoremap <silent> <leader>Tss :<C-u>setlocal spell!<CR>
nnoremap <silent> <leader>Tse :<C-u>setlocal spelllang=en<CR>
nnoremap <silent> <leader>Tsd :<C-u>setlocal spelllang=de<CR>
" }}}

" }}}

" {{{ Windows (w)
nnoremap <leader>1 1<C-w>w
nnoremap <leader>2 2<C-w>w
nnoremap <leader>3 3<C-w>w
nnoremap <leader>4 4<C-w>w
nnoremap <leader>ws <C-w>s
nnoremap <leader>wv <C-w>v
nnoremap <leader>wd <C-w>c
nnoremap <leader>wm <C-w>o
nnoremap <leader>w= <C-w>=
nnoremap <leader>ww <C-w>w
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>wH <C-w>H
nnoremap <leader>wJ <C-w>J
nnoremap <leader>wK <C-w>K
nnoremap <leader>wL <C-w>L
" }}}

" }}}
