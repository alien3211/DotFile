if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match ttimestamp "\[\d\d\d\d-\d\d-\d\d \d\d\:\d\d:\d\d.\d\d\d\]" 
syn match ttraceobject "(.*)"
syn match treceivedsignal "signal.*received"
syn keyword ttracelevel REC SIG SEND SIG TRACE6 TRACE7 PARAM TRACE1 TRACE2 TRACE3 TRACE4 TRACE5 TRACE9
syn match terror "ERROR:.*$"
syn match tinfo "INFO:.*$"

if version >= 508 || !exists("did_man_syn_inits")
 	hi link ttimestamp Comment
	hi link ttraceobject PreProc
	hi link treceivedsignal PreProc
	hi link ttracelevel Identifier
	hi link terror Error
	hi link tinfo Type
endif

let b:current_syntax = "tracelog"
