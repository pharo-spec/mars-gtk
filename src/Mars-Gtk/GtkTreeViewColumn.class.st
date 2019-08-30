"
GtkTreeViewColumn
GtkTreeViewColumn — A visible column in a GtkTreeView widget

https://developer.gnome.org/gtk3/stable/GtkTreeViewColumn.html
"
Class {
	#name : #GtkTreeViewColumn,
	#superclass : #GObject,
	#instVars : [
		'renderers'
	],
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #accessing }
GtkTreeViewColumn class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gtk_tree_view_column_init(void *object))
]

{ #category : #accessing }
GtkTreeViewColumn class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_tree_view_column_get_type())
]

{ #category : #'instance creation' }
GtkTreeViewColumn class >> new [

	^ self treeViewColumnNew initialize
]

{ #category : #private }
GtkTreeViewColumn class >> treeViewColumnNew [

	^ self ffiCall: #(GtkTreeViewColumn *gtk_tree_view_column_new (void))
]

{ #category : #accessing }
GtkTreeViewColumn >> addAttribute: attribute column: column renderer: aRenderer [

	self ffiCall: #(void gtk_tree_view_column_add_attribute (
		self,
		GtkCellRendererText *aRenderer,
		const gchar *attribute,
		gint column))
]

{ #category : #accessing }
GtkTreeViewColumn >> beResizable [

	self resizable: true
]

{ #category : #private }
GtkTreeViewColumn >> gtkTreeViewColumnGetTitle [

	^ self ffiCall: #(String gtk_tree_view_column_get_title (self))
]

{ #category : #private }
GtkTreeViewColumn >> gtkTreeViewColumnPackEnd: cell expand: expand [

	self ffiCall: #(void gtk_tree_view_column_pack_end (
		self,
		GtkCellRendererText *cell,
		gboolean aBoolean))
]

{ #category : #private }
GtkTreeViewColumn >> gtkTreeViewColumnPackStart: cell expand: expand [

	self ffiCall: #(void gtk_tree_view_column_pack_start (
		self,
		GtkCellRendererText *cell,
		gboolean expand))
]

{ #category : #private }
GtkTreeViewColumn >> gtkTreeViewColumnSetTitle: string [

	self ffiCall: #(void gtk_tree_view_column_set_title (self, String string))
]

{ #category : #accessing }
GtkTreeViewColumn >> id [
	^ self title
]

{ #category : #initialization }
GtkTreeViewColumn >> initialize [

	super initialize.
	renderers := #()
]

{ #category : #testing }
GtkTreeViewColumn >> isEditable [
	
	^ renderers anySatisfy: #isEditable 
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
GtkTreeViewColumn >> packEnd: aRenderer [

	self packEnd: aRenderer expand: true
]

{ #category : #accessing }
GtkTreeViewColumn >> packEnd: aRenderer expand: aBoolean [

	renderers := renderers copyWith: aRenderer.
	self 
		gtkTreeViewColumnPackEnd: aRenderer 
		expand: aBoolean
]

{ #category : #accessing }
GtkTreeViewColumn >> packStart: aRenderer [

	self packStart: aRenderer expand: true 
		
]

{ #category : #accessing }
GtkTreeViewColumn >> packStart: aRenderer expand: aBoolean [

	renderers := renderers copyWith: aRenderer.
	self 
		gtkTreeViewColumnPackStart: aRenderer 
		expand: aBoolean
]

{ #category : #private }
GtkTreeViewColumn >> resizable: resizable [

	^ self ffiCall: #(void gtk_tree_view_column_set_resizable (self, gboolean resizable))
]

{ #category : #accessing }
GtkTreeViewColumn >> title [

	^ self gtkTreeViewColumnGetTitle
]

{ #category : #accessing }
GtkTreeViewColumn >> title: aString [

	self gtkTreeViewColumnSetTitle: aString
]
