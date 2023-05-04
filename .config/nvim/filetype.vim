" ===========================
" Filetype dependent settings
" ===========================

" Custom filetype
autocmd BufRead,BufNewFile *.tf set filetype=terraform

" Set filetype dependent config base directory
let s:filetype_dir = expand('%:p:h') . '/ftplugin/'
function s:load_filetype_script(ft_name)
    execute 'source' . s:filetype_dir . a:ft_name . '.vim'
endfunction

" Load filetype settings
autocmd FileType javascript call s:load_filetype_script('javascript')
autocmd FileType markdown call s:load_filetype_script('markdown')
