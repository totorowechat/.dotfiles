execute pathogen#infect()
:inoremap jk <Esc>

" map leader to space
:map <Space> <Leader>

:nmap <Leader>w :w<Enter>

:nmap <Leader>q :q <Enter>

:nnoremap <Leader>wq :wq<Enter>

:nnoremap <Leader>e $

:nnoremap <Leader>a 0


" ack.vim configuration

let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

