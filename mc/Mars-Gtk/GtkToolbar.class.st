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
	#category : 'Mars-Gtk-Container'
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

{ #category : #accessing }
GtkToolbar >> iconSize: icon_size [
	^ self ffiCall: #(void gtk_toolbar_set_icon_size (self, GtkIconSize icon_size))
]

{ #category : #accessing }
GtkToolbar >> insert: item at: pos [
	"If pos is 0 the item is prepended to the start of the toolbar. 
	 If pos is negative, the item is appended to the end of the toolbar."
	^ self ffiCall: #(void gtk_toolbar_insert (self, GtkToolItem *item, gint pos))
]

{ #category : #accessing }
GtkToolbar >> style: style [
	^ self ffiCall: #(void gtk_toolbar_set_style (self, GtkToolbarStyle style))
]
