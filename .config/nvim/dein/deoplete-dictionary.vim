if has('unix')
    setlocal dictionary+=/usr/share/dict/words
    setlocal dictionary+=/usr/share/dict/american-english
endif

call deoplete#custom#source('dictionary', 'min_pattern_length', 4)
call deoplete#custom#source('dictionary', 'sorters', [])
