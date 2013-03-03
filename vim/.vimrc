" Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
" }

" Setup {
filetype on

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

let mapleader=","
" }

" Basic Settings {
set hidden
set nocompatible
set encoding=utf-8
set nowrap
set nolist
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
set equalalways
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
set t_Co=16
set mouse=a
set pastetoggle=<F2>
set spelllang=en_us
set cpoptions+=$
set virtualedit=all
set background=dark
set cindent
set wildmenu
set wildmode=list:longest,full
" }

" Bundles {
        Bundle 'gmarik/vundle'
        Bundle 'tpope/vim-fugitive'
        Bundle 'scrooloose/nerdtree'
        Bundle 'MarcWeber/vim-addon-mw-utils'
        Bundle 'tomtom/tlib_vim'
        Bundle 'honza/snipmate-snippets'
        Bundle 'garbas/vim-snipmate'
        Bundle 'flazz/vim-colorschemes'
        Bundle 'Lokaltog/powerline'
" }

" Advanced Settings {
" Solarized {
let g:solarized_bold=1
let g:solarized_contrast="high"
let g:solarized_degrade=0
let g:solarized_italic=1
let g:solarized_termcolors=16
let g:solarized_termtrans=0
let g:solarized_underline=1
let g:solarized_visibility="high"

if &t_Co >=16 || has('gui_running')
	syntax enable
	colorscheme solarized
endif
" }

" Miscellaneous {
if has('cmdline_info')
set showcmd
endif

filetype plugin indent on

if has('autocmd')
autocmd filetype python set expandtab
endif

set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars=tab:>.
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%v\ %P%)
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
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
" }

" Mapping {
" Basic {
nnoremap ; :
nnoremap j gj
nnoremap k gk

imap '' <Esc>
vmap '' <Esc>
cmap '' <Esc>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-o> <C-w>o
map <C-c> <C-w>c 

map <Space> <C-D>
map <BackSpace> <C-U>

nnoremap <Tab>h <C-w><S-h>
nnoremap <Tab>j <C-w><S-j>
nnoremap <Tab>k <C-w><S-k>
nnoremap <Tab>l <C-w><S-l>

nmap <silent> <leader>. :set list<CR>
nmap <silent> <leader>m :set nolist<CR>

nmap <silent> <leader>/ :nohlsearch<CR>
nmap <silent> <leader>s :set spell!<CR>

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nmap <silent> <leader>wr :set winwidth=1<CR>
nmap <silent> <leader>we :set winwidth=9999<CR>

nmap <silent> <leader>fr :set winheight=1<CR>
nmap <silent> <leader>fe :set winheight=9999<CR> 

vmap Q gq
nmap Q gqap
cmap w!! w !sudo tee % > /dev/null
" }

" Fugitive {
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
" }

" NerdTree {
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
nnoremap <silent> <leader>n :NERDTree .<CR>
" }
" }

" Plugins {
" NerdTree {
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }
" }
