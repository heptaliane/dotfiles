" ===============
" Common settings
" ===============

syntax on
filetype plugin indent on

set number
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set cindent
set cinoptions=g0
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set colorcolumn=80
set t_Co=256
set wildmenu
set showmatch
set title
set scrolloff=5
set conceallevel=0
set fileformat=unix
set encoding=utf-8
set clipboard+=unnamedplus
set backspace=indent,eol,start
set cursorline

if has('win32')
    let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
    let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
    let &shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
    let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    set shellquote= shellxquote=
endif
