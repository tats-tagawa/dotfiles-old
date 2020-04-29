" space as leader
let mapleader=" "

" -------------------------------- vifm --------------------------------
nnoremap <leader>fm. :Vifm<cr>
nnoremap <leader>fm~ :Vifm ~<cr>

" ------------------------- buffers and panes --------------------------

" write buffer
nnoremap <leader>w :w<cr>

" close pane
nnoremap <leader>dp <c-w>q

" delete buffer but don't close pane
nnoremap <leader>db :bp<bar>sp<bar>bn<bar>bd<cr>

" delete buffer
nnoremap <leader>dd :bd<cr>

" navigate between buffers
nnoremap <s-j><s-j> :bprev<cr>
nnoremap <s-k><s-k> :bnext<cr>

" refresh buffer
nnoremap <leader>rb :e!<cr>

"  quit
nnoremap <leader>q :q<cr>

" jk as escape
inoremap jk <esc>
vnoremap jk <esc>

" reload init.vim / .vimrc
nnoremap <leader>so :source ~/.config/nvim/init.vim<cr>
