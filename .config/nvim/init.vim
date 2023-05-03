filetype on

" Vim config setting
let g:config_dir = expand('~/.config/nvim/')
if has('win32')
    let g:config_dir = expand('~/AppData/Local/nvim/')
endif

" Load environment variables
execute 'source ' . g:config_dir . 'environment.vim'

" Load native settings
execute 'source ' . g:config_dir . 'common.vim'

" Load keymaps
execute 'source ' . g:config_dir . 'keymap.vim'

" Load filetype dependent settings
execute 'source ' . g:config_dir . 'filetype.vim'

" Install external dependencies
execute 'source ' . g:config_dir . 'dependencies.vim'

" Load plugins
execute 'source ' . g:config_dir . 'plugin.vim'

" Color scheme
try
    colorscheme molokai
catch
    colorscheme ron
endtry
