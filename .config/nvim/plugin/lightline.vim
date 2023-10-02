set laststatus=2
let g:lightline = {
    \ 'mode_map': {'c': 'NORMAL'},
    \ 'colorscheme': 'powerline',
    \ 'active': {
    \       'left': [['mode', 'paste'],
    \               ['gitbranch', 'readonly', 'filename', 'modified']],
    \       'right': [['lineinfo'],
    \                ['percent'],
    \                ['fileformat', 'fileencoding', 'filetype', 'charvaluehex'],
    \                ['lsp_errors', 'lsp_warnings']],
    \   },
    \ 'component_function': {
    \       'gitbranch': 'FugitiveHead',
    \   },
    \ 'component_expand': {
    \       'lsp_warnings': 'lightline_lsp#warnings',
    \       'lsp_errors': 'lightline_lsp#errors',
    \   },
    \ 'component_type': {
    \       'lsp_warnings': 'warning',
    \       'lsp_errors': 'errors',
    \   },
    \ }

let g:lightline.tab = {
    \ 'active': ['tabnum', 'filename', 'modified'],
    \ 'inactive': ['tabnum', 'filename', 'modified'],
    \ }
