private
ensureBox: aContainer inWindow: aWindow
	"ensure a container is a box (when adding toolbars and menus, a vertical box needs to be added). 
	 but of course, this needs to be added just once, so, at start, container == window (he is its 
	 own container), after adding a menu, container will be a box, then if we add a toolbar we don't 
	 need to add another box."
	^ aContainer == aWindow 
		ifTrue: [ window add: GtkBox newHorizontal ]
		ifFalse: [ aContainer ]