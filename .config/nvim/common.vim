" ======================
" General Settings
" ======================

colorscheme molokai

syntax on
filetype plugin indent on

set number
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set colorcolumn=80
set wildmenu
set showmatch
set title
set scrolloff=5
set cindent
set cinoptions=g0
set clipboard+=unnamedplus
set conceallevel=0

noremap <space>p zfa(
noremap <space>b zfa{
noremap <space>s zfa[
noremap <space>o zo
noremap <space>O zO
noremap <space>t :tabnew<CR>
noremap <space>h gT
noremap <space>l gt
noremap <TAB> <C-w>w
noremap <space>s :vs<CR>

inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>

" ======================
" color settings
" ======================

hi Visual ctermbg=240
hi Comment ctermfg=102
hi MatchParen ctermfg=208 ctermbg=233
