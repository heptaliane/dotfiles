let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': ['python', 'cpp', 'c', 'sh', 'markdown', 'rust']
    \ }

let g:syntastic_enable_signs = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_rust_checkers = ['cargo', 'rustc']
