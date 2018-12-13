Class {
	#name : #OSXDispatchAsync,
	#superclass : #FFILibrary,
	#instVars : [
		'mainQueue'
	],
	#classVars : [
		'dispatch_block_t',
		'dispatch_queue_global_t',
		'dispatch_queue_main_t',
		'dispatch_queue_t'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #'class initialization' }
OSXDispatchAsync class >> initialize [ 

	dispatch_queue_main_t := #'void *'. 
	dispatch_queue_t := #'void *'. 
	dispatch_queue_global_t := #'void *'.
	dispatch_block_t := #FFICallback.
]

{ #category : #'as yet unclassified' }
OSXDispatchAsync >> dispatchAsync: aQueue do: aBlock [

	self 
		dispatchAync: aQueue 
		callback: (GCallback 
			signature: #(void (void)) 
			block: aBlock)
]

{ #category : #'as yet unclassified' }
OSXDispatchAsync >> dispatchAsyncOnMainQueue: aBlock [

	self 
		dispatchAsync: self mainQueue
		do: aBlock
]

{ #category : #'as yet unclassified' }
OSXDispatchAsync >> dispatchAync: queue callback: block [

	^ self ffiCall: #(void dispatch_async(dispatch_queue_t queue, dispatch_block_t block))
]

{ #category : #'as yet unclassified' }
OSXDispatchAsync >> globalQueue: identifier [

	^ self ffiCall: #(dispatch_queue_global_t dispatch_get_global_queue(
		long identifier, 
		0))
]

{ #category : #initialization }
OSXDispatchAsync >> initialize [ 
	super initialize.
	mainQueue := ExternalAddress null
]

{ #category : #'accessing platform' }
OSXDispatchAsync >> macModuleName [ 

	^ 'libobjc.dylib'
]

{ #category : #'as yet unclassified' }
OSXDispatchAsync >> mainQueue [
	mainQueue isNull ifTrue: [ 
		mainQueue := ExternalAddress loadSymbol: '_dispatch_main_q' from: self macModuleName ].

	^ mainQueue
]
