" Vim syntax file
" Language:	ActionScript
" Maintainer:	Jay Freeman <saurik@saurik.com>
" Last Change:	2007 Aug 20

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C++ syntax to start with
if version < 600
  so <sfile>:p:h/javascript.vim
else
  runtime! syntax/javascript.vim
  unlet b:current_syntax
endif

" Default highlighting
if version >= 508 || !exists("did_actionscript_syntax_inits")
  if version < 508
    let did_actionscript_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  delcommand HiLink
endif

let b:current_syntax = "actionscript"

" vim: ts=8
