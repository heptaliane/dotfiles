let g:deoplete#enable_at_startup = 1

inoremap <expr><C-h> deoplete#smart_close_popup()
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><BS> pumvisible() ? "\<C-h>" : "\<BS>"
inoremap <expr><CR> pumvisible() ? deoplete#close_popup() : "\<CR>"

call deoplete#custom#option({
 \ 'auto_complete': v:true,
 \ 'auto_complete_delay': 0,
 \ 'smart_case': v:true,
 \ 'ignore_case': v:false,
 \ 'min_pattern_length': 1,
 \ 'max_list': 500,
 \ 'enable_buffer_path': v:true,
 \ 'skip_multibyte': v:true,
 \ })
