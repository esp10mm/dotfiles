set t_Co=256
set ts=2 sw=2 et
set smarttab
set autoindent
set nu
set nobackup
set hidden
set foldmethod=manual
se nosol

" fix meta-keys which generate <Esc>a .. <Esc>z
let c='a'
while c <= 'z'
  exec "set <M-".toupper(c).">=\e".c
  exec "imap \e".c." <M-".toupper(c).">"
  let c = nr2char(1+char2nr(c))
endw

let g:ctrlp_map = 'Ð'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" alt+o
noremap Ï <ESC>o
inoremap Ï <ESC>o

inoremap Ê <ESC>
inoremap Ë <End>;

noremap Ñ :b#<CR>
inoremap Ñ <ESC>:b#<CR>

" buffer switch
nnoremap Î :bprevious<CR>
nnoremap Í :bnext<CR> 
inoremap Î <ESC>:bprevious<CR>
inoremap Í <ESC>:bnext<CR> 
nnoremap × :bdelete<CR>


let g:closetag_filenames = "*.ejs,*.html,*.xhtml,*.phtml"
let b:did_indent = 1
let g:airline#extensions#tabline#enabled = 1

" vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/MatchTagAlways'
" Plugin 'othree/yajs.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'kshenoy/vim-signature'
Plugin 'majutsushi/tagbar'
Plugin 'Chiel92/vim-autoformat'
" Plugin 'grassdog/tagman.vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-repeat'
" Plugin 'xolox/vim-easytags'
" Plugin 'xolox/vim-misc'

call vundle#end()
" vundle setup end

let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" au BufWrite * :Autoformat
noremap <F3> :Autoformat<CR>

nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>

" tab switch
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>h :wincmd h<CR>

" easy motion set
map Á <Plug>(easymotion-prefix)
map Ál <Plug>(easymotion-lineforward)
map Áh <Plug>(easymotion-linebackward)
map Áw <Plug>(easymotion-overwin-w)
map Áf <Plug>(easymotion-overwin-f)
map Á; <Plug>(easymotion-bd-w)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" Require tpope/vim-repeat to enable dot repeat support
" Jump to anywhere with only `s{char}{target}`
" `s<CR>` repeat last find motion.
nmap s <Plug>(easymotion-s)
" Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

" hotkey setup
map <Leader>n <Esc>:let @*=line(".")<CR>
map <Leader>b <Esc>:NERDTreeToggle<CR>
map <Leader>] <Esc>:set paste<CR>
map <Leader>[ <Esc>:set nopaste<CR>
map <Leader>f <Esc>:set fdm=indent<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <F8> :TagbarToggle<CR>

" inoremap <C-j> <ESC>

" plugin setup
execute pathogen#infect()

syntax on

filetype plugin indent on

colorscheme monokai
let g:monokai_italic = 1
let g:monokai_thick_border = 1
let g:monokai_zentree = 1

let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup = 1

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:loaded_airline_themes=1
" let g:airline_symbols.linenr = ':'
let g:airline_theme='luna'

set background=dark
