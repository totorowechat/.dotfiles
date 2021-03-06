" installed plugin 
"
" ack.vim
" LeaderF
" vim-commentary
" vim-sensible

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'mileszs/ack.vim'

Plug 'tpope/vim-sensible'

Plug 'tpope/vim-commentary'

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

call plug#end()

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

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

:nmap <Leader>tt :tabnew 
:nmap <Leader>tc :tabclose<cr>
:nmap <Leader>to :tabonly<cr>
:nmap <Leader>tn :tabnext<cr>
:nmap <Leader>tp :tabprevious<cr>

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


