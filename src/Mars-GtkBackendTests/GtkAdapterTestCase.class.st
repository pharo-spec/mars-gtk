Class {
	#name : #GtkAdapterTestCase,
	#superclass : #SpTest,
	#instVars : [
		'app'
	],
	#category : #'Mars-GtkBackendTests'
}

{ #category : #running }
GtkAdapterTestCase >> adapter [ 

	^ presenter adapter
]

{ #category : #running }
GtkAdapterTestCase >> initializeTestedInstance [
	super initializeTestedInstance.

	presenter application: app.
]

{ #category : #running }
GtkAdapterTestCase >> runCaseManaged [
	
	GtkApplication ensureRunning. 
	app := SpApplication new.
	app useBackend: #Gtk.
	
	[ super runCaseManaged  ] ensure: [ app:= nil ].
]
