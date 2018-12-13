set encoding=utf8
set mouse+=a
set nobackup
set hlsearch

" for hyper to not break the first line
set t_RV=

let g:jsx_ext_required = 0

set t_Co=256
set ts=2 sw=2 et
set smarttab
set autoindent
set nu
set nobackup
set hidden
se nosol
set timeoutlen=1000 ttimeoutlen=0
set clipboard=unnamedplus

let g:molokai_original = 1

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

command! -bang -nargs=* MRU call fzf#vim#history(fzf#vim#with_preview())
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!assets/" --glob "!public/" --glob "!__snapshots__/" --glob "!coverage/" --glob "!semantic/" --glob "!dist/*" --glob "!build/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" alt+o
map Ï <ESC>o
map Ï <ESC>o

inoremap Ê <ESC>
inoremap Ë <End>;

inoremap Æ <ESC>:Find 
noremap Æ :Find 

inoremap Õ <ESC>:MRU<CR>
noremap Õ :MRU<CR>

" command history
inoremap É <ESC>:History:<CR>
noremap É :History:<CR>

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

" JS syntax plug
" Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Colorscheme plug
" Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal.vim' " pywal theme


" Completetion related plug
function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction
Plug 'marijnh/tern_for_vim', { 'do': function('BuildTern') }
Plug 'SirVer/ultisnips'

Plug 'w0rp/ale'
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1
" Plug 'vim-syntastic/syntastic'
" Plug 'happylinks/syntastic-local.vim'
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exec = 'eslint'

" Navigating plug
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeIgnore = ['\.swp$']
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
" let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

Plug 'easymotion/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'chusiang/vim-sdcv'
Plug 'mileszs/ack.vim'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/MatchTagAlways'
nnoremap % :MtaJumpToOtherTag<CR>%
Plug 'majutsushi/tagbar'
Plug 'johngrib/vim-game-code-break'
Plug 'kshenoy/vim-signature'

" Others plug
" Plug 'Chiel92/vim-autoformat'
Plug 'airblade/vim-gitgutter'
" Plug 'grassdog/tagman.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
" Plug 'dkprice/vim-easygrep'
" Plug 'xolox/vim-easytags'
" Plug 'xolox/vim-misc'
Plug 'tpope/vim-fugitive'
" Track the engine.
Plug 'tpope/vim-surround'
" Snippets are separated from the engine. Add this if you want them:
Plug 'ervandew/supertab'

Plug 'ryanoasis/vim-devicons'

let g:webdevicons_enable_ctrlp = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let NERDTreeShowHidden=1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
" let g:webdevicons_conceal_nerdtree_brackets = 0
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0

" Plug 'sbdchd/neoformat'
" autocmd BufWritePre *.js Neoformat

set foldenable
set foldmethod=syntax
set foldlevelstart=99
set foldcolumn=0
Plug 'Konfekt/FastFold'
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

Plug 'mhinz/vim-startify'
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
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nmap <leader>e :call SearchWord()<CR>

" tab switch
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <C-h> :wincmd h<CR>

" easy motion set
map <Leader> <Plug>(easymotion-prefix)
" map ; <Plug>(easymotion-prefix)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)
" nmap <Leader>w <Plug>(easymotion-overwin-w)
" map <Leader>f <Plug>(easymotion-overwin-f)
map <Leader>; <Plug>(easymotion-bd-w)

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
map Ó <Esc>:Gstatus<CR>
map <Leader>n <Esc>:let @*=line(".")<CR>
map <Leader>b <Esc>:NERDTreeToggle<CR>
" map <Leader>] <Esc>:set paste<CR>
" map <Leader>[ <Esc>:set nopaste<CR>

" vmap <Leader>y "+y
" vmap <Leader>d "+d
" nmap <Leader>p "+p
" nmap <Leader>P "+P
" vmap <Leader>p "+p
" vmap <Leader>P "+P

nmap <F8> :TagbarToggle<CR>


syntax on
colorscheme wal

filetype plugin indent on

" let g:indent_guides_guide_size=1
" let g:indent_guides_enable_on_vim_startup = 1

" airline color
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" set background=dark

" NERDTree color
" hi Directory guifg=#FF0000 ctermfg=221
" hi NERDTreeOpenable guifg=#FF0000 ctermfg=203
" hi NERDTreeClosable guifg=#FF0000 ctermfg=203

autocmd Filetype json let g:indentLine_setConceal = 0
