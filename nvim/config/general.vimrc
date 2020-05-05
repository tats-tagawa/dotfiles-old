" colorscheme
colorscheme gruvbox

" switch between buffers without closing
set hidden

" relative row numbers
set number
set relativenumber

"more natural splitting
set splitbelow
set splitright

" indentation/tab behavior (softtabs)
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2

" faster redrawing
set lazyredraw

" faster keys
set timeoutlen=1000
set ttimeoutlen=10

" don't treat numbers as octal when number has leading zeros
set nrformats=

" show matching brackets/parentheses
set showmatch

" highlight line with cursor
set cursorline

" search settings
set ignorecase
set smartcase

" always leave space above/below cursor
set scrolloff=15

" utf-8
scriptencoding utf-8

" use system clipboard
set clipboard=unnamed

" make Vim on macOS happy with DOS EOLs
set ffs=unix,dos
set ff=unix

" Stop Vim from auto-inserting comments in vim files
au FileType vim setlocal fo-=c fo-=r fo-=o

" autosave when focus lost
:au FocusLost * :wa

" enable true color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
