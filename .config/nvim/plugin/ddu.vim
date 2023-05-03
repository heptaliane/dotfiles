" ui
call ddu#custom#patch_global({
\     'ui': 'filer',
\     'uiOptions': {
\         'filer': {
\              'toggle': v:true,
\          },
\     },
\     'uiParams': {
\         'filer': {
\             'toggle': v:true,
\             'sort': 'filename',
\             'sortTreesFirst': v:true,
\         },
\     },
\ })

" source
call ddu#custom#patch_global({
\     'sources': [
\         {'name': 'file'},
\     ],
\     'sourceOptions': {
\         '_': {
\             'ignoreCase': v:true,
\             'matchers': [
\                 'matcher_substring',
\                 'matcher_hidden',
\             ],
\         },
\     },
\ })

" kind
call ddu#custom#patch_global({
\     'kindOptions': {
\         'file': {
\             'defaultAction': 'open',
\         },
\     },
\ })

" Enter ddu keymap
nnoremap <space>e <cmd>Ddu
\     -name=filer=`win_getid()`
\     -ui=filer
\     -resume
\     -sync
\     -source-option-path=`getcwd()`
\     -source-option-columns=filename file<CR>

" ddu-filter keymap
function! s:ddu_filer_settings() abort
    function! ToggleHidden(name)
      let current = ddu#custom#get_current(b:ddu_ui_name)
      let source_options = get(current, 'sourceOptions', {})
      let source_options_name = get(source_options, a:name, {})
      let matchers = get(source_options_name, 'matchers', [])
      return empty(matchers) ? ['matcher_hidden'] : []
    endfunction

    nnoremap <buffer><expr> <CR>
    \   ddu#ui#get_item()->get('isTree', v:false) ?
    \   '<cmd>call ddu#ui#filer#do_action("itemAction", {"name": "narrow"})<CR>' :
    \   '<cmd>call ddu#ui#filer#do_action("itemAction", {"name": "open"})<CR>'
    nnoremap <buffer> <F5> <cmd>call ddu#ui#filer#do_action('refreshItems')<CR>
    nnoremap <buffer> q <cmd>call ddu#ui#filer#do_action('quit')<CR>
    nnoremap <buffer> <space>e <cmd>call ddu#ui#filer#do_action('quit')<CR>
    nnoremap <buffer> ~ <cmd>call ddu#ui#filer#do_action('itemAction', {
    \     'name': 'narrow',
    \     'params': {
    \         'path': expand('~'),
    \     },
    \ })<CR>
    nnoremap <buffer> u <cmd>call ddu#ui#filer#do_action('itemAction', {
    \     'name': 'narrow',
    \     'params': {
    \         'path': expand('..'),
    \     },
    \ })<CR>
    nnoremap <buffer> h <cmd>call ddu#ui#filer#do_action('updateOptions', {
    \     'sourceOptions': {
    \         'file': {
    \             'matchers': ToggleHidden('file'),
    \         }
    \     },
    \ })<CR>
endfunction
autocmd FileType ddu-filer call s:ddu_filer_settings()
