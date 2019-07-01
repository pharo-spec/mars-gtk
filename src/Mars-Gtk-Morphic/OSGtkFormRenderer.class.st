"
I'm a bridge between a window and a GtkFormView to render a Form.

"
Class {
	#name : #OSGtkFormRenderer,
	#superclass : #OSWindowFormRenderer,
	#instVars : [
		'formView',
		'buffer'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #'updating screen' }
OSGtkFormRenderer >> deferUpdatesWhile: aBlock [
	
	aBlock value
]

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
	buffer := Form extent: aForm extent depth: aForm depth.
	formView form: buffer
]

{ #category : #initialization }
OSGtkFormRenderer >> initialize [

	super initialize.
	formView := GtkFormView new
]

{ #category : #'updating screen' }
OSGtkFormRenderer >> updateAll [
	
	self updateRectangle: form boundingBox
]

{ #category : #'updating screen' }
OSGtkFormRenderer >> updateAreas: allDamage immediate: forceToScreen [

	| updateUnion |

	allDamage ifEmpty: [ ^ self ].

	updateUnion := 	allDamage inject: allDamage first into: [ :a :b | a merge: b ].
	buffer copy: updateUnion from: updateUnion origin in: form rule: Form over.	

	formView invalidateRect: updateUnion.	

]

{ #category : #'updating screen' }
OSGtkFormRenderer >> updateRectangle: aRect [

	buffer 
		copy: aRect
		from: aRect origin 
		in: form 
		rule: Form over.

	formView invalidateRect: aRect
]

{ #category : #accessing }
OSGtkFormRenderer >> window: aWindowHandle [

	super window: aWindowHandle.
	self ensureEventHandler.
	self ensureFormView
]
