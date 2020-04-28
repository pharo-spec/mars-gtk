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

{ #category : #accessing }
GtkWidget class >> gClassSize [

	^ 824
]

{ #category : #accessing }
GtkWidget class >> gSize [

	^ 32
]

{ #category : #accessing }
GtkWidget class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_widget_get_type())
]

{ #category : #private }
GtkWidget class >> widgetDestroy: widget [
	"I get a handle here (a void *) so I need to remap the function"
	self ffiCall: #(void gtk_widget_destroy ("GtkWidget *" void *widget))
]

{ #category : #accessing }
GtkWidget >> addAccelerator: aString group: anAccelGroup shortcut: aShortcut [
	| charValue modifiers |

	charValue := aShortcut platformCharacter asciiValue.
	modifiers := aShortcut platformModifier asGdkModifierType.
		
	self 
		widgetAddAccelerator: aString 
		group: anAccelGroup 
		key: charValue
		modifiers: modifiers
		accelFlags: GTK_ACCEL_VISIBLE
		
]

{ #category : #style }
GtkWidget >> addClass: aString [

	self styleContext addClass: aString
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

{ #category : #initialization }
GtkWidget >> autoObjectUnref [

	"do not unref"
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

{ #category : #drawing }
GtkWidget >> boundingBox [
	^ self positionInTopLevel corner: self positionInTopLevel + self size
]

{ #category : #private }
GtkWidget >> canDefault: can_default [

	self ffiCall: #(void gtk_widget_set_can_default (self, gboolean can_default))
]

{ #category : #private }
GtkWidget >> canFocus: can_focus [

	^ self ffiCall: #(void gtk_widget_set_can_focus (self, gboolean can_focus))
]

{ #category : #signaling }
GtkWidget >> connectButtonPressEvent: aBlock [
	"connects to button-press-event signal 
	 aBlock needs to answer a boolean to stop or not event propagation"

	^ (GButtonPressEventCallback do: aBlock) connectTo: self	

]

{ #category : #signaling }
GtkWidget >> connectButtonReleaseEvent: aBlock [
	"connects to button-release-event signal 
	 aBlock needs to answer a boolean to stop or not event propagation"

	^ (GButtonReleaseEventCallback do: aBlock) connectTo: self

]

{ #category : #signaling }
GtkWidget >> connectClicked: aBlock [

	(GClickedCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectDeleteEvent: aBlock [
	"answers whether the widget can be deleted ot not"
	
	^ (GDeleteEventCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectDestroy: aBlock [

	(GDestroyCallback do: [ :widget :aData | aBlock value ]) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectDoubleClicked: aBlock [
	
	(GDoubleClickButtonPressEventCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectEnterNotify: aBlock [
	"connects to motion_notify_event signal.
	 aBlock needs to answer a boolean to stop or not event propagation"

	^ (GEnterNotifyEventCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectEvent: aBlock [

	(GEventCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectEventAfter: aBlock [

	(GEventAfterCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectFocusInEvent: aBlock [
	
	(GFocusInEventCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectFocusOutEvent: aBlock [

	(GFocusOutEventCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectHide: aBlock [

	(GHideCallback do: [ :widget :user_data | aBlock value ]) connectTo: self 
]

{ #category : #signaling }
GtkWidget >> connectKeyPressEvent: aBlock [

	^ (GKeyPressEventCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectKeyReleaseEvent: aBlock [

	^ (GKeyReleaseEventCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectLeaveNotify: aBlock [
	"connects to motion_notify_event signal.
	 aBlock needs to answer a boolean to stop or not event propagation"

	^ (GLeaveNotifyEventCallback do: aBlock) connectTo: self

]

{ #category : #signaling }
GtkWidget >> connectMotionNotify: aBlock [
	"connects to motion_notify_event signal.
	 aBlock needs to answer a boolean to stop or not event propagation"

	^ (GMotionNotifyEventCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectRealize: aBlock [

	^ self 
		connect: 'realize' 
		do: aBlock
]

{ #category : #signaling }
GtkWidget >> connectRightClicked: aBlock [
	"connect to button-press-event signal but evaluates if this is 'secondary button', 
	 which is right click.
	 aBlock needs to answer a boolean to stop or not event propagation"
	
	(GSecondaryButtonPressEventCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkWidget >> connectScroll: aBlock [
	"connects to scroll_event signal.
	 aBlock needs to answer a boolean to stop or not event propagation"

	^ (GScrollEventCallback do: aBlock) connectTo: self

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
	 this is an extension to Gtk3, but it will make our lifes easier this side :).
	 It receives a valuable (usually a block)"

	self connectRightClicked: [ :event |
		aGtkMenu 
			showAll;
			popupAtPointer: event.
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

{ #category : #initialization }
GtkWidget >> delete [

	self isAlive ifFalse: [ ^ self ].
	self destroy
]

{ #category : #accessing }
GtkWidget >> destroy [
	
	^ self ffiCall: #(void gtk_widget_destroy (self))
]

{ #category : #private }
GtkWidget >> display [

	^ self ffiCall: #(GdkDisplay *gtk_widget_get_display (self))
]

{ #category : #private }
GtkWidget >> dragDestSetFlags: flags targetsTypes: targets targetsAmount: n_targets actions: actions [
"Sets a widget as a potential drop destination, and adds default behaviors.

The default behaviors listed in flags have an effect similar to installing default handlers for the widget’s drag-and-drop signals (“drag-motion”, “drag-drop”, ...). They all exist for convenience. When passing GTK_DEST_DEFAULT_ALL for instance it is sufficient to connect to the widget’s “drag-data-received” signal to get primitive, but consistent drag-and-drop support.

Things become more complicated when you try to preview the dragged data, as described in the documentation for “drag-motion”. The default behaviors described by flags make some assumptions, that can conflict with your own signal handlers. For instance GTK_DEST_DEFAULT_DROP causes invokations of gdk_drag_status() in the context of “drag-motion”, and invokations of gtk_drag_finish() in “drag-data-received”. Especially the later is dramatic, when your own “drag-motion” handler calls gtk_drag_get_data() to inspect the dragged data.

There’s no way to set a default action here, you can use the “drag-motion” callback for that. Here’s an example which selects the action to use depending on whether the control key is pressed or not:"
	^ self
		ffiCall:
			#(void gtk_drag_dest_set #(self , GtkDestDefaults flags , const GtkTargetEntry * targets , gint n_targets , GdkDragAction actions))
]

{ #category : #private }
GtkWidget >> dragDestUnset [
	"Clears information about a drop destination set with gtk_drag_dest_set(). The widget will no longer receive notification of drags."
	^ self ffiCall: #(void gtk_drag_dest_unset #(self))
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

{ #category : #accessing }
GtkWidget >> fontMap: font_map [

	^ self ffiCall: #(void gtk_widget_set_font_map (self, PangoFontMap *font_map))
]

{ #category : #accessing }
GtkWidget >> gdkWindow [

	^ self ffiCall: #(GdkWindow *gtk_widget_get_window (self))
]

{ #category : #private }
GtkWidget >> getAllocatedHeight [
	"Returns the height that has currently been allocated to widget . This function is intended to be used when implementing handlers for the “draw” function."

	^ self ffiCall: #(int gtk_widget_get_allocated_height(self))
]

{ #category : #private }
GtkWidget >> getAllocatedWidth [
	"Returns the width that has currently been allocated to widget . This function is intended to be used when implementing handlers for the “draw” function."

	^ self ffiCall: #(int gtk_widget_get_allocated_width(self))
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

{ #category : #private }
GtkWidget >> getWindow [
	"Returns the height that has currently been allocated to widget . This function is intended to be used when implementing handlers for the “draw” function."

	^ self
		ffiCall: #(GtkWindow *gtk_widget_get_window(self))
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

{ #category : #geometry }
GtkWidget >> height [

	^ self getAllocatedHeight
]

{ #category : #geometry }
GtkWidget >> height: aNumber [

	self sizeRequest: self width @ aNumber
]

{ #category : #showing }
GtkWidget >> hide [

	self ffiCall: #(void gtk_widget_hide (self))
]

{ #category : #testing }
GtkWidget >> isConfiguredVisible [
	^ self ffiCall: #(gboolean gtk_widget_get_visible (self))
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

{ #category : #drawing }
GtkWidget >> positionInTopLevel [

	self parentWindow ifNil: [ ^ 0@0 ].
	^ self 
		translateCoordinates: 0@0
		to: self parentWindow
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

{ #category : #accessing }
GtkWidget >> queueDraw [

	^ GtkQueueDraw uniqueInstance queueDraw: self
]

{ #category : #accessing }
GtkWidget >> queueDrawArea: rect [

	^ GtkQueueDraw uniqueInstance 
		queueDrawArea: self
		x: rect left 
		y: rect top
		width: rect width 
		height: rect height
]

{ #category : #style }
GtkWidget >> removeClass: aString [

	self styleContext removeClass: aString
]

{ #category : #'external resource management' }
GtkWidget >> resourceData [
	^ handle
]

{ #category : #geometry }
GtkWidget >> scaleFactor [
	"See https://developer.gnome.org/gtk3/stable/GtkWidget.html#gtk-widget-get-scale-factor"

	^ self ffiCall: #(gint gtk_widget_get_scale_factor (self))
]

{ #category : #accessing }
GtkWidget >> sensitive [
	
	^ self ffiCall: #(gboolean gtk_widget_get_sensitive (self))
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

	self ffiCall: #(void gtk_widget_show_all (self))
]

{ #category : #geometry }
GtkWidget >> size [

	^  self width @ self height
]

{ #category : #geometry }
GtkWidget >> sizeRequest: aPoint [
	self sizeRequestWidth: aPoint x height: aPoint y
]

{ #category : #private }
GtkWidget >> sizeRequestWidth: width height: height [
	^ self ffiCall: #(void gtk_widget_set_size_request ( self, gint width, gint height ) )
]

{ #category : #style }
GtkWidget >> styleContext [
	
	^ self ffiCall: #(GtkStyleContext *gtk_widget_get_style_context (self))
]

{ #category : #TOREMOVE }
GtkWidget >> takeKeyboardFocus [
	
	self flag: #TODO.
]

{ #category : #accessing }
GtkWidget >> tooltipText [
	
	^ self ffiCall: #(String gtk_widget_get_tooltip_text (self))
]

{ #category : #accessing }
GtkWidget >> tooltipText: aString [

	self setTooltipText: aString
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

{ #category : #geometry }
GtkWidget >> width [

	^ self getAllocatedWidth
]

{ #category : #geometry }
GtkWidget >> width: aNumber [

	self sizeRequest: aNumber @ self height
]

{ #category : #'private deferring' }
GtkWidget >> withAllChildrenDo: aBlock [

	aBlock cull: self
]
