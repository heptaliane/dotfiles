let g:vista_sidebar_width = 40
let g:vista_update_on_text_changed = v:true

if has("nvim")
    let g:vista_default_executive = "nvim_lsp"
else
    let g:vista_default_executive = "vim_lsp"
endif

nmap <space>k :Vista!!<CR>
