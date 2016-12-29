" Vim syntax file
" Language:     Swill Templates
" Maintainer:   Jay Freeman <saurik@saurik.com>
" Last Change:  2007 Sep 18

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match armHexNumber +\<-\?\(0x\)\?[0-9a-fA-F]\+\>+

syn match armInstruction +\<\(add\|and\|asr\|bic\|cmp\|eor\|ldr\|lsl\|lsr\|mcr\|mrc\|msr\|mov\|mul\|mvn\|orr\|rsb\|sbc\|str\|sub\|sxtb\|tst\|uxt\)\(eq\|ne\|cs\|cc\|mi\|pl\|vs\|vc\|hi\|ls\|ge\|lt\|gt\|le\)\?s\?\(b\|h\)\?\>+

syn match armDecNumber +\<-\?[0-9]\+\>+
syn match armDecNumber +\<-\?[0-9]\+\.[0-9]*\>+
syn match armDecNumber +\<-\?\.[0-9]\+\>+

syn match armProcessor +\<p[0-9]\+\>+

syn match armRegister +\<cpsr\(_[cfsx]\+\)\?\>+
syn match armRegister +\<r[0-9]\+\>+
syn keyword armRegister pc lr sp

syn match armBranch +\<bl\?x\?\(eq\|ne\|cs\|cc\|mi\|pl\|vs\|vc\|hi\|ls\|ge\|lt\|gt\|le\)\?\>+
syn keyword armBranch push pop

syn keyword armCode thumb arm11
syn keyword armData uint1 uint2 uint4 zeros table magic chars
syn keyword armPointer point

syn match armEscape contained +\\[\\nrt]+

syn region armString
    \ start=+"+
    \ end=+"+
    \ contains=armEscape

syn region armShortComment
    \ start=+;+
    \ end=+\n+

" Default highlighting
if version >= 508 || !exists("did_arm_syntax_inits")
  if version < 508
    let did_msp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink armBranch Special
  HiLink armCode Special
  HiLink armPointer Statement
  HiLink armData Type
  HiLink armShortComment Comment
  HiLink armHexNumber Number
  HiLink armDecNumber Number
  HiLink armRegister Identifier
  HiLink armProcessor Special
  HiLink armInstruction Statement
  HiLink armString String
  HiLink armEscape Special

  delcommand HiLink
endif

let b:current_syntax = "arm"

" vim: ts=8
