"
GtkTextTag — A tag that can be applied to text in a GtkTextBuffer

https://developer.gnome.org/gtk3/stable/GtkTextTag.html
"
Class {
	#name : #GtkTextTag,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Misc'
}

{ #category : #accessing }
GtkTextTag class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_text_tag_get_type())
]

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
GtkTextTag >> beBold [

	self gObjectSet: 'weight' toInteger: 800
]

{ #category : #accessing }
GtkTextTag >> beItalic [

	self gObjectSet: 'style' toInteger: 2
]

{ #category : #accessing }
GtkTextTag >> beStrikeThrough [

	self gObjectSet: 'strikethrough' toBoolean: true
]

{ #category : #accessing }
GtkTextTag >> beUnderlined [

	"does not seem to have any effect"
	self flag: #TODO.
	
	self gObjectSet: 'underline-set' toBoolean: true
]

{ #category : #accessing }
GtkTextTag >> fontFamily: family size: size weight: weight [ 
	"is disabled for now as it crashes the vm"
	
	"self gObjectSet: 'family' toString: family.
	self gObjectSet: 'size-set' toBoolean: true.
	self gObjectSet: 'size-points' toInteger: size.
	self gObjectSet: 'weight' toInteger: weight"
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

{ #category : #accessing }
GtkTextTag >> indent: anInteger [ 

	"indent space is hard coded to 50 pixels. Should be calculated"
	self flag: #TODO.
	self gObjectSet: 'indent' toInteger: anInteger * 50
]

{ #category : #testing }
GtkTextTag >> isForegroundSet [

	^ self gObjectGetBoolean: 'foreground-set'
]
