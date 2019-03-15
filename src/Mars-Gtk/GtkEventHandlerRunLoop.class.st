Class {
	#name : #GtkEventHandlerRunLoop,
	#superclass : #GtkRunLoop,
	#instVars : [
		'runLoop'
	],
	#category : 'Mars-Gtk-Base'
}

{ #category : #'private handler' }
GtkEventHandlerRunLoop >> getEventsHandler [
	^ self ffiCall: #(void *getEventsHandler(void)) module: 'EventsHandlerPlugin'
]

{ #category : #'private installing' }
GtkEventHandlerRunLoop >> installRunLoop [
	runLoop := GCallback 
		signature: #(void (void)) 
		block: [self processEvents].
	self setEventsHandler: runLoop
]

{ #category : #'private handler' }
GtkEventHandlerRunLoop >> setDefaultEventsHandler [
	^ self ffiCall: #(void *setDefaultEventsHandler(void)) module: 'EventsHandlerPlugin'
]

{ #category : #'private handler' }
GtkEventHandlerRunLoop >> setEventsHandler: aHandler [
	^ self ffiCall: #(void setEventsHandler(#GCallback aHandler)) module: 'EventsHandlerPlugin'
]

{ #category : #'private installing' }
GtkEventHandlerRunLoop >> uninstallRunLoop [
	self setDefaultEventsHandler.
	runLoop := nil.

]
