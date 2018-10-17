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

{ #category : #accessing }
GtkPaned >> pack1: child [
	^ self pack1: child resize: true shrink: true
]

{ #category : #accessing }
GtkPaned >> pack1: child resize: resize shrink: shrink [ 
	^ self ffiCall: #(void gtk_paned_pack1 (self, GtkWidget *child, gboolean resize, gboolean shrink))
]

{ #category : #accessing }
GtkPaned >> pack2: child [
	^ self pack2: child resize: true shrink: true
]

{ #category : #accessing }
GtkPaned >> pack2: child resize: resize shrink: shrink [ 
	^ self ffiCall: #(void gtk_paned_pack2 (self, GtkWidget *child, gboolean resize, gboolean shrink))
]
