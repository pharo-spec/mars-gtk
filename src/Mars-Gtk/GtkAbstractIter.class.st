Class {
	#name : #GtkAbstractIter,
	#superclass : #GtkStructure,
	#classTraits : 'TGtkLibrary classTrait',
	#instVars : [
		'store'
	],
	#classVars : [
		'OFFSET_STAMP',
		'OFFSET_USER_DATA',
		'OFFSET_USER_DATA2',
		'OFFSET_USER_DATA3'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #'field definition' }
GtkAbstractIter class >> fieldsDesc [
	"self compileFields"
	^ #(
		gint stamp;
		gpointer user_data;
		gpointer user_data2;
		gpointer user_data3;)
]

{ #category : #'instance creation' }
GtkAbstractIter class >> on: aStore [

	^ self new store: aStore
]

{ #category : #accessing }
GtkAbstractIter >> appendNew [
	
	^ self subclassResponsibility
]

{ #category : #accessing }
GtkAbstractIter >> at: index put: aValue [

	self 
		atColumnIndex: index 
		setValue: aValue
]

{ #category : #accessing }
GtkAbstractIter >> at: index putObject: aGBaseObject [

	self 
		atColumnIndex: index 
		setValue: aGBaseObject getHandle
]

{ #category : #accessing }
GtkAbstractIter >> at: index putString: aValue [

	self 
		atColumnIndex: index 
		setString: aValue
]

{ #category : #private }
GtkAbstractIter >> atColumnIndex: index setString: aValue [

	 self subclassResponsibility
]

{ #category : #private }
GtkAbstractIter >> atColumnIndex: index setValue: aValue [

	 self subclassResponsibility
]

{ #category : #copying }
GtkAbstractIter >> copyInMemory [
	
	^ super copyInMemory
		store: self store;
		yourself
]

{ #category : #accessing }
GtkAbstractIter >> gdkPixbufAt: index [ 

	| result |

	result := ByteArray new: Smalltalk wordSize.
	result pointerAt: 1 put: ExternalAddress null. 
	self getStringAtColumnIndex: index into: result.
	^ (GdkPixbuf fromHandle: (result pointerAt: 1)) initialize

]

{ #category : #private }
GtkAbstractIter >> getStringAtColumnIndex: index into: aValue [

	 self subclassResponsibility
]

{ #category : #accessing }
GtkAbstractIter >> gtkImageAt: anInteger [ 
	self shouldBeImplemented.
]

{ #category : #accessing }
GtkAbstractIter >> setValues: aValueArray [

	self subclassResponsibility
]

{ #category : #'accessing structure variables' }
GtkAbstractIter >> stamp [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_STAMP
]

{ #category : #'accessing structure variables' }
GtkAbstractIter >> stamp: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_STAMP put: anObject
]

{ #category : #accessing }
GtkAbstractIter >> store [
	^ store
]

{ #category : #accessing }
GtkAbstractIter >> store: anObject [
	store := anObject
]

{ #category : #accessing }
GtkAbstractIter >> stringAt: index [
	| result |

	result := ByteArray new: Smalltalk wordSize.
	result pointerAt: 1 put: ExternalAddress null. 
	self getStringAtColumnIndex: index into: result.
	^ (result pointerAt:1) readStringUTF8

]

{ #category : #'accessing structure variables' }
GtkAbstractIter >> user_data [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_USER_DATA) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtkAbstractIter >> user_data2 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_USER_DATA2) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtkAbstractIter >> user_data2: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_USER_DATA2 put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtkAbstractIter >> user_data3 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_USER_DATA3) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtkAbstractIter >> user_data3: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_USER_DATA3 put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtkAbstractIter >> user_data: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_USER_DATA put: anObject getHandle.
]
