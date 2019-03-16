"
I'm  a widget with two adjustable panes.

https://developer.gnome.org/gtk3/stable/GtkPaned.html
"
Class {
	#name : #GtkPaned,
	#superclass : #GtkContainer,
	#pools : [
		'GtkOrientation'
	],
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #'instance creation' }
GtkPaned class >> new [ 
	self error: 'Use one of my siblings'
]

{ #category : #'instance creation' }
GtkPaned class >> newHorizontal [
	^ (self panedNew: GTK_ORIENTATION_HORIZONTAL) initialize
]

{ #category : #'instance creation' }
GtkPaned class >> newVertical [
	^ (self panedNew: GTK_ORIENTATION_VERTICAL) initialize	
]

{ #category : #private }
GtkPaned class >> panedNew: orientation [
	^ self ffiCall: #(GtkPaned *gtk_paned_new (GtkOrientation orientation))
]

{ #category : #private }
GtkPaned >> basicPack1: child resize: resize shrink: shrink [ 

	^ self ffiCall: #(void gtk_paned_pack1 (self, GtkWidget *child, gboolean resize, gboolean shrink))
]

{ #category : #private }
GtkPaned >> basicPack2: child resize: resize shrink: shrink [
 
	^ self ffiCall: #(void gtk_paned_pack2 (self, GtkWidget *child, gboolean resize, gboolean shrink))
]

{ #category : #accessing }
GtkPaned >> pack1: child [

	^ self 
		pack1: child 
		resize: true 
		shrink: true
]

{ #category : #accessing }
GtkPaned >> pack1: child resize: resize shrink: shrink [ 

	self keepWidget: child.
	self 
		basicPack1: child 
		resize: resize 
		shrink: shrink 
]

{ #category : #accessing }
GtkPaned >> pack2: child [

	^ self 
		pack2: child 
		resize: true 
		shrink: true
]

{ #category : #accessing }
GtkPaned >> pack2: child resize: resize shrink: shrink [ 

	self keepWidget: child.
	self 
		basicPack2: child 
		resize: resize 
		shrink: shrink 
]

{ #category : #accessing }
GtkPaned >> position [

	self ffiCall: #(gint gtk_paned_get_position (self))
]

{ #category : #accessing }
GtkPaned >> position: position [

	self ffiCall: #(void gtk_paned_set_position (self, gint position))
]
