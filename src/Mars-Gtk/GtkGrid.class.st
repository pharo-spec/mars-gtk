"
I pack widgets in a rows and columns.

https://developer.gnome.org/gtk3/stable/GtkGrid.html


"
Class {
	#name : #GtkGrid,
	#superclass : #GtkContainer,
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #accessing }
GtkGrid class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_grid_get_type())
]

{ #category : #private }
GtkGrid class >> gridNew [
	^ self ffiCall: #(GtkGrid *gtk_grid_new (void))
]

{ #category : #'instance creation' }
GtkGrid class >> new [ 
	^ self gridNew initialize
]

{ #category : #accessing }
GtkGrid >> attach: child at: aPoint [

	^ self 
		attach: child 
		at: aPoint
		span: 1@1
]

{ #category : #accessing }
GtkGrid >> attach: child at: aPoint span: spanPoint [
	
	self keepWidget: child.
	^ self 
		attach: child 
		left: aPoint x
		top: aPoint y 
		width: spanPoint x 
		height: spanPoint y
]

{ #category : #private }
GtkGrid >> attach: child left: left top: top width: width height: height [
	self ffiCall: #(void gtk_grid_attach (
		self, 
		GtkWidget *child, 
		gint left, 
		gint top, 
		gint width, 
		gint height))
]

{ #category : #accessing }
GtkGrid >> columnHomogeneous: homogeneous [

	self ffiCall: #(void gtk_grid_set_column_homogeneous (self, gboolean homogeneous))
]

{ #category : #accessing }
GtkGrid >> columnSpacing [

	^ self ffiCall: #(guint gtk_grid_get_column_spacing (self))
]

{ #category : #accessing }
GtkGrid >> columnSpacing: spacing [

	self ffiCall: #(void gtk_grid_set_column_spacing (self, guint spacing))
]

{ #category : #testing }
GtkGrid >> isColumnHomogeneous [

	^ self ffiCall: #(gboolean gtk_grid_get_column_homogeneous (self))
]

{ #category : #testing }
GtkGrid >> isRowHomogeneous [

	^ self ffiCall: #(gboolean gtk_grid_get_row_homogeneous (self))
]

{ #category : #accessing }
GtkGrid >> rowHomogeneous: homogeneous [

	self ffiCall: #(void gtk_grid_set_row_homogeneous (self, gboolean homogeneous))
]

{ #category : #accessing }
GtkGrid >> rowSpacing [

	^ self ffiCall: #(guint gtk_grid_get_row_spacing (self))
]

{ #category : #accessing }
GtkGrid >> rowSpacing: spacing [

	self ffiCall: #(void gtk_grid_set_row_spacing (self, guint spacing))
]
