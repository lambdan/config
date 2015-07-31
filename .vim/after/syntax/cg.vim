" Vim syntax file
" Language:	Cg
" Maintainer:	Jay Freeman <saurik@saurik.com>
" Last Change:	2006 Oct 22

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword cgType string void packed
syn match cgType '\<\(double\|float\|half\|int\|fixed\|bool\)\([1-4]\(x[1-4]\)\?\)\?\>'
syn match cgType '\<sampler\([1-3]D\|CUBE\|RECT\)\?\>'

syn keyword cgConditional if else
syn keyword cgConstant true false
syn keyword cgRepeat while for
syn keyword cgStatement return

syn keyword cgStructure struct interface typedef
syn keyword cgStructure technique pass

syn keyword cgStorageClass const static
syn keyword cgStorageClass in out inout uniform

syn match cgSwizzle '\.\s*\<[xyzw]\{1,4\}\>'
syn match cgSwizzle '\.\s*\<[rgba]\{1,4\}\>'
syn match cgSwizzle '\.\s*\<\(_m[0-3][0-3]\)\{1,16\}\>'

" Functions {{{
syn keyword cgDebugging debug
syn keyword cgDerivative ddx ddy

syn keyword cgGeometric distance faceforward length
syn keyword cgGeometric normalize reflect refract

syn keyword cgMathematical abs acos all any asin atan atan2
syn keyword cgMathematical ceil clamp cos cosh cross
syn keyword cgMathematical degrees determinant dot exp exp2
syn keyword cgMathematical floor fmod frac frexp
syn keyword cgMathematical isfinite isinf isnan
syn keyword cgMathematical ldexp lerp lit log log2 log10
syn keyword cgMathematical max min modf mul noise pow
syn keyword cgMathematical radians round rsqrt
syn keyword cgMathematical saturate sign sin sincos sinh
syn keyword cgMathematical smoothstep step sqrt tan tanh transpose

syn match cgPacking '\<\(un\)?pack_2\(half\|ushort\)\>'
syn match cgPacking '\<\(un\)?pack_4u\?byte\>'

syn match cgTextureMap '\<tex\([1-3]D\|RECT\|CUBE\)\(proj\)\?\>'
" }}}
" Semantics {{{
syn keyword cgSemantic BLENDWEIGHT NORMAL DIFFUSE SPECULAR DEPTH DEPR
syn keyword cgSemantic COLOR COLOR0 COLOR1 COL COL0 COL1 BOL0 BCOL1
syn keyword cgSemantic POSITION WPOS PSIZE PSIZ FOG FOGC FOGCOORD
syn keyword cgSemantic TESSFACTOR BLENDINDICES TANGENT BINORMAL

syn match cgSemantic '\<TEXCOORD[0-7]\>'
syn match cgSemantic '\<TEX[0-7]\>'
syn match cgSemantic '\<CLP[0-5]\>'
syn match cgSemantic '\<C[0-9]*\>'

syn match cgSemantic '\<ATTR1[0-5]\>'
syn match cgSemantic '\<ATTR[0-9]\>'

syn match cgSemantic '\<TEXUNIT1[0-5]\>'
syn match cgSemantic '\<TEXUNIT[0-9]\>'
" }}}

syn keyword cgTodo contained XXX
syn cluster cgCommentGroup contains=cgTodo
syn keyword cgConvention _in _out

" Strings & Characters {{{
syn match cgSpecial display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn match cgSpecial display contained "\\\(u\x\{4}\|U\x\{8}\)"

syn region cgString start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=cgSpecial,@Spell
" cgCppString: same as cgString, but ends at end of line
syn region cgCppString start=+L\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end='$' contains=cgSpecial,@Spell

syn match cgCharacter "L\='[^\\]'"
syn match cgCharacter "L'[^']*'" contains=cgSpecial
syn match cgSpecialError "L\='\\[^'\"?\\abfnrtv]'"
syn match cgSpecialCharacter "L\='\\['\"?\\abfnrtv]'"
syn match cgSpecialCharacter display "L\='\\\o\{1,3}'"
syn match cgSpecialCharacter display "'\\x\x\{1,2}'"
syn match cgSpecialCharacter display "L'\\x\x\+'"
" }}}

syn match cgSpaceError display excludenl "\s\+$"
syn match cgSpaceError display " \+\t"me=e-1

" Nesting {{{
"catch errors caused by wrong parenthesis and brackets
" also accept <% for {, %> for }, <: for [ and :> for ] (C99)
" But avoid matching <::.
syn cluster	cgParenGroup	contains=cgParenError,cgSpecial,cgCommentSkip,cgCommentString,cgComment2String,@cgCommentGroup,cgCommentStartError,cgCommentSkip,cgOctalZero,cgNumber,cgFloat,cgOctal,cgOctalError,cgNumbersCom
if exists("c_no_bracket_error")
  syn region	cgParen		transparent start='(' end=')' contains=ALLBUT,@cgParenGroup,cgCppParen,cgCppString,@Spell
  " cgCppParen: same as cgParen but ends at end-of-line; used in cgDefine
  syn region	cgCppParen	transparent start='(' skip='\\$' excludenl end=')' end='$' contained contains=ALLBUT,@cgParenGroup,cgParen,cgString,@Spell
  syn match	cgParenError	display ")"
  syn match	cgErrInParen	display contained "[{}]\|<%\|%>"
else
  syn region	cgParen		transparent start='(' end=')' contains=ALLBUT,@cgParenGroup,cgCppParen,cgErrInBracket,cgCppBracket,cgCppString,@Spell
  " cgCppParen: same as cgParen but ends at end-of-line; used in cgDefine
  syn region	cgCppParen	transparent start='(' skip='\\$' excludenl end=')' end='$' contained contains=ALLBUT,@cgParenGroup,cgErrInBracket,cgParen,cgBracket,cgString,@Spell
  syn match	cgParenError	display "[\])]"
  syn match	cgErrInParen	display contained "[\]{}]\|<%\|%>"
  syn region	cgBracket	transparent start='\[\|<::\@!' end=']\|:>' contains=ALLBUT,@cgParenGroup,cgErrInParen,cgCppParen,cgCppBracket,cgCppString,@Spell
  " cgCppBracket: same as cgParen but ends at end-of-line; used in cgDefine
  syn region	cgCppBracket	transparent start='\[\|<::\@!' skip='\\$' excludenl end=']\|:>' end='$' contained contains=ALLBUT,@cgParenGroup,cgErrInParen,cgParen,cgBracket,cgString,@Spell
  syn match	cgErrInBracket	display contained "[);{}]\|<%\|%>"
endif
" }}}
" Numbers {{{
"integer number, or floating point number without a dot and with "f".
syn case ignore
syn match	cgNumbers	display transparent "\<\d\|\.\d" contains=cgNumber,cgFloat,cgOctalError,cgOctal
" Same, but without octal error (for comments)
syn match	cgNumbersCom	display contained transparent "\<\d\|\.\d" contains=cgNumber,cgFloat,cgOctal
syn match	cgNumber		display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
"hex number
syn match	cgNumber		display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
" Flag the first zero of an octal number as something special
syn match	cgOctal		display contained "0\o\+\(u\=l\{0,2}\|ll\=u\)\>" contains=cgOctalZero
syn match	cgOctalZero	display contained "\<0"
syn match	cgFloat		display contained "\d\+f"
"floating point number, with dot, optional exponent
syn match	cgFloat		display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match	cgFloat		display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match	cgFloat		display contained "\d\+e[-+]\=\d\+[fl]\=\>"
if !exists("c_no_c99")
  "hexadecimal floating point number, optional leading digits, with dot, with exponent
  syn match	cgFloat		display contained "0x\x*\.\x\+p[-+]\=\d\+[fl]\=\>"
  "hexadecimal floating point number, with leading digits, optional dot, with exponent
  syn match	cgFloat		display contained "0x\x\+\.\=p[-+]\=\d\+[fl]\=\>"
endif

" flag an octal number with wrong digits
syn match	cgOctalError	display contained "0\o*[89]\d*"
syn case match
" }}}
" Comments {{{
if exists("c_comment_strings")
  " A comment can contain cgString, cgCharacter and cgNumber.
  " But a "*/" inside a cgString in a cgComment DOES end the comment!  So we
  " need to use a special type of cgString: cgCommentString, which also ends on
  " "*/", and sees a "*" at the start of the line as comment again.
  " Unfortunately this doesn't very well work for // type of comments :-(
  syntax match	cgCommentSkip	contained "^\s*\*\($\|\s\+\)"
  syntax region cgCommentString	contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end=+\*/+me=s-1 contains=cgSpecial,cgCommentSkip
  syntax region cgComment2String	contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end="$" contains=cgSpecial
  syntax region  cgCommentL	start="//" skip="\\$" end="$" keepend contains=@cgCommentGroup,cgComment2String,cgCharacter,cgNumbersCom,cgSpaceError,@Spell
  syntax region cgComment	matchgroup=cgCommentStart start="/\*" end="\*/" contains=@cgCommentGroup,cgCommentStartError,cgCommentString,cgCharacter,cgNumbersCom,cgSpaceError,@Spell
else
  syn region	cgCommentL	start="//" skip="\\$" end="$" keepend contains=@cgCommentGroup,cgSpaceError,@Spell
  syn region	cgComment	matchgroup=cgCommentStart start="/\*" end="\*/" contains=@cgCommentGroup,cgCommentStartError,cgSpaceError,@Spell
endif
" keep a // comment separately, it terminates a preproc. conditional
syntax match	cgCommentError	display "\*/"
syntax match	cgCommentStartError display "/\*"me=e-1 contained
" }}}

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_c_syn_inits")
    if version < 508
        let did_c_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

  HiLink cgCppString		cgString
  HiLink cgSpecialCharacter	cgSpecial
  HiLink cgNumber		Number
  HiLink cgOctal			Number
  HiLink cgOctalZero		PreProc	 " link this to Error if you want
  HiLink cgFloat			Float
  HiLink cgOctalError		cgError
  HiLink cgParenError		cgError
  HiLink cgErrInParen		cgError
  HiLink cgErrInBracket		cgError
  HiLink cgOperator		Operator
  HiLink cgStorageClass		StorageClass
  HiLink cgCommentString		cgString
  HiLink cgComment2String	cgString
  HiLink cgCommentSkip		cgComment
  HiLink cgComment		Comment
  HiLink cgSpecial		SpecialChar

    HiLink cgCommentL cgComment
    HiLink cgCommentStart cgComment

    HiLink cgCommentError cgError
    HiLink cgCommentStartError cgError
    HiLink cgSpaceError cgError
    HiLink cgSpecialError cgError
    HiLink cgError Error

    HiLink cgGeometric cgFunction
    HiLink cgDebugging cgFunction
    HiLink cgDerivative cgFunction
    HiLink cgMathematical cgFunction
    HiLink cgPacking cgFunction
    HiLink cgTextureMap cgFunction

    HiLink cgFunction Operator
    HiLink cgSemantic Operator
    HiLink cgSwizzle Operator

    HiLink cgCharacter Character
    HiLink cgComment Comment
    HiLink cgConditional Conditional
    HiLink cgConstant Constant
    HiLink cgRepeat Repeat
    HiLink cgStatement Statement
    HiLink cgStorageClass StorageClass
    HiLink cgString String
    HiLink cgStructure Structure
    HiLink cgTodo Todo
    HiLink cgType Type

    " XXX: better category?
    HiLink cgConvention SpecialChar

    delcommand HiLink
endif

let b:current_syntax = "cg"

" vim: ts=8
