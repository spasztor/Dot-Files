set nocompatible
filetype indent plugin on
syntax on
colo evening

set spell spelllang=en_us
set wildmenu
set showmatch

set ruler

hi CursorLine cterm=NONE ctermbg=darkmagenta guibg=darkred
hi CursorColumn cterm=NONE ctermbg=darkmagenta guibg=darkred
set cursorline
set cursorcolumn
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

nnoremap j gj
nnoremap k gk

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list
set columns=80
set number

set shiftwidth=4
set tabstop=4
set expandtab
