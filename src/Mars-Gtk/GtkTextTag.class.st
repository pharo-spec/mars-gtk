"
GtkTextTag — A tag that can be applied to text in a GtkTextBuffer

https://developer.gnome.org/gtk3/stable/GtkTextTag.html
"
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

{ #category : #converting }
GtkTextTag >> asTextAttributeList [
	| list |

	self flag: #TODO. "Other properties"
	list := #().
	self isForegroundSet ifTrue: [ 
		"for some reason, 'foreground' property is NULL while 'foreground-rgba' is not"
		list := list copyWith: (TextColor color: self foregroundRGBA asColor)  ].
	
	^ list
	
]

{ #category : #accessing }
GtkTextTag >> foreground [

	^ Color fromHexString: (self gObjectGetString: 'foreground')
]

{ #category : #accessing }
GtkTextTag >> foreground: aColor [

	self gObjectSet: 'foreground' toString: '#', aColor asHexString
]

{ #category : #accessing }
GtkTextTag >> foregroundRGBA [

	^ self gObjectGetHandle: 'foreground-rgba' as: GdkRGBA
]

{ #category : #testing }
GtkTextTag >> isForegroundSet [

	^ self gObjectGetBoolean: 'foreground-set'
]
