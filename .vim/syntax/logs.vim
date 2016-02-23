" Vim syntax file
" Language: RNC traces
" Maintainer: Krzysztof Garus
" Latest Revision: 2 July 2013

if exists("b:current_syntax")
"  finish
endif

syntax clear
syntax case match

syn keyword traceinfo   INFO
syn keyword tracenormal TRACE1 TRACE2 TRACE3 TRACE4 TRACE5 TRACE6 TRACE7 TRACE8 nextgroup=normalny skipwhite
syn match traceerror  'ERROR.*$'

"syn match normalny '.*'

syn match fileline "[a-zA-Z0-9_.]\+\:\d\+"
syn match datetime "^\[[^]]*\]" nextgroup=fileline skipwhite

syn match messageHex "^[0-9A-F][0-9A-F][0-9A-F][0-9A-F].*" nextgroup=messageHex fold

syn region messageTree start="  {" end="^  }" fold contains=messageTreeIn
syn region messageTreeIn start="   {" end="   }" fold contains=messageTreeIn

hi link datetime        Macro
hi link tracenormal     Statement
hi link traceinfo       Constant
hi link traceerror      Operator
hi link fileline        Type
hi link messageHex      preProc
hi link messageTree     Comment
hi link messageTreeIn     Comment

set foldmethod=syntax

