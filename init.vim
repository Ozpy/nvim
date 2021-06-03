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
"Easymotion
Plug 'easymotion/vim-easymotion'
"NerdTree
Plug 'scrooloose/nerdtree'
"TmuxNavigator
Plug 'christoomey/vim-tmux-navigator'
"EasyAlign
Plug 'junegunn/vim-easy-align'
"Ariline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets' 
"Emet
Plug 'mattn/emmet-vim'
"Nercommenter
Plug 'preservim/nerdcommenter'
"Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Emmet
Plug 'mattn/emmet-vim'
"Floaterm: abrir consola en nvim
Plug 'voldikss/vim-floaterm'
call plug#end()


let mapleader=" "

"Config shortcuts
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>wq :wq<CR>
:imap aa <Esc>
nmap <Leader>f :Files<CR>

"Config Theme:
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

"Config easymotion
nmap <Leader>s <Plug>(easymotion-s2)

"Config NerdTree
nmap <Leader>nt :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1

"Config airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

 nmap <Leader>1 :b1<CR>
 nmap <Leader>2 :b3<CR>
 nmap <Leader>3 :b4<CR>
 nmap <Leader>4 :b5<CR>
 nmap <Leader>5 :b6<CR>
 nmap <Leader>l :bnext<CR>
 nmap <Leader>h :bprevious<CR>

 let g:airline_theme='cool'
								      "Config nerdCommenter
filetype plugin on  
								      "Config COC snippets
" Use <C-l> for trigger snippet expand.
imap  <silent><expr> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
									"Config Floaterm
nmap <Leader>cmd :FloatermNew 
let g:floaterm_keymap_toggle = '<F12>'
nmap <Leader>cmdn :FloatermNext
nmap <Leader>cmdp :FloatermPrev
									"Config COC movimiento de seleccion de autocompletar
"Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" use <c-space>for trigger completion
Iinoremap <silent><expr> <c-space> coc#refresh()

