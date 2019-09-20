"
GtkScrollable — An interface for scrollable widgets

https://developer.gnome.org/gtk3/stable/GtkScrollable.html
"
Trait {
	#name : #GtkTScrollable,
	#category : #'Mars-Gtk-Widget'
}

{ #category : #accessing }
GtkTScrollable >> hAdjustment [

	^ self ffiCall: #(GtkAdjustment *gtk_scrollable_get_hadjustment (self))
]

{ #category : #accessing }
GtkTScrollable >> hAdjustment: adjustment [

	^ self ffiCall: #(void gtk_scrollable_set_hadjustment (self, GtkAdjustment *adjustment))
]

{ #category : #accessing }
GtkTScrollable >> vAdjustment [

	^ self ffiCall: #(GtkAdjustment *gtk_scrollable_get_vadjustment (self))
]

{ #category : #accessing }
GtkTScrollable >> vAdjustment: adjustment [

	^ self ffiCall: #(void gtk_scrollable_set_vadjustment (self, GtkAdjustment *adjustment))
]
