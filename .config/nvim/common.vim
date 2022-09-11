" ======================
" General Settings
" ======================

syntax on
filetype plugin indent on

set number
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set colorcolumn=80
set wildmenu
set showmatch
set title
set scrolloff=5
set cindent
set cinoptions=g0
set clipboard+=unnamedplus
set conceallevel=0
set fileformat=unix

if has('nvim-0.6')
    unmap Y
endif

noremap <space>o zo
noremap <space>O zO
noremap <space>t :tabnew<CR>
noremap <space>h gT
noremap <space>l gt
noremap <TAB> <C-w>w
noremap <space>v :vs<CR>

" nvim settings
if has('nvim')
    noremap <space>s :sp<CR><C-W>w7<C-W>_:terminal<CR>
    tnoremap <ESC> <C-\><C-n>

    au TermOpen * startinsert
    au TermOpen * set nonumber
    au TermOpen * set scrolloff=0
    au WinEnter * if &buftype ==# 'terminal' | startinsert | endif

    if has('win64')
        set shell='powershell'
    endif
endif

" ======================
" color settings
" ======================

hi Visual ctermbg=240
hi Comment ctermfg=102
hi MatchParen ctermfg=208 ctermbg=233
try
    colorscheme molokai
catch
    colorscheme ron
endtry
