" ======================
" Dein settings
" ======================

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

colorscheme ron

syntax on
filetype on

set number
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set showmode
set colorcolumn=80
set showmatch
set scrolloff=5
set cindent
set cinoptions=g0

noremap <space>p zfa(
noremap <space>b zfa{
noremap <space>s zfa[
noremap <space>o zo
noremap <space>O zO
noremap <space>t :tabnew<CR>
noremap <space>h gT
noremap <space>l gt
