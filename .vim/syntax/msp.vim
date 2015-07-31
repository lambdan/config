" Vim syntax file
" Language:     Menes Server Pages
" Maintainer:   Jay Freeman <saurik@saurik.com>
" Last Change:  2005 May 30

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C++ syntax to start with
if version < 600
  so <sfile>:p:h/xml.vim
else
  runtime! syntax/xml.vim
  unlet b:current_syntax
endif

syn keyword cppConditional
    \ if else switch
    \ contained
hi def link cppConditional Conditional

syn keyword cppLabel
    \ case default
    \ contained
hi def link cppLabel Label

syn keyword cppRepeat
    \ while for do
    \ contained
hi def link cppRepeat Repeat

syn keyword cppStatement
    \ goto break return continue asm
    \ contained
hi def link cppStatement Statement

""""""""""""""""""
" XML Extensions

syn cluster xmlContent
    \ contains=wafContent,xmlTagName,xmlAttrib,xmlEqual,xmlString,@xmlStartTagHook

syn region wafContent
    \ matchgroup=xmlTag start=+<[^ /!?<>"']\@=+
    \ matchgroup=xmlTag end=+\(/>\|\(</[^>]*\)\@<=>\)+
    \ contains=wafLogic,wafContent,wafExpression,xmlTagName,xmlPartial,xmlEqual,xmlBracket,@xmlStartTagHook

syn region wafLogicTag
    \ start=+\(<waf:logic\)\@<=+
    \ end=+>+
    \ contains=@xmlContent
    \ contained

syn match wafLogicTag
    \ +\(<waf:logic\)\@<=>+
    \ contained

syn region wafLogic
    \ matchgroup=wafBorder start=+<waf:logic+
    \ matchgroup=wafBorder end=+</waf:logic>+
    \ contains=wafLogicTag,xmlComment,wafLogic,wafContent ",cpp.*

syn region wafExpression
    \ matchgroup=wafBorder start=+{\@<!{{\@!+
    \ matchgroup=wafBorder end=+}\@<!}}\@!+
"    \ contains=cpp.*

syn clear xmlString
syn region xmlString
    \ start=+"+
    \ skip=+\\\\\|\\"+
    \ end=+"+
    \ contains=xmlEntity,wafExpression
    \ contained
    \ display

syn region xmlString
    \ start=+'+
    \ skip=+\\\\\|\\'+
    \ end=+'+
    \ contains=xmlEntity,wafExpression
    \ contained
    \ display

" Default highlighting
if version >= 508 || !exists("did_msp_syntax_inits")
  if version < 508
    let did_msp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

    HiLink xmlAttribNamespace xmlNamespace
    HiLink xmlBracket xmlTag

    HiLink wafBorder Statement
    HiLink wafCode Statement
    HiLink wafExpression wafCode
    HiLink wafLogic wafCode
    HiLink wafLogicTag wafBorder

  delcommand HiLink
endif

let b:current_syntax = "msp"

" vim: ts=8
