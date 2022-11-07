set ts=2 sw=2 et

call plug#begin('~/.config/nvim/plugged')

" let mapleader = "\<Space>"
" let g:mapleader = "\<Space>"
nmap <Space> <Leader>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'junegunn/gv.vim'

imap <silent><script><expr> <C-E> copilot#Accept("<End>")
let g:copilot_no_tab_map = v:true
let g:copilot_assume_mapped = v:true
Plug 'github/copilot.vim'

let g:fzf_layout = { 'down': '~40%' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
command! -bang -nargs=* MRU call fzf#vim#history()
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --ignore-case --hidden --follow -g "!assets/*" -g "!public/*" -g "!*/__snapshots__/*" --ignore-file "coverage/" -g "!*/semantic/*" -g "!dist/*" -g "!.git/*" -g "!*.min.css" -g "!*.min.js" -g "!bundle" -g  "!clienttemplates" -g "!dist" -g "!build/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, {'dir': system('git rev-parse --show-toplevel 2> /dev/null')[:-2]}, <bang>0)
inoremap <Leader>f <ESC>:Find
noremap <Leader>f :Find
inoremap Õ <ESC>:MRU<CR>
noremap Õ :MRU<CR>


Plug 'easymotion/vim-easymotion'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'branch': 'release/0.x'
  \ }
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <F12> <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-declaration)
nmap <silent> ge <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 佈景主題
Plug 'ayu-theme/ayu-vim'

" 檔案樹
Plug 'scrooloose/nerdtree'

" 設定NERDTree
nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>
nnoremap <Leader> 1 : NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" buffer switch
nnoremap Î :bprevious<CR>
nnoremap Í :bnext<CR>
inoremap Î <ESC>:bprevious<CR>
inoremap Í <ESC>:bnext<CR>
nnoremap × :bdelete<CR>

map <Leader> <Plug>(easymotion-prefix)
" map ; <Plug>(easymotion-prefix)
" map <Leader>l <Plug>(easymotion-lineforward)
" map <Leader>h <Plug>(easymotion-linebackward)
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


map <Leader>b <Esc>:Buffers<CR>
map <Leader>n <Esc>:NERDTreeToggle<CR>
map <Leader>h <Esc>:History<CR>
map <Leader>l <Esc>:History:<CR>
map <Leader>c <Esc>:Commits<CR>
map <Leader>m <Esc>:Commands<CR>
map <Leader>g <Esc>:vertical rightb Git<CR>
" map <Leader>f <Esc>:GFiles<CR>
map <Leader>e <Esc>:Vaffle<CR>
map <Leader>t <Esc>:term<CR>
map <Leader>v <Esc>:vsplit<CR>

call plug#end()
