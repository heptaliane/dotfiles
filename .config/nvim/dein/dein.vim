" ======================
" Dein startup settings
" ======================

let g:dein_cache_path = g:nvim_cache_dir . 'dein/'

" set dein.vim directory
let s:dein_dir = g:dein_cache_path . '/repos/github.com/Shougo/dein.vim'

" clone dein.vim if it does not exist
if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
endif

" add dein.vim to runtime path
execute 'set runtimepath+=' . fnamemodify(s:dein_dir, ':p')

" set dein config dir
let g:dein_common_config_dir = g:dein_config_dir . "common/"
let g:dein_nvim_config_dir = g:dein_config_dir . "nvim/"
let g:dein_vim_config_dir = g:dein_config_dir . "vim/"

if dein#load_state(g:dein_cache_path)
    call dein#begin(g:dein_cache_path)

    if filereadable(expand(g:dein_common_config_dir . 'dein.toml'))
        call dein#load_toml(g:dein_common_config_dir . 'dein.toml', {'lazy': 0})
    endif

    if filereadable(expand(g:dein_common_config_dir . 'dein_lazy.toml'))
        call dein#load_toml(g:dein_common_config_dir . 'dein_lazy.toml', {'lazy': 1})
    endif

    if has("nvim")
        if filereadable(expand(g:dein_nvim_config_dir . 'dein.toml'))
            call dein#load_toml(g:dein_nvim_config_dir . 'dein.toml', {'lazy': 0})
        endif

        if filereadable(expand(g:dein_nvim_config_dir . 'dein_lazy.toml'))
            call dein#load_toml(g:dein_nvim_config_dir . 'dein_lazy.toml', {'lazy': 1})
        endif
    endif

    if !has("nvim")
        if filereadable(expand(g:dein_vim_config_dir . 'dein.toml'))
            call dein#load_toml(g:dein_vim_config_dir . 'dein.toml', {'lazy': 0})
        endif

        if filereadable(expand(g:dein_vim_config_dir . 'dein_lazy.toml'))
            call dein#load_toml(g:dein_vim_config_dir . 'dein_lazy.toml', {'lazy': 1})
        endif
    endif

    call dein#end()
    call dein#save_state()
endif

" install plugins
if dein#check_install()
    call dein#install()
endif
