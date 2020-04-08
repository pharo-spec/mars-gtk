"
I'm a bridge between a window and a GtkFormView to render a Form.

"
Class {
	#name : #OSGtkFormRenderer,
	#superclass : #OSWindowFormRenderer,
	#instVars : [
		'formView'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #accessing }
OSGtkFormRenderer >> backendWindow: aWindowHandle [

	super backendWindow: aWindowHandle.
	self ensureEventHandler.
	self ensureFormView
]

{ #category : #'updating screen' }
OSGtkFormRenderer >> deferUpdatesWhile: aBlock [

	GtkRunLoop defer: aBlock
]

{ #category : #private }
OSGtkFormRenderer >> ensureEventHandler [
	"ensure we use the correct event handler"
		
	formView eventHandler: (GtkMorphicEventHandler new 
		morphicWorld: backendWindow osWindow eventHandler morphicWorld;
		yourself).

]

{ #category : #private }
OSGtkFormRenderer >> ensureFormView [
	"ensure window contains a world morph view"
	
	backendWindow gtkWindow
		removeAll;
		add: formView.
		
	formView show
]

{ #category : #accessing }
OSGtkFormRenderer >> form: aForm [

	super form: aForm.
"	buffer := Form extent: aForm extent depth: aForm depth.
"	formView form: aForm
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

	| intersection windowExtent |

	allDamage ifEmpty: [ ^ self ].
	windowExtent := backendWindow extent.

	allDamage
		do: [ :rectangle | 
			intersection := rectangle
				intersect: (0 @ 0 corner: windowExtent)
				ifNone: [ nil ].
			intersection ifNotNil: [ formView invalidateRect: rectangle ] ]
]

{ #category : #'updating screen' }
OSGtkFormRenderer >> updateRectangle: aRect [

	formView invalidateRect: aRect
]
