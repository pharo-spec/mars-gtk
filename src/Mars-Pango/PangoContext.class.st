"
The PangoContext structure stores global information used to control the itemization process.

https://developer.gnome.org/pango/unstable/pango-Text-Processing.html#PangoContext
"
Class {
	#name : #PangoContext,
	#superclass : #PangoObject,
	#category : #'Mars-Pango-Base'
}

{ #category : #finalization }
PangoContext class >> finalizeResourceData: handle [
	handle isNull ifTrue: [ ^ self ].
	^ self g_object_unref: handle
]

{ #category : #private }
PangoContext class >> g_object_unref: handle [
	^ self ffiCall: #( void g_object_unref (void *handle)) module: PangoLibrary
]

{ #category : #initialization }
PangoContext >> initialize [
	self autoRelease
]
