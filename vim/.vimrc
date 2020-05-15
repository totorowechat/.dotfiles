" installed plugin 
"
" ack.vim
" LeaderF
" vim-commentary
" vim-sensible
" vim-smooth-scroll

execute pathogen#infect()
:inoremap jk <Esc>

" map leader to space
:nmap <Space> <Leader>


:nmap <Leader>fw :w<cr>

:nnoremap <Leader>fq :q <cr>

:nnoremap <Leader>fa :wq<cr>

:nnoremap <Leader>e $

:nnoremap <Leader>a 0

" copy yank, paste

set clipboard^=unnamed,unnamedplus
:vnoremap <Leader>y "+y
:nnoremap <Leader>p "+p

" buffer

:nmap <Leader>bn :bn<cr>
:nmap <Leader>bp :bp<cr>

:vnoremap <Leader>y "+y
" tab

:nmap <Leader>tn :tabnew 
:nmap <Leader>tc :tabclose<cr>
:nmap <Leader>to :tabonly<cr>

" vim-smooth-scroll

" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 16, 1)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 16, 1)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 16, 1)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 16, 1)<CR>

" ack
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack



execute pathogen#infect()
:inoremap jk <Esc>

" map leader to space
:nmap <Space> <Leader>


:nmap <Leader>fw :w<cr>

:nnoremap <Leader>fq :q <cr>

:nnoremap <Leader>fa :wq<cr>

:nnoremap <Leader>e $

:nnoremap <Leader>a 0

" copy yank, paste

set clipboard^=unnamed,unnamedplus
:vnoremap <Leader>y "+y
:nnoremap <Leader>p "+p

" buffer

:nmap <Leader>bn :bn<cr>
:nmap <Leader>bp :bp<cr>

:vnoremap <Leader>y "+y
" tab

:nmap <Leader>tn :tabnew 
:nmap <Leader>tc :tabclose<cr>
:nmap <Leader>to :tabonly<cr>

" vim-smooth-scroll

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 16, 1)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 16, 1)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 16, 1)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 16, 1)<CR>

" ack
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

