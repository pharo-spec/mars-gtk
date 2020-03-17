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

	self model placeholder ifNotNil: [ :text | gtkEntry placeHolderText: (text valueForPresenter: self presenter) asString ].
	self model whenPlaceholderChangedDo: [ :text | gtkEntry placeHolderText: (text valueForPresenter: self presenter) asString ].
	
	gtkEntry maxLength: self model maxLength.
	self model whenMaxLengthChangedDo: [ gtkEntry maxLength: self model maxLength ].
	
	self model isPassword ifTrue: [ 
		gtkEntry bePassword.
		gtkEntry visibility: false. ].
	
	self model whenPasswordChangedDo: [ :isPassword | 
		isPassword
			ifFalse: [ gtkEntry beForAnyCharacter ]
			ifTrue: [ gtkEntry bePassword ].
		gtkEntry visibility: isPassword not ].
	
	self model autoAccept ifTrue: [ 
		gtkEntry connectChanged: [ 
			self model text: gtkEntry text ] ]
]

{ #category : #private }
GtkTextInputFieldAdapter >> getPlaceholderText [

	^ self presenter placeholder ifNotNil: [ :aString | aString valueForPresenter: self presenter ]
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
