
syntax on
set cin ai si et  aw ts=4 sw=4 ttm=100 nu rnu belloff=all bg=dark ru mouse=v bs+="indent,eol,start" nocp clipboard^=unnamedplus autoread cindent cino+=j1,(0,ws,WS 
set makeprg=g++\ %\ -o\ %<\ -std=c++17\ -O2
let g:netrw_banner = 0
let mapleader = " "

inoremap {<CR> {<CR>}<ESC>O
inoremap jk <ESC>
nnoremap <Leader>e :Ex<CR>

nnoremap <Leader>bp :let @+ = expand("%:p")<CR>



