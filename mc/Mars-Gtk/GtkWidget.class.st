"
GtkWidget — Base class for all widgets.

https://developer.gnome.org/gtk3/stable/GtkWidget.html
"
Class {
	#name : #GtkWidget,
	#superclass : #Object,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#instVars : [
		'handle',
		'callbacks',
		'data'
	],
	#pools : [
		'GConnectFlags',
		'GSignalMatchType',
		'GtkAlign',
		'GtkStateFlags',
		'GtkStateType',
		'GtkTypes'
	],
	#category : 'Mars-Gtk-Widget'
}

{ #category : #converting }
GtkWidget class >> asExternalTypeOn: generator [
	^ FFIOpaqueObjectType objectClass: self
]

{ #category : #'library path' }
GtkWidget class >> ffiLibraryName [
	^ GtkLibrary
]

{ #category : #finalization }
GtkWidget class >> finalizeResourceData: widget [
	(widget isNil or: [ widget isNull ]) ifTrue: [ ^ self ].
	GtkFinalizeSignal emitTarget: self handle: widget.
	self widgetDestroy: widget
]

{ #category : #'instance creation' }
GtkWidget class >> fromHandle: handle [
	^ (self basicNew setHandle: handle) initialize
]

{ #category : #private }
GtkWidget class >> widgetDestroy: widget [
	"I get a handle here (a void *) so I need to remap the function"
	self ffiCall: #(void gtk_widget_destroy ("GtkWidget *" void *widget))
]

{ #category : #converting }
GtkWidget >> asListBoxRow [
	^ GtkListBoxRow newWidget: self
]

{ #category : #'external resource management' }
GtkWidget >> autoRelease [
	FFIExternalResourceManager addResource: self
]

{ #category : #accessing }
GtkWidget >> beHAlignStart [
	self hAlign: GTK_ALIGN_START
]

{ #category : #'private signaling' }
GtkWidget >> connect: aString do: aBlock [
	"this is the basic signaling (for IO events), who share signature along them... of course 
	 this is not correct in all cases (like for example 'draw'), then you need to use the method
	 #connect:signature:do:
	 BEWARE when installing callbacks to gtk... you HAVE TO catch and fork any error happening, 
	 otherwise you will crash your image (event processing happens in VM event loop, so is fragile)"
	^ self 
		connect: aString 
		signature: #(void (void *widget, void *aData))  
 		do: [ :widget :aData | [ aBlock value ] fork ]
]

{ #category : #'private signaling' }
GtkWidget >> connect: aString signature: signature do: aBlock [
	"BEWARE when installing callbacks to gtk... you HAVE TO catch and fork any error happening, 
	 otherwise you will crash your image (event processing happens in VM event loop, so is fragile)"
	| callback |
	callback := FFICallback signature: signature block: aBlock.
	self registerCallback: callback.
	self signal: aString connect: callback data: ExternalAddress null
]

{ #category : #signaling }
GtkWidget >> connectClicked: aBlock [
	self connect: 'clicked' do: aBlock
]

{ #category : #signaling }
GtkWidget >> connectDestroy: aBlock [
	self connect: 'destroy' do: aBlock
]

{ #category : #signaling }
GtkWidget >> connectHide: aBlock [
	self connect: 'hide' do: aBlock
]

{ #category : #signaling }
GtkWidget >> connectShow: aBlock [
	self connect: 'show' do: aBlock
]

{ #category : #accessing }
GtkWidget >> data [
	"Stores any kind of 'data' you want to keep associated to the widget"
	^ data
]

{ #category : #accessing }
GtkWidget >> data: anObject [
	data := anObject
]

{ #category : #signaling }
GtkWidget >> disconnectAll [
	callbacks ifNil: [ ^ self ].
	callbacks copy do: [ :each | 
		self assert: (self disconnectByFunc: each) ~= 0.
		callbacks remove: each ].
	
]

{ #category : #'private signaling' }
GtkWidget >> disconnectByFunc: func [
	^ self 
		disconnectMatchedMask: G_SIGNAL_MATCH_FUNC 
		signal: 0 
		detail: 0 
		closure: ExternalAddress null
		func: func 
		data: ExternalAddress null
]

{ #category : #'private signaling' }
GtkWidget >> disconnectMatchedMask: mask signal: signal_id detail: detail closure: closure func: func data: aData [
	^ self ffiCall: #(guint g_signal_handlers_disconnect_matched (
		self,
		GSignalMatchType mask,
		guint signal_id,
		GQuark detail,
		"GClosure *" void *closure,
		FFICallback func,
      gpointer aData))
]

{ #category : #'library path' }
GtkWidget >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #private }
GtkWidget >> getHandle [
	^ handle
]

{ #category : #accessing }
GtkWidget >> grabDefault [
	self ffiCall: #(void gtk_widget_grab_default (self))
]

{ #category : #accessing }
GtkWidget >> grabFocus [
	self ffiCall: #(void gtk_widget_grab_focus (self))
]

{ #category : #accessing }
GtkWidget >> hAlign [
	^ self ffiCall: #(GtkAlign gtk_widget_get_halign (self))
]

{ #category : #accessing }
GtkWidget >> hAlign: align [
	^ self ffiCall: #(void gtk_widget_set_halign (self, GtkAlign align))
]

{ #category : #showing }
GtkWidget >> hide [
	self ffiCall: #( void gtk_widget_hide (self))
]

{ #category : #testing }
GtkWidget >> isFocus [
	^ self ffiCall: #(gboolean gtk_widget_is_focus (self))
]

{ #category : #testing }
GtkWidget >> isSensitive [
	"Returns the widget’s effective sensitivity, which means it is sensitive itself and also its parent widget is sensitive"
	^ self ffiCall: #(gboolean gtk_widget_is_sensitive (self))
]

{ #category : #testing }
GtkWidget >> isVisible [
	^ self ffiCall: #(gboolean gtk_widget_is_visible (self))
]

{ #category : #private }
GtkWidget >> objectReference [
	self ffiCall: #(gpointer g_object_ref (self))
]

{ #category : #private }
GtkWidget >> objectUnreference [
	self ffiCall: #(gpointer g_object_unref (self))
]

{ #category : #accessing }
GtkWidget >> overrideBackgroundColor: color [
	^ self 
		overrideBackgroundState: GTK_STATE_FLAG_NORMAL 
		color: color gtkRGBA
]

{ #category : #private }
GtkWidget >> overrideBackgroundState: state color: color [
	^ self ffiCall: #(void gtk_widget_override_background_color (self, GtkStateFlags state, const GdkRGBA *color))
]

{ #category : #accessing }
GtkWidget >> path [
	| length path pathReversed |
	
	length := ExternalAddress new.
	path := ExternalAddress new.
	pathReversed := ExternalAddress new.
	
	self widgetPathLength: length path: path reversed: pathReversed.
	
	^ path readString
]

{ #category : #private }
GtkWidget >> registerCallback: aCallback [
	callbacks ifNil: [ callbacks := Set new ].
	callbacks add: aCallback
]

{ #category : #'external resource management' }
GtkWidget >> resourceData [
	^ handle
]

{ #category : #accessing }
GtkWidget >> sensitive: sensitive [
	self ffiCall: #(void gtk_widget_set_sensitive (self, gboolean sensitive))
]

{ #category : #private }
GtkWidget >> setHandle: aHandle [
	handle := aHandle
]

{ #category : #showing }
GtkWidget >> show [
	^ self ffiCall: #(void gtk_widget_show (self))
]

{ #category : #showing }
GtkWidget >> showAll [
	^ self ffiCall: #(void gtk_widget_show_all (self))
]

{ #category : #'private signaling' }
GtkWidget >> signal: aString connect: callback data: aData [
	^ self 
		signal: aString  
		connect: callback 
		data: aData
		flags: G_CONNECT_NONE
]

{ #category : #'private signaling' }
GtkWidget >> signal: signalName connect: callback data: aData flags: connectFlags [
	^ self ffiCall: #( gulong g_signal_connect_data ( 
		self,
		const gchar *signalName,
		GCallback callback,
		gpointer 	aData,
		0,
		GConnectFlags connectFlags ) )
		
]

{ #category : #geometry }
GtkWidget >> sizeRequest: aPoint [
	self sizeRequestWidth: aPoint x height: aPoint y
]

{ #category : #private }
GtkWidget >> sizeRequestWidth: width height: height [
	^ self ffiCall: #(void gtk_widget_set_size_request ( self, gint width, gint height ) )
]

{ #category : #accessing }
GtkWidget >> vAlign [
	^ self ffiCall: #(GtkAlign gtk_widget_get_valign (self))
]

{ #category : #accessing }
GtkWidget >> vAlign: align [
	^ self ffiCall: #(void gtk_widget_set_valign (self, GtkAlign align))
]

{ #category : #private }
GtkWidget >> widgetPathLength: path_length path: path reversed: path_reversed [
	^ self ffiCall: #(void gtk_widget_path (self, guint *path_length, gchar **path, gchar **path_reversed))
]
