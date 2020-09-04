Class {
	#name : #GtkMorphicUIManager,
	#superclass : #MorphicUIManager,
	#category : #'Mars-Gtk-Morphic-UIManager'
}

{ #category : #activation }
GtkMorphicUIManager class >> activate [

	self default: self new
]

{ #category : #accessing }
GtkMorphicUIManager class >> isActiveManager [

	^ true
]

{ #category : #testing }
GtkMorphicUIManager class >> isValidForCurrentSystemConfiguration [
	
	^ Smalltalk isHeadless 
		and: [ Smalltalk isInteractiveGraphic
		and: [ OSWindowDriver driverClass = OSGtkDriver ] ]
]

{ #category : #accessing }
GtkMorphicUIManager >> debugSessionClass [

	^ GtkDebugSession
]

{ #category : #debug }
GtkMorphicUIManager >> handleCallbackExceptionsWith: exceptionHandler during: aBlock [
	"Let it pass, the UI manager will take care about"

	aBlock value
]

{ #category : #'handle debug requests' }
GtkMorphicUIManager >> handleDebugRequest: aDebugRequest [
	<debuggerCompleteToSender>
	
	GtkOupsDebuggerSystem new openDebuggerOnRequest: aDebugRequest
]

{ #category : #'handle debug requests' }
GtkMorphicUIManager >> handleWarningDebugRequest: aWarningDebugRequest [
	<debuggerCompleteToSender>
	
	GtkOupsDebuggerSystem new openDebuggerOnRequest: aWarningDebugRequest
]
