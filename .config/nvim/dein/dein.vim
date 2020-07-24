" ======================
" Dein startup settings
" ======================

if has('unix')
    let g:dein_cache_path = expand('~/.cache/nvim/dein')
else
    let g:dein_cache_path = expand('~/.cache/nvim/dein')
endif

" set dein.vim directory
let s:dein_dir = g:dein_cache_path . '/repos/github.com/Shougo/dein.vim'

" clone dein.vim if it does not exist
if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
endif

" add dein.vim to runtime path
execute 'set runtimepath+=' . fnamemodify(s:dein_dir, ':p')

if dein#load_state(g:dein_cache_path)
    call dein#begin(g:dein_cache_path)

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
