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
	#category : 'Mars-Gtk-Widget'
}

{ #category : #private }
GtkLabel class >> labelNew: str [
	^ self ffiCall: #(GtkLabel *gtk_label_new (const gchar *str))
]

{ #category : #'instance creation' }
GtkLabel class >> new [
	^ self newLabel: nil
]

{ #category : #'instance creation' }
GtkLabel class >> newLabel: aString [
	^ (self labelNew: aString) initialize
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
	self hAlign: GTK_ALIGN_START.
	self vAlign: GTK_ALIGN_START
]

{ #category : #private }
GtkLabel >> justify: jtype [ 
	self ffiCall: #(void gtk_label_set_justify (self, GtkJustification jtype))
]

{ #category : #accessing }
GtkLabel >> text [
	^ self ffiCall: #(const gchar *gtk_label_get_text (self))
]

{ #category : #accessing }
GtkLabel >> text: str [
	^ self ffiCall: #(void gtk_label_set_text (self, const gchar *str))
]
