"
I signal a callback has been disconnected from its owner widget
"
Class {
	#name : #GtkDisconnectCallbackSignal,
	#superclass : #GtkSignal,
	#instVars : [
		'callback',
		'number'
	],
	#category : #'Mars-Gtk-Signal'
}

{ #category : #'instance creation' }
GtkDisconnectCallbackSignal class >> emitCallback: aCallback number: aNumber [ 

	^ (self 
		newCallback: aCallback 
		number: aNumber)
		emit
]

{ #category : #'instance creation' }
GtkDisconnectCallbackSignal class >> newCallback: aCallback number: aNumber [ 

	^ self new 
		callback: aCallback;
		number: aNumber;
		yourself
]

{ #category : #accessing }
GtkDisconnectCallbackSignal >> callback [
	^ callback
]

{ #category : #accessing }
GtkDisconnectCallbackSignal >> callback: anObject [
	callback := anObject
]

{ #category : #accessing }
GtkDisconnectCallbackSignal >> number [
	^ number
]

{ #category : #accessing }
GtkDisconnectCallbackSignal >> number: anObject [
	number := anObject
]

{ #category : #printing }
GtkDisconnectCallbackSignal >> printOneLineContentsOn: stream [
	
	stream
		<< self callback signalName
		<< ' (' << self number asString << ')'
]
