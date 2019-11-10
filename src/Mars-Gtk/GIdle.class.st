"
I am a copy of class GLibLibrary. This comment is copied from there, and might not be entirely accurate

Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #GIdle,
	#superclass : #GtkLibrary,
	#category : #'Mars-Gtk-Base'
}

{ #category : #private }
GIdle >> idleAddFull: aCallback [

	self ffiCall: #(void g_idle_add_full(gint 100,  FFICallback aCallback, NULL, NULL))
]

{ #category : #'accessing platform' }
GIdle >> runner [

	^ TFSameThreadRunner uniqueInstance
]

{ #category : #'accessing platform' }
GIdle >> win32LibraryName [

	^ 'libglib-2.0-0.dll'
]
