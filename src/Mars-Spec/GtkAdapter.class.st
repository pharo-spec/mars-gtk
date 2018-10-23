Class {
	#name : #GtkAdapter,
	#superclass : #AbstractAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #'as yet unclassified' }
GtkAdapter >> gtInspectorPreviewIn: aGLMCompositePresentation [
	"Do nothing at the moment"
]

{ #category : #protocol }
GtkAdapter >> layout: aSpecLayoutFrame [ 
	
	self flag: #TODO.
]

{ #category : #protocol }
GtkAdapter >> takeKeyboardFocus [
	
	self widgetDo: [ :w | w grabFocus ]
]
