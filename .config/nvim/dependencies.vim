if !has('deno')
    if has('unix')
        !curl -fsSL https://deno.land/x/install/install.sh | sh
    elseif has('windows')
        !scoop install deno
    endif
endif
