
set cin ai si noet  aw ts=4 sw=4 ttm=100 nu rnu belloff=all ru bg=dark mouse=a bs+="indent,eol,start"  autoread cindent cino+=j1,(0,ws,WS
set makeprg=g++\ %\ -o\ %<\ -std=c++17\ -O2

let g:netrw_banner = 0
let mapleader = " "
inoremap {<CR> {<CR>}<ESC>O
inoremap jk <ESC>
nnoremap <Leader>e :Ex<CR>
nnoremap <M-j> :cn<CR>
nnoremap <M-k> :cp<CR>
nnoremap <Leader>m :make<CR>

nnoremap <Leader>bp :let @+ = expand("%:p")<CR>



