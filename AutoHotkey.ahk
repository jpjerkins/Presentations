
#NoEnv
#HotkeyModifierTimeout 0
; {{{1
; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

; #z::Run www.autohotkey.com
; WheelDown::WheelUp
; WheelUp::WheelDown

SetTitleMatchMode, Regex

;
; KEY ASSIGNMENTS {{{1
;

; Block media keys on home keyboard
#If InStr(A_computername, "PhilHomeLaptop")
	Volume_Mute:: return
	Volume_Down:: return
	Volume_Up:: return
	Media_Next:: return
	Media_Prev:: return
	Media_Stop:: return
	Media_Play_Pause:: return
	Launch_Mail:: return
	Launch_Media:: return
#If

; ^!n::RunNotepad
; $\::GoBackslash()
^!+Space::ToggleAlwaysOnTop()
^!l::GoLINQPad()
^!7::Go7Zip()
^!+7::GoNew7Zip()
^!+c::GoNewPowerShellCore()
^!c::GoPowerShellCore()
!+c::GoVSCode()
^!e::SearchEverything()
; ^!e::GoErlang()
; ^!+e::GoNewErlang()
#If InStr(A_computername, "MRO-")
	^!f::GoChrome()
#If
#If InStr(A_computername, "Jerkins-Laptop")
	^!f::GoFirefox()
#If
; +!f::GoFreeplane()
^!g::GoGit()
#If InStr(A_computername, "MRO-")
	^!i::GoIIS()
#If
^!+i::GoSearchInbox()
#If !InStr(A_computername, "jerkinsp")
	^!j::GoJiraIssue()
#If
^!k::GoKeePass()
!+o::GoPostman()
!+k::KeywordsChord()
^!m::MultimonitorChord()
^!p::GoCommandPrompt()
#If InStr(A_computername, "TN-")
	^!+m::ToggleMute()
	!+n::GoOneNote()
#If
^!o::GoOutlook()
; !+p::PasswordChord()
; ^!+p::UsernameAndPasswordChord()
^!q::GoSQL()
^!+q::GoNewSQL()
^!r::RemoveFormatting()
;^!+r::GoMRemoteNG()
^!s::SearchChord()
^!t::GoTeams()
^!u::GoSublime()
$^v::PasteToCygwin()
^!V::GoVS2022()
^+v::GoGVim()
^!+v::GoNewVS2022()
;^!w::GoWebexTeams()
^!w::GoWorkNotes()
^!+w::GoWebexMeetings()
;^!x::GoCubicExplorer()
;^!y::GoCygwin()
;^!+y::GoNewCygwin()
;^!z::Test()

ToggleAlwaysOnTop() ; {{{1
{
	Winset, AlwaysOnTop, Toggle, A
}

SqlBitsChord() ; {{{1
{
	SplashTextOn, , , 5`,Lbl`,tmP`,Sel`,Tran`,Var
	Input, secondKey, L1 T2, {Esc}
	SplashTextOff
	if ErrorLevel = EndKey:Escape ; {{{2
	{
		return
	}

	; SELECT TOP 5 {{{2
	if (secondKey = "5")
	{
		InputBox, tableName, SQL SELECT TOP 5, Enter name of table to SELECT from, , , 120
		if (ErrorLevel)
		{
			return
		}
		Send,SELECT{Tab}{Tab}{Tab}TOP 5 [
		SendRaw,%tableName%
		Send,] = '
		SendRaw,%tableName%
		Send,',{Enter}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}*{Enter}{BS}{BS}{BS}{BS}{BS}{BS}FROM{Tab}{Tab}{Tab}{Tab}
		SendRaw,%tableName%
		Send,{Enter}
		return
	}

	; Label {{{2
	if (secondKey = "l")
	{
		InputBox, label, SQL Label, Enter name for the label, , , 120
		if (ErrorLevel)
		{
			return
		}
		SendRaw,[%label%] = '%label%'
		clipboard = %label%
		return
	}

	; If temp sproc exists, delete {{{2
	if (secondKey = "p")
	{
		InputBox, tempSproc, SQL Temp Object Check, Enter name of temp stored proc to conditionally drop `, INCLUDING the # symbol, , , 120
		if (ErrorLevel)
		{
			return
		}
		StringReplace, tempSprocSafe, tempSproc, #, {#}
		Send,IF OBJECT_ID('tempdb..%tempSprocSafe%') IS NOT NULL{Enter}DROP PROC %tempSprocSafe%{Enter}GO{Enter}{Enter}
		return
	}

	; Select {{{2
	if (secondKey = "s")
	{
		InputBox, tableName, SQL SELECT, Enter name of table to SELECT from, , , 120
		if (ErrorLevel)
		{
			return
		}
		Send,SELECT{Tab}{Tab}{Tab}[
		SendRaw,%tableName%
		Send,] = '
		SendRaw,%tableName%
		Send,',{Enter}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}*{Enter}{BS}{BS}{BS}{BS}{BS}{BS}FROM{Tab}{Tab}{Tab}{Tab}
		SendRaw,%tableName%
		Send,{Enter}
		return
	}

	; Transaction block {{{2
	if (secondKey = "t")
	{
		Send, -- COMMIT -- ROLLBACK{Enter}`/*{Enter}BEGIN TRAN{Enter}{Enter}{Enter}{Enter}-- *`/{Enter}{Enter}SELECT{Tab}[@@TRANCOUNT] = @@TRANCOUNT,{Enter}{Tab}{Tab}{Tab}{Tab}[@@SERVERNAME] = @@SERVERNAME{Enter}{Enter}{Up}{Up}{Up}{Up}{Up}{Up}{Up}
		return
	}
	; Variable {{{2
	if (secondKey = "v")
	{
		InputBox, variable, SQL Variable, Enter name of the variable, , , 120
		if (ErrorLevel)
		{
			return
		}
		SendRaw, [%variable%] = %variable%
		return
	}

} ; }}}1
KeywordsChord() ; {{{1
{
	SplashTextOn, , , Pwx`,pwxL`,pwxM`,WebSig`,Dt`,Tm
	Input, secondKey, L1 T2, {Esc}
	SplashTextOff
	if ErrorLevel = EndKey:Escape ; {{{2
	{
		return
	}

	; Signature {{{2
	if (secondKey = "s")
	{
		InputBox, salutation, Salutation, How do you want to sign off?, , , 120
		if (salutation = "")
		{
			salutation := "Thanks!"
		}
		StringReplace salutationSafe, salutation, !, {!}
		Send, {Enter}{Enter}%salutationSafe%{Enter}{Enter}Phil Jerkins{Enter}PJerkins@mrocorp.com{Enter}
		return
	}

	; Signature with WebEx {{{2
	if (secondKey = "w")
	{
		InputBox, salutation, Salutation, How do you want to sign off?, , , 120
		if (salutation = "")
		{
			salutation := "Thanks!"
		}
		StringReplace salutationSafe, salutation, !, {!}
		Send, {Enter}{Enter}%salutationSafe%{Enter}{Enter}Phil Jerkins{Enter}PJerkins@mrocorp.com{Enter}WebEx:{Space}{Space}https://mrocorp.webex.com/meet/pjerkins{Space}
		return
	}

	; Date {{{2
	if (secondKey = "d")
	{
		sendInput % A_YYYY . "-" . A_MM . "-" . A_DD
		return
	}

	; Time {{{2
	if (secondKey = "t")
	{
		sendInput % A_Hour . "-" . A_Min . "-" . A_Sec
		return
	}

	; Phil WebEx {{{2
	if (secondKey = "p")
	{
		Send, https://evicore.webex.com/meet/phil.jerkins
		return
	}

	; Location: Phil WebEx {{{2
	if (secondKey = "l")
	{
		Send, Phil's WebEx: https://evicore.webex.com/meet/phil.jerkins
		return
	}

	; Nebula WebEx in MarkDown {{{2
	if (secondKey = "m")
	{
		Send, [my WebEx room](https://evicore.webex.com/meet/phil.jerkins)
		return
	}

} ; }}}1
SearchWindows() ; {{{1
{
	InputBox, searchCriteria, Search Windows, Enter text to search for, , , 120
	if (ErrorLevel)
	{
	}
	else {
		WinActivate i)%searchCriteria%
	}
}

SearchGoogle() ; {{{1
{
	InputBox, searchCriteria, Search Google, Enter what you want to search Google for, , , 120
	if (ErrorLevel)
	{
		return
	}
	StringReplace, searchString, searchCriteria, %A_Space%, +, A
	Run "http://www.google.com/search?q=%searchString%"
}

SearchAmazon() ; {{{1
{
	InputBox, searchCriteria, Search Amazon, Enter what you want to search Amazon for, , , 120
	if (ErrorLevel)
	{
		return
	}
	StringReplace, searchString, searchCriteria, %A_Space%, +, A
	Run "http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias`%3Daps&field-keywords=%searchString%&x=0&y=0"
}

SearchWikipedia() ; {{{1
{
	InputBox, searchCriteria, Search Wikipedia, Enter what you want to search Wikipedia for, , , 120
	if (ErrorLevel)
	{
		return
	}
	StringReplace, searchString, searchCriteria, %A_Space%, +, A
	Run "http://en.wikipedia.org/w/index.php?title=Special`%3ASearch&search=%searchString%&button="
}

SearchYouTube() ; {{{1
{
	InputBox, searchCriteria, Search YouTube, Enter what you want to search YouTube for, , , 120
	if (ErrorLevel)
	{
		return
	}
	StringReplace, searchString, searchCriteria, %A_Space%, +, A
	Run "http://www.youtube.com/results?search_query=%searchString%"
}

Test() ; {{{1
{
	TrayTip, RSS Update, You have RSS updates..., 5
} ; }}}1

result := IsObject(passwords)

EnterPassword(key, change:=0) ; {{{1
{
	static passwords := {}

	if (change = 1) { ; {{{
		passwords[key] := ""
	} ; }}}

	if (passwords[key] == "") {
		; global passwords
		InputBox, password, %key% Password, Enter your %key% password, HIDE, , 120
		if ErrorLevel > 0 ; {{{
		{
			return
		} ; }}}
		passwords[key] := Encrypt(password)
		TrayTip, Password Saved, Saved your %key% password., 5
	}
	password := Decrypt(passwords[key])
	SendRaw, %password%
}


EnterUsername(key, change:=0) ; {{{1
{
	static usernames := {}

	oldUsername := usernames[key]

	if (change = 1) { ; {{{
		usernames[key] := ""
	} ; }}}

	if (usernames[key] == "")
	{
		InputBox, username, %key% Username, Enter your %key% username, , , 120, , , , , %oldusername%
		if ErrorLevel > 0 ; {{{2
		{
			return
		}
		usernames[key] := username
		TrayTip, Username Saved, Saved %username% as your %key% username., 5
	}
	username := usernames[key]
	SendRaw, %username%
}

PasswordChord() ; {{{1
{
	InputBox, key, Which Password?, Enter the key for the password you want (or "change" to change one), , , 120
	if ErrorLevel > 0 ; {{{
	{
		return
	} ; }}}

	change := 0
	if (key = "change") { ; {{{
		change := 1
		InputBox, key, Which Password?, Enter the key for the password you want to change, , , 120
		if ErrorLevel > 0 ; {{{
		{
			return
		} ; }}}

	} ; }}}

	EnterPassword(key, change)

} ; }}}1

UsernameAndPasswordChord() ; {{{1
{
	InputBox, key, Which Username?, Enter the key for the creds you want (or "change" to change one), , , 120
	if ErrorLevel > 0 ; {{{2
	{
		return
	}

	change := 0
	if (key = "change") { ; {{{
		change := 1
		InputBox, key, Which Password?, Enter the key for the password you want to change, , , 120
		if ErrorLevel > 0 ; {{{
		{
			return
		} ; }}}

	} ; }}}

	EnterUsername(key, change)
	Send, {Tab}
	EnterPassword(key, change)
	Send, {Enter}
} ; }}}1

SearchChord() ; {{{1
{
	SplashTextOn, , , Waiting for next key in chord (A, D, E, G, M, O, W, Y)...
	Input, secondKey, L1 T2, {Esc}
	SplashTextOff
	if ErrorLevel = EndKey:Escape ; {{{2
	{
		return
	}

	; Search Amazon {{{2
	if (secondKey = "a")
	{
		SearchAmazon()
		return
	}

	; Search Everything {{{2
	if (secondKey = "e")
	{
		SearchEverything()
		return
	}

	; Search Google {{{2
	if (secondKey = "g")
	{
		SearchGoogle()
		return
	}

	; Search Outlook {{{2
	if (secondKey = "o")
	{
		GoOutlook()
		Send ^e
		return
	}

	; Search Wikipedia {{{2
	if (secondKey = "w")
	{
		SearchWikipedia()
		return
	}

	; Search Open Windows {{{2
	if (secondKey = "n")
	{
		SearchWindows()
		return
	}

	; Search YouTube {{{2
	if (secondKey = "y")
	{
		SearchYouTube()
		return
	}
} ; }}}1

; Searches the Everything file indexer
; Find it at http://www.voidtools.com
SearchEverything() ; {{{1
{
	InputBox, searchCriteria, Search Everything, Enter a file to search for, , , 120
	if (ErrorLevel) {
	}
	else {
		Run , "C:\Program Files\Everything\Everything.exe" -search "%searchCriteria%" 
	}
}

MoveToPrimaryMonitorRestored() ; {{{1
{
	SysGet, primaryMonitorId, MonitorPrimary
	SysGet, mainMon, MonitorWorkArea, primaryMonitorId
	newTop := mainMonTop + 50
	newLeft := mainMonLeft + 50
	newHeight := mainMonBottom - mainMonTop - 100
	newWidth := mainMonRight - mainMonLeft - 100
	WinRestore, A
	WinMove, A, , newLeft, newTop, newWidth, newHeight
}

MoveToSecondaryMonitor() ; {{{1
{
	SysGet, monitorCount, 80
	if (monitorCount = 1)
	{
		return
	}
	SysGet, primaryMonitorId, MonitorPrimary
	secondaryMonitorId := 3 - primaryMonitorId
	SysGet, secMon, MonitorWorkArea, %secondaryMonitorId%
	newTop := secMonTop + 50
	newLeft := secMonLeft + 50
	newHeight := secMonBottom - secMonTop - 100
	newWidth := secMonRight - secMonLeft - 100
	WinRestore, A
	WinMove, A, , newLeft, newTop, newWidth, newHeight
	WinMaximize, A
}

MoveToFirstMonitor() ; {{{1
{
	SysGet, secMon, MonitorWorkArea, 1
	newTop := secMonTop + 50
	newLeft := secMonLeft + 50
	newHeight := secMonBottom - secMonTop - 100
	newWidth := secMonRight - secMonLeft - 100
	WinRestore, A
	WinMove, A, , newLeft, newTop, newWidth, newHeight
	WinMaximize, A
}

MoveToSecondMonitor() ; {{{1
{
	SysGet, monitorCount, 80
	if (monitorCount = 1)
	{
		return
	}
	SysGet, secMon, MonitorWorkArea, 2
	newTop := secMonTop + 50
	newLeft := secMonLeft + 50
	newHeight := secMonBottom - secMonTop - 100
	newWidth := secMonRight - secMonLeft - 100
	WinRestore, A
	WinMove, A, , newLeft, newTop, newWidth, newHeight
	WinMaximize, A
}

MoveToThirdMonitor() ; {{{1
{
	SysGet, monitorCount, 80
	if (monitorCount < 3)
	{
		return
	}
	SysGet, secMon, MonitorWorkArea, 3
	newTop := secMonTop + 50
	newLeft := secMonLeft + 50
	newHeight := secMonBottom - secMonTop - 100
	newWidth := secMonRight - secMonLeft - 100
	WinRestore, A
	WinMove, A, , newLeft, newTop, newWidth, newHeight
	WinMaximize, A
}

MultimonitorChord() ; {{{1
{
	SplashTextOn, , , Waiting for next key in chord (Q|C, P, S)...
	Input, secondKey, L1 T2, {Esc}
	SplashTextOff
	if ErrorLevel = EndKey:Escape
	{
		return
	}

	if (secondKey = "q" || secondKey = "c")
	{
		MoveToPrimaryMonitorRestored()
		WinClose, A
	}
	else if (secondKey = "p")
	{
		MoveToPrimaryMonitorRestored()
		WinMaximize, A
	}
	else if (secondKey = "s")
	{
		MoveToSecondaryMonitor()
	}
	else if (secondKey = "1")
	{
		MoveToFirstMonitor()
	}
	else if (secondKey = "2")
	{
		MoveToSecondMonitor()
	}
	else if (secondKey = "3")
	{
		MoveToThirdMonitor()
	}
}

GoWeather() ; {{{1
{
	Run http://www.weather.com/weather/today/37167
}

GoClearQuest() ; {{{1
{
	Run http://cqweb:8000/cqweb/login?/cqweb/main?schema=2002.05.00&contextid=KS_CM&command=GenerateMainFrame&rmsessionid=2f957114-10e8-4c2e-86e1-0a01000a565a
}

GoJiraIssue() ; {{{1
{
	InputBox, issueNumber, View Jira Issue, Enter a Jira issue to view, , , 120
	if (ErrorLevel) {
	}
	else {
		Run http://devblocks.hca.corpad.net:8080/browse/%issueNumber%
	}
}

RemoveFormatting() ; {{{1
{
	clipboard = %clipboard%
}

RunNotepad() ; {{{1
{
	IfWinExist Untitled - Notepad
		WinActivate
	else
		Run Notepad
	return
}

GoKeePass() ; {{{1
{
	IfWinExist KeePa
		WinActivate
	else
		If (InStr(A_computername, "MRO-")) {
			Run C:\Program Files\KeePass Password Safe 2\KeePass.exe
		} else {
			Run C:\Program Files (x86)\KeePass Password Safe 2\KeePass.exe
		}
	return
}

GoPostman() ; {{{1
{
	IfWinExist Postman
		WinActivate
	else
		Run C:\Users\jerkinsp\AppData\Local\Postman\app-6.0.10\Postman.exe
	return
}

GoLINQPad() ; {{{1
{
	IfWinExist LINQPad
		WinActivate
	else
		Run C:\Program Files\LINQPad7\LINQPad7.exe
	return
}

Go7Zip() ; {{{1
{
	Process, exist, 7zFM.exe
	if %ErrorLevel% = 0
	{
		Run C:\Program Files\7-Zip\7zFM.exe
	}
	else
	{
		WinActivate, ahk_pid %ErrorLevel%
	}
	return
}
GoNew7Zip() ; {{{1
{
	Run C:\Program Files\7-Zip\7zFM.exe
}

GoWebexMeetings() ; {{{1
{
	IfWinExist Cisco Webex Meetings
		WinActivate
	else
		MsgBox WebEx Meetings isn't running.
	return
	;Process, exist, atmgr.exe
	;if %ErrorLevel% <> 0
	;{
	;	WinActivate, ahk_pid %ErrorLevel%
	;}
	;return
}

GoTeams() ; {{{1
{
	IfWinExist Microsoft Teams
		WinActivate
	else
		Run C:\Users\pjerkins\AppData\Local\Microsoft\Teams\current\Teams.exe
	return
}

GoWebexTeams() ; {{{1
{
	Process, exist, CiscoCollabHost.exe
	if %ErrorLevel% = 0
	{
		Run C:\Program Files\Cisco Spark\CiscoCollabHost.exe
	}
	else
	{
		WinActivate, ahk_pid %ErrorLevel%
	}
	return
}

GoThinkingRock() ; {{{1
{
	IfWinExist ThinkingRock
		WinActivate
	Else
		Run C:\Program Files (x86)\TR-2.2.1\bin\tr-launcher.exe
	return
}

GoTeradata() ; {{{1
{
	IfWinExist Teradata SQL Assistant
		WinActivate
	Else
		Run C:\Program Files (x86)\Teradata\Client\13.11\Teradata SQL Assistant\SQLA.exe
	return
}

GoSublime() ; {{{1
{
	IfWinExist Sublime Text
		WinActivate
	Else
		Run C:\Program Files\Sublime Text 3\sublime_text.exe
	return
}

GoSlack() ; {{{1
{
	IfWinExist Slack
		WinActivate
	Else
		Run C:\Users\PJERKINS\AppData\Local\slack\slack.exe
	return
}

GoVSCode() ; {{{1
{
	IfWinExist Visual Studio Code
		WinActivate
	Else
		If (InStr(A_computername, "MRO-")) {
			Run C:\Program Files\Microsoft VS Code\Code.exe
		} else {
			Run C:\Users\PhilJ\AppData\Local\Programs\Microsoft VS Code\Code.exe
		}
	return
}

GoCygwin() ; {{{1
{
	Process, exist, mintty.exe
	if %ErrorLevel% = 0
	{
		Run C:\cygwin64\bin\mintty.exe -
	}
	else
	{
		WinActivate, ahk_pid %ErrorLevel%
	}
	return
}

GoNewCygwin() ; {{{1
{
	Run C:\cygwin64\bin\mintty.exe -
}

GoCommandPrompt() ; {{{1
{
				IfWinExist cmd\.exe
								WinActivate
				Else IfWinExist Command Prompt

								WinActivate

				Else
								Run %ComSpec%, C:\
				return
}

GoNewCommandPrompt() ; {{{1
{
				Run %ComSpec%, C:\
}

GoPowershellCore() ; {{{1
{
	IfWinExist PowerShell 7
		WinActivate
	Else IfWinExist pwsh
		WinActivate
	Else
		Run C:\Program Files\PowerShell\7\pwsh.exe -WorkingDirectory ~
	return
}

GoCmder() ; {{{1
{
				IfWinExist Cmder
								WinActivate
				Else
								Run C:\Users\pjerkins\Downloads\cmder\Cmder.exe
				return
}

GoNewPowershellCore() ; {{{1
{
	Run C:\Program Files\PowerShell\7\pwsh.exe -WorkingDirectory ~
}

GoWindowsTerminal() ; {{{1
{
	IfWinExist PowerShell Core
		WinActivate
	Else
		Run C:\Users\PJERKINS\AppData\Local\Microsoft\WindowsApps\wt.exe
	return
}

GoNewWindowsTerminal() ; {{{1
{
	Run C:\Users\PJERKINS\AppData\Local\Microsoft\WindowsApps\wt.exe
}

GoOneNote() ; {{{1
{
	IfWinExist OneNote
		WinActivate
	else
		Run C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE
	return
}

GoPowerShell() ; {{{1
{
	IfWinExist Windows PowerShell
		WinActivate
	else
		run c:\Windows\system32\WindowsPowerShell\v1.0\PowerShell_ISE.exe
	return
}

GoGit() ; {{{1
{
	Process, exist, SourceTree.exe
	if %ErrorLevel% = 0
	{
		If (InStr(A_computername, "MRO-")) {
			Run C:\Users\pjerkins\AppData\Local\SourceTree\SourceTree.exe
		} else {
			Run C:\Users\PhilJ\AppData\Local\SourceTree\SourceTree.exe
		}
	}
	else
	{
		WinActivate, ahk_pid %ErrorLevel%
	}
	return
}
GoErlang() ; {{{1
{
	IfWinExist Erlang
		WinActivate
	else
		Run C:\Program Files\erl5.7.2\bin\werl.exe, C:\Program Files\erl5.7.2\usr
	return
}
GoNewErlang() ; {{{1
{
	Run C:\Program Files\erl5.7.2\bin\werl.exe, C:\Program Files\erl5.7.2\usr
}

PasteToCygwin() ; {{{1
{
	IfWinActive, cmd\.exe|Command Prompt|Console2|PuTTY
		Send, %clipboard%
	else
		Send, ^v
	return
}

; GoBackslash() ; {{{1
; {
; 	Process, exist, 7zFM.exe
; 	if %ErrorLevel% = 0
; 	{
; 		Send \
; 		return
; 	}
; 	IfWinNotActive, ahk_pid %ErrorLevel%
; 	{
; 		Send \
; 		return
; 	}
; 	MsgBox, 4, Computer\ Guard, Are you sure you want to wait for Computer\?
; 	IfMsgBox, Yes
; 	{
; 		Send \
; 	}
; 	return
; }


GoFirefox() ; {{{1
{
	IfWinExist .*Mozilla Firefox
		WinActivate
	else IfWinExist .*Vimperator
		WinActivate
	else
		MsgBox Firefox isn't running.
	return
}



GoIE() { ; {{{1
	RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\Microsoft\Internet Explorer\Main, Start Page, about:blank
	IfWinExist .*Internet Explorer
		WinActivate
	else
		MsgBox Internet Explorer isn't running.
	return
}

GoIIS() { ; {{{1
	IfWinExist Internet Information Services
		WinActivate
	else
		Run , "C:\Program Files\Everything\Everything.exe" -search "InetMgr.exe" 
	return
}


GoChrome() ; {{{1
{
	IfWinExist .*Chrome
		WinActivate
	else IfWinExist .*Iron
		WinActivate
	else
		MsgBox Chrome isn't running.
	return
}



GoEdge() ; {{{1
{
	IfWinExist .*Edge
		WinActivate
	else
		MsgBox Edge isn't running.
	return
}



GoFreeplane() ; {{{1
{
	IfWinExist .*Freeplane
		WinActivate
	else
		Run C:\Program Files\Freeplane\freeplane.exe
	return
}



GoMSDN() { ; {{{1
	IfWinExist .*MSDN
		WinActivate
	else
		Run C:\Program Files\Common Files\Microsoft Shared\Help\dexplore.exe /helpcol ms-help://MS.MSDNQTR.2006JAN.1033
	return
}

GoOutlook() ; {{{1
{
	IfWinExist PJerkins@mrocorp.com
		WinActivate
	else
		MsgBox Outlook isn't running.
	return
}
; GoOutlook() ; {{{1
; {
; 	Process, exist, OUTLOOK.EXE
; 	if %ErrorLevel% = 0
; 	{
; 		Run C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE
; 	}
; 	else
; 	{
; 		WinActivate, ahk_pid %ErrorLevel%
; 	}
; 	return
; }

GoSQL() ; {{{1
{
	IfWinExist Microsoft SQL Server Management Studio
		WinActivate
	else
		Run C:\Program Files (x86)\Microsoft SQL Server Management Studio 19\Common7\IDE\Ssms.exe
	return
}
GoNewSQL() ; {{{1
{
	Run C:\Program Files (x86)\Microsoft SQL Server\110\Tools\Binn\ManagementStudio\Ssms.exe
}

GoRemedy() ; {{{1
{
	Run http://remedy/
}

GoMRemoteNG() ; {{{1
{
	Process, exist, mRemoteNG.exe
	if %ErrorLevel% = 0
	{
		Run C:\Program Files (x86)\mRemoteNG\mRemoteNG.exe
	}
	else
	{
		WinActivate, ahk_pid %ErrorLevel%
	}
	return
}

GoVS2013() { ; {{{1
	IfWinExist Microsoft Visual Studio
		WinActivate
	else
		MsgBox Visual Studio isn't running.
	return
}

GoVS2022() { ; {{{1
	IfWinExist Microsoft Visual Studio
		WinActivate
	else
		Run , "C:\Program Files\Everything\Everything.exe" -search "DevEnv.exe" 
	return
}

GoNewVS2022() { ; {{{1
	Run , "C:\Program Files\Everything\Everything.exe" -search "DevEnv.exe" 
}

GoSharpDevelop() { ; {{{1
	Process, exist, SharpDevelop.exe
	if %ErrorLevel% = 0
	{
		Run C:\Program Files (x86)\SharpDevelop\4.3\bin\SharpDevelop.exe
	}
	else
	{
		WinActivate, ahk_pid %ErrorLevel%
	}
	return
}

GoVSS() { ; {{{1
	IfWinExist Visual SourceSafe
		WinActivate
	else
		Run C:\Program Files\Microsoft Visual Studio\COMMON\VSS\win32\SSEXP.EXE
	return
}

GoGVim() ; {{{1
{
	IfWinExist .*GVIM
		WinActivate
	else
		If (InStr(A_computername, "MRO-")) {
			Run C:\Program Files (x86)\Vim\vim90\gvim.exe
		} else {
			Run C:\Program Files (x86)\Vim\vim82\gvim.exe
		}
	return
}
GoNewGVim() ; {{{1
{
	Run C:\Program Files (x86)\Vim\vim81\gvim.exe
}

GoWinSCP() ; {{{1
{
	IfWinExist .*WinSCP
		WinActivate
	else
		Run C:\Program Files (x86)\WinSCP\WinSCP.exe
	return
}
GoWorkNotes() ; {{{1
{
	Process, exist, nw.exe
	if %ErrorLevel% = 0
	{
		if(InStr(A_computername, "MRO-")) {
			Run C:\Users\pjerkins\Downloads\TiddlyDesktop\nw.exe --user-data-dir="C:\Users\pjerkins\AppData\Local\TiddlyDesktop\User Data" --profile-directory=Default --app-id=bpdeplafbjkfabcdjdbibppeobkefplc
		} else {
			Run C:\Users\PhilJ\Downloads\TiddlyDesktop\nw.exe --user-data-dir="C:\Users\PhilJ\AppData\Local\TiddlyDesktop\User Data" --profile-directory=Default --app-id=bpdeplafbjkfabcdjdbibppeobkefplc
		}
	}
	else
	{
		WinActivate, ahk_pid %ErrorLevel%
	}
	return
}
GoCubicExplorer() ; {{{1
{
	Process, exist, CubicExplorer.exe
	if %ErrorLevel% = 0
	{
		Run C:\Program Files\CubicExplorer_dev\CubicExplorer.exe
	}
	else
	{
		WinActivate, ahk_pid %ErrorLevel%
	}
	return
}
GoSearchInbox() ; {{{1
{
	IfWinActive, Outlook\.exe|Outlook
		Send, ^efolderpath:Inbox "%clipboard%"{Enter}
}

ToggleMute() ; {{{1
{
	; SoundSet, +1, Microphone, Mute, 3
	SoundGet original, Microphone, Mute, 3
	new := original="Off" ? 1 : 0
	new_str := new=1 ? "On" : "Off"
	SoundSet new, Microphone, Mute, 3
	TrayTip, ToggleMute, "Mute was %original%; turning %new_str%"
}

; }}}1

; Following encryption scheme IS WEAK!!!  Knowledge of how the encryption
; works IS ENOUGH to decrypt an encrypted password!
; From http://www.autohotkey.com/board/topic/23097-encryptiondecryption/
Encrypt(cleartext)
{
  
  ; Let's get Random!
  Random, ,%A_now%
  Random, pe_rand1, 2, 6
  Random, pe_rand2, 4, 7
  Random, pe_rand3, 10, 90
  
  ; Store pe_rand3 Substitute!
  stringleft, pr3_L1, pe_rand3, 1
  stringright, pr3_R1, pe_rand3, 1
  pr3_L1 +=64
  pr3_R1 +=64
  pr3_L2 := chr(pr3_L1)
  pr3_R2 := chr(pr3_R1)
  
  ; Begin final String, adding the first Random #!
  allstr := pe_rand1

  ; Get the Password and split it!
  stringsplit, sngltr, cleartext

  ; Change to numbers & Encode!
  Loop, parse, cleartext
  {
    nxtltr := sngltr%a_index%
    asc_numb := asc(nxtltr)
    chngd%a_index% := asc_numb+pe_rand1
    chngd%a_index% *= pe_rand2
    chngd%a_index% += pe_rand3
    
    tempor := chngd%a_index%
    allstr = %allstr%%tempor%
  }

  ; Add the 2nd/3rd Random #'s!'
  allstr = %allstr%%pe_rand2%%pr3_L2%
  allstr = %pr3_R2%%allstr%

  return allstr
  ; return "Hello"
}

Decrypt(cyphertext)
{
	; Get the Decryptors!
  StringLeft, pr3_R2, cyphertext, 1
  StringRight, pr3_L2, cyphertext, 1
  StringTrimLeft, tempor, cyphertext, 1
  cyphertext = %tempor%
  StringTrimRight, tempor, cyphertext, 1
  cyphertext = %tempor%
  StringLeft, pd_rand1, cyphertext, 1
  StringTrimLeft, tempor, cyphertext, 1
  cyphertext = %tempor%
  StringRight, pd_rand2, cyphertext, 1
  StringTrimRight, tempor, cyphertext, 1
  cyphertext = %tempor%
  
	; Fix Decryptor 3!
  pr3_L1 := asc(pr3_L2)
  pr3_R1 := asc(pr3_R2)
  pr3_L1 -= 64
  pr3_R1 -= 64
  pd_rand3 = %pr3_L1%%pr3_R1%
  
  numb := strlen(cyphertext)/3
  
	; Decrypt and change to Letters then to Password!
  loop, %numb%
  {
    StringLeft, tmpltr, cyphertext, 3
    StringTrimLeft, tempor, cyphertext, 3
    cyphertext = %tempor%
    tmpltr -= pd_rand3
    tmpltr /= pd_rand2
    tmpltr -= pd_rand1
    tmpwrd := chr(tmpltr)
    ps_word := % ps_word . tmpwrd
  }

	return ps_word
}

