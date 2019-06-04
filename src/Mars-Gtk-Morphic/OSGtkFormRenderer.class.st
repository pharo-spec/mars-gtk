Class {
	#name : #OSGtkFormRenderer,
	#superclass : #OSWindowFormRenderer,
	#instVars : [
		'gtkFormView'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #accessing }
OSGtkFormRenderer >> form: aForm [

	super form: aForm.
	gtkFormView form: aForm
]

{ #category : #initialization }
OSGtkFormRenderer >> initialize [

	super initialize.
	gtkFormView := GtkFormView new
]

{ #category : #'updating screen' }
OSGtkFormRenderer >> updateAll [
	
	gtkFormView invalidate
]

{ #category : #'updating screen' }
OSGtkFormRenderer >> updateRectangle: aRect [

	gtkFormView invalidateRect: aRect
]

{ #category : #accessing }
OSGtkFormRenderer >> window: aWindowHandle [

	super window: aWindowHandle.
	"ensure we use the correct event handler"
	gtkFormView eventHandler: aWindowHandle osWindow eventHandler.
	"ensure window contains a world morph view"
	aWindowHandle gtkWindow
		removeAll;
		add: (GtkBox newVertical 
			packStart: gtkFormView;
			yourself)
]
