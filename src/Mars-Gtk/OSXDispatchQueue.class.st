Class {
	#name : #OSXDispatchQueue,
	#superclass : #FFILibrary,
	#instVars : [
		'mainQueue',
		'queues'
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
OSXDispatchQueue class >> initialize [ 

	dispatch_queue_main_t := #'void *'. 
	dispatch_queue_t := #'void *'. 
	dispatch_queue_global_t := #'void *'.
	dispatch_block_t := #FFICallback.
]

{ #category : #private }
OSXDispatchQueue >> calloutAPIClass [

	^ TFCalloutAPI
]

{ #category : #accessing }
OSXDispatchQueue >> dispatchAsync: aQueue do: aBlock [

	self 
		dispatchAync: aQueue 
		callback: (GCallback 
			signature: #(void (void)) 
			block: aBlock)
]

{ #category : #accessing }
OSXDispatchQueue >> dispatchAsyncOnMainQueue: aBlock [

	self 
		dispatchAsync: self mainQueue
		do: aBlock
]

{ #category : #private }
OSXDispatchQueue >> dispatchAync: queue callback: block [

	^ self ffiCall: #(void dispatch_async(dispatch_queue_t queue, dispatch_block_t block))
]

{ #category : #private }
OSXDispatchQueue >> dispatchQueueCreate: label [

	^ self 
		ffiCall: #(dispatch_queue_t dispatch_queue_create(const char *label, 0))
		module: self
]

{ #category : #registering }
OSXDispatchQueue >> ensureQueueNamed: aName [

	^ self 
		queueNamed: aName 
		ifAbsent: [ self registerQueue: aName ]
]

{ #category : #private }
OSXDispatchQueue >> globalQueue: identifier [

	^ self ffiCall: #(dispatch_queue_global_t dispatch_get_global_queue(
			long identifier, 
			0))
]

{ #category : #initialization }
OSXDispatchQueue >> initialize [ 
	super initialize.
	mainQueue := ExternalAddress null.
	queues := Dictionary new.
]

{ #category : #'accessing platform' }
OSXDispatchQueue >> macModuleName [ 

	^ 'libobjc.dylib'
]

{ #category : #accessing }
OSXDispatchQueue >> mainQueue [
	mainQueue isNull ifTrue: [ 
		mainQueue := ExternalAddress loadSymbol: '_dispatch_main_q' from: self macModuleName ].

	^ mainQueue
]

{ #category : #accessing }
OSXDispatchQueue >> queueNamed: aName [

	^ queues at: aName
]

{ #category : #accessing }
OSXDispatchQueue >> queueNamed: aName ifAbsent: aBlock [

	^ queues 
		at: aName 
		ifAbsent: aBlock
]

{ #category : #registering }
OSXDispatchQueue >> registerQueue: aName [
	| queue |.

	queue := self dispatchQueueCreate: aName.
	queues at: aName put: queue.
	^ queue
]

{ #category : #private }
OSXDispatchQueue >> workerName [ 

	^ #gtk
]
