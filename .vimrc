" syntax coloring in osx mountain lion+
set term=builtin_ansi

" show line number
set number

" show color syntax
filetype plugin indent on
syntax on

" line number color
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" show filename in tmux tabs
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%")) 
