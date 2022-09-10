if has('unix')
    setlocal dictionary+=/usr/share/dict/words
    setlocal dictionary+=/usr/share/dict/american-english
endif

if has('win32') || has('win64')
    let s:dict_dir = g:nvim_cache_dir . 'dict'
    if !isdirectory(s:dict_dir)
        execute '!mkdir ' s:dict_dir
    endif

    let s:eng_dict = s:dict_dir . 'english'
    if !filereadable(s:eng_dict)
        execute '!curl https://raw.githubusercontent.com/dwyl/english-words/master/words.txt > ' s:eng_dict
    endif

    execute 'setlocal dictionary+=' . s:dict_dir
endif

call deoplete#custom#source('dictionary', 'min_pattern_length', 4)
call deoplete#custom#source('dictionary', 'sorters', [])
