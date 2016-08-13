" vim: fdm=marker foldlevel=0

" {{{ Plugins
call plug#begin('~/.config/nvim/plugins')
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'chrisbra/vim-diff-enhanced'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
call plug#end()
" }}}

" {{{ General settings
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
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
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = "soft"
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

" {{{ 'haya14busa/incsearch.vim'
map / <Plug>(incsearch-forward)
" }}}

" {{{ 'mbbill/undotree'
let g:undotree_SetFocusWhenToggle = 1
" }}}

" {{{ 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep'
cnoreabbrev ag Ack!
" }}}

" {{{ 'scrooloose/nerdcommenter'
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
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
let g:ycm_collect_identifiers_from_tags_files = 1
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
let g:vimwiki_folding = 'syntax'
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
nmap <silent> <leader>n :nohlsearch<CR>
map <M-CR> <S-CR>
imap <M-CR> <S-CR>
" }}}

" {{{ Applications (a)
nmap <silent> <leader>au :UndotreeToggle<CR>
nmap <silent> <leader>af :NERDTreeToggle<CR>
" }}}

" {{{ Buffers (b)
nmap <leader>bb :CtrlPBuffer<CR>
nmap <leader>bd :bd<CR>
" }}}

" {{{ Commenting (c)
map <leader>cc <plug>NERDCommenterToggle
map <leader>cy <plug>NERDCommenterYank
map <leader>ca <plug>NERDCommenterAppend
" }}}

" {{{ Files (f)
nmap <leader>fs :w<CR>
nmap <leader>fp :CtrlP<CR>
" }}}

" {{{ Git (g)
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gc :Gcommit<CR>
nmap <silent> <leader>gd :Gdiff<CR>
nmap <leader>gw :Gwrite<CR>
" }}}

" {{{ Quit / Quickfix (q)
nmap <silent> <leader>qq :qa<CR>
nmap <silent> <leader>qo :copen<CR>
nmap <silent> <leader>qc :cclose<CR>
nmap <silent> <leader>qj :cnext<CR>
nmap <silent> <leader>qk :cprevious<CR>
" }}}

" {{{ Tags (t)
noremap <leader>tt <C-]>
nmap <silent> <leader>tj :tag<CR>
nmap <silent> <leader>tk :pop<CR>
nmap <silent> <leader>ts :tags<CR>
" nmap <silent> <leader>tf :CtrlPTag<CR>
" }}}

" {{{ Toggles (T)

nmap <silent> <leader>Tl :setlocal number!<CR>

" {{{ Spelling (s)
nmap <silent> <leader>Tss :setlocal spell!<CR>
nmap <silent> <leader>Tse :setlocal spelllang=en<CR>
nmap <silent> <leader>Tsd :setlocal spelllang=de<CR>
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
