syn keyword cTodo contained TAG

syn keyword cStatement __asm__
syn keyword cStatement _assert _assume _breakpoint _likely
syn keyword cStatement _nodefault _not _null _trace _unlikely
syn keyword cStatement new delete _label

syn keyword cType _Bool

syn keyword Special _
syn match Special +::+

syn keyword cSpecial _constructor _deconstructor _property
syn keyword cSpecial _begin _handle _always _profile _end _end_
syn keyword cSpecial _start __attribute__
syn keyword cSpecial C E F

syn keyword cRepeat _forever _forall _rforall _foreach
syn keyword cRepeat _check _raise _repeat _syscall _until
syn keyword cRepeat TEMP_FAILURE_RETRY

syn keyword cType _deprecated _disused _externc _finline
syn keyword cType _statistic _transient _packed _unused

syn keyword cType GLuint GLint GLsizei GLvoid GLenum
syn keyword cType GLsizeiptr GLintptr GLfloat GLdouble

syn keyword cConstant SIGBUS

syn match Meta +@[^ ]*+

syn clear cErrInParen

syn match Dead +\$+

syn keyword cStatement _amdcall
