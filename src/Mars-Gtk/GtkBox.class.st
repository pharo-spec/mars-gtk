"
GtkBox — A container box.

https://developer.gnome.org/gtk3/stable/GtkBox.html
"
Class {
	#name : #GtkBox,
	#superclass : #GtkContainer,
	#pools : [
		'GtkOrientation'
	],
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #private }
GtkBox class >> boxNewOrientation: orientation spacing: spacing [

	^ self ffiCall: #(GtkBox *gtk_box_new (GtkOrientation orientation, gint spacing))
]

{ #category : #accessing }
GtkBox class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_box_get_type())
]

{ #category : #'instance creation' }
GtkBox class >> new [ 
	self error: 'Use one of my siblings'
]

{ #category : #'instance creation' }
GtkBox class >> newHorizontal [
	^ self newHorizontalSpacing: 0
]

{ #category : #'instance creation' }
GtkBox class >> newHorizontalSpacing: spacing [
	^ (self boxNewOrientation: GTK_ORIENTATION_HORIZONTAL spacing: spacing) initialize
]

{ #category : #'instance creation' }
GtkBox class >> newVertical [
	^ self newVerticalSpacing: 0
]

{ #category : #'instance creation' }
GtkBox class >> newVerticalSpacing: spacing [
	^ (self boxNewOrientation: GTK_ORIENTATION_VERTICAL spacing: spacing) initialize
]

{ #category : #accessing }
GtkBox >> add: child [
	"Add is not a valid message for boxes (they use pack* family)"
	
	"self shouldNotImplement"
	^ self packStart: child
]

{ #category : #private }
GtkBox >> basicPackEnd: child expand: expand fill: fill padding: padding [ 
	^ self ffiCall: #(void gtk_box_pack_end (
		self, 
		GtkWidget *child, 
		gboolean expand, 
		gboolean fill, 
		guint padding))
]

{ #category : #private }
GtkBox >> basicPackStart: child expand: expand fill: fill padding: padding [ 
	^ self ffiCall: #(void gtk_box_pack_start (
		self, 
		GtkWidget *child, 
		gboolean expand, 
		gboolean fill, 
		guint padding))
]

{ #category : #accessing }
GtkBox >> homogeneous: homogeneous [
	self ffiCall: #(void gtk_box_set_homogeneous (self, gboolean homogeneous)) 
]

{ #category : #testing }
GtkBox >> isHomogeneous [
	self ffiCall: #(gboolean gtk_box_get_homogeneous (self)) 
]

{ #category : #accessing }
GtkBox >> packEnd: child [

	^ self packEnd: child expand: true fill: true padding: 0 
]

{ #category : #accessing }
GtkBox >> packEnd: child expand: expand fill: fill padding: padding [

	self keepWidget: child.
	self basicPackEnd: child expand: expand fill: fill padding: padding.

	^ child
]

{ #category : #accessing }
GtkBox >> packEnd: child padding: padding [

	^ self packEnd: child expand: true fill: true padding: padding
]

{ #category : #accessing }
GtkBox >> packStart: child [

	^ self packStart: child expand: true fill: true padding: 0
]

{ #category : #accessing }
GtkBox >> packStart: child expand: expand fill: fill padding: padding [ 

	self keepWidget: child.
	self basicPackStart: child expand: expand fill: fill padding: padding.

	^ child
]

{ #category : #accessing }
GtkBox >> packStart: child padding: padding [

	^ self packStart: child expand: true fill: true padding: padding
]

{ #category : #accessing }
GtkBox >> spacing [
		^ self ffiCall: #(gint gtk_box_get_spacing (self))
]

{ #category : #accessing }
GtkBox >> spacing: 	spacing [
		^ self ffiCall: #(void gtk_box_set_spacing (self, gint spacing))
]
