Class {
	#name : #GtkAdapterTestCase,
	#superclass : #SpecTestCase,
	#category : #'Mars-GtkBackendTests'
}

{ #category : #running }
GtkAdapterTestCase >> adapter [ 

	^ presenter adapter
]

{ #category : #running }
GtkAdapterTestCase >> runCaseManaged [

	GtkApplication ensureRunning. 
	SpecBindings 
		value: GtkAdapterBindings new 
		during: [ super runCaseManaged ]
]
