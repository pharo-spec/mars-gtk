Class {
	#name : #GtkRichTextAdapter,
	#superclass : #GtkTextAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkRichTextAdapter >> addTextTo: gtkTextView [
	| tagTable styles |
	tagTable := GtkTextTagTable new.
	styles := self model styleAttributes. 
	styles keysAndValuesDo: [ :name :attributes | | tag |
		tag := GtkTextTag newName: name.
		attributes do: [:attribute | attribute acceptTag: tag ].
		tagTable add: tag].
	gtkTextView textBuffer: (self bufferClass newTable: tagTable).
	gtkTextView textBuffer connectChanged: [ 
			self applyStyleTo: gtkTextView  ] .
	super addTextTo: gtkTextView 
]

{ #category : #building }
GtkRichTextAdapter >> applyStyleTo: gtkTextView [
	| tags |
	tags := GtkTextStyleTagsVisitor new 
		styleProvider: self model styleAttributes;
		styleDocument: self model renderTree. 
	tags do: [ :each | each acceptTextBuffer: gtkTextView textBuffer ]
]

{ #category : #building }
GtkRichTextAdapter >> setText: text to: gtkWidget [
	super 
		setText: (self model contentProvider plaintextFor: text) 
		to: gtkWidget 
]

{ #category : #building }
GtkRichTextAdapter >> widgetClass [

	^ GtkRichTextView
]
