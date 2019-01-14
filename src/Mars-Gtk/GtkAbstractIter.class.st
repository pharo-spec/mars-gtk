Class {
	#name : #GtkAbstractIter,
	#superclass : #FFIExternalStructure,
	#traits : 'TGtkLibrary',
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

{ #category : #private }
GtkAbstractIter >> getStringAtColumnIndex: index into: aValue [

	 self subclassResponsibility
]

{ #category : #accessing }
GtkAbstractIter >> setValues: aValueArray [

	self subclassResponsibility
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

	result := ExternalAddress new.
	self getStringAtColumnIndex: index into: result.
	^ result readStringUTF8
]
