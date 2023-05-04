let g:vimtex_fold_envs = 0
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:tex_flavor = 'latexmk'
let g:tex_conceal = ''
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_latexmk_engines = {'_': '-pdfdvi'}
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdfdvi',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \]}

nnoremap <space>x <plug>(vimtex-compile)
nnoremap <space>q <plug>(vimtex-view)

autocmd Bufread,BufNewFile *.tex execute 'inoremap $ $$<Left>'
