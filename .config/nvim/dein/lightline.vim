set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'powerline',
    \ 'active': {
    \       'left': [['mode', 'paste'],
    \               ['gitbranch', 'readonly', 'filename', 'modified']]
    \       },
    \ 'component_function': {
    \       'gitbranch': 'fugitive#head',
    \       }
    \ }

let g:lightline.tab = {
    \ 'active': ['tabnum', 'filename', 'modified'],
    \ 'inactive': ['tabnum', 'filename', 'modified'],
    \ }
