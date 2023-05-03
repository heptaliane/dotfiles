let g:lsp_diagnostics_echo_cursor = v:true
let g:lsp_diagnostics_echo_delay = 0
let g:lsp_diagnostics_float_cursor = v:false
let g:lsp_diagnostics_float_delay = 0
let g:lsp_diagnostics_virtual_text_enabled = v:false
let g:lsp_diagnostics_virtual_text_prefix = " ‣ "
let g:lsp_document_code_action_signs_enabled = v:false

" python lsp server config
let s:pylsp_config = {
\   'pylsp': {
\       'configrationSources': ['flake8'],
\       'plugins': {
\           'flake8': {
\               'enabled': v:true,
\               'maxLineLength': 88,
\           },
\           'jedi_completion': {
\               'enabled': v:true,
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

nnoremap <space>d :LspPeekDefinition<CR>
nnoremap <space>D :LspDefinition<CR>
nnoremap <space>w :LspNextDiagnostic<CR>
nnoremap <space>/ :LspReferences<CR>
nnoremap <space>r :LspRename<CR>
nnoremap <space>f :LspDocumentFormat<CR>
