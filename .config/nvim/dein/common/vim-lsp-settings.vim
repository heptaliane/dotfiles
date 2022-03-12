let g:lsp_diagnostics_echo_cursor = v:true
let g:lsp_diagnostics_echo_delay = 0
let g:lsp_diagnostics_float_cursor = v:false
let g:lsp_diagnostics_float_delay = 0
let g:lsp_diagnostics_virtual_text_enabled = v:false
let g:lsp_diagnostics_virtual_text_prefix = " ‣ "
let g:lsp_document_code_action_signs_enabled = v:false

" python lsp server config
" Use deoplete-jedi completion
let s:pylsp_config = {
\   'pylsp': {
\       'configrationSources': ['flake8'],
\       'plugins': {
\           'flake8': {
\               'enabled': v:true,
\               'maxLineLength': 88,
\           },
\           'jedi_completion': {
\               'enabled': v:false,
\           },
\           'pycodestyle': {
\               'enabled': v:false,
\           },
\       }
\   }
\}

let g:lsp_settings = {
\   'pylsp-all': {
\       'workspace_config': s:pylsp_config,
\   },
\}

nmap <space>d :LspPeekDefinition<CR>
nmap <space>D :LspDefinition<CR>
nmap <space>w :LspNextDiagnostic<CR>
nmap <space>/ :LspReferences<CR>
nmap <space>r :LspRename<CR>
nmap <space>f :LspDocumentFormat<CR>
