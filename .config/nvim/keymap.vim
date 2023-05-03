" ============
" Key mappings
" ============

" Tab control
nnoremap <space>t :tabnew<CR>
nnoremap <space>h gT
nnoremap <space>l gt

" Window splitting
nnoremap <space>v :vs<CR>
nnoremap <TAB> <C-w>w

" Neovim only mappings
if has("nvim")
    " Terminal mode settings
    nnoremap <space>s :sp<CR><C-w>w7<C-w>_:terminal<CR>
    nnoremap <ESC> <C-\><C-n>

    " Terminal relavant settings
    autocmd TermOpen * startindent
    autocmd TermOpen * set nonumber
    autocmd TermOpen * set sctolloff=0
    autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
endif
