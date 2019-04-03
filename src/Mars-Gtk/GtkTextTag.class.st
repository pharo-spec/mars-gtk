Class {
	#name : #GtkTextTag,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'instance creation' }
GtkTextTag class >> newName: aString [

	^ (self textTagNew: aString) initialize 
]

{ #category : #private }
GtkTextTag class >> textTagNew: aName [

	^ self ffiCall: #(GtkTextTag *gtk_text_tag_new (const gchar *aName))
]

{ #category : #accessing }
GtkTextTag >> foreground: aColor [

	self gObjectSet: 'foreground' toString: aColor asHTMLColor
]
