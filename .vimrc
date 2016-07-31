call pathogen#infect()

" settings according to :options order
" important
set nocompatible              " behave very Vi compatible (not advisable)

" moving around, searching and patterns
set ignorecase                " ignore case when using a search pattern
set smartcase                 " override 'ignorecase' when pattern has upper case characters
set incsearch                 " show match for partly typed search command
set hlsearch     		      " highlight all matches for the last used search pattern

" tags
set tags=./tags;,tags;

" displaying text
set scrolloff=8               " number of screen lines to show around the cursor
set wrap                      " long lines wrap
set nolinebreak               " wrap long lines at a character in 'breakat'
set lazyredraw                " don't redraw while executing macros
set nolist                    " show <Tab> as ^I and end-of-line as $
set number		              " show the line number for each line

" syntax, highlighting and spelling
set background=dark           " the background color brightness
set synmaxcol=200             " maximum column to look for syntax items
syntax sync minlines=256
set nocursorline              " highlight the screen line of the cursor
set nocursorcolumn
" set colorcolumn=80          " columns to highlight, match to 'textwidth'

" multiple windows
set laststatus=2	          " always show status line
set statusline=%<%F
set statusline+=%w%h%m%r      " options
set statusline+=\ %y/%{&ff}
set statusline+=\/%{''.(&fenc!=''?&fenc:&enc).''} " encoding
set statusline+=\ %{(&bomb?\",BOM\":\"\")}        " encoding2
set statusline+=\CWD:%{getcwd()}
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " right aligned file nav info

set hidden                    " don't unload a buffer when no longer shown in a window
set splitright                " a new window is put right of the current one

" multiple tab pages
set showtabline=2             " always show tab line
" set tabpagemax=16             " maximum number of tab pages to open for -p

" terminal
set ttyfast                   " terminal connection is fast
set title
set titlelen=70
" set titlestring=%f            " when not empty, use for the window title

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
set pumheight=15              " Determines the maximum number of items to show in the popup menu for Insert mode completion
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
set nofoldenable              " fold by default
set foldlevelstart=0          " open folds level
set foldnestmax=5             " maximum fold depth for foldmethod 'indent' or 'syntax'
set foldmethod=indent         " fold based on indent level

" diff mode
" mapping
set timeoutlen=500            " lower timeout for mappings [msec]

" reading and writing files
set fileformats=unix,dos,mac  " list of file formats to look for when editing a file
set backup                    " keep a backup after overwriting a file
set backupdir^=/tmp//         " list of directories to put backup files in

" the swap file
set swapfile                  " use a swap file for this buffer
set directory^=/tmp//         " list of directories for the swap file

" command line editing
set history=200               " how many command lines are remembered
set wildmode=list:longest,full             " specifies how command line completion works
set wildignore+=*.o,*.obj,*.pyc,*.db " list of patterns to ignore files for file name completion
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=*~,*.swp,*.tmp,*.zip
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor
set wildmenu                  " command-line completion shows a list of matches

" executing external commands
" running make and jumping to errors
" language specific
" multi-byte characters
set encoding=utf-8            " character encoding used in Vim: latin1, utf-8
set fileencoding=utf-8        " character encoding for the current file

" various
set virtualedit=block         " when to use virtual editing
set gdefault                  " use the 'g' flag for ':substitute'
set autoread

syntax on
filetype plugin indent on

" Enable extended % matching
ru macros/matchit.vim

if $TERM == 'xterm-256color' || $TERM == 'screen-256color'
    set t_Co=256
endif

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

" http://vimcolorschemetest.googlecode.com/svn/html/index-html.html
" colorscheme molokai
colorscheme xoria256
" colorscheme wombat256
" colorscheme gardener
" colorscheme greenvision


" correct some spelling mistakes Insert mode
iabbrev PSOT POST
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
autocmd FileType css set omnifunc=csscomplete#CompleteCSS noci
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType sql set omnifunc=sqlcomplete#CompleteSQL
autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['standard']

autocmd BufNewFile,BufRead *.less set filetype=css
autocmd BufRead,BufNewFile *.tpl set filetype=smarty

" this will make it impossible to save in any other format than unix
" http://www.reddit.com/r/vim/comments/ozr5h/convert_every_text_file_to_unix_format_if_not/c3lhgpe
" autocmd BufWritePre * set ff=unix
" autocmd BufWritePre * :make
" autocmd BufEnter * let &titlestring = ' ' . expand("%:f")

" let php_folding = 1
let php_noShortTags = 1
let php_sql_query = 1
let php_htmlInStrings = 1
let php_baselib = 1

command W :w
command Q :q
command E :q

let g:phpcomplete_parse_docblock_comments = 1

" let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_checkers = ['php', 'phpmd']
let g:syntastic_php_phpmd_post_args = '~/.vim/phpmd_rules.xml'
let g:syntastic_csslint_args = "--ignore=outline-none"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = '●'
let g:syntastic_style_error_symbol = '‣'
let g:syntastic_warning_symbol = '○'
let g:syntastic_style_warning_symbol = '▹'
autocmd ColorScheme * highlight SyntasticError ctermbg=red  guibg=#960000
autocmd ColorScheme * highlight SyntasticWarning ctermbg=red guibg=#AEA100
autocmd ColorScheme * highlight SyntasticStyleError ctermbg=yellow guibg=#960000
autocmd ColorScheme * highlight SyntasticStyleWarning ctermbg=yellow guibg=#960000

highlight SyntasticErrorLine guibg=#2f0000

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_extensions = ['tag','dir','line','mixed']
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_user_command = 'find %s -type f -not \( -iname tags -o -path "*/.svn/*" -o -path "*/.git/*" -o -path "*/vendor/*" -o -path "*/.idea/*" -o -path "*/cache/*" \)'

" https://github.com/Shougo/neocomplete.vim
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#enable_auto_select = 1

" Define keyword
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

let g:php_cs_fixer_path = "php-cs-fixer" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "symfony"              " which level ?
let g:php_cs_fixer_config = "default"             " configuration
let g:php_cs_fixer_php_path = "php"               " Path to PHP
" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_enable_default_mapping = 0     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0
let g:php_cs_fixer_verbose = 0

" clear search results
nnoremap <leader><space> :noh<CR>

" list opened buffers
nnoremap <leader>b :ls<cr>:b<space>

" open taglist
nnoremap <F2> :TlistOpen<CR>
inoremap <F2> <Esc>:TlistOpen<CR>

" open quickfix list
nnoremap <F3> :copen<CR>
inoremap <F3> <Esc>:copen<CR>

nnoremap <F4> :Vexplore<CR>
inoremap <F4> <Esc>:Vexplore<CR>

" toggle paste mode
nnoremap <F5> :set paste!<CR>

nnoremap <F6> :Gstatus<CR>

" strips whitespace
nnoremap <F8> :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <F9> :update<bar>make<CR>
inoremap <F9> <Esc>:update<bar>make<CR>

" toggle line number
nnoremap <F11> :setlocal number!<CR>

nnoremap j gj
nnoremap k gk

" needs +xterm_clipboard
vnoremap <C-c> "+y

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Whitespace fixes
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()

nnoremap <leader>w :w<CR>
inoremap <leader>w <Esc>:w<CR>
vnoremap <leader>w <Esc>:w<CR>

nnoremap <leader>q :q<CR>
inoremap <leader>q <Esc>:q<CR>
vnoremap <leader>q <Esc>:q<CR>

nnoremap <leader>n :tabnew<CR>

nmap <silent> <UP>    :lprev<CR>
nmap <silent> <DOWN>  :lnext<CR>
nmap <silent> <LEFT>  :cprev<CR>
nmap <silent> <RIGHT> :cnext<CR>
