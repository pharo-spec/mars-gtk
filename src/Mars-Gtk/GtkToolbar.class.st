"
GtkToolbar — Create bars of buttons and other widgets

https://developer.gnome.org/gtk3/stable/GtkToolbar.html
"
Class {
	#name : #GtkToolbar,
	#superclass : #GtkContainer,
	#pools : [
		'GtkIconSize',
		'GtkToolbarStyle'
	],
	#category : #'Mars-Gtk-Widget-Toolbar'
}

{ #category : #'instance creation' }
GtkToolbar class >> new [
	^ self toolbarNew initialize 
]

{ #category : #private }
GtkToolbar class >> toolbarNew [
	^ self ffiCall: #(GtkToolbar *gtk_toolbar_new (void))
]

{ #category : #accessing }
GtkToolbar >> beBoth [
	^ self style: GTK_TOOLBAR_BOTH
]

{ #category : #accessing }
GtkToolbar >> beBothHorizontal [
	^ self style: GTK_TOOLBAR_BOTH_HORIZ
]

{ #category : #accessing }
GtkToolbar >> beIconSizeLargeToolbar [
	^ self iconSize: GTK_ICON_SIZE_LARGE_TOOLBAR
]

{ #category : #accessing }
GtkToolbar >> beIconSizeSmallToolbar [
	^ self iconSize: GTK_ICON_SIZE_SMALL_TOOLBAR
]

{ #category : #accessing }
GtkToolbar >> beIcons [
	^ self style: GTK_TOOLBAR_ICONS
]

{ #category : #accessing }
GtkToolbar >> beText [
	^ self style: GTK_TOOLBAR_TEXT
]

{ #category : #events }
GtkToolbar >> connectPopupContextMenu: aBlock [

	^ self 
		connect: 'popup-context-menu' 
		signature: #(gint (void *widget, int x, int y, int mouseButton, void *aData))  
 		do: [ :widget :x :y :aData | [ aBlock value: x value: y ] fork ]
]

{ #category : #accessing }
GtkToolbar >> dropHighlightItem: item atIndex: anIndex [

	^ self ffiCall: #(void gtk_toolbar_set_drop_highlight_item (self, GtkToolItem *item, gint anIndex))
]

{ #category : #accessing }
GtkToolbar >> iconSize [
	^ self ffiCall: #(GtkIconSize gtk_toolbar_get_icon_size (self))
]

{ #category : #accessing }
GtkToolbar >> iconSize: icon_size [
	^ self ffiCall: #(void gtk_toolbar_set_icon_size (self, GtkIconSize icon_size))
]

{ #category : #accessing }
GtkToolbar >> indexOf: item [

	^ self ffiCall: #(gint gtk_toolbar_get_item_index (self, GtkToolItem *item))
]

{ #category : #accessing }
GtkToolbar >> insert: item at: pos [
	"If pos is 0 the item is prepended to the start of the toolbar. 
	 If pos is negative, the item is appended to the end of the toolbar."
	^ self ffiCall: #(void gtk_toolbar_insert (self, GtkToolItem *item, gint pos))
]

{ #category : #accessing }
GtkToolbar >> itemAt: anIndex [

	^ self ffiCall: #(GtkToolItem * gtk_toolbar_get_nth_item (self, gint anIndex))
]

{ #category : #accessing }
GtkToolbar >> positionAt: aPoint [

	^ self positionAtX: aPoint x y: aPoint y
]

{ #category : #accessing }
GtkToolbar >> positionAtX: x y: y [

	^ self ffiCall: #(gint gtk_toolbar_get_drop_index (self, gint x, gint y))
]

{ #category : #accessing }
GtkToolbar >> reliefStyle [
	^ self ffiCall: #(GtkReliefStyle gtk_toolbar_get_relief_style (self))
]

{ #category : #accessing }
GtkToolbar >> reliefStyle: style [

	^ self ffiCall: #(void gtk_toolbar_set_style (self, GtkToolbarStyle style))
]

{ #category : #accessing }
GtkToolbar >> showOverflowArrow: aBoolean [

	^ self ffiCall: #(void gtk_toolbar_set_show_arrow (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkToolbar >> showsOverflowArrow [

	^ self ffiCall: #(gboolean gtk_toolbar_get_show_arrow (self))
]

{ #category : #accessing }
GtkToolbar >> size [

	^ self ffiCall: #(gint gtk_toolbar_get_n_items (self))
]

{ #category : #accessing }
GtkToolbar >> style [
	^ self ffiCall: #(GtkToolbarStyle gtk_toolbar_get_style (self))
]

{ #category : #accessing }
GtkToolbar >> style: style [
	^ self ffiCall: #(void gtk_toolbar_set_style (self, GtkToolbarStyle style))
]

{ #category : #accessing }
GtkToolbar >> unsetIconSize [
	^ self ffiCall: #(void gtk_toolbar_unset_icon_size (self))
]

{ #category : #accessing }
GtkToolbar >> unsetStyle [
	^ self ffiCall: #(void gtk_toolbar_unset_style (self))
]
