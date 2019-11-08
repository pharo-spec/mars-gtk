Class {
	#name : #GtkDefer,
	#superclass : #Object,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #private }
GtkDefer class >> ffiLibraryName [ 

	^ GLibLibrary2 
]

{ #category : #private }
GtkDefer class >> idleAdd: aCallback [

	self ffiCall: #(void g_idle_add( FFICallback aCallback, NULL)) module: GLibLibrary2
]

{ #category : #private }
GtkDefer class >> idleAddFull: aCallback [

	self ffiCall: #(void g_idle_add_full(gint 100,  FFICallback aCallback, NULL, NULL)) module: GLibLibrary2
]

{ #category : #private }
GtkDefer class >> mainContextInvoke: aCallback [

	self ffiCall: #(void g_main_context_invoke( NULL, FFICallback aCallback, NULL)) module: GLibLibrary2
]

{ #category : #private }
GtkDefer class >> runInGtk:  aBlock [

	| aSemaphore aCallback |

	(GtkRunLoop current isRunning not or: [ GCallbackVariable value ]) ifTrue: [ 
		^ aBlock value ].

	aSemaphore := Semaphore new.
	aCallback := GCallback signature: #(guint (void* data)) block: [:data | 
		aBlock ensure: [ aSemaphore signal ]. 
		0 ].

	self idleAddFull: aCallback.
	
	aSemaphore wait.
]
