#SingleInstance Force
#IfWinActive �Torrent
; Use Ctrl+R to add a show to �Torrent via http://EZRSS.it
^r::
uTorrentRSS:
	InputBox show, New Show, Enter the name of the show:
	IfWinNotExist �Torrent
	{	MsgBox Couldn't find �Torrent!
		Return
	}
	WinActivate
	SendInput !f{Down 3}{Enter}

	StringReplace show2, show, %A_Space%, +, All
	SendInput,
	(ltrim join comments
		{Raw}
		http://ezrss.it/search/index.php?show_name_exact=true&mode=rss&show_name=%show2%`t
		` `t
		%show%`t
		a`t
		` `r
	)
Return

		
#IfWinActive ahk_class Notepad
	^s::
		Send ^s
		Sleep 100
		Reload
	Return
#IfWinActive
