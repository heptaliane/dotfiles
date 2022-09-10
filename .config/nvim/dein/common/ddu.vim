call ddu#custom#patch_global({
    \   'ui': 'ff',
    \   'sources': [{'name': 'file'}],
    \   'sourceOptions': {
    \       '_': {
    \           'ignoreCase': v:true,
    \           'matchers': ['matcher_substring', 'matcher_hidden'],
    \       },
    \   },
    \   'kindOptions': {
    \       'file': {
    \           'defaultAction': 'open',
    \       },
    \   },
    \   'uiOptions': {
    \       'filer': {
    \           'toggle': v:true,
    \       },
    \   },
    \   'uiParams': {
    \       'filer': {
    \           'toggle': v:true,
    \       },
    \   },
    \ })

nnoremap <space>e <Cmd>Ddu
    \ -name=filer=`win_getid()`
    \ -ui=filer -resume -sync
    \ -source-option-path=`getcwd()`
    \ -source-option-columns=filename file<CR>

autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
    nnoremap <buffer><silent> <CR>
        \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
    nnoremap <buffer><silent> /
        \ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
    nnoremap <buffer><silent> q
        \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
    nnoremap <buffer><silent> <space>e
        \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

autocmd FileType ddu-filer call s:ddu_filer_my_settings()
function! s:ddu_filer_my_settings() abort
    nnoremap <buffer><expr> <CR>
    \ ddu#ui#filer#is_directory() ?
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow'})<CR>" :
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open'})<CR>"
    nnoremap <buffer><F5>
        \ <Cmd>call ddu#ui#filer#do_action('refreshItems')
    nnoremap <buffer> q
        \ <Cmd>call ddu#ui#filer#do_action('quit')<CR>
    nnoremap <buffer> <space>e
        \ <Cmd>call ddu#ui#filer#do_action('quit')<CR>
    nnoremap <buffer> ~
        \ <Cmd>call ddu#ui#filer#do_action('itemAction',
        \ {'name': 'narrow', 'params': {'path': expand('~')}})<CR>
    nnoremap <buffer> u
        \ <Cmd>call ddu#ui#filer#do_action('itemAction',
        \ {'name': 'narrow', 'params': {'path': ".."}})<CR>
    nnoremap <buffer> h
    \ <Cmd>call ddu#ui#filer#do_action('updateOptions', {
    \   'sourceOptions': {
    \     'file': {
    \       'matchers': ToggleHidden('file'),
    \     },
    \   },
    \ })<CR>

    function! ToggleHidden(name)
      let current = ddu#custom#get_current(b:ddu_ui_name)
      let source_options = get(current, 'sourceOptions', {})
      let source_options_name = get(source_options, a:name, {})
      let matchers = get(source_options_name, 'matchers', [])
      return empty(matchers) ? ['matcher_hidden'] : []
    endfunction
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
    inoremap <buffer><silent> <CR>
        \ <Esc><Cmd>close<CR>
    nnoremap <buffer><silent> <CR>
        \ <Cmd>close<CR>
    nnoremap <buffer><silent> q
        \ <Cmd>close<CR>
endfunction

