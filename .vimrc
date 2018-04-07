"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" plugins "
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic.git'

NeoBundle 'itchyny/lightline.vim'
set laststatus=2
set t_Co=256

NeoBundle 'tyru/caw.vim.git'

NeoBundle 't9md/vim-quickhl'

NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=4
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=239
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=237

NeoBundle 'Shougo/unite.vim'
let g:unite_enable_start_insert=1
let g:unite_source_file_mru_limit=50
let g:unite_source_mru_filename_format=''
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    nmap <buffer> <ESC> <Plug>(unite_exit)
    imap <buffer> jj <Plug>(unite_insert_leave)
    imap <buffer> <space> <Plug>(unite_delete_backward_path)
    nnoremap <silent> <buffer> <expr> <C-t> unite#do_action('vsplit')
    inoremap <silent> <buffer> <expr> <C-t> unite#do_action('vsplit')
endfunction"}}}

NeoBundle 'Shougo/neocomplete.vim'
let g:acp_enableAtStartup=0
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#sources#syntax#min_keyword_length=3
let g:neocomplete#lock_buffer_name_pattern='\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'.gosh_completions'
        \}
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns={}
endif
let g:neocomplete#keyword_patterns['default']='\h\w*'
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "") . "\<CR>"
endfunction

" NeoBundle 'Shougo/neosnippet.vim'
" NeoBundle 'Shougo/neosnippet-snippets'
call neobundle#end()

" Required:
filetype plugin indent on

"-------------------------
" End Neobundle Settings.
"-------------------------

colorscheme ron
syntax on
set number
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set showmode
set colorcolumn=80
set showmatch
set scrolloff=5
set cindent
set cinoptions=g0

nnoremap <silent><C-h> ^
nnoremap <silent><C-l> $
inoremap , ,<space>
noremap <space>h <space>zfa{
noremap <space>t <space>zfa(
noremap <space>l <space>zfa[

autocmd BufRead,BufNewFile *.js setfiletype javascript
autocmd BufRead,BufNewFile *.jsx setfiletype javascript
autocmd BufRead,BufNewFile *.js let g:syntastic_javascript_checkers=['']
autocmd BufRead,BufNewFile *.jsx let g:syntastic_javascript_checkers=['']

" autocmd BufWritePre * :%s/ *$//ge

" " auto fcitx
" let g:input_toggle = 0
" function! Fcitxen()
"     let s:input_status = system("fcitx-remote")
"     if s:input_status == 2
"         let g:input_toggle = 1
"         let l:a = system("fcitx-remote -c")
"     endif
" endfunction
" function! Fcitxzh()
"     let s:input_status = system("fcitx-remote")
"     if s:input_status != 2 && g:input_toggle == 1
"         let l:a = system("fcitx-remote -o")
"         let g:input_toggle = 0
"     endif
" endfunction
" autocmd InsertLeave *.tex call Fcitxen()
" autocmd InsertEnter *.tex call Fcitxzh()
" autocmd InsertLeave *.txt call Fcitxen()
" autocmd InsertEnter *.txt call Fcitxzh()

" nerdtree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" quickhl
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

" caw.vim
nmap <Space>c <Plug>(caw:hatpos:toggle)
vmap <Space>c <Plug>(caw:hatpos:toggle)

" unite
nnoremap [unite] <Nop>
nmap <space>f [unite]
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]b :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]u :<C-u>Unite buffer<CR>

" neocomplete
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><space> pumvisible() ? "\<C-y>" : "\<space>"

NeoBundleCheck
