"
I am a special class made to insert callbacks into the idle action. 
I exist because while running on main thread, gtk will execute gtk_main who will take over the thread. To insert commands, we need to add a call to one of the idle functions (see my implemented methods and senders to it for details)
"
Class {
	#name : #GIdle,
	#superclass : #GLibLibrary,
	#instVars : [
		'deferring',
		'mutex'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #private }
GIdle >> gIdleAddFull: aCallback [

	self ffiCall: #(void g_idle_add_full(gint 100, GCallback aCallback, NULL, NULL))
]

{ #category : #accessing }
GIdle >> idleAddFull: aBlock [
	| cb |

	mutex critical: [ 
		deferring add: ((cb := GSourceFunc new)
			signature: #(guint (void *data))
			block: [ :data | 
				aBlock value. 
				mutex critical: [ deferring remove: cb ].
				0 ]) ].

	^ self gIdleAddFull: cb
]

{ #category : #initialization }
GIdle >> initialize [ 

	super initialize.
	mutex := Mutex new.
	deferring := Set new
]

{ #category : #'accessing platform' }
GIdle >> runner [

	^ TFSameThreadRunner uniqueInstance
]
