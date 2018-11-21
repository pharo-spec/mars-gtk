Class {
	#name : #GtkDestroySignal,
	#superclass : #GtkSignal,
	#instVars : [
		'handle'
	],
	#classVars : [
		'NotifyCallback'
	],
	#category : #'Mars-Gtk-Signal'
}

{ #category : #'as yet unclassified' }
GtkDestroySignal class >> installFor: aWidget [
	
	self isFiltered ifTrue: [ ^ self ].
	aWidget weakRef: self notifyCallback
]

{ #category : #'as yet unclassified' }
GtkDestroySignal class >> notifyCallback [

	^ NotifyCallback ifNil: [ 
		NotifyCallback := FFICallback 
			signature: #(void (void *data, void *object)) 
			block: [ :data :object | 
				self new 
					 handle: object;
					 emit ] ]
]

{ #category : #'as yet unclassified' }
GtkDestroySignal class >> reset [ 
	<script>
	
	NotifyCallback := nil
]

{ #category : #accessing }
GtkDestroySignal >> handle [
	^ handle
]

{ #category : #accessing }
GtkDestroySignal >> handle: anObject [
	handle := anObject
]

{ #category : #printing }
GtkDestroySignal >> printOneLineContentsOn: stream [
	
	stream << self handle printString
]
