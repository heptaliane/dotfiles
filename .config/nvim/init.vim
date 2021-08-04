filetype on

" set nvim config basedir
if has('unix')
    let g:nvim_config_dir = expand('~/.config/nvim/')
else
    let g:nvim_config_dir = expand('~/AppData/Local/nvim/')
endif

" set dein config dir
let g:dein_config_dir = g:nvim_config_dir . 'dein/'

" set nvim cache dir
let g:nvim_cache_dir = expand('~/.cache/nvim/')

" Dein startup
execute 'source ' . g:dein_config_dir . 'dein.vim'

" General settings
execute 'source ' . g:nvim_config_dir . 'common.vim'

" Setting by filetype
execute 'source ' . g:nvim_config_dir . 'filetype.vim'

" ======================
" native paths
" ======================
" let g:python3_host_prog = ''
