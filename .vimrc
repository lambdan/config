set term=builtin_ansi
set bg=dark
set number
filetype plugin indent on
syntax on
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%")) 

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" cygwin backspace fix
" set nocompatible
" set backspace=2
