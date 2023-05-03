" ui
call ddc#custom#patch_global('ui', 'native')

" source
call ddc#custom#patch_global('sources', [
\     'vim-lsp',
\     'path',
\     'around',
\ ])
call ddc#custom#patch_global('sourceOptions', {
\     '_': {
\         'matchers': [
\             'matcher_fuzzy',
\         ],
\         'sorters': [
\             'sorter_rank',
\             'sorter_fuzzy',
\         ],
\     },
\     'vim-lsp': {
\         'minAutoCompleteLength': 1,
\         'mark': '[L]',
\     },
\     'path': {
\         'mark': '[P]',
\     },
\     'around': {
\         'mark': '[A]',
\     },
\ })
call ddc#custom#patch_global('sourceParams', {
\     '_': {
\         'maxSize': 500,
\     },
\     'path': {
\         'absolute': v:false,
\     },
\ })
" TODO Overwrite path cmd on win32

" filter
call ddc#custom#patch_global('filterParams', {
\     'matcher_fuzzy': {
\         'splitMode': 'word',
\     },
\ })

" keymapping
inoremap <silent><expr> <TAB>
\ pumvisible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

call ddc#enable()
