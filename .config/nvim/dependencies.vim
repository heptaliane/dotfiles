" =============================
" Install external dependencies
" =============================

" Deno
if exepath('deno') == ''
    if has('unix')
        !curl -fsSL https://deno.land/x/install/install.sh | sh
    elseif has('win32')
        !scoop install deno
    endif
endif
