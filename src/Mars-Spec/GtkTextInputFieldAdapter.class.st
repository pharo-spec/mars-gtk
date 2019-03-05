Class {
	#name : #GtkTextInputFieldAdapter,
	#superclass : #GtkAbstractTextAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #visiting }
GtkTextInputFieldAdapter >> accept [ 
	
	self widgetDo: [ :w | 
		self model text: w text ]
]

{ #category : #building }
GtkTextInputFieldAdapter >> addModelTo: gtkEntry [
	
	super addModelTo: gtkEntry.

	self model placeholder ifNotNil: [ :text | gtkEntry placeHolderText: text asString ].
	self model whenPlaceholderChangedDo: [ :text | gtkEntry placeHolderText: text asString ].
	
	gtkEntry maxLength: self model maxLength.
	self model whenMaxLengthChangedDo: [ gtkEntry maxLength: self model maxLength ].
	
	self model isInvisible ifTrue: [ 
		gtkEntry bePassword.
		gtkEntry visibility: false. ].
	
	self model whenVisibilityChangedDo: [ :aValue | aValue 
		ifTrue: [ gtkEntry beForAnyCharacter ]
		ifFalse: [ gtkEntry bePassword ].
		gtkEntry visibility: aValue ].
	

	gtkEntry connectTextChanged: [ :text | 
		self halt.
		self model text: text ]
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
