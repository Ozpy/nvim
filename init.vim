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
set autoindent cindent smartindent showmatch
set incsearch

"---------------copiar y pegar---------------
func! GetSelectedText()
    normal gv"xy
    let result = getreg("x")
    return result
endfunc
noremap <C-C> :call system('clip.exe', GetSelectedText())<CR>
noremap <C-X> :call system('clip.exe', GetSelectedText())<CR>gvx
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

"---------------Theme---------------
Plug 'morhetz/gruvbox'

"---------------IDE---------------
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
"Bracey
Plug 'turbio/bracey.vim'
"Fugitive (Git)
Plug 'tpope/vim-fugitive'
"Autoclose
Plug 'jiangmiao/auto-pairs'
"Color
Plug 'KabbAmine/vCoolor.vim'
"Pickachu Colors
Plug 'DougBeney/pickachu'
"Copy 
Plug 'NLKNguyen/copy-cut-paste.vim'
"Tabline
"poner :CocInstall coc-tabnine
"Plug 'codota/tabnine-vim'
"Suntaxis shows the error
Plug 'vim-syntastic/syntastic', {'for': 'python'}
"codi
Plug 'metakirby5/codi.vim'
"ctrlp otro buscador de archivos
Plug 'ctrlpvim/ctrlp.vim'
"Runcode (ejecuta pedazos de codigo)
Plug '0x84/vim-coderunner'
"surround encerrar cososas como palabras o lineas
Plug 'tpope/vim-surround'
"Vim begood para mejorar en la velocidad de vim
Plug 'ThePrimeagen/vim-be-good'
call plug#end()

"---------------MapLeaders----------------
let mapleader=" "

"---------------Shortcuts---------------
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>wq :wq<CR>
imap aa <Esc>
nmap <Leader>f :Files<CR>

"---------------Ejecutar JS---------------
nmap <Leader>nd :w<CR>:!nodejs %<CR>

"---------------Configuraciones de vim --------
"Config word wrapping 
set wrap lbr nolist 
"config search con /
set noic nohls is 
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
"---------------Theme---------------:
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
set background=dark
"---------------easymotion---------------
nmap <Leader>s <Plug>(easymotion-s2)
"---------------NerdTree---------------
nmap <Leader>nt :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1
"---------------Airline---------------
set ttimeoutlen=50
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme='bubblegum'
"---------------NerdCommenter---------------
filetype plugin on
"---------------COC snippets---------------
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <C-x>  <Plug>(coc-convert-snippet)

nmap <Leader>cmd :FloatermNew
let g:floaterm_keymap_toggle = '<F12>'
nmap <Leader>cmdn :FloatermNext
nmap <Leader>cmdp :FloatermPrev

" Configuration floaterm 
let g:floaterm_keymap_kill   = '<F9>'
let g:floaterm_keymap_new    = '<F10>'
let g:floaterm_keymap_prev   = '<F7>'
let g:floaterm_keymap_next   = '<F8>'
let g:floaterm_keymap_toggle = '<F12>'

inoremap <silent><expr> <c-space> coc#refresh()
""//////Config Fugitive
"status we can stage and unstage los archivos con s en el archivo para stage y
"u para unstage  
nmap <leader>gs :G<CR> 
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>

"/////////////emmet ctrl+'+,
let g:user_emmet_leader_key='<C-Z>'

"---------------Live-Server---------------
nmap <leader>live :FloatermSend live-server<CR> 
"---------------Comiling---------------
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c'
exec "!gcc % -o %<"
exec "!time ./%<"
elseif &filetype == 'cpp'
exec "!g++ % -o %<"
exec "!time ./%<"
elseif &filetype == 'java'
exec "FloatermNew powershell.exe  echo javac %" 
exec "!time "
exec "FloatermNew powershell.exe java %:r" 
"exec 
""FloatermNew powershell.exe java -cp %:p:h %:t:r" 
elseif &filetype == 'sh'
exec "!time bash %"
elseif &filetype == 'python'
"exec 
""!time python2.7 %"
exec "FloatermNew powershell.exe python %"
elseif &filetype == 'html'
exec "!firefox % &"
elseif &filetype == 'go'
exec "!go build %<"
exec "!time go run %"
elseif &filetype == 'mkd'
exec "!~/.vim/markdown.pl % > %.html &"
exec "!firefox %.html &"
endif
endfunc
