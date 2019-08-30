"
GtkLayout
GtkLayout — Infinite scrollable area containing child widgets and/or custom drawing

https://developer.gnome.org/gtk3/stable/GtkLayout.html
"
Class {
	#name : #GtkLayout,
	#superclass : #GtkContainer,
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #accessing }
GtkLayout class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gtk_layout_init(void *object))
]

{ #category : #accessing }
GtkLayout class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_layout_get_type())
]

{ #category : #private }
GtkLayout class >> gtkNewLayoutWithHorizontalAdjustment: horizontalAdjustment withVerticalAdjustment: verticalAdjustment [ 

	^ self ffiCall: #(GtkLayout *gtk_layout_new (GtkAdjustment *horizontalAdjustment,
                GtkAdjustment *verticalAdjustment))
]

{ #category : #'instance creation' }
GtkLayout class >> new [

	^ self
		withHorizontalAdjustment: (GtkAdjustment newDefault)
		withVerticalAdjustment: (GtkAdjustment newDefault)
]

{ #category : #'instance creation' }
GtkLayout class >> withHorizontalAdjustment: horizontalAdjustment withVerticalAdjustment: verticalAdjustment [

	^ (self
		gtkNewLayoutWithHorizontalAdjustment: horizontalAdjustment
		withVerticalAdjustment: verticalAdjustment)
		initialize
			
]

{ #category : #accessing }
GtkLayout >> moveChild: aChild to: aPoint [

	self moveChild: aChild toX: aPoint x toY: aPoint y.
]

{ #category : #accessing }
GtkLayout >> moveChild: aChild toX: x toY: y [

	^ self ffiCall: #(void gtk_layout_move (self,
                GtkWidget *aChild,
                gint x,
                gint y))
]

{ #category : #accessing }
GtkLayout >> putChild: aChild at: aPoint [
	self keepWidget: aChild.
	self putChild: aChild atX: aPoint x atY: aPoint y.
]

{ #category : #accessing }
GtkLayout >> putChild: aChild atX: x atY: y [

	^ self ffiCall: #(void gtk_layout_put (self,
                GtkWidget *aChild,
                gint x,
                gint y))
]
