" ============================================
" Vim plugin settings
" --------------------------------------------
" Indivisual plugin settings are in `plugins/`
" ============================================

" Plugin install directory
let s:plugin_base_dir = expand('~/.cache/vim/plugin/')
let s:plug_dir = fnamemodify(s:plugin_base_dir, ':p') . 'junegunn/vim-plug/'

if !isdirectory(s:plug_dir)
    execute '!git clone https://github.com/junegunn/vim-plug ' . expand(s:plug_dir)
endif

" Setup vim-plug autoload script
let s:vim_autoload_dir = fnamemodify(expand('~/.vim/autoload/'), ':p')
if !isdirectory(s:vim_autoload_dir)
    if has('win32')
        execute '!New-Item -ItemType Directory -Force -Path ' . s:vim_autoload_dir
    else
        execute '!mkdir -p ' . s:vim_autoload_dir
    endif
endif

let s:plug_autoload_script = s:vim_autoload_dir . 'plug.vim'
if !filereadable(s:plug_autoload_script)
    if has('win32')
        execute '!New-Item -ItemType HardLink -Path ' . s:plug_autoload_script . ' -Target ' . s:plug_dir . 'plug.vim'
    else
        execute '!ln -sf ' . s:plug_dir . 'plug.vim ' . s:plug_autoload_script
    endif
endif

if has('nvim')
    execute 'set runtimepath+=' . fnamemodify('~/.vim/', ':p')
endif

" Plugin config directory
let g:plugin_config_dir = g:config_dir . 'plugin/'
call plug#begin(s:plugin_base_dir)
    " Custom colorscheme
    Plug 'tomasr/molokai'

    " Toggle comment
    Plug 'tpope/vim-commentary'

    " Highlight
    Plug 't9md/vim-quickhl'

    " Autocompletion
    Plug 'Shougo/neco-syntax'
    Plug 'vim-denops/denops.vim'

    " Braket completion
    Plug 'jiangmiao/auto-pairs'

    " Git plugin
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Lsp plugins
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'

    " Status bar
    Plug 'halkn/lightline-lsp'
    Plug 'itchyny/lightline.vim'

    " Braket color
    Plug 'luochen1990/rainbow'

    " Syntax analyzer
    Plug 'liuchengxu/vista.vim'

    " Filetype syntax
    Plug 'aklt/plantuml-syntax'
    Plug 'hashivim/vim-terraform'
    Plug 'udalov/kotlin-vim'

    " Filetype dependent plugins
    Plug 'lervag/vimtex', {'for': 'tex'}
    Plug 'rust-lang/rust.vim', {'for': 'rust'}

    " Startup analyzer
    Plug 'dstein64/vim-startuptime'

    " Neovim plugin support for Vim 8+
    if !has('nvim')
        if version >= 800
            Plug 'roxma/vim-hug-neovim-rpc'
        endif

        if version < 900
            Plug 'roxma/nvim-yarp'
        endif
    endif

    if has('nvim')
        " Indent guide
        Plug 'lukas-reineke/indent-blankline.nvim'

        " Extra highlights
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    endif

    if has('nvim') || version >= 900
        Plug 'github/copilot.vim'
    endif

    " Deno dependent plugins
    if exepath('deno') != ''
        " ddu.vim
        Plug 'Shougo/ddu.vim'
        Plug 'Shougo/ddu-commands.vim'
        " ddu-ui
        Plug 'Shougo/ddu-ui-filer'
        " ddu-source
        Plug 'Shougo/ddu-source-file'
        " ddu-filter
        Plug 'Shougo/ddu-filter-matcher_substring'
        Plug 'Shougo/ddu-filter-matcher_hidden'
        " ddu-kind
        Plug 'Shougo/ddu-kind-file'
        " ddu-column
        Plug 'Shougo/ddu-column-filename'

        " ddc.vim
        Plug 'Shougo/ddc.vim'
        " ddc-ui
        Plug 'Shougo/ddc-ui-native'
        " ddc-source
        Plug 'shun/ddc-source-vim-lsp'
        Plug 'tani/ddc-path'
        Plug 'Shougo/ddc-source-around'
        " ddc-filter
        Plug 'Shougo/ddc-filter-sorter_rank'
        Plug 'tani/ddc-fuzzy'
    endif

    " Avante.nvim dependencies
    if has('nvim')
        " Dependencies
        Plug 'nvim-lua/plenary.nvim'
        Plug 'MunifTanjim/nui.nvim'
        Plug 'MeanderingProgrammer/render-markdown.nvim'

        " Optional dependencies
        Plug 'hrsh7th/nvim-cmp'
        Plug 'nvim-tree/nvim-web-devicons'
        Plug 'HakonHarnes/img-clip.nvim'
        Plug 'zbirenbaum/copilot.lua'
        Plug 'stevearc/dressing.nvim'
        Plug 'folke/snacks.nvim'

        Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }
    endif
call plug#end()

" Plugin custom settings
function! s:custom_setting(basename)
    execute 'source ' . g:plugin_config_dir . a:basename . '.vim'
endfunction
function! s:custom_lua_script(basename)
    execute 'source ' . g:plugin_config_dir . a:basename . '.lua'
endfunction

call s:custom_setting('molokai')
call s:custom_setting('commentary')
call s:custom_setting('vim-quickhl')
call s:custom_setting('auto-pairs')
call s:custom_setting('vim-fugitive')
call s:custom_setting('gitgutter')
call s:custom_setting('vim-lsp-settings')
call s:custom_setting('lightline')
call s:custom_setting('rainbow')
call s:custom_setting('vista')
call s:custom_setting('vimtex')

if has('nvim')
    call s:custom_lua_script('indent-blankline')
    call s:custom_lua_script('avante')
endif

if exepath('deno') != ''
    call s:custom_setting('ddu')
    call s:custom_setting('ddc')
endif
