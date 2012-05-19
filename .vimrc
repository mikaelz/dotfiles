set nocompatible              " Use vim advance settings
set autoindent                " Auto-indent on
set shm=atI                   " Disable intro screen
set lazyredraw                " Don't redraw screen during macros
set ttyfast                   " Improves redrawing for newer computers
set timeoutlen=500            " Lower timeout for mappings
set history=50                " Only store past 500 commands
set undolevels=50             " Only undo up to 150 times
set titlestring=%f title      " Display filename in terminal window
set guitablabel=%N\ %t%(\ %M%)
set ruler                     " Show ruler
set rulerformat=%l:%c ruler   " Display current column/line in bottom right
set showcmd                   " Show incomplete command at bottom right
set splitbelow                " Open new split windows below current
set bs=2                      " Allow backspacing over anything
set completeopt=menu          " Don't show extra info on completions
set ignorecase smartcase      " Only be case sensitive when search contains uppercase
set gdefault                  " Assume /g flag on :s searches
set hidden                    " Allow hidden buffers
set mouse=a                   " Enable mouse support
set number		              " Show line numbers
set hlsearch     		      " Highlight search terms
set incsearch
set encoding=utf-8
set fileencoding=utf-8
set et                        " Tabs to spaces
set sw=4                      " Shift width, number of chars for << and >>
set sts=4
set tabstop=4
set smarttab
set smartindent
set ofu=syntaxcomplete#Complete
" Hide irrelevent matches
set wildmode=full
" Enable ctrl-n and ctrl-p to scroll thru matches
set wildmenu
set wildignore+=*.o,*.obj,*.pyc,*.DS_Store,*.db 

" http://www.reddit.com/r/vim/comments/ozr5h/convert_every_text_file_to_unix_format_if_not/
set fileformats=unix,dos,mac  " File formats

" Folds
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


set wrap
set nolinebreak
set nolist
set textwidth=79
" :h fo-table
set formatoptions=qrn12

set laststatus=2	    " Show always status line
set statusline=%<%F
set statusline+=%w%h%m%r " Options
set statusline+=\ \ %y/%{&ff}
set statusline+=\ cwd:%{getcwd()}
" set statusline+=\ mtime:\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}
" set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

syntax on
filetype plugin indent on

" Enable extended % matching
ru macros/matchit.vim

set backup
set swapfile
set backupdir^=$HOME/.vim_bak//   "put all swap files together in one place
set directory^=$HOME/.vim_swap//   "put all swap files together in one place

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=400

colorscheme molokai

if has('gui_running')
	set guicursor=a:blinkon0 " Disable blinking cursor
	set guifont=Monaco:h12
	set guioptions=ac " Disable GUI menu and toolbar
	set lines=45 columns=180 " Maximize gvim window
    " set colorcolumn=85
else
	" Enable "+y (copy to clipboard) support on OS X
	vno <silent> "+y :<c-u>cal<SID>Copy()<cr>
	vm "+Y "+y
	fun s:Copy()
		let old = @"
		norm! gvy
		call system('pbcopy', @")
		let @" = old
	endf
endif


" When the page starts to scroll, keep the cursor 8 lines from the top and 8 lines from the bottom
set scrolloff=8

" Correct some spelling mistakes
ia htis this
ia tihs this
ia funciton function
ia funtion function
ia fucntion function
ia retunr return
ia reutrn return
ia foreahc foreach
ia fitler filter
ia !+ !=
ca !+ !=
ca !- !=
ca ~? ~/

" autocomplete funcs and identifiers for languages
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" this will make it impossible to save in any other format than unix
" http://www.reddit.com/r/vim/comments/ozr5h/convert_every_text_file_to_unix_format_if_not/c3lhgpe
autocmd BufWritePre * set ff=unix

" save all on focus lost
au FocusLost * :wa

" build
set makeprg=php\ -l\ %

" let php_folding = 1
let php_noShortTags = 1
let php_sql_query = 1
let php_htmlInStrings = 1 
let php_baselib = 1

" \<space> clear search results
nnoremap <leader><space> :noh<cr>

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap j gj
nnoremap k gk

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
