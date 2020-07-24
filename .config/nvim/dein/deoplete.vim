let g:deoplete#enable_at_startup = 1
let g:deoplete#max_slist = 10000

inoremap <expr><C-h> deoplete#smart_close_popup()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><BS> pumvisible() ? "\<C-h>" : "\<BS>"
inoremap <expr><CR> pumvisible() ? deoplete#close_popup() : "\<CR>"

call deoplete#custom#option({
 \ 'auto_complete_delay': 0,
 \ 'smart_case': v:true,
 \ 'ignore_case': v:false,
 \ 'min_pattern_length': 1,
 \ })
call deoplete#custom#var('file', 'enable_buffer_path', v:true)
