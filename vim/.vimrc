" Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
" }

" call pathogen#helptags()
" call pathogen#runtime_append_all_bundles()

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

let mapleader=","

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Basic Settings {
set hidden
set nocompatible
set encoding=utf-8

set nowrap
set tabstop=8
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftwidth=8
set shiftround
set showmatch
set showmode
set noignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set ruler
set cursorline
set winminheight=0
" make current window fill up all the space
set winheight=9999

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile

set t_Co=256
" }

" Advanced Settings {
if has('cmdline_info')
set showcmd
endif

if &t_Co > 2 || has('gui_running')
syntax on
endif

if &t_Co >= 256 || has('gui_running')
colorscheme mustang
endif

" File-Specific Settings {
filetype plugin indent on
if has('autocmd')
autocmd filetype python set expandtab
endif
" }

" Status Line {
if has('statusline')
set laststatus=2
set statusline=%<%f\
set statusline+=%w%h%m%r
set statusline+=%{fugitive#statusline()}
set statusline+=\ [%{&ff}/%Y]
set statusline+=\ [%{getcwd()}]
set statusline+=%=%-14.(%l,%c%V%)\ %p%%
endif
" }

" ruler on steroids
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%v\ %P%)

" set list
" set listchars=tab:>.,trail:.,extends:#,nbsp:.

autocmd filetype html,xml set listchars-=tab:>.

set pastetoggle=<F2>

set mouse=a

nnoremap ; :
nnoremap j gj
nnoremap k gk

vmap Q gq
nmap Q gqap

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <silent> <leader>/ :nohlsearch<CR>
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_us

cmap w!! w !sudo tee % > /dev/null
" }

" Bundles {
	Bundle 'gmarik/vundle'
	Bundle 'tpope/vim-fugitive'
	Bundle 'Lokaltog/vim-powerline'
	Bundle 'scrooloose/nerdtree'
	Bundle 'godlygeek/csapprox'
	Bundle 'MarcWeber/vim-addon-mw-utils'
	Bundle 'tomtom/tlib_vim'
	Bundle 'honza/snipmate-snippets'
	Bundle 'garbas/vim-snipmate'

" }

" Plugins {
" Powerline {
" let g:Powerline_symbols = 'fancy'
" let g:Powerline_theme = 'skwp'
" let g:Powerline_colorscheme = 'skwp'
let g:Powerline_cache_enabled = 0
" }
" Fugitive {
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
" }
" NerdTree {
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
" }
" }
