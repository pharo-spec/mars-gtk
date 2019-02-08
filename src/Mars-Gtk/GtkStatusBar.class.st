"
GtkStatusbar
GtkStatusbar — Report messages of minor importance to the user

https://developer.gnome.org/gtk3/stable/GtkStatusbar.html
"
Class {
	#name : #GtkStatusBar,
	#superclass : #GtkBox,
	#category : #'Mars-Gtk-Widget-Display'
}

{ #category : #private }
GtkStatusBar class >> gtkStatusBarNew [

	^ self ffiCall: #(GtkStatusBar *gtk_statusbar_new (void))
]

{ #category : #'instance creation' }
GtkStatusBar class >> new [

	^ self gtkStatusBarNew initialize
]

{ #category : #'instance creation' }
GtkStatusBar >> basicPush: utf8EncodedMessage withId: context_id [

	^ self ffiCall: #(guint gtk_statusbar_push (self, guint context_id, String utf8EncodedMessage))
]

{ #category : #'instance creation' }
GtkStatusBar >> contextNamed: aName [

	^ GtkStatusBarContext new
		bar: self;
		name: aName;
		id: (self newContextIdForContextNamed: aName);
		yourself
]

{ #category : #'instance creation' }
GtkStatusBar >> newContextIdForContextNamed: aName [

	self ffiCall: #(guint gtk_statusbar_get_context_id (self, String aName))
]

{ #category : #'instance creation' }
GtkStatusBar >> popFromContextId: context_id [

	self ffiCall: #(void gtk_statusbar_pop (self, guint context_id))
]

{ #category : #'instance creation' }
GtkStatusBar >> pushMessage: aMessage withId: anId [

	self 
		basicPush: aMessage
		withId: anId
]

{ #category : #'instance creation' }
GtkStatusBar >> removeAllFromContextId: contextId [

	self ffiCall: #(void gtk_statusbar_remove_all (self, guint contextId))
]

{ #category : #'instance creation' }
GtkStatusBar >> removeMessageWithId: message_id fromContextId: context_id [

	self ffiCall: #(void gtk_statusbar_remove (self, guint context_id, guint message_id))
]
