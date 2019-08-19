"
I'm a visitor to apply platform dependent configuration to the OSGtkDriver that will 
become the active world.
This is needed because some Gtk settings (like theme) need to be applied before the 
first window is created (otherwise it will create a default window theme).
"
Class {
	#name : #OSGtkDriverConfiguration,
	#superclass : #OSPlatformVisitor,
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #actions }
OSGtkDriverConfiguration >> apply [ 

	self visit
]

{ #category : #visiting }
OSGtkDriverConfiguration >> visitMacOS: aPlatform [

	GtkSettings default themeName: 'Sierra-light'
]

{ #category : #visiting }
OSGtkDriverConfiguration >> visitWindows: aPlatform [

	GtkSettings default themeName: 'Windows-10-master'
]
