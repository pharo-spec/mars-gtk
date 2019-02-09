"
GtkWidget — Base class for all widgets.

https://developer.gnome.org/gtk3/stable/GtkWidget.html
"
Class {
	#name : #GtkWidget,
	#superclass : #GObject,
	#instVars : [
		'data',
		'deferActions'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'library path' }
GtkWidget class >> ffiLibraryName [
	^ GtkLibrary
]

{ #category : #finalization }
GtkWidget class >> finalizeResourceData: aHandle [

	super finalizeResourceData: aHandle
	"(self isValidHandle: aHandle) ifFalse: [ ^ self ].
	GtkFinalizeSignal emitTarget: self handle: aHandle.
	self widgetDestroy: aHandle"
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

{ #category : #accessing }
GtkWidget >> addAccelerator: aString group: anAccelGroup shortcut: aShortcut [
	| charValue modifiers |

	charValue := aShortcut character key asciiValue.
	modifiers := aShortcut modifier asGdkModifierType.
		
	self 
		widgetAddAccelerator: aString 
		group: anAccelGroup 
		key: charValue
		modifiers: modifiers
		accelFlags: GTK_ACCEL_VISIBLE
		
]

{ #category : #accessing }
GtkWidget >> allocation [
	| allocation |
	
	allocation := GtkAllocation new.
	self getAllocation: allocation.
	^ allocation asRectangle
]

{ #category : #converting }
GtkWidget >> asListBoxRow [

	^ GtkListBoxRow newWidget: self
]

{ #category : #'external resource management' }
GtkWidget >> autoRelease [

	GtkRegisterAutoRelease emitWidget: self.
	^ super autoRelease
]

{ #category : #private }
GtkWidget >> basicGrabDefault [

	self ffiCall: #(void gtk_widget_grab_default (self))
]

{ #category : #accessing }
GtkWidget >> beHAlignCenter [

	self hAlign: GTK_ALIGN_CENTER
]

{ #category : #accessing }
GtkWidget >> beHAlignEnd [

	self hAlign: GTK_ALIGN_END
]

{ #category : #accessing }
GtkWidget >> beHAlignStart [

	self hAlign: GTK_ALIGN_START
]

{ #category : #accessing }
GtkWidget >> beVAlignCenter [

	self vAlign: GTK_ALIGN_CENTER
]

{ #category : #accessing }
GtkWidget >> beVAlignEnd [

	self vAlign: GTK_ALIGN_END
]

{ #category : #accessing }
GtkWidget >> beVAlignStart [

	self vAlign: GTK_ALIGN_START
]

{ #category : #TOREMOVE }
GtkWidget >> bindKeyCombination: aShortcut toAction: aBlock [
 
	self flag: #TODO.
]

{ #category : #private }
GtkWidget >> canDefault: can_default [

	self ffiCall: #(void gtk_widget_set_can_default (self, gboolean can_default))
]

{ #category : #signaling }
GtkWidget >> connectButtonPressEvent: aBlock [

	^ self 
		connect: 'button-press-event'
		signature: #(gboolean (void *widget, void* event, void *aData))  
 		do: [ :widget :event :aData |
			aBlock value: (GdkEventButton fromHandle: event) ]
]

{ #category : #signaling }
GtkWidget >> connectClicked: aBlock [

	self connect: 'clicked' do: aBlock
]

{ #category : #signaling }
GtkWidget >> connectDeleteEvent: aBlock [
	"answers whether the widget can be deleted ot not"
	
	self 
		connect: 'delete-event'
		signature: #(int (void *widget, void *event, void *user_data))
		do: [ :widget :event :user_data | aBlock value ]
]

{ #category : #signaling }
GtkWidget >> connectDestroy: aBlock [

	self 
		connect: 'destroy' 
		signature: #(void (void *widget, void *aData))  
 		do: [ :widget :aData | aBlock value ]

]

{ #category : #signaling }
GtkWidget >> connectDoubleClicked: aBlock [
	self flag: #TODO. "According to #irc, the correct way to deal with a double click 
	 is with a GtkGestureMultipress, but this works and I do not have time to go deeper."
	
	self connectButtonPressEvent: [ :event | | stop |
		stop := false.
		event isDoubleClick ifTrue: [ 
			aBlock fork.
			stop := true ].
		stop ]
]

{ #category : #signaling }
GtkWidget >> connectHide: aBlock [
	self connect: 'hide' do: aBlock
]

{ #category : #signaling }
GtkWidget >> connectKeyPressEvent: aBlock [

	^ self 
		connect: 'key-press-event'
		signature: #(gboolean (void *widget, void* event, void *aData))  
 		do: [ :widget :event :aData | aBlock value: event ]
]

{ #category : #signaling }
GtkWidget >> connectShow: aBlock [
	self connect: 'show' do: aBlock
]

{ #category : #signaling }
GtkWidget >> connectSizeAllocate: aBlock [

	self 
		connect: 'size-allocate'
		signature: #(void (void *widget, void *allocation, gpointer user_data))
		do: [ :widget :allocation :user_data |
			aBlock cull: (GdkRectangle fromHandle: allocation) asRectangle ]
]

{ #category : #signaling }
GtkWidget >> connectUnmap: aBlock [

	self 
		connect: 'unmap' 
		do: aBlock
]

{ #category : #accessing }
GtkWidget >> contextMenu: aGtkMenu [
	"sets all needed to show a context menu. 
	 this is an extension to Gtk3, but it will make our lifes easier this side :)"

	aGtkMenu autoRelease.
	self connectButtonPressEvent: [ :event |
		event isSecondaryButton ifTrue: [ 
				aGtkMenu
					showAll;
					popupAtPointer: event ].
			false ]
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

{ #category : #'private deferring' }
GtkWidget >> deferAction: aBlock [
	"Deferred actions are needed because some settings (like #grabDefault) acquire sense once a 
	 widget is inserted into a window. Hence, we need to 'defer' this action until that moment. 
	 NOTE: For now, because I didn't find a better place, resolution of deferred actions are made 
	 when calling GtkWindow>>#showAll, maybe this needs to change in the future.". 

	deferActions ifNil: [ deferActions := #() ].
	deferActions := deferActions copyWith: aBlock
]

{ #category : #accessing }
GtkWidget >> destroy [
	
	^ self ffiCall: #(void gtk_widget_destroy (self))
]

{ #category : #'private deferring' }
GtkWidget >> executeDeferredActions [

	deferActions ifNil: [ ^ self ].
	deferActions do: #value.
	deferActions := nil
]

{ #category : #'library path' }
GtkWidget >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #private }
GtkWidget >> getAllocation: allocation [

	self ffiCall: #(void gtk_widget_get_allocation (self, GtkAllocation *allocation))
	
]

{ #category : #accessing }
GtkWidget >> getPreferredSizeMin: minimum_size natural: natural_size [

	self ffiCall: #(void gtk_widget_get_preferred_size (
		self, 
		GtkRequisition *minimum_size,
		GtkRequisition *natural_size))
]

{ #category : #private }
GtkWidget >> getTopLevel [
	"I will get the window from GtkApplication (to keep identity), so I answer just the 
	 ExternalAddress, skiping any other object creation."

	^ self ffiCall: #("GtkWidget *"void *gtk_widget_get_toplevel (self))
]

{ #category : #accessing }
GtkWidget >> grabDefault [

	self canDefault: true.
	self deferAction: [ 
		self basicGrabDefault ]
]

{ #category : #accessing }
GtkWidget >> grabFocus [
	self ffiCall: #(void gtk_widget_grab_focus (self))
]

{ #category : #'GT-Inspector-Extension' }
GtkWidget >> gtInspectorDeferActionsIn: composite [
	<gtInspectorPresentationOrder: 100>  

	composite fastList
		title: 'Deferred actions';
		display: [ deferActions asArray ];
		when: [ deferActions isEmptyOrNil not ]
]

{ #category : #accessing }
GtkWidget >> hAlign [
	^ self ffiCall: #(GtkAlign gtk_widget_get_halign (self))
]

{ #category : #accessing }
GtkWidget >> hAlign: align [
	^ self ffiCall: #(void gtk_widget_set_halign (self, GtkAlign align))
]

{ #category : #accessing }
GtkWidget >> hExpand: expand [

	self ffiCall: #(void gtk_widget_set_hexpand (self, gboolean expand))
]

{ #category : #showing }
GtkWidget >> hide [

	self ffiCall: #(void gtk_widget_hide (self))
]

{ #category : #testing }
GtkWidget >> isFocus [
	^ self ffiCall: #(gboolean gtk_widget_is_focus (self))
]

{ #category : #testing }
GtkWidget >> isHExpand [

	self ffiCall: #(gboolean gtk_widget_get_hexpand (self))
]

{ #category : #testing }
GtkWidget >> isSensitive [
	"Returns the widget’s effective sensitivity, which means it is sensitive itself and also its parent widget is sensitive"

	^ self ffiCall: #(gboolean gtk_widget_is_sensitive (self))
]

{ #category : #testing }
GtkWidget >> isVExpand [

	self ffiCall: #(gboolean gtk_widget_get_vexpand (self))
]

{ #category : #testing }
GtkWidget >> isVisible [
	^ self ffiCall: #(gboolean gtk_widget_is_visible (self))
]

{ #category : #accessing }
GtkWidget >> margin [

	^ self gObjectGetInteger: 'margin'
]

{ #category : #accessing }
GtkWidget >> margin: aNumber [

	^ self gObjectSet: 'margin' toInteger: aNumber
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
GtkWidget >> parentWindow [ 
	| windowHandle |
	
	windowHandle := self getTopLevel.
	windowHandle isNull ifTrue: [ ^ nil ].
	
	^ GtkApplication current windowByHandle: windowHandle
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

{ #category : #geometry }
GtkWidget >> preferredSizeMinimum [
	| min natural |
	
	min := GtkRequisition new.
	natural := GtkRequisition new.
	self 
		getPreferredSizeMin: min 
		natural: natural.
	
	^ min width @ min height
]

{ #category : #geometry }
GtkWidget >> preferredSizeNatural [
	| min natural |
	
	min := GtkRequisition new.
	natural := GtkRequisition new.
	self 
		getPreferredSizeMin: min 
		natural: natural.
	
	^ natural width @ natural height
]

{ #category : #private }
GtkWidget >> queueDraw [

	^ self ffiCall: #(void gtk_widget_queue_draw (self))
]

{ #category : #'external resource management' }
GtkWidget >> resourceData [
	^ handle
]

{ #category : #accessing }
GtkWidget >> sensitive: sensitive [
	"sensitive is the gtk equivallent of enable/disable"

	self ffiCall: #(void gtk_widget_set_sensitive (self, gboolean sensitive))
]

{ #category : #private }
GtkWidget >> setTooltipText: text [

	^ self ffiCall: #(void gtk_widget_set_tooltip_text (self, const gchar *text))
]

{ #category : #showing }
GtkWidget >> show [

	^ self 
		ffiCall: #(void gtk_widget_show (self))
]

{ #category : #showing }
GtkWidget >> showAll [

	^ self 
		ffiCall: #(void gtk_widget_show_all (self))
]

{ #category : #geometry }
GtkWidget >> sizeRequest: aPoint [
	self sizeRequestWidth: aPoint x height: aPoint y
]

{ #category : #private }
GtkWidget >> sizeRequestWidth: width height: height [
	^ self ffiCall: #(void gtk_widget_set_size_request ( self, gint width, gint height ) )
]

{ #category : #TOREMOVE }
GtkWidget >> takeKeyboardFocus [
	
	self flag: #TODO.
]

{ #category : #accessing }
GtkWidget >> tooltipText: aString [

	self setTooltipText: aString utf8Encoded asString 
]

{ #category : #accessing }
GtkWidget >> translateCoordinates: aPoint to: aWidget [
	| result type xBuffer yBuffer |
	
	type := self class resolveType: 'gint'.
	xBuffer := type newBuffer.
	yBuffer := type newBuffer.
	
	result := self 
		translateCoordinatesTo: aWidget 
		x: aPoint x 
		y: aPoint y 
		toX: xBuffer 
		toY: yBuffer.
	
	^ result 
		ifTrue: [ (xBuffer signedLongAt: 1) @ (yBuffer signedLongAt: 1) ]
		ifFalse: [ aPoint ]
]

{ #category : #accessing }
GtkWidget >> translateCoordinatesTo: dest_widget x: src_x y: src_y toX: dest_x toY: dest_y [
	
	^ self ffiCall: #(gboolean gtk_widget_translate_coordinates (
		self,
		GtkWidget *dest_widget,
		gint src_x,
		gint src_y,
 		gint *dest_x,
 		gint *dest_y))
]

{ #category : #accessing }
GtkWidget >> vAlign [
	^ self ffiCall: #(GtkAlign gtk_widget_get_valign (self))
]

{ #category : #accessing }
GtkWidget >> vAlign: align [
	^ self ffiCall: #(void gtk_widget_set_valign (self, GtkAlign align))
]

{ #category : #accessing }
GtkWidget >> vExpand: expand [

	self ffiCall: #(void gtk_widget_set_vexpand (self, gboolean expand))
]

{ #category : #private }
GtkWidget >> widgetAddAccelerator: accel_signal group: accel_group key: accel_key modifiers: accel_mods accelFlags: accel_flags [

	^ self ffiCall: #(void gtk_widget_add_accelerator (
		self,
 		const gchar *accel_signal,
		GtkAccelGroup *accel_group,
		guint accel_key,
		GdkModifierType accel_mods,
		GtkAccelFlags accel_flags))
]

{ #category : #private }
GtkWidget >> widgetPathLength: path_length path: path reversed: path_reversed [
	^ self ffiCall: #(void gtk_widget_path (self, guint *path_length, gchar **path, gchar **path_reversed))
]

{ #category : #'private deferring' }
GtkWidget >> withAllChildrenDo: aBlock [

	aBlock cull: self
]
