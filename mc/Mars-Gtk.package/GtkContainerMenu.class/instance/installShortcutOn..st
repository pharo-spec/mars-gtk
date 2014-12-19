accessing
installShortcutOn: gtkWindow 
	self view items do: [ :each | 
		each platformView installShortcutOn: gtkWindow ]