" Vim syntax file
" Language:	++C
" Maintainer:	Jay Freeman <saurik@saurik.com>
" Last Change:	2005 Mar 24

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C++ syntax to start with
if version < 600
  so <sfile>:p:h/cpp.vim
else
  runtime! syntax/cpp.vim
  unlet b:current_syntax
endif

syn keyword xxcAccess const friend static virtual
syn keyword xxcStorageClass function
syn keyword xxcSpecial constructor destructor cast

" Default highlighting
if version >= 508 || !exists("did_xxc_syntax_inits")
  if version < 508
    let did_xxc_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink xxcAccess xxcStatement
  HiLink xxcStatement Statement
  HiLink xxcSpecial SpecialChar
  HiLink xxcStorageClass StorageClass
  delcommand HiLink
endif

let b:current_syntax = "xxc"

" vim: ts=8
