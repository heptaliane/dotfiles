" ======================
" Dein settings
" ======================
filetype on

" set dein cache path and dein config dir
if has('nvim')
    let s:dein_cache_path = expand('~/.cache/nvim/dein')
    let g:dein_config_dir = expand('~/.config/nvim/dein/')
else
    let s:dein_cache_path = expand('~/.cache/vim/dein')
    let g:dein_config_dir = expand('~/.config/vim/dein/')
endif

" set dein.vim directory
let s:dein_dir = s:dein_cache_path . '/repos/github.com/Shougo/dein.vim'

" clone dein.vim if it does not exist
if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
endif

" add dein.vim to runtime path
execute 'set runtimepath+=' . fnamemodify(s:dein_dir, ':p')

if dein#load_state(s:dein_cache_path)
    call dein#begin(s:dein_cache_path)

    if filereadable(expand(g:dein_config_dir . 'dein.toml'))
        call dein#load_toml(g:dein_config_dir . 'dein.toml', {'lazy': 0})
    endif

    if filereadable(expand(g:dein_config_dir . 'dein_lazy.toml'))
        call dein#load_toml(g:dein_config_dir . 'dein_lazy.toml', {'lazy': 1})
    endif

    call dein#end()
    call dein#save_state()
endif

" install plugins
if dein#check_install()
    call dein#install()
endif

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

" ======================
" ft plugins
" ======================

let s:ftplugin_dir = '~/.config/nvim/ftplugin/'
let s:javascript_plugin_path = s:ftplugin_dir . 'javascript.vim'
let s:rust_plugin_path = s:ftplugin_dir . 'rust.vim'
au Bufread,BufNewFile *.js execute 'source ' . s:javascript_plugin_path
au Bufread,BufNewFile *.json execute 'source ' . s:javascript_plugin_path
au Bufread,BufNewFile *.jsx execute 'source ' . s:javascript_plugin_path
au Bufread,BufNewFile *.html execute 'source ' . s:javascript_plugin_path
au FileType rust execute 'source ' . s:rust_plugin_path
