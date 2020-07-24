" ======================
" ft plugins
" ======================

" set ftplugin config basedir
if has('unix')
    let s:ftplugin_dir = expand('~/.config/nvim/ftplugin/')
else
    let s:ftplugin_dir = expand('~/AppData/Local/nvim/ftplugin/')
endif
let s:javascript_plugin_path = s:ftplugin_dir . 'javascript.vim'
let s:rust_plugin_path = s:ftplugin_dir . 'rust.vim'
let s:markdown_plugin_path = s:ftplugin_dir . 'markdown.vim'
au Bufread,BufNewFile *.js execute 'source ' . s:javascript_plugin_path
au Bufread,BufNewFile *.json execute 'source ' . s:javascript_plugin_path
au Bufread,BufNewFile *.jsx execute 'source ' . s:javascript_plugin_path
au Bufread,BufNewFile *.html execute 'source ' . s:javascript_plugin_path
au FileType rust execute 'source ' . s:rust_plugin_path
au FileType markdown execute 'source ' . s:markdown_plugin_path
