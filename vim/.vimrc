" Notes {
"	vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
" }

" Setup {
	let mapleader=","
        let loaded_matchparen = 1

	set rtp+=~/.vim/bundle/Vundle.vim

	call vundle#begin()
        Plugin 'flazz/vim-colorschemes'
        Plugin 'garbas/vim-snipmate'
        Plugin 'hced/bufkill-vim'
        Plugin 'scrooloose/nerdtree'
        Plugin 'scrooloose/snipmate-snippets'
        Plugin 'tomtom/tlib_vim'
        Plugin 'Townk/vim-autoclose'
        Plugin 'tpope/vim-fugitive'
        Plugin 'vim-addon-mw-utils'
        Plugin 'VundleVim/Vundle.vim'
	call vundle#end()

	filetype on
	filetype plugin on
	filetype indent on

        colorscheme molokai
" }

" Basic Settings {
	set hidden
	set noexrc
	set nocompatible
	set encoding=utf-8
	set nowrap
	set nolist
	set tabstop=8
	set shiftwidth=8
	set softtabstop=8
	set shiftround
	set mousehide
	set expandtab
	set backspace=indent,eol,start
	set autoindent
	set tagstack
	set copyindent
	set relativenumber
	set number
	set showmatch
	set showmode
	set ignorecase
	set infercase
	set smartcase
	set smarttab
	set hlsearch
	set incsearch
	set synmaxcol=1024
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
	set t_Co=256
	set mouse=a
	set pastetoggle=<F2>
	set spelllang=en_us
	set cpoptions+=ces$
	set printoptions=header:0,duplex:long,paper:letter
	set virtualedit=all
	set cindent
	set wildmenu
	set wildmode=list:longest,full
	set lazyredraw
	set tabpagemax=10
	set matchtime=5
	set linespace=0
	set formatoptions=rq
	set showtabline=1
	set colorcolumn=80,120
	set cursorcolumn
	set nostartofline
	set numberwidth=3
	set scrolloff=8
	set sidescrolloff=8
	set shortmess=aOstT
	set autochdir
	set clipboard+=unnamed
	set backupdir=~/.vim/backup
	set iskeyword+=_,$,@,%,#
	set undodir=~/.vim/undo
	set tags=~/.vim/tags/
	set whichwrap=b,s,h,l,<,>,~,[,]
	set directory=~/.vim/tmp
	set laststatus=2
	set showfulltag
	set textwidth=80
        set fillchars = ""
        set diffopt+=iwhite
        set autoread
        set grepprg=grep\ -nH\ $*
        set timeoutlen=500
" }

" Advanced Settings {
	" Folding {
		set foldenable
		set foldmarker={,}
		set foldmethod=marker
		set foldlevel=9999
		set foldopen=block,insert,jump,hor,mark,percent,quickfix,search,tag,undo

		function SimpleFoldText() " {
			return getline(v:foldstart).' '
		endfunction " }

		set foldtext=SimpleFoldText()
        " }

	" Miscellaneous {
		if has('cmdline_info')
			set showcmd
		endif

		set listchars=tab:>.,trail:.,extends:#,nbsp:.
		autocmd filetype html,xml,py set listchars=tab:>.
	        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%v\ %P%)
	" }

	" Status Line {
		if has('statusline')
		        set statusline=%<%f\
		        set statusline+=%w%h%m%r
		        set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
		        set statusline+=\ [%{&ff}/%Y]
		        set statusline+=\ [%{getcwd()}]
		        set statusline+=%=%-14.(%l,%c%V%)\ %p%%
		endif
        " }
" }

" Mapping {
	" Basic {
 		vmap Q gq
		nmap Q gqap 
		imap '' <Esc>
		vmap '' <Esc>

		nnoremap ; :
                nnoremap j gj
                nnoremap k gk

		map <Space> <C-D>
		map <BackSpace> <C-U>

                map <leader>hx :%!xxd<CR>
                map <leader>hq :%!xxd -r<CR>

		nmap <silent> <leader>a 10zl
		nmap <silent> <leader>f 10zh

                nmap <silent> <leader>cd :lcd %:h<CR>
 		nmap <silent> <leader>/ :nohlsearch<CR>
		nmap <silent> <leader>s :set spell!<CR>
                
		nmap <silent> <leader>ev :e $MYVIMRC<CR>
		nmap <silent> <leader>sv :so $MYVIMRC<CR>

                nmap <silent> <leader>dcs :colorscheme molokai<CR>
                nmap <silent> <leader>lcs :colorscheme github<CR>
	" }
	
	" Toggle {
                nmap <silent> <leader>hl :set invcursorline<CR>
		nmap <silent> <leader>hk :set invcursorcolumn<CR> 
		nmap <silent> <leader>ww :set invwrap<CR>:set wrap?<CR>
		nmap <silent> <leader>p :set invpaste<CR>:set paste?<CR>
		nmap <silent> <leader>? :set invhls<CR>:set invhls?<CR>
 		nmap <silent> <leader>. :set invlist<CR>:set invlist?<CR>
	" }
	
	" Advanced {
		cmap w!! w !sudo tee % > /dev/null
		nmap <silent> <leader>wa :1,9000bwipeout<CR>
		nmap <silent> <leader>md :!mkdir -p %:p:h<CR>
                nmap <silent> <leader>x :w<CR>:!chmod 755 %<CR>:e<CR> 
		imap <leader>fn <C-R>=expand('%:t:r')<CR>
                nmap <silent> <leader>C :set opfunc=ClearText<CR>g@
		vmap <silent> <leader>C :<C-U>call ClearText(visual(), 1)<CR>
        	nmap <silent>gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

		function! ClearText(type, ...)
		        let sel_save = &selection
		        let &selection = "inclusive"
		        let reg_save = @@
		        if a:0
		                silent exe "normal! '<" . a:type . "'>r w"
                        elseif a:type == 'line'
                                silent exe "normal! '[V']r w"
                        elseif a:type == 'block'
                                silent exe "normal! `[\<C-V>`]r w"
                        else
                                silent exe "normal! `[v`]r w"
                        endif
                        let &selection = sel_save
                        let @@ = reg_save
                endfunction

                au FilterWritePre * if &diff | colorscheme BlackSea | 
                                        \ set colorcolumn= |  
                                        \ set nocursorline |
                                        \ set nocursorcolumn | 
                                        \ highlight DiffText cterm=none ctermfg=Red ctermbg=LightGrey |
                                        \ highlight DiffChange cterm=none ctermfg=Black ctermbg=LightGrey |
                                        \ endif
	" }
	
	" Commands {
	        nmap <silent> <leader>gt :execute "!zsh goldscript.sh -r"<CR>
	        nmap <silent> <leader>pt :execute "!zsh goldscript.sh -w"<CR>
	" }
	
	" Window {
	 	map <C-h> <C-w>h
		map <C-j> <C-w>j
		map <C-k> <C-w>k
		map <C-l> <C-w>l
		map <C-o> <C-w>o
		map <C-c> <C-w>c 

                nnoremap <Tab>h <C-w><S-h>
		nnoremap <Tab>j <C-w><S-j>
		nnoremap <Tab>k <C-w><S-k>
		nnoremap <Tab>l <C-w><S-l>  

 		noremap <silent> <C-7> <C-W><
		noremap <silent> <C-8> <C-W>-
		noremap <silent> <C-9> <C-W>+
		noremap <silent> <C-0> <C-W>> 

	        nmap <silent> <leader>bd :BD<CR>

		noremap <silent> <leader>cc :close<CR>
		noremap <silent> <leader>cw :cclose<CR>

                nmap <silent> <leader>wr :set winwidth=1<CR>
		nmap <silent> <leader>we :set winwidth=9999<CR> 
		nmap <silent> <leader>fr :set winheight=1<CR>
		nmap <silent> <leader>fe :set winheight=9999<CR> 

                noremap <silent> <C-F9> :vertical resize -10<CR>
		noremap <silent> <C-F10> :resize +10<CR>
		noremap <silent> <C-F11> :resize -10<CR>
		noremap <silent> <C-F12> :vertical resize +10<CR>

		noremap <silent> <leader>cj :wincmd j<CR>:close<CR>
		noremap <silent> <leader>ck :wincmd k<CR>:close<CR>
		noremap <silent> <leader>ch :wincmd h<CR>:close<CR>
		noremap <silent> <leader>cl :wincmd l<CR>:close<CR>

		nmap <silent> <leader>sw :execute ":resize " . line('$')<CR> 
	" }

	" Fugitive {
		nnoremap <silent> <leader>gl :Glog<CR>
		nnoremap <silent> <leader>gr :Gread<CR>
		nnoremap <silent> <leader>gd :Gdiff<CR>
                \ :colorscheme github<CR>
		nnoremap <silent> <leader>gw :Gwrite<CR>
		nnoremap <silent> <leader>gb :Gblame<CR>
		nnoremap <silent> <leader>gs :Gstatus<CR>
		nnoremap <silent> <leader>gD :diffoff!<CR><C-W>h:bd<CR>
                \ :colorscheme molokai<CR>
	" }

	" NerdTree {
		map <C-E> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
		map <leader>e :NERDTreeFind<CR>
		nmap <leader>nt :NERDTreeFind<CR>
		nnoremap <silent> <leader>n :NERDTree .<CR>
		let NERDTreeIgnore=[ '\.obj$','\.o$','\.pdf' ]
		let NERDTreeShowBookmarks=1
		" autocmd vimenter * if !argc() | NERDTree | endif
                autocmd bufenter * if (winnr("$") == 1 && exists("
                \ b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
	" }
" }
