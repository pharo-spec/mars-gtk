Class {
	#name : #GtkRichTextAdapter,
	#superclass : #GtkTextAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkRichTextAdapter >> setText: text to: gtkTextView [
	| table gtkTag |
	text isString ifTrue: [ ^ self ].
	table := GtkTextTagTable new.
	text runs values do: [ :v | | k |
		k := v identityHash asString.
		gtkTag := GtkTextTag newName: k.
		v collect: [ :each | each acceptTag: gtkTag ].
		table add: gtkTag ].
	gtkTextView textBuffer: (self bufferClass newTable: table).
	gtkTextView textBuffer connectChanged: [
		self presenter text runs withStartStopAndValueDo: [ :start :stop :val |
			(GtkTextStyleTag newName: val identityHash asString from: start to: stop) 
				acceptTextBuffer: gtkTextView textBuffer ] ].
	
	super setText: text to: gtkTextView 
]

{ #category : #building }
GtkRichTextAdapter >> widgetClass [

	^ GtkRichTextView
]
