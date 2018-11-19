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

{ #category : #finalization }
GtkWindow class >> finalizeResourceData: aHandle [

	(self isValidHandle: aHandle) ifFalse: [ ^ self ].
	GtkFinalizeSignal emitTarget: self handle: aHandle.
	self widgetDestroy: aHandle.
	aHandle beNull
]

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
GtkWindow >> beModal [

	self modal: true
]

{ #category : #accessing }
GtkWindow >> beNotModal [

	self modal: false
]

{ #category : #accessing }
GtkWindow >> center [
	self setPosition: GTK_WIN_POS_CENTER
]

{ #category : #geometry }
GtkWindow >> defaultSize: aPoint [

	self defaultSizeWidth: aPoint x height: aPoint y
]

{ #category : #private }
GtkWindow >> defaultSizeWidth: width height: height [

	^ self ffiCall: #(void gtk_window_set_default_size (self, gint width, gint height))
]

{ #category : #initialization }
GtkWindow >> initialize [

	super initialize.
	"I retain a reference to ensure it is not destroyed until I actually want to doit."
	self objectRef.
	"registering to prevent GC"
	self application registerWindow: self.
	"I need to ensure the handle is nil when destroy, to prevent double free"
	self connectDestroy: [ self windowDestroyed ].
	"self weakRef: (notifyFinalize := FFICallback 
		signature: #(void (void *aData, void *where_the_object_was)) 
		block: [ :aData :object | Stdio stdout << 'Finalizing: ' << object printString << String lf ])"	
]

{ #category : #testing }
GtkWindow >> isModal [ 

	^ self ffiCall: #(gboolean gtk_window_get_modal (self))
]

{ #category : #private }
GtkWindow >> modal: modal [

	^ self ffiCall: #(void gtk_window_set_modal (self, gboolean modal))
]

{ #category : #accessing }
GtkWindow >> position: aPoint [

	self flag: #TODO.
]

{ #category : #geometry }
GtkWindow >> resize: aPoint [
	self resizeWidth: aPoint x height: aPoint y
]

{ #category : #private }
GtkWindow >> resizeWidth: width height: height [
	^ self ffiCall: #(void gtk_window_resize (self, gint width, gint height))
]

{ #category : #private }
GtkWindow >> setPosition: position [
	"This is how it will be positioned WHEN showing (not after)"

	self ffiCall: #(void gtk_window_set_position ( self, GtkWindowPosition position ) )
]

{ #category : #accessing }
GtkWindow >> showAll [
	self withAllChildrenDo: #executeDeferredActions.
	super showAll
]

{ #category : #accessing }
GtkWindow >> title [ 
	^ self ffiCall: #(const gchar *gtk_window_get_title (self))
]

{ #category : #accessing }
GtkWindow >> title: title [
	^ self ffiCall: #(void gtk_window_set_title (self, String *title))
]

{ #category : #accessing }
GtkWindow >> titleBar [

	self ffiCall: #(GtkWidget *gtk_window_get_titlebar (self))
]

{ #category : #accessing }
GtkWindow >> titleBar: aTitleBar [

	self ffiCall: #(void gtk_window_set_titlebar (self, GtkWidget *aTitleBar))
]

{ #category : #accessing }
GtkWindow >> transientTo: parent [
	
	self ffiCall: #(void gtk_window_set_transient_for (self, GtkWindow *parent))
]

{ #category : #private }
GtkWindow >> windowAddAccelGroup: accel_group [

	^ self ffiCall: #(void gtk_window_add_accel_group (self, GtkAccelGroup *accel_group))
]

{ #category : #finalization }
GtkWindow >> windowDestroyed [
	"This process a destroy signal"

	GtkDestroySignal emitWidget: self.
	"according to documentation: Signals that all holders of a reference to the widget should 
	 release the reference that they hold. May result in finalization of the widget if all 
	 references are released.
	 Seems to mean if I receive the destroy signal, window no longer exist (and I do not need 
	 to re-trigger destroy on it."	
	handle beNull.
	self application unregisterWindow: self
]
