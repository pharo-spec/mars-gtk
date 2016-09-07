system startup
shutDown: quitting
	"ensure Gtk is stop when shutting down"
	quitting ifFalse: [ ^ self ].
	Current ifNil: [ ^ self ].
	Current stop.