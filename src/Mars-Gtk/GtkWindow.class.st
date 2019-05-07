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
	"self widgetDestroy: aHandle."
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
	self windowAddAccelGroup: anAcceleratorGroup
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

{ #category : #geometry }
GtkWindow >> bounds [

	^ self position extent: self size
]

{ #category : #geometry }
GtkWindow >> center [
	"Sets position as 'center' to be applied *before* window is opened."
	
	"self isVisible 
		ifTrue: [ self moveTo: (self display primaryMonitor geometry extent - self size) // 2 ]
		ifFalse: [ "self setPosition: GTK_WIN_POS_CENTER" ]"
]

{ #category : #signaling }
GtkWindow >> connectActivateFocus: aBlock [

	self connect: 'activate-focus' do: aBlock
]

{ #category : #accessing }
GtkWindow >> decorated: setting [
	"https://developer.gnome.org/gtk3/stable/GtkWindow.html#gtk-window-set-decorated
	 This may not work all the time"
	self ffiCall: #(void gtk_window_set_decorated (self, gboolean setting))
]

{ #category : #geometry }
GtkWindow >> defaultSize: aPoint [

	self 
		defaultSizeWidth: aPoint x
		height: aPoint y
]

{ #category : #private }
GtkWindow >> defaultSizeWidth: width height: height [

	^ self ffiCall: #(void gtk_window_set_default_size (self, gint width, gint height))
]

{ #category : #private }
GtkWindow >> getPositionX: root_x y: root_y [

	^ self ffiCall: #(void gtk_window_get_position (self, gint *root_x, gint *root_y))
]

{ #category : #private }
GtkWindow >> getSizeWidth: width height: height [

	^ self ffiCall: #(void gtk_window_get_size (self, gint *width, gint *height))
]

{ #category : #geometry }
GtkWindow >> gravity [

	^ self ffiCall: #(GdkGravity gtk_window_get_gravity (self))
]

{ #category : #geometry }
GtkWindow >> gravity: gravity [

	^ self ffiCall: #(void gtk_window_set_gravity (self, GdkGravity gravity))
]

{ #category : #initialization }
GtkWindow >> initialize [

	super initialize.
	"registering to prevent GC"
	self application registerWindow: self.
	"I need to ensure the handle is nil when destroy, to prevent double free"
	self connectDestroy: [ self windowDestroyed ]
]

{ #category : #testing }
GtkWindow >> isDecorated [

	^ self ffiCall: #(gboolean gtk_window_get_decorated (self))
]

{ #category : #testing }
GtkWindow >> isModal [ 

	^ self ffiCall: #(gboolean gtk_window_get_modal (self))
]

{ #category : #testing }
GtkWindow >> isResizable [

	^ self ffiCall: #(gboolean gtk_window_get_resizable (self))
]

{ #category : #private }
GtkWindow >> modal: modal [

	^ self ffiCall: #(void gtk_window_set_modal (self, gboolean modal))
]

{ #category : #geometry }
GtkWindow >> moveTo: aPoint [

	self moveX: aPoint x y: aPoint y
]

{ #category : #geometry }
GtkWindow >> moveToCenter [ 

	self moveTo: (self display primaryMonitor geometry extent - self size) // 2
]

{ #category : #private }
GtkWindow >> moveX: x y: y [

	^ self ffiCall: #(void gtk_window_move (self, gint x, gint y))
]

{ #category : #geometry }
GtkWindow >> position [
	| rootX rootY |
	
	rootX := FFIInt32 newBuffer.
	rootY := FFIInt32 newBuffer.
	
	self getPositionX: rootX y: rootY. 
	
	^ (rootX signedLongAt: 1) @ (rootY signedLongAt: 1)
]

{ #category : #accessing }
GtkWindow >> removeAcceleratorGroup: anAcceleratorGroup [

	(acceleratorGroups includes: anAcceleratorGroup) ifFalse: [ ^ self ].
	self windowRemoveAccelGroup: anAcceleratorGroup.
	acceleratorGroups remove: anAcceleratorGroup
	
]

{ #category : #accessing }
GtkWindow >> resizable: resizable [

	self ffiCall: #(void gtk_window_set_resizable (self, gboolean resizable))
]

{ #category : #geometry }
GtkWindow >> resize: aPoint [

	self 
		resizeWidth: aPoint x 
		height: aPoint y
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
GtkWindow >> show [
	| titleBar |
	
	self withAllChildrenDo: #executeDeferredActions.
	self flag: #TODO. "All this checking is because current TFFI does not answers correctly nil when 
	address answered is NULL. This will be fixed and this will not be necesary :)"
	titleBar := self titleBar.
	(titleBar notNil and: [ titleBar getHandle isNull not ]) 
		ifTrue: [ titleBar showAll ].
	super show
]

{ #category : #accessing }
GtkWindow >> showAll [

	"We have to do in this way to avoid the selection of the first element in a list"
	self show.
	self children do: #showAll
]

{ #category : #geometry }
GtkWindow >> size [
	| width height |
	
	width := FFIInt32 newBuffer.
	height := FFIInt32 newBuffer.
	
	self getSizeWidth: width height: height. 
	
	^ (width signedLongAt: 1) @ (height signedLongAt: 1)
]

{ #category : #accessing }
GtkWindow >> title [ 
	^ self ffiCall: #(const gchar *gtk_window_get_title (self))
]

{ #category : #accessing }
GtkWindow >> title: title [
	^ self ffiCall: #(void gtk_window_set_title (self, String title))
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

	GtkWindowDestroySignal emitWidget: self.
	"according to documentation: Signals that all holders of a reference to the widget should 
	 release the reference that they hold. May result in finalization of the widget if all 
	 references are released.
	 Seems to mean if I receive the destroy signal, window no longer exist (and I do not need 
	 to re-trigger destroy on it."	
	handle beNull.
	self application unregisterWindow: self
]

{ #category : #private }
GtkWindow >> windowRemoveAccelGroup: accel_group [

	^ self ffiCall: #(void gtk_window_remove_accel_group (self, GtkAccelGroup *accel_group))
]
