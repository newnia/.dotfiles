set nocompatible

filetype plugin on

set number " show line numbers
set relativenumber " show relative line numbers
set cursorline  " highlight current line

set showcmd " show incomplete commands in bottom bar
set ruler " show cursor coordinates
set laststatus=2 " always show status line

syntax on " highlight syntax, let's see if this makes a difference?

set hlsearch " highlight search results
" use <C-L> to clear highlighting of the search highlighting
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
set ignorecase " ignore case in search
set incsearch " show search results as i type, see if we like this?


set termguicolors

color gruvbox
set background=dark

set softtabstop=4
set shiftwidth=4
set expandtab

" vim-plug section
if has('nvim')
    call plug#begin()
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'SirVer/ultisnips'
    call plug#end()
    let g:deoplete#enable_at_startup = 1   
    " deoplete tab_complete
    " inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
    " ultisnips tabcomplete
    let g:UltiSnipsExpandTrigger='<tab>'
    " add suffixes for searching since I only use this for zettelkasten right
    " now
    set suffixesadd=.md
endif

