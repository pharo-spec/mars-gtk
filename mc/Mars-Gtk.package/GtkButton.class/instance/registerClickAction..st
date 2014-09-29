event handling
registerClickAction: anAnnoncementClass
	"Registers a click action"
	self 
		registerEvent: 'clicked' 
		do: [ self view announce: (anAnnoncementClass sender: self view) ]