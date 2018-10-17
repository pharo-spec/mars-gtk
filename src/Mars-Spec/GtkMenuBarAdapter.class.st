Class {
	#name : #GtkMenuBarAdapter,
	#superclass : #GtkMenuBaseAdapter,
	#category : #'Mars-Spec'
}

{ #category : #building }
GtkMenuBarAdapter >> buildWidget [ 
	| menuBar fileMenu fileMenuItem quitMenuItem |

	menuBar := GtkMenuBar new.
	fileMenu := GtkMenu new.
	fileMenuItem := GtkMenuItem newLabel: 'File'.

	fileMenuItem submenu: fileMenu.
	quitMenuItem := GtkMenuItem newLabel: 'Quit'.
	quitMenuItem connectActivate: [ self inform: 'No way!' ].
	fileMenu add: quitMenuItem.

	menuBar add: fileMenuItem.
	
	^ menuBar
]

{ #category : #accessing }
GtkMenuBarAdapter >> gtkClass [
	
	^ GtkMenuBar
]
