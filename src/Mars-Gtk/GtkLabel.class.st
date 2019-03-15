"
I'm a widget that displays a small to medium amount of text.

https://developer.gnome.org/gtk3/stable/GtkLabel.html


"
Class {
	#name : #GtkLabel,
	#superclass : #GtkWidget,
	#pools : [
		'GtkJustification'
	],
	#category : #'Mars-Gtk-Widget-Display'
}

{ #category : #private }
GtkLabel class >> labelNew: str [
	^ self ffiCall: #(GtkLabel *gtk_label_new (String str))
]

{ #category : #'instance creation' }
GtkLabel class >> new [
	^ (self labelNew: nil) initialize
]

{ #category : #'instance creation' }
GtkLabel class >> newLabel: aString [

	^ (self labelNew: aString) initialize
]

{ #category : #private }
GtkLabel >> basicText [
	^ self ffiCall: #(String gtk_label_get_text (self))
]

{ #category : #private }
GtkLabel >> basicText: utf8EncodedString [

	^ self ffiCall: #(void gtk_label_set_text (self, String utf8EncodedString))
]

{ #category : #accessing }
GtkLabel >> beJustifyCenter [
	self justify: GTK_JUSTIFY_CENTER
]

{ #category : #accessing }
GtkLabel >> beJustifyFill [
	self justify: GTK_JUSTIFY_FILL
]

{ #category : #accessing }
GtkLabel >> beJustifyLeft [
	self justify: GTK_JUSTIFY_LEFT
]

{ #category : #accessing }
GtkLabel >> beJustifyRight [
	self justify: GTK_JUSTIFY_RIGHT
]

{ #category : #initialization }
GtkLabel >> initialize [ 
	super initialize.
	self beHAlignStart.
	self beVAlignCenter
]

{ #category : #accessing }
GtkLabel >> justify: jtype [ 
	self ffiCall: #(void gtk_label_set_justify (self, GtkJustification jtype))
]

{ #category : #accessing }
GtkLabel >> label [
	
	self ffiCall: #(String gtk_label_get_label (self))
]

{ #category : #accessing }
GtkLabel >> label: aString [ 
	
	self ffiCall: #(void gtk_label_set_label (self, String aString))
]

{ #category : #accessing }
GtkLabel >> text [
	
	^ self basicText
]

{ #category : #accessing }
GtkLabel >> text: str [
	
	self basicText: str
]
