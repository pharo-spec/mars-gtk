"
union GdkEvent

A GdkEvent contains a union of all of the event types, and allows access to the data fields in a number of ways.

https://developer.gnome.org/gdk3/stable/gdk3-Event-Structures.html#GdkEvent
"
Class {
	#name : #GdkEvent,
	#superclass : #GtkStructure,
	#instVars : [
		'wasHandled'
	],
	#pools : [
		'GdkEventType'
	],
	#category : #'Mars-Gtk-Base-Events'
}

{ #category : #private }
GdkEvent class >> eventFree: event [

	self ffiCall: #(void gdk_event_free ("GdkEvent *"void *event)) module: GdkLibrary
]

{ #category : #private }
GdkEvent class >> eventNew: type [

	^ self ffiCall: #(GdkEvent *gdk_event_new (GdkEventType type))
]

{ #category : #resources }
GdkEvent class >> ffiLibrary [

	^ GdkLibrary 
]

{ #category : #finalization }
GdkEvent class >> finalizeResourceData: aHandle [

	self eventFree: aHandle
]

{ #category : #testing }
GdkEvent class >> isType: aType [

	^ false
]

{ #category : #'instance creation' }
GdkEvent class >> newConcreteFromHandle: handle [
	| type |
	
	"type is always the first element on every type"
	type := GdkEventType fromInteger: (handle signedLongAt: 1).
	^ self allSubclasses
		detect: [ :each | each isType: type ]
		ifFound: [ :each | each fromHandle: handle ]
		ifNone: [ GdkEventAny fromHandle: handle ]
]

{ #category : #'instance creation' }
GdkEvent class >> newType: aType [

	self flag: #TODO. "fromHandle: is workaround for a temporal problem"
	^ (self fromHandle: (self eventNew: aType)) asConcreteType autoRelease
]

{ #category : #visiting }
GdkEvent >> accept: aVisitor [
	
	^ self subclassResponsibility
]

{ #category : #converting }
GdkEvent >> asConcreteType [

	^ self class newConcreteFromHandle: self getHandle
]

{ #category : #'external resource management' }
GdkEvent >> autoRelease [

	FFIExternalResourceManager addResource: self
]

{ #category : #compatibility }
GdkEvent >> button [
	"button number pressed. 
	 by default, zero"

	^ 0
]

{ #category : #accessing }
GdkEvent >> ffiLibrary [

	^ GdkLibrary
]

{ #category : #accessing }
GdkEvent >> free [

	self ffiCall: #(void gdk_event_free (self))
]

{ #category : #testing }
GdkEvent >> isAnyType [

	^ false
]

{ #category : #testing }
GdkEvent >> isDoubleClick [

	^ false
]

{ #category : #testing }
GdkEvent >> isEventButton [

	^ false
]

{ #category : #testing }
GdkEvent >> isEventConfigure [

	^ false
]

{ #category : #testing }
GdkEvent >> isEventKey [

	^ false
]

{ #category : #testing }
GdkEvent >> isEventMotion [

	^ false
]

{ #category : #'external resource management' }
GdkEvent >> resourceData [

	^ self getHandle
]

{ #category : #'accessing structure variables' }
GdkEvent >> type [

	^ self subclassResponsibility
]

{ #category : #compatibility }
GdkEvent >> wasHandled [
	"this should be in package Mars-Gtk-Morphic but I need the instance variable"

	^ wasHandled ifNil: [ wasHandled := false ]
]

{ #category : #compatibility }
GdkEvent >> wasHandled: aBoolean [

	^ wasHandled := aBoolean
]

{ #category : #'accessing structure variables' }
GdkEvent >> window [

	self subclassResponsibility
]
