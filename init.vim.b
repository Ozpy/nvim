set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set showmatch
set sw=2
set relativenumber

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
"Theme
Plug 'morhetz/gruvbox'

"IDE:
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
call plug#end()

"Config Theme:
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

"Config easymotion
let mapleader=" "
nmap <Leader>s <Plug>(easymotion-s2)

"Config NerdTree
nmap <Leader>nt :NERDTreeFind<CR>
