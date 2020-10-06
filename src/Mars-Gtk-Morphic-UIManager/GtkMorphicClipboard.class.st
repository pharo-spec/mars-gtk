Class {
	#name : #GtkMorphicClipboard,
	#superclass : #Clipboard,
	#category : #'Mars-Gtk-Morphic-UIManager'
}

{ #category : #private }
GtkMorphicClipboard >> beDefault [

	Default := self
]

{ #category : #accessing }
GtkMorphicClipboard >> clipboardText [

	^ GtkClipboard forSelection waitForText
]

{ #category : #accessing }
GtkMorphicClipboard >> clipboardText: aString [

	GtkClipboard forSelection text: aString
]
