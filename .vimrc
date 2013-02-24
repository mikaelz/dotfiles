call pathogen#infect()

" settings according to :options order


" important
set nocompatible              " behave very Vi compatible (not advisable)

" moving around, searching and patterns
set ignorecase                " ignore case when using a search pattern
set smartcase                 " override 'ignorecase' when pattern has upper case characters
set incsearch                 " show match for partly typed search command

" tags

" displaying text
set scrolloff=8               " number of screen lines to show around the cursor
set wrap                      " long lines wrap
set nolinebreak               " wrap long lines at a character in 'breakat'
set lazyredraw                " don't redraw while executing macros
set nolist                    " show <Tab> as ^I and end-of-line as $
set number		              " show the line number for each line

" syntax, highlighting and spelling
set background=dark           " the background color brightness
set synmaxcol=400             " maximum column to look for syntax items 
set hlsearch     		      " highlight all matches for the last used search pattern
set cursorline                " highlight the screen line of the cursor
set colorcolumn=80            " columns to highlight, match to 'textwidth'

" multiple windows
set laststatus=2	          " always show status line
set statusline=%<%F
set statusline+=%w%h%m%r      " options
set statusline+=\ \ %y/%{&ff}
set statusline+=\ cwd:%{getcwd()}
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " right aligned file nav info

set hidden                    " don't unload a buffer when no longer shown in a window
set splitright                " a new window is put right of the current one

" multiple tab pages
set showtabline=2             " always show tab line
set tabpagemax=16             " maximum number of tab pages to open for -p

" terminal
set ttyfast                   " terminal connection is fast
set titlestring=%f title      " when not empty, use for the window title

" using the mouse
set mouse=a                   " enable mouse support

" printing
" messages and info
set shortmess=atI             " disable intro screen
set showcmd                   " show (partial) command keys in the status line
set ruler                     " show cursor position below each window
set rulerformat=%l:%c ruler   " current column/line in bottom right

" selecting text
" editing text
set undolevels=200            " maximum number of changes that can be undone
set textwidth=80              " line length above which to break a line
set backspace=2               " specifies what <BS>, CTRL-W, etc. in Insert mode
set formatoptions=qrn12       " list of flags how automatic formatting works, :help fo-table
set completeopt=menu          " use a popup menu for Insert mode completion
set omnifunc=syntaxcomplete#Complete " function for filetype-specific Insert mode completion
set nrformats=                " "alpha", "octal" and/or "hex" format for CTRL-A and CTRL-X

" tabs and indenting
set tabstop=4                 " number of spaces a <Tab> in the text stands for 
set shiftwidth=4              " number of spaces used for each step of (auto)indent
set smarttab                  " a <Tab> in an indent inserts 'shiftwidth' spaces
set softtabstop=4             " if non-zero, number of spaces to insert for a <Tab>
set expandtab                 " expand <Tab> to spaces in Insert mode
set autoindent                " automatically set the indent of a new line
set smartindent               " do clever autoindenting

" folding
set nofoldenable              " dont fold by default
set foldnestmax=3             " maximum fold depth for foldmethod 'indent' or 'syntax'

" diff mode
" mapping
set timeoutlen=500            " lower timeout for mappings [msec]

" reading and writing files
set fileformats=unix,dos,mac  " list of file formats to look for when editing a file
set backup                    " keep a backup after overwriting a file 
set backupdir=/tmp            " list of directories to put backup files in

" the swap file
set swapfile                  " use a swap file for this buffer
set directory=/tmp            " list of directories for the swap file

" command line editing
set history=200               " how many command lines are remembered
set wildmode=full             " specifies how command line completion works
set wildignore+=*.o,*.obj,*.pyc,*.DS_Store,*.db " list of patterns to ignore files for file name completion
set wildmenu                  " command-line completion shows a list of matches

" executing external commands
" running make and jumping to errors
" language specific
" multi-byte characters
set encoding=utf-8            " character encoding used in Vim: latin1, utf-8
set fileencoding=utf-8        " character encoding for the current file

" various
set gdefault                  " use the 'g' flag for ':substitute'


syntax on
filetype plugin indent on

colorscheme molokai

" Enable extended % matching
ru macros/matchit.vim

if has('gui_running')
	set guicursor=a:blinkon0 " Disable blinking cursor
	set guifont=Monaco:h12
	set guioptions=ac " Disable GUI menu and toolbar
	set lines=45 columns=180 " Maximize gvim window
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


" correct some spelling mistakes Insert mode
iabbrev htis this
iabbrev funciton function
iabbrev funtion function
iabbrev fucntion function
iabbrev retunr return
iabbrev reutrn return
iabbrev foreahc foreach
iabbrev wsitch switch
iabbrev fitler filter
iabbrev ~? ~/
iabbrev ){ ) {
iabbrev !+ !=
iabbrev !- !=

" correct some spelling mistakes Command mode
cabbrev ~? ~/

" autocomplete funcs and identifiers for languages
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" this will make it impossible to save in any other format than unix
" http://www.reddit.com/r/vim/comments/ozr5h/convert_every_text_file_to_unix_format_if_not/c3lhgpe
autocmd BufWritePre * set ff=unix
" autocmd BufWritePre * :make

" let php_folding = 1
let php_noShortTags = 1
let php_sql_query = 1
let php_htmlInStrings = 1 
let php_baselib = 1

command W :w
command Q :q

" \<space> clear search results
nnoremap <leader><space> :noh<CR>

" \n toggle line number
nnoremap <leader>n :setlocal number!<CR>

" \p toggle paste mode
nnoremap <leader>p :set paste!<CR>

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

" list opened buffers
nnoremap <leader>l :ls<cr>:b<space>

