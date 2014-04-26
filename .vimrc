
" auto indentation when writing functions() { for example
set autoindent
filetype indent on

" show filename in tmux tabs
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%")) 

<<<<<<< HEAD
" show syntax
syntax enable

" one tab is 4 spaces
set tabstop=4

" show line numbers
set number

" fix cygwin backspace
set nocompatible 

" something about tabbing
set expandtab
set shiftwidth=2
set softtabstop=2

=======
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" cygwin backspace fix
" set nocompatible
" set backspace=2
>>>>>>> FETCH_HEAD
