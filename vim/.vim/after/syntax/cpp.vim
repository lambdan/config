syn keyword cStatement __asm__
syn keyword cppStatement _synchronized _desynchronized _map
syn keyword cppStatement _catch
syn keyword cppStatement _scope

syn keyword cStatement static_assert
syn keyword cStatement decltype

syn keyword cSpecial _B _H _I _L _M _R _S _V _Vs
syn match Special +::+

syn match Special +\<$(\([^')]\|'.*'\)\+)+
syn match Special +\<${[^}]*}+

syn keyword cPreProc _initialize _finalize _value

syn keyword cRepeat _rforeach _tforeach _rtforeach

syn match cppCast "\<\(assert\|implicit\|lexical\|lowlevel\)_cast\s*<"me=e-1
syn match cppCast "\<\(assert\|implicit\|lexical\|lowlevel\)_cast\s*$"
syn keyword cppCast _unconst

syn keyword cType byte_t offset_t
syn keyword cppType _default _deprecated _finline

syn match Special +^%\<\(apt\|bundle\|class\|end\|flag\|filter\|function\|hook\|implementation\|interface\)\>+
syn match Special +%\<\(original\)\>+

syn match Special +R"(\_.\{-})"+
