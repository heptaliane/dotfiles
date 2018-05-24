let g:deoplete#auto_complete_delay = 0
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_ignore_case = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_slist = 10000

inoremap <expr><C-h> deoplete#smart_close_popup()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><BS> pumvisible() ? "\<C-h>" : "\<BS>"
inoremap <expr><CR> pumvisible() ? deoplete#close_popup() : "\<CR>"
