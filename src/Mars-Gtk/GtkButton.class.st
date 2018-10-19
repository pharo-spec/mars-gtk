"
GtkButton — A widget that emits a signal when clicked on

https://developer.gnome.org/gtk3/stable/GtkButton.html
"
Class {
	#name : #GtkButton,
	#superclass : #GtkWidget,
	#pools : [
		'GtkPositionType',
		'GtkReliefStyle'
	],
	#category : #'Mars-Gtk-Widget'
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

{ #category : #accessing }
GtkButton >> gtk_button_get_label [

	^ self ffiCall: #(gchar* gtk_button_get_label(self))
]

{ #category : #accessing }
GtkButton >> gtk_button_set_label: utf8EncodedBytes [

	^ self ffiCall: #(void gtk_button_set_label(self, gchar * utf8EncodedBytes))
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

	^ self gtk_button_get_label asByteArray utf8Decoded
]

{ #category : #accessing }
GtkButton >> label: aString [

	^ self gtk_button_set_label: aString utf8Encoded
]

{ #category : #accessing }
GtkButton >> reliefStyle [

	^ self ffiCall: #(GtkReliefStyle gtk_button_get_relief (self))
]

{ #category : #accessing }
GtkButton >> reliefStyle: relief [

	^ self ffiCall: #(void gtk_button_set_relief (self, GtkReliefStyle relief))
]

{ #category : #accessing }
GtkButton >> setNoRelief [

	self reliefStyle: GTK_RELIEF_NONE
]

{ #category : #accessing }
GtkButton >> setNormalRelief [

	self reliefStyle: GTK_RELIEF_NORMAL
]
