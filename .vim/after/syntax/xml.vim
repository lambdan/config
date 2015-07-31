syn cluster xmlContent
    \ contains=xmlTagName,xmlAttrib,xmlEqual,xmlString,@xmlStartTagHook

syn match xmlBracket
    \ +</+
    \ contained

syn region xmlPartial
    \ matchgroup=xmlTagName start=+<\@<=[a-z]+
    \ matchgroup=xmlTagName end=+\([^/]\@=>\|\(/>\)\@=\)+
    \ contains=@xmlContent

syn region xmlPartial
    \ matchgroup=xmlNamespace start=+<\@<=[a-z]\([a-z]*:\)\@=+
    \ matchgroup=xmlTagName end=+\([^/]\@=>\|\(/>\)\@=\)+
    \ contains=@xmlContent

syn match xmlTagName
    \ +\(<.\)\@<=[^ /!?<>"']\++
    \ contains=xmlNamespace,xmlAttribPunct,@xmlTagHook
    \ contained
    \ display

syn match xmlNamespace
    \ +\(<.\)\@<=[^ /!?<>"':]\+[:]\@=+
    \ contains=@xmlNamespaceHook
    \ contained
    \ display

syn match xmlAttribNamespace
    \ +\( \)\@<=[^ /!?<>"':]\+[:]\@=+
    \ contains=@xmlNamespaceHook
    \ contained
    \ display

syn clear xmlAttrib
syn match xmlAttrib
    \ +[-'"<]\@<!\<[a-zA-Z:_][-.0-9a-zA-Z0-9:_]*\>\(['">]\@!\|$\)+
    \ contains=xmlAttribNamespace,xmlAttribPunct,@xmlAttribHook
    \ contained
    \ display

" XXX: should this contain @xmlContent instead?
syn region xmlTag
    \ matchgroup=xmlTag start=+<[^ /!?<>"']\@=+
    \ matchgroup=xmlTag end=+>+
    \ contains=xmlTag,xmlTagName,xmlAttrib,xmlEqual,xmlString,@xmlStartTagHook

syn clear xmlError
syn match xmlError "&"

syn clear xmlEntity
syn match xmlEntity "&[^; \t]*;" contains=xmlEntityPunct

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

  delcommand HiLink
endif
