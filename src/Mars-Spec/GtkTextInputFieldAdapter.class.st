Class {
	#name : #GtkTextInputFieldAdapter,
	#superclass : #GtkAbstractTextAdapter,
	#pools : [
		'GdkKeyCodes'
	],
	#category : #'Mars-Spec-Adapter'
}

{ #category : #visiting }
GtkTextInputFieldAdapter >> accept [ 
	
	self widgetDo: [ :w | 
		self presenter text: w text ].
	self presenter actionPerformed
]

{ #category : #building }
GtkTextInputFieldAdapter >> addModelTo: gtkEntry [
	
	super addModelTo: gtkEntry.

	self presenter placeholder ifNotNil: [ :text | 
		gtkEntry placeHolderText: (text localizedForPresenter: self presenter) asString ].
	self presenter whenPlaceholderChangedDo: [ :text | 
		gtkEntry placeHolderText: (text localizedForPresenter: self presenter) asString ].
	
	gtkEntry maxLength: self model maxLength.
	self model whenMaxLengthChangedDo: [ gtkEntry maxLength: self presenter maxLength ].
	
	self presenter isPassword ifTrue: [ 
		gtkEntry bePassword.
		gtkEntry visibility: false. ].
	
	self presenter whenPasswordChangedDo: [ :isPassword | 
		isPassword
			ifFalse: [ gtkEntry beForAnyCharacter ]
			ifTrue: [ gtkEntry bePassword ].
		gtkEntry visibility: isPassword not ].
	
	self presenter autoAccept ifTrue: [ 
		gtkEntry connectChanged: [ 
			self model text: gtkEntry text ] ].
	
	self presenter acceptOnCR ifTrue: [ 
		self ensureWidgetListenToKeyEvent: gtkEntry ].
	self presenter whenAcceptOnCRChangedDo: [ :bool |
		bool ifTrue: [ 
			self ensureWidgetListenToKeyEvent: gtkEntry ] ]
]

{ #category : #private }
GtkTextInputFieldAdapter >> ensureWidgetListenToKeyEvent: aWidget [
	
	aWidget 
		detectCallbackBySignal: GKeyPressEventCallback signalName
		ifFound:  [ :aCallback | ^ self ]
		ifNone: [  ].
	
	aWidget connectKeyPressEvent: [ :event | 
		self handleKeyEvent: event ]
]

{ #category : #private }
GtkTextInputFieldAdapter >> getPlaceholderText [

	^ self presenter placeholder ifNotNil: [ :aString | aString localizedForPresenter: self presenter ]
]

{ #category : #private }
GtkTextInputFieldAdapter >> handleKeyEvent: event [

	self presenter acceptOnCR ifTrue: [ 
		event keyValue = KEY_Return ifTrue: [ 
			self accept.
			^ true ] ].

	^ super handleKeyEvent: event
]

{ #category : #testing }
GtkTextInputFieldAdapter >> isPassword [
	
	^ widget isPassword 
]

{ #category : #accessing }
GtkTextInputFieldAdapter >> placeHolderText [
	
	^ widget placeHolderText 
]

{ #category : #visiting }
GtkTextInputFieldAdapter >> text: aString [ 
	
	super text: aString.
	"Changing the text programatically does not throw an event"
	self model text: aString.
]

{ #category : #private }
GtkTextInputFieldAdapter >> widgetClass [

	^ GtkEntry
]

{ #category : #building }
GtkTextInputFieldAdapter >> wrapWidget: gtkWidget [

	^ gtkWidget
]
