Class {
	#name : #GtkAdapterTestCase,
	#superclass : #SpTest,
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
