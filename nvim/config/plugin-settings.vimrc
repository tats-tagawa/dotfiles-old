" coc.nvim coc-pairs
" Open brackets on enter
 inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

 " gruvbox color scheme
let g:gruvbox_contrast_dark = "hard"

let g:vimwiki_list = [{'path': '~/Library/Mobile\ Documents/com~apple~CloudDocs/notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
