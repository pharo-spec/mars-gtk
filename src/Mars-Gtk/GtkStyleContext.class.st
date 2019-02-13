Class {
	#name : #GtkStyleContext,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Styles'
}

{ #category : #accessing }
GtkStyleContext >> font [
	^ self font: GtkStateFlags GTK_STATE_FLAG_NORMAL 
]
