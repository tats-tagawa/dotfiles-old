" colorscheme
colorscheme gruvbox

" switch between buffers without closing
set hidden

" relative row numbers
set number
set relativenumber

" remember last 1000 commands
set history=1000

" reload files changed outside vim
set autoread

"more natural splitting
set splitbelow
set splitright

" indentation/tab behavior (softtabs)
set autoindent
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2

" faster redrawing
set ttyfast
set lazyredraw

" faster keys
set timeoutlen=1000
set ttimeoutlen=10

" don't treat numbers as octal when number has leading zeros
set nrformats=

" autosave when focus lost
:au FocusLost * :wa

" show matching brackets/parentheses
set showmatch

" highlight line with cursor
set cursorline

" search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" always leave space above/below cursor
set scrolloff=15

" utf-8
set encoding=utf-8
scriptencoding utf-8

" use system clipboard
set clipboard=unnamed


" make backspace behave like other apps
set backspace=indent,eol,start

" make Vim on macOS happy with DOS EOLs
set ffs=unix,dos
set ff=unix

" Stop Vim from auto-inserting comments in vim files
au FileType vim setlocal fo-=c fo-=r fo-=o

" enable true color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
