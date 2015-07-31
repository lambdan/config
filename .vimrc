set nocompatible
set ruler showcmd nomodeline
set hlsearch incsearch
set backspace=2 autoindent bin
"set list listchars=tab:\ \
"listchars=tab:>-,trail:.,extends:>,eol:$
set smarttab expandtab
set wrap whichwrap+=<,>,[,]
set wrapmargin=0 textwidth=0
:fixdel
set t_ts=^[]1;
set t_fs=^G

set nobackup wildmenu
set viminfo=%,'50,\"10000,:10000
set showmatch matchtime=1
set directory=~/.vimswap//,/var/tmp//,/tmp//
set foldmethod=marker

" XXX: Win32 ? 128-167,224-235 : 192-255
set iskeyword=@,48-57,_

" XXX: weird redhat extensions?
set mouse= nolz
"set hid

if v:version >= 700
    set numberwidth=8
endif

"filetype plugin indent on
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

syntax on
"set term=builtin_ansi
colorscheme saurik

setglobal fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

let c_space_errors=1
let c_no_if0=1
let java_allow_cpp_keywords=1
let java_space_errors=1
au BufNewFile,BufRead *.ipp setf cpp
au BufNewFile,BufRead *.g setf antlr
au BufNewFile,BufRead *.kon setf xml

au BufNewFile,BufRead *.vcg setf cg
au BufNewFile,BufRead *.fcg setf cg
au BufNewFile,BufRead *.cg setf cg
au BufNewFile,BufRead *.xm setf logos

au BufNewFile,BufRead *.css let b:swill = "css" | set ft=swill
au BufNewFile,BufRead *.json let b:swill = "js" | set ft=swill
au BufNewFile,BufRead *.js let b:swill = "js" | set ft=swill
au BufNewFile,BufRead *.html let b:swill = "html" | set ft=swill
au BufNewFile,BufRead *.sql let b:swill = "sql" | set ft=swill
au BufNewFile,BufRead *.swl let b:swill = "swl" | set ft=swill

au BufNewFile,BufRead *.as set ft=actionscript
au BufNewFile,BufRead *.msp set ft=msp
au BufNewFile,BufRead *.smali set ft=smali
au BufNewFile,BufRead *.cy set ft=javascript

au BufNewFile,BufRead *.arm setf arm | set nonumber | set mouse=
au BufNewFile,BufRead *.rl set ft=ragel
au BufNewFile,BufRead *.xxc setf xxc
au BufNewFile,BufRead *.xxh setf xxc


" auto indentation when writing functions() { for example
set autoindent
filetype indent on
syntax on
filetype plugin indent on

" show filename in tmux tabs
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%")) 

" show syntax
" syntax enable

" one tab is 4 spaces
set tabstop=4

" show line numbers
set number

" fix cygwin backspace
set nocompatible 

" something about tabbing
set expandtab
set shiftwidth=4
set softtabstop=4
:fixdel

