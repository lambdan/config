#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

#MaxHotkeysPerInterval 1000

; bring up start menu with alt+space and search 
<!Space::
KeyWait Alt
Send {RWin}
return

$!c:: ; copy
	Send {Ctrl Down}{c}{Ctrl Up}
Return

$!a:: ; select all
	Send {Ctrl Down}{a}{Ctrl Up}
Return

$!v:: ; paste
	Send {Ctrl Down}{v}{Ctrl Up}
Return

$!w:: ; close tab
	Send {Ctrl Down}{w}{Ctrl Up}
Return

$!t:: ; new tab
	Send {Ctrl Down}{t}{Ctrl Up}
Return

$!s:: ; save
	Send {Ctrl Down}{s}{Ctrl Up}
Return

$!z:: ; undo
	Send {Ctrl Down}{z}{Ctrl Up}
Return
