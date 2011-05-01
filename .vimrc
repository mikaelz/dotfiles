" vim:ff=unix:
"--------------------------------------------------------------------------
" http://items.sjbach.com/319/configuring-vim-right
"--------------------------------------------------------------------------
set nocompatible            " Use vim advance settings
set autoindent              " Auto-indent on
set shm=atI                 " Disable intro screen
set lazyredraw              " Don't redraw screen during macros
set ttyfast                 " Improves redrawing for newer computers
set nobk nowb noswf         " Disable backup
set timeoutlen=500          " Lower timeout for mappings
set history=50              " Only store past 50 commands
set undolevels=150          " Only undo up to 150 times
set titlestring=%f title    " Display filename in terminal window
set ruler                   " Show ruler
set rulerformat=%l:%c ruler " Display current column/line in bottom right
set showcmd                 " Show incomplete command at bottom right
set splitbelow              " Open new split windows below current
set bs=2                    " Allow backspacing over anything
set wrap linebreak          " Automatically break lines
set completeopt=menu        " Don't show extra info on completions
set ignorecase smartcase    " Only be case sensitive when search contains uppercase
set gdefault                " Assume /g flag on :s searches
set hidden                  " Allow hidden buffers
set mouse=a                 " Enable mouse support
set number		            " Show line numbers
set hls     		        " Highlight search terms
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix,dos    " File formats
set laststatus=2	        " Show always status line
set noet                    " Tabs to spaces
set sw=4                    " Shift width, number of chars for << and >>
set sts=4
set tabstop=4
set smarttab
set smartindent
" set foldmethod=indent
set ofu=syntaxcomplete#Complete
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n " Set the status line the way i like it
set wildmenu " Enable command-line tab completion
set wildmode=full
set wildignore+=*.o,*.obj,*.pyc,*.DS_Store,*.db " Hide irrelevent matches

set textwidth=79
set columns=79
set formatoptions=qrn1     " Automatic formatting

syntax on
filetype plugin indent on

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=400
runtime macros/matchit.vim       " Enable extended % matching

if has('gui_running')
	set guicursor=a:blinkon0 " Disable blinking cursor
	set guifont=monospace\ 10
	set guioptions=ac " Disable GUI menu and toolbar
	set lines=50 columns=120 " Maximize gvim window
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

" Theme
color wombat
if &diff | syntax off | endif " Turn syntax highlighting off for diff

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Correct some spelling mistakes
ia teh the
ia htis this
ia tihs this
ia eariler earlier
ia funciton function
ia funtion function
ia fucntion function
ia retunr return
ia reutrn return
ia foreahc foreach
ia !+ !=
ca !+ !=
ca ~? ~/

" autocomplete funcs and identifiers for languages
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

set makeprg=php\ -l\ %

" let php_folding = 1
let php_noShortTags = 1
let php_sql_query = 1
let php_htmlInStrings = 1 
let php_baselib = 1
