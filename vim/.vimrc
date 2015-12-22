" Defined Statements:
let s:running_windows = has("win16") || has("win32") || has("win64") " Define windows version

" If your paths are fucked (for windows) include this:
"if s:running_windows
"    let $GVIM='C:/Program Files (x86)/Vim/'
"    let $VIM='C:/Program Files (x86)/Vim/'
"    let $VIMRUNTIME='C:/Program Files (x86)/Vim/vim74'
"    set runtimepath=~/vimfiles,$VIMRUNTIME/vimfiles,$VIMRUNTIME,$VIMRUNTIME/after,~/vimfiles/after
"endif

" Vim Settings:
set nocompatible " Explicitly get out of vi-compatible mode
set fileencoding=utf-8 " File encoding is UTF-8
let g:skip_loading_mswin=1 " To make sure mswin.vim doesn't load
set history=9999 " Large History
set clipboard+=unnamed " Share windows clipboard

set noerrorbells " Don't make noise

" Following is hack to get powershell working
" From: http://stackoverflow.com/questions/94382/vim-with-powershell

if s:running_windows 
    set shell=cmd.exe
    set shellcmdflag=/c\ powershell.exe\ -NoLogo\ -NoProfile\ -NonInteractive\ -ExecutionPolicy\ RemoteSigned
    set shellpipe=|
    set shellredir=>
endif

" Backup: (not working at present)
"set backup " Make backup files
"if s:running_windows
"    set backupdir=~/vimfiles/backup " Where to put backup files
"    set directory=~/vimfiles/temp " Directory to place swap files in
"else
"    set backupdir=~/.vim/backup " Where to put backup files
"    set directory=~/.vim/temp " Directory to place swap files in
"endif

syntax enable " Highight syantax
set spell spelllang=en_us " Set spelling language
color molokai " Color scheme
hi clear SpellBad
hi SpellBad cterm=underline

" Spaces and Tabs:
set shiftwidth=4
set tabstop=4
set expandtab
set list " Show tabs to not ever have them

" UI Config
"Set whitespace chars
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set columns=120 "Set max columns
set number " Show column number
set numberwidth=5 " Can have columns of up to 99999

" Show cursors:
set cursorline
set cursorcolumn
" Set cursor colors:
hi CursorLine cterm=NONE ctermbg=darkmagenta guibg=darkred
hi CursorColumn cterm=NONE ctermbg=darkmagenta guibg=darkred

filetype plugin indent on
set wildmenu
set showmatch
set ruler

" Search:
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" Movement:
nnoremap j gj
nnoremap k gk
nnoremap gV '[v']
