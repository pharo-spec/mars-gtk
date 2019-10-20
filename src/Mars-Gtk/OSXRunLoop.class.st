Class {
	#name : #OSXRunLoop,
	#superclass : #FFILibrary,
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
OSXRunLoop >> calloutAPIClass [

	^ TFCalloutAPI
]

{ #category : #actions }
OSXRunLoop >> createQueue: aName [

	OSXDispatchQueue uniqueInstance registerQueue: aName

	
]

{ #category : #actions }
OSXRunLoop >> install [ 

	self createQueue: 'org.pharo.Gtk'.
	self runLoopRun
]

{ #category : #'accessing platform' }
OSXRunLoop >> macLibraryName [ 

	^ '/System/Library/Frameworks/CoreFoundation.framework/CoreFoundation'
]

{ #category : #'as yet unclassified' }
OSXRunLoop >> runLoopRun [

	self ffiCall: #(void CFRunLoopRun(void))
]

{ #category : #accessing }
OSXRunLoop >> workerName [

	^ #gtk
]
