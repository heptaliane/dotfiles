" =========================================
" Define vim internal environment variables
" =========================================

let $DENO_INSTALL = fnamemodify('~/.deno', ':p')
let $PATH = $DENO_INSTALL . '/bin:' . $PATH
