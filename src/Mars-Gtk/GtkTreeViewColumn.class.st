"
GtkTreeViewColumn
GtkTreeViewColumn — A visible column in a GtkTreeView widget

https://developer.gnome.org/gtk3/stable/GtkTreeViewColumn.html
"
Class {
	#name : #GtkTreeViewColumn,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #'instance creation' }
GtkTreeViewColumn class >> new [

	^ self treeViewColumnNew initialize
]

{ #category : #private }
GtkTreeViewColumn class >> treeViewColumnNew [

	^ self ffiCall: #(GtkTreeViewColumn *gtk_tree_view_column_new (void))
]

{ #category : #private }
GtkTreeViewColumn >> gtkTreeViewColumnGetTitle [

	^ self ffiCall: #(const gchar * gtk_tree_view_column_get_title (self))
]

{ #category : #private }
GtkTreeViewColumn >> gtkTreeViewColumnPackStart: aRenderer andExpand: aBoolean [

	self ffiCall: #(void gtk_tree_view_column_pack_start (self,
                                 GtkCellRendererText *aRenderer,
                                 gboolean aBoolean))
]

{ #category : #private }
GtkTreeViewColumn >> gtkTreeViewColumnSetTitle: encodedBytes [

	self ffiCall: #(void gtk_tree_view_column_set_title (self, const gchar *encodedBytes))
]

{ #category : #testing }
GtkTreeViewColumn >> isResizable [ 

	^ self ffiCall: #(gboolean gtk_tree_view_column_get_resizable (self))
]

{ #category : #accessing }
GtkTreeViewColumn >> maxWidth [

	^ self ffiCall: #(gint gtk_tree_view_column_get_max_width (self))
]

{ #category : #accessing }
GtkTreeViewColumn >> maxWidth: max_width [

	^ self ffiCall: #(void gtk_tree_view_column_set_max_width (self, gint max_width))
]

{ #category : #accessing }
GtkTreeViewColumn >> minWidth [

	^ self ffiCall: #(gint gtk_tree_view_column_get_min_width (self) )
]

{ #category : #accessing }
GtkTreeViewColumn >> minWidth: min_width [

	^ self ffiCall: #(void gtk_tree_view_column_set_min_width (self, gint min_width) )
]

{ #category : #accessing }
GtkTreeViewColumn >> renderer: aRenderer [

	self gtkTreeViewColumnPackStart: aRenderer andExpand: true
]

{ #category : #accessing }
GtkTreeViewColumn >> resizable: resizable [

	^ self ffiCall: #(void gtk_tree_view_column_set_resizable (self, gboolean resizable))
]

{ #category : #accessing }
GtkTreeViewColumn >> setAttribute: attribute toColumAtIndex: column forRenderer: aRenderer [

	self ffiCall: #(void gtk_tree_view_column_add_attribute (self,
                                    GtkCellRendererText *aRenderer,
                                    const gchar *attribute,
                                    gint column))
]

{ #category : #accessing }
GtkTreeViewColumn >> title [

	^ self gtkTreeViewColumnGetTitle utf8Decoded
]

{ #category : #accessing }
GtkTreeViewColumn >> title: aString [

	self gtkTreeViewColumnSetTitle: aString utf8Encoded asString
]
