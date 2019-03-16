"
GtkFixed
GtkFixed — A container which allows you to position widgets at fixed coordinates

https://developer.gnome.org/gtk3/stable/GtkFixed.html
"
Class {
	#name : #GtkFixed,
	#superclass : #GtkContainer,
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #private }
GtkFixed class >> gtkFixedNew [

	^ self ffiCall: #(GtkFixed *gtk_fixed_new ())
]

{ #category : #'instance creation' }
GtkFixed class >> new [

	^ self gtkFixedNew initialize
]

{ #category : #accessing }
GtkFixed >> moveChild: aChild to: aPoint [

	self moveChild: aChild toX: aPoint x toY: aPoint y.
]

{ #category : #accessing }
GtkFixed >> moveChild: aChild toX: x toY: y [

	^ self ffiCall: #(void gtk_fixed_move (self,
                GtkWidget *aChild,
                gint x,
                gint y))
]

{ #category : #accessing }
GtkFixed >> putChild: aChild at: aPoint [
	self keepWidget: aChild.
	self putChild: aChild atX: aPoint x atY: aPoint y.
]

{ #category : #accessing }
GtkFixed >> putChild: aChild atX: x atY: y [

	^ self ffiCall: #(void gtk_fixed_put (self,
                GtkWidget *aChild,
                gint x,
                gint y))
]
