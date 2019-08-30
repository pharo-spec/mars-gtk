"
GtkAccelLabel — A label which displays an accelerator key on the right of the text

https://developer.gnome.org/gtk3/stable/GtkAccelLabel.html
"
Class {
	#name : #GtkAccelLabel,
	#superclass : #GtkLabel,
	#classVars : [
		'SymbolTable'
	],
	#category : #'Mars-Gtk-Widget-Display'
}

{ #category : #private }
GtkAccelLabel class >> accelLabelNew: string [

	^ self ffiCall: #(GtkAccelLabel* gtk_accel_label_new (String string))
]

{ #category : #private }
GtkAccelLabel class >> createSymbolTable [

	^ Dictionary newFromPairs: { 
		#Cmd. 		(Character value: 16r2318) asString.
		#Meta. 	(Character value: 16r2318) asString.
		#Alt. 		(Character value: 16r2325) asString. 
		#Ctrl.  	(Character value: 16r2303) asString. 
		#Shift. 	(Character value: 16r21E7) asString.
		#Enter. 	(Character value: 16r23ce) asString }
]

{ #category : #accessing }
GtkAccelLabel class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gtk_accel_label_init(void *object))
]

{ #category : #accessing }
GtkAccelLabel class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_accel_label_get_type())
]

{ #category : #'instance creation' }
GtkAccelLabel class >> new [

	self error: 'Use #newLabel:'
]

{ #category : #'instance creation' }
GtkAccelLabel class >> newAccelerator: aShortcut [

	^ (self newLabel: (self shortcutToString: aShortcut))
		accelerator: aShortcut;
		yourself
]

{ #category : #'instance creation' }
GtkAccelLabel class >> newLabel: aString [

	^ (self accelLabelNew: aString) initialize
]

{ #category : #private }
GtkAccelLabel class >> shortcutToString: aShortcut [
	| keyParts |
	
	"if this is not mac, we need just to print its string"
	OSPlatform current isMacOS 
		ifFalse: [ ^ aShortcut asString ].
	
	keyParts := (aShortcut asString substrings: '+') collect: #trimBoth.
	"Ensure shift is first"
	((keyParts includes: 'Shift') and: [ 
		(keyParts first = 'Shift') not ])
		ifTrue: [ keyParts := (keyParts copyWithout: 'Shift') copyWithFirst: 'Shift' ].
		
	^ keyParts 
		inject: '' 
		into: [ :s :each | s, (self symbolTableAt: each ifAbsent: [ each capitalized ]) ]
]

{ #category : #private }
GtkAccelLabel class >> symbolTable [

	^ SymbolTable ifNil: [ SymbolTable := self createSymbolTable ]
]

{ #category : #private }
GtkAccelLabel class >> symbolTableAt: anObject ifAbsent: aBlock [

	^ self symbolTable 
		at: anObject 
		ifAbsent: aBlock
]

{ #category : #private }
GtkAccelLabel >> accelLabelSetAccelKey: accelerator_key modifiers: accelerator_mods [
	
	self ffiCall: #(void gtk_accel_label_set_accel (
		self,
		guint accelerator_key,
		GdkModifierType accelerator_mods))
]

{ #category : #accessing }
GtkAccelLabel >> accelerator: aShortcut [
	| charValue modifiers |

	charValue := aShortcut character key asciiValue.
	modifiers := aShortcut modifier asGdkModifierType.
	
	self 
		accelLabelSetAccelKey: charValue 
		modifiers: modifiers
]

{ #category : #accessing }
GtkAccelLabel >> widget: accel_widget [

	self ffiCall: #(void gtk_accel_label_set_accel_widget (self, GtkWidget *accel_widget))
]
