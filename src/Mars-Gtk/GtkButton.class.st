"
GtkButton — A widget that emits a signal when clicked on

https://developer.gnome.org/gtk3/stable/GtkButton.html
"
Class {
	#name : #GtkButton,
	#superclass : #GtkWidget,
	#instVars : [
		'image'
	],
	#pools : [
		'GtkPositionType',
		'GtkReliefStyle'
	],
	#category : #'Mars-Gtk-Widget-Buttons'
}

{ #category : #private }
GtkButton class >> buttonNew [
	^ self ffiCall: #(GtkButton *gtk_button_new ())
]

{ #category : #private }
GtkButton class >> buttonNewWithLabel: label [
	^ self ffiCall: #(GtkButton *gtk_button_new_with_label (String label))
]

{ #category : #'instance creation' }
GtkButton class >> new [ 
	^ self buttonNew initialize
]

{ #category : #'instance creation' }
GtkButton class >> newLabel: aString [

	^ (self buttonNewWithLabel: aString) initialize
]

{ #category : #accessing }
GtkButton >> alwaysShowImage [

	^ self alwaysShowImage: true
]

{ #category : #accessing }
GtkButton >> alwaysShowImage: always_show [
	^ self ffiCall: #(void gtk_button_set_always_show_image (self, gboolean always_show))
]

{ #category : #accessing }
GtkButton >> alwaysShowsImage [
	^ self ffiCall: #(gboolean gtk_button_get_always_show_image (self))
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

{ #category : #simulating }
GtkButton >> clicked [

	self ffiCall: #(void gtk_button_clicked (self))

]

{ #category : #style }
GtkButton >> font: aLogicalFont [ 
	
	| pangoFont |
	
	pangoFont := self styleContext font.
	pangoFont familyName: aLogicalFont familyName.
]

{ #category : #private }
GtkButton >> getImage [

	^ self ffiCall: #(GtkImage *gtk_button_get_image (self))
]

{ #category : #private }
GtkButton >> gtkButtonGetLabel [

	^ self ffiCall: #(gchar *gtk_button_get_label(self))
]

{ #category : #private }
GtkButton >> gtkButtonSetLabel: aString [

	self ffiCall: #(void gtk_button_set_label(self, String aString))
]

{ #category : #accessing }
GtkButton >> image [

	^ image ifNil: [ image := self getImage ]
]

{ #category : #accessing }
GtkButton >> image: anImage [

	image := anImage.
	self setImage: anImage
]

{ #category : #accessing }
GtkButton >> imagePosition [
	^ self ffiCall: #(GtkPositionType gtk_button_get_image_position (self))
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

	^ self gtkButtonGetLabel
]

{ #category : #accessing }
GtkButton >> label: aString [

	^ self gtkButtonSetLabel: aString
]

{ #category : #accessing }
GtkButton >> reliefStyle [

	^ self ffiCall: #(GtkReliefStyle gtk_button_get_relief (self))
]

{ #category : #accessing }
GtkButton >> reliefStyle: relief [

	^ self ffiCall: #(void gtk_button_set_relief (self, GtkReliefStyle relief))
]

{ #category : #private }
GtkButton >> setImage: anImage [

	self ffiCall: #(void gtk_button_set_image (self, GtkWidget *anImage))
]

{ #category : #accessing }
GtkButton >> setNoRelief [

	self reliefStyle: GTK_RELIEF_NONE
]

{ #category : #accessing }
GtkButton >> setNormalRelief [

	self reliefStyle: GTK_RELIEF_NORMAL
]

{ #category : #accessing }
GtkButton >> useNoUnderline [

	^ self useUnderline: false
]

{ #category : #accessing }
GtkButton >> useUnderline [

	^ self useUnderline: true
]

{ #category : #accessing }
GtkButton >> useUnderline: aBoolean [

	^ self ffiCall: #(void gtk_button_set_use_underline (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkButton >> usesUnderline [

	^ self ffiCall: #(gboolean gtk_button_get_use_underline ())
]
