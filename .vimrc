set encoding=utf8
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
" set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete\ File\ Types\ 11

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:webdevicons_enable_ctrlp = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
" let g:webdevicons_conceal_nerdtree_brackets = 0
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
" let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

set t_Co=256
set ts=2 sw=2 et
set smarttab
set autoindent
set nu
set nobackup
set hidden
set foldmethod=manual
se nosol
set timeoutlen=1000 ttimeoutlen=0
set clipboard=unnamedplus

let g:molokai_original = 1
" let g:rehash256 = 1

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

" --column: Show column number
"  " --line-number: Show line number
"  " --no-heading: Do not show file headings in results
"  " --fixed-strings: Search term as a literal string
"  " --ignore-case: Case insensitive search
"  " --no-ignore: Do not respect .gitignore, etc...
"  " --hidden: Search hidden files and folders
"  " --follow: Follow symlinks
"  " --glob: Additional conditions for search (in this case ignore everything
"  in the .git/ folder)
"  " --color: Search color options

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!dist/*" --glob "!build/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" alt+o
noremap Ï <ESC>o
inoremap Ï <ESC>o

inoremap Ê <ESC>
inoremap Ë <End>;

inoremap Æ <ESC>:Find 
noremap Æ :Find 

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

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

Plug 'Valloric/MatchTagAlways'
" Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'Chiel92/vim-autoformat'
Plug 'airblade/vim-gitgutter'
Plug 'tomasr/molokai'
Plug 'moskytw/luthadel.vim'
Plug 'morhetz/gruvbox'
" Plug 'grassdog/tagman.vim'
"
function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction
Plug 'marijnh/tern_for_vim', { 'do': function('BuildTern') }

Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'chusiang/vim-sdcv'
" Plug 'dkprice/vim-easygrep'
Plug 'mileszs/ack.vim'
" Plug 'xolox/vim-easytags'
" Plug 'xolox/vim-misc'
Plug 'tpope/vim-fugitive'
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'nono/vim-handlebars'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'wellle/targets.vim'

call plug#end()

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" au BufWrite * :Autoformat
noremap <F3> :Autoformat<CR>

nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nmap <leader>e :call SearchWord()<CR>

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
" nmap s <Plug>(easymotion-s)
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
map <Leader>g <Esc>:Gstatus<CR>
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
" execute pathogen#infect()

syntax on

filetype plugin indent on

colorscheme gruvbox
" let g:monokai_italic = 1
" let g:monokai_thick_border = 1
" let g:monokai_zentree = 1

" let g:indent_guides_guide_size=1
" let g:indent_guides_enable_on_vim_startup = 1

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:loaded_airline_themes=1
" let g:airline_symbols.linenr = ':'
let g:airline_theme='tomorrow'

set background=dark

" NERDTree color
hi Directory guifg=#FF0000 ctermfg=221
hi NERDTreeOpenable guifg=#FF0000 ctermfg=203
hi NERDTreeClosable guifg=#FF0000 ctermfg=203
