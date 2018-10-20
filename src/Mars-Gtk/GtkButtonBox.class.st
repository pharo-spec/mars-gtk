"
GtkButtonBox
GtkButtonBox — A container for arranging buttons

https://developer.gnome.org/gtk3/stable/GtkButtonBox.html
"
Class {
	#name : #GtkButtonBox,
	#superclass : #GtkBox,
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #private }
GtkButtonBox class >> buttonBoxNewOrientation: orientation [
	^ self ffiCall: #(GtkButtonBox *gtk_button_box_new (GtkOrientation orientation))
]

{ #category : #'instance creation' }
GtkButtonBox class >> newHorizontal [
	^ (self buttonBoxNewOrientation: GTK_ORIENTATION_HORIZONTAL) initialize
]

{ #category : #'instance creation' }
GtkButtonBox class >> newHorizontalSpacing: spacing [

	self shouldNotImplement
]

{ #category : #'instance creation' }
GtkButtonBox class >> newVertical [
	^ (self buttonBoxNewOrientation: GTK_ORIENTATION_VERTICAL) initialize
]

{ #category : #'instance creation' }
GtkButtonBox class >> newVerticalSpacing: spacing [

	self shouldNotImplement
]

{ #category : #'brick-layout' }
GtkButtonBox >> expandToFill [

	^ self layout: GtkButtonBoxStyle GTK_BUTTONBOX_EXPAND
]

{ #category : #'brick-layout' }
GtkButtonBox >> layout [

	^ self ffiCall: #(GtkButtonBoxStyle gtk_button_box_get_layout (self))
]

{ #category : #'brick-layout' }
GtkButtonBox >> layout: aLayout [

	^ self ffiCall: #(void gtk_button_box_set_layout (self, GtkButtonBoxStyle aLayout))
]

{ #category : #'brick-layout' }
GtkButtonBox >> placeAtCenter [

	^ self layout: GtkButtonBoxStyle GTK_BUTTONBOX_CENTER
]

{ #category : #'brick-layout' }
GtkButtonBox >> placeAtEdges [

	^ self layout: GtkButtonBoxStyle GTK_BUTTONBOX_EDGE
]

{ #category : #'brick-layout' }
GtkButtonBox >> placeAtEnd [

	^ self layout: GtkButtonBoxStyle GTK_BUTTONBOX_END
]

{ #category : #'brick-layout' }
GtkButtonBox >> placeAtStart [

	^ self layout: GtkButtonBoxStyle GTK_BUTTONBOX_START
]

{ #category : #'brick-layout' }
GtkButtonBox >> spreadEvenly [

	^ self layout: GtkButtonBoxStyle GTK_BUTTONBOX_SPREAD
]
