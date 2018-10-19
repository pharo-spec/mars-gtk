"
GtkWindow — Toplevel which can contain other widgets.

https://developer.gnome.org/gtk3/stable/GtkWindow.html
"
Class {
	#name : #GtkWindow,
	#superclass : #GtkContainer,
	#instVars : [
		'acceleratorGroups'
	],
	#pools : [
		'GtkWindowPosition',
		'GtkWindowType'
	],
	#category : #'Mars-Gtk-Widget-Window'
}

{ #category : #'instance creation' }
GtkWindow class >> new [ 
	^ (self windowNew: GTK_WINDOW_TOPLEVEL) initialize
]

{ #category : #private }
GtkWindow class >> windowNew: type [ 
	^ self ffiCall: #( GtkWindow *gtk_window_new ( GtkWindowType type ) )
]

{ #category : #accessing }
GtkWindow >> addAcceleratorGroup: anAcceleratorGroup [

	acceleratorGroups ifNil: [ acceleratorGroups := Set new ].
	acceleratorGroups add: anAcceleratorGroup.
	self windowAddAccelGroup: anAcceleratorGroup.

]

{ #category : #'external resource management' }
GtkWindow >> autoRelease [
	"autoReleasing windows is more complicated than the usual WeakRegistry mechanism, since 
	 I can have strong references to self in callbacks (due to the events registered). 
	 Therefore, I need a better mechanism and this is well handled by EphemeronRegistry. 
	 This will call the regular #finalize method from this object"
	self flag: #TODO. "Verify this"
	super autoRelease
]

{ #category : #accessing }
GtkWindow >> center [
	self setPosition: GTK_WIN_POS_CENTER
]

{ #category : #finalization }
GtkWindow >> finalize [
	(self getHandle isNil or: [ self getHandle isNull ]) ifTrue: [ ^ self ].
	GtkFinalizeSignal emitTarget: self handle: self getHandle.
	"self disconnectAll."
	"It may have changed after all disconnections (some disconnect may trigger a 
	 destroy, I'm not sure how this works...)"
	self getHandle ifNotNil: [ 
		"self objectUnreference."
		self class widgetDestroy: self getHandle ]
]

{ #category : #initialization }
GtkWindow >> initialize [
	super initialize.
	"registering to prevent GC"
	self application registerWindow: self.
	"I retain a reference to ensure it is not destroyed until I actually want to doit"
	"self objectReference."
	"I need to ensure the handle is nil when destroy, to prevent double free"
	self connectDestroy: [ 
		GtkDestroySignal emitWidget: self.
		self application unregisterWindow: self.
		handle := nil ]
]

{ #category : #accessing }
GtkWindow >> modal: modal [
	self ffiCall: #(void gtk_window_set_modal (self, gboolean modal))
]

{ #category : #accessing }
GtkWindow >> position: aPoint [
	self flag: #todo.
]

{ #category : #geometry }
GtkWindow >> resize: aPoint [
	self resizeWidth: aPoint x height: aPoint y
]

{ #category : #private }
GtkWindow >> resizeWidth: width height: height [
	^ self ffiCall: #(void gtk_window_resize (self, gint width, gint height))
]

{ #category : #accessing }
GtkWindow >> setPosition: position [
	"This is how it will be positioned WHEN showing (not after)"
	self ffiCall: #(void gtk_window_set_position ( self, GtkWindowPosition position ) )
]

{ #category : #accessing }
GtkWindow >> title [ 
	^ self ffiCall: #(const gchar *gtk_window_get_title (self))
]

{ #category : #accessing }
GtkWindow >> title: title [
	^ self ffiCall: #(void gtk_window_set_title (self, const gchar *title))
]

{ #category : #private }
GtkWindow >> windowAddAccelGroup: accel_group [

	^ self ffiCall: #(void gtk_window_add_accel_group (self, GtkAccelGroup *accel_group))
]
