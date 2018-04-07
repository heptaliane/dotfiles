set ambiwidth=double
set laststatus=2

let s:rsep = " %{get(g:, 'airline_right_alt_sep', '')} "

let g:airline_powerline_fonts = 1
let g:airline_linecolumn_prefix = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#readonly#enabled = 0

let g:airline_theme = 'murmur'

let g:airline_section_b =
    \ ' %{airline#extensions#branch#get_head()}' .
    \ '%{""!=airline#extensions#branch#get_head()?("  " . g:airline_left_alt_sep . "  "):""}' .
    \ '%{""!=airline#parts#readonly()?airline_symbols.crypt . " ":""}' .
    \ '%t' . '%{""!=&modified?" | +":""}'
let g:airline_section_c = ""
let g:airline_section_x =
    \ " %{strlen(&fileformat)?&fileformat:'unknown'}" . s:rsep .
    \ " %{strlen(&fenc)?&fenc:&enc}" . s:rsep .
    \ " %{strlen(&filetype)?&filetype:'no fft'}"
let g:airline_section_y = " %3p%% "
let g:airline_section_z = " %3l:%2c"

" key map
nmap <space>h <Plug>AirlineSelectPrevTab
nmap <space>l <Plug>AirlineSelectNextTab
