Class {
	#name : #OSGtkFormRenderer,
	#superclass : #OSWindowFormRenderer,
	#instVars : [
		'formView'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #private }
OSGtkFormRenderer >> ensureEventHandler [
	"ensure we use the correct event handler"
		
	formView eventHandler: (GtkMorphicEventHandler new 
		morphicWorld: self window osWindow eventHandler morphicWorld;
		yourself).

]

{ #category : #private }
OSGtkFormRenderer >> ensureFormView [
	"ensure window contains a world morph view"
	
	self window gtkWindow
		removeAll;
		add: formView.
		
	formView show
]

{ #category : #accessing }
OSGtkFormRenderer >> form: aForm [

	super form: aForm.
	formView form: aForm
]

{ #category : #initialization }
OSGtkFormRenderer >> initialize [

	super initialize.
	formView := GtkFormView new
]

{ #category : #'updating screen' }
OSGtkFormRenderer >> updateAll [
	
	formView invalidate
]

{ #category : #'updating screen' }
OSGtkFormRenderer >> updateRectangle: aRect [

	formView invalidateRect: aRect
]

{ #category : #accessing }
OSGtkFormRenderer >> window: aWindowHandle [

	super window: aWindowHandle.
	self ensureEventHandler.
	self ensureFormView
]
