"
GtkButton — A widget that emits a signal when clicked on

https://developer.gnome.org/gtk3/stable/GtkButton.html
"
Class {
	#name : #GtkButton,
	#superclass : #GtkWidget,
	#pools : [
		'GtkPositionType'
	],
	#category : 'Mars-Gtk-Widget'
}

{ #category : #private }
GtkButton class >> buttonNew [
	^ self ffiCall: #(GtkButton *gtk_button_new ())
]

{ #category : #private }
GtkButton class >> buttonNewWithLabel: label [
	^ self ffiCall: #(GtkButton *gtk_button_new_with_label (const gchar *label))
]

{ #category : #'instance creation' }
GtkButton class >> new [ 
	^ self buttonNew initialize
]

{ #category : #'instance creation' }
GtkButton class >> newLabel: aString [
	^ (self buttonNewWithLabel: aString utf8Encoded) initialize
]

{ #category : #accessing }
GtkButton >> alwaysShowImage: always_show [
	^ self ffiCall: #(void gtk_button_set_always_show_image (self, gboolean always_show))
]

{ #category : #accessing }
GtkButton >> beImagePositionBottom [
	self imagePosition: GTK_POS_BOTTOM
]

{ #category : #accessing }
GtkButton >> beImagePositionLeft [
	self imagePosition: GTK_POS_LEFT
]

{ #category : #accessing }
GtkButton >> beImagePositionRight [
	self imagePosition: GTK_POS_RIGHT
]

{ #category : #accessing }
GtkButton >> beImagePositionTop [
	self imagePosition: GTK_POS_TOP
]

{ #category : #private }
GtkButton >> gtkButtonGetLabel [

	^ self ffiCall: #(gchar *gtk_button_get_label(self))
]

{ #category : #private }
GtkButton >> gtkButtonSetLabel: utf8EncodedBytes [

	self ffiCall: #(void gtk_button_set_label(self, gchar *utf8EncodedBytes))
]

{ #category : #accessing }
GtkButton >> image [ 
	^ self ffiCall: #(GtkImage *gtk_button_get_image (self))
]

{ #category : #accessing }
GtkButton >> image: image [
	self ffiCall: #(void gtk_button_set_image (self, GtkWidget *image))
]

{ #category : #accessing }
GtkButton >> imagePosition: position [
	^ self ffiCall: #(void gtk_button_set_image_position (self, GtkPositionType position))
]

{ #category : #testing }
GtkButton >> isAlwaysShowImage [
	^ self ffiCall: #(void gtk_button_get_always_show_image (self))
]

{ #category : #accessing }
GtkButton >> label [

	^ self gtkButtonGetLabel asByteArray utf8Decoded
]

{ #category : #accessing }
GtkButton >> label: aString [

	^ self gtkButtonSetLabel: aString utf8Encoded
]
