"
I'm a system for reporting errors.

https://developer.gnome.org/glib/stable/glib-Error-Reporting.html
"
Class {
	#name : #GError,
	#superclass : #FFIExternalStructure,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#pools : [
		'GtkTypes'
	],
	#category : 'Mars-Gtk-Misc'
}

{ #category : #'field definition' }
GError class >> fieldsDesc [
	"self rebuildFieldAccessors" 
	^ #(
	GQuark       domain;
  	gint         code;
  	gchar       *message
	)
]

{ #category : #'accessing structure variables' }
GError >> code [
	"This method was automatically generated"
	^handle signedLongAt: 5
]

{ #category : #'accessing structure variables' }
GError >> code: anObject [
	"This method was automatically generated"
	handle signedLongAt: 5 put: anObject
]

{ #category : #'accessing structure variables' }
GError >> domain [
	"This method was automatically generated"
	^handle unsignedLongAt: 1
]

{ #category : #'accessing structure variables' }
GError >> domain: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: 1 put: anObject
]

{ #category : #accessing }
GError >> domainString [
	^ self gquarkToString: self domain
]

{ #category : #private }
GError >> gquarkToString: quark [
	^ self ffiCall: #(const gchar *g_quark_to_string (GQuark quark))
]

{ #category : #testing }
GError >> isError [
	^ self isOk not
]

{ #category : #testing }
GError >> isOk [
	^ self code = 0
]

{ #category : #'accessing structure variables' }
GError >> message [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: 9) type: ExternalType char asPointerType
]

{ #category : #'accessing structure variables' }
GError >> message: anObject [
	"This method was automatically generated"
	handle pointerAt: 9 put: anObject getHandle.
]

{ #category : #accessing }
GError >> messageString [
	self message isNull ifTrue: [ ^ 'Unknown error.' ].
	^ self message readString
]
