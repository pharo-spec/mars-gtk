Class {
	#name : #GtkAdapterTestCase,
	#superclass : #SpTestCase,
	#category : #'Mars-GtkBackendTests'
}

{ #category : #running }
GtkAdapterTestCase >> adapter [ 

	^ presenter adapter
]

{ #category : #running }
GtkAdapterTestCase >> runCaseManaged [

	GtkApplication ensureRunning. 
	SpBindings 
		value: GtkAdapterBindings new 
		during: [ super runCaseManaged ]
]
