if exepath('deno') == ""
    if has('unix')
        !curl -fsSL https://deno.land/x/install/install.sh | sh
        function! AddDeno2Path(rcfile)
            execute '!echo export DENO_INSTALL=/home/kenta/.deno >> ' . a:rcfile
            execute "!echo export PATH='$DENO_INSTALL/bin:$PATH' >> " . a:rcfile
            let $DENO_INSTALL = '/home/kenta/.deno'
            let $PATH = $DENO_INSTALL . "/bin:" . $PATH
        endfunction

        call AddDeno2Path(expand('~/.zshrc'))
        call AddDeno2Path(expand('~/.bashrc'))
    elseif has('windows')
        !scoop install deno
    endif
endif
