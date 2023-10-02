" ===========================
" Filetype dependent settings
" ===========================

" Custom filetype
autocmd BufRead,BufNewFile *.tf set filetype=terraform

" Set filetype dependent config base directory
let s:filetype_dir = 'ftplugin/'
function s:load_filetype_script(ft_name)
    execute 'source ' . g:config_dir . s:filetype_dir . a:ft_name . '.vim'
endfunction

" Load filetype settings
autocmd FileType javascript call s:load_filetype_script('javascript')
autocmd FileType json call s:load_filetype_script('javascript')
autocmd FileType markdown call s:load_filetype_script('markdown')
autocmd FileType sql call s:load_filetype_script('sql')
