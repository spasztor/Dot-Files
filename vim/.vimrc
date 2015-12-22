" -------------
" Windows Powershell Setup:
" -------------

let s:running_windows = has("win16") || has("win32") || has("win64") " Define windows version

" If your paths are fucked (for windows) include this:
"if s:running_windows
"    let $GVIM='C:/Program Files (x86)/Vim/'
"    let $VIM='C:/Program Files (x86)/Vim/'
"    let $VIMRUNTIME='C:/Program Files (x86)/Vim/vim74'
"    set runtimepath=~/vimfiles,$VIMRUNTIME/vimfiles,$VIMRUNTIME,$VIMRUNTIME/after,~/vimfiles/after
"endif
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

" -------------
" Plugins:
" -------------

" Rainbow Plugin:
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:lisp_rainbow = 1
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

" -------------
" Vim Settings:
" -------------

set nocompatible " Explicitly get out of vi-compatible mode
set fileencoding=utf-8 " File encoding is UTF-8
let g:skip_loading_mswin=1 " To make sure mswin.vim doesn't load
set history=9999 " Large History
set clipboard+=unnamed " Share windows clipboard

set noerrorbells " Don't make noise


syntax enable " Highlight syntax
set spell spelllang=en_us " Set spelling language
color darkblue " Color scheme
hi clear SpellBad
hi SpellBad cterm=bold

" Spaces and Tabs:
set shiftwidth=2
set tabstop=2
set expandtab
set list " Show tabs to not ever have them
set nojoinspaces " Disable double spaces on Join
set backspace=2 " Make backspace behave nicely.
set backspace=indent,eol,start " Force it to work on these characters.
"
" UI Config
"Set whitespace chars
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set columns=120 "Set max columns
set number " Show column number
set numberwidth=5 " Can have columns of up to 99999
set cc=100 " Highlight Column 100

" Show cursors:
set cursorline
set cursorcolumn
" Set cursor colors:
hi CursorColumn cterm=NONE ctermbg=darkmagenta guibg=darkred
hi CursorLine cterm=NONE ctermbg=darkmagenta

filetype plugin indent on
set wildmenu
set showmatch
set ruler

" Search
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Help:
helptags $home/vimfiles/doc
map <leader>hh :he <C-R><C-W><CR>

" Movement:
nnoremap j gj
nnoremap k gk
nnoremap gV '[v']
