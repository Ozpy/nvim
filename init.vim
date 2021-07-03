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
"
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
"Bracey
Plug 'turbio/bracey.vim'
"Fugitive (Git)
Plug 'tpope/vim-fugitive'
call plug#end()


let mapleader=" "

"Config shortcuts
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>wq :wq<CR>
imap aa <Esc>
nmap <Leader>f :Files<CR>
"Config tabs
 nmap <Leader>1 :b1<CR>
 nmap <Leader>2 :b3<CR>
 nmap <Leader>3 :b4<CR>
 nmap <Leader>4 :b5<CR>
 nmap <Leader>5 :b6<CR>
 nmap <Leader>L :bnext<CR>
 nmap <Leader>H :bprevious<CR>
 nmap <Leader>l gt<CR>
 nmap <Leader>h gT<CR>

"Config Theme:
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
set background=dark

"Config easymotion
nmap <Leader>s <Plug>(easymotion-s2)

"Config NerdTree
nmap <Leader>nt :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1

"Config airline
set ttimeoutlen=50
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme='bubblegum'
                                                                      "Config nerdCommenter
filetype plugin on
                                                                      "Config COC snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
"Usar tab para brincar en el codigo
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? coc#_select_confirm() :
      "\ coc#expandableOrJumpable() ?
""\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      "\ <SID>check_back_space() ?
""\<TAB>" :
      "\ coc#refresh()

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"let g:coc_snippet_next = '<tab>'
""///////////Config Floaterm
nmap <Leader>cmd :FloatermNew
let g:floaterm_keymap_toggle = '<F12>'
nmap <Leader>cmdn :FloatermNext
nmap <Leader>cmdp :FloatermPrev
" Configuration floaterm 
let g:floaterm_keymap_new    = '<F9>'
let g:floaterm_keymap_prev   = '<F7>'
let g:floaterm_keymap_next   = '<F8>'
let g:floaterm_keymap_toggle = '<F12>'
"//////////Config COC movimiento de seleccion de autocompletar
"Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
""//////Config Fugitive
"status we can stage and unstage los archivos con s en el archivo para stage y
"u para unstage  
nmap <leader>gs :G<CR> 
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
