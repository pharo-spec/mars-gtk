as yet unclassified
installShortcutOn: gtkWindow
	"Transmiting to submenu. 
	 This is horrible and anti-demeters law... but it works for now"
	self view submenu platformView installShortcutOn: gtkWindow 