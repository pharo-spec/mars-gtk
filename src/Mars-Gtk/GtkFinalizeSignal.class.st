"
I'm a signal to register when a finalise data is happening.
"
Class {
	#name : #GtkFinalizeSignal,
	#superclass : #GtkSignal,
	#instVars : [
		'target',
		'handle'
	],
	#category : #'Mars-Gtk-Signal'
}

{ #category : #'instance creation' }
GtkFinalizeSignal class >> emitTarget: aTarget handle: aHandle [
	^ (self newTarget: aTarget handle: aHandle) emit
]

{ #category : #'instance creation' }
GtkFinalizeSignal class >> newTarget: aTarget [
	^ self newTarget: aTarget handle: nil
]

{ #category : #'instance creation' }
GtkFinalizeSignal class >> newTarget: aTarget handle: aHandle [
	^ self new 
		target: aTarget;
		handle: aHandle
]

{ #category : #accessing }
GtkFinalizeSignal >> handle [
	^ handle
]

{ #category : #accessing }
GtkFinalizeSignal >> handle: anObject [
	handle := anObject
]

{ #category : #printing }
GtkFinalizeSignal >> printOneLineContentsOn: stream [
	
	stream
		<< self target name  
		<< ' ' << self handle printString
]

{ #category : #accessing }
GtkFinalizeSignal >> target [
	^ target
]

{ #category : #accessing }
GtkFinalizeSignal >> target: anObject [
	target := anObject
]
