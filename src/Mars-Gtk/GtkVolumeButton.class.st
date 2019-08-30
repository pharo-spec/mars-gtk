"
GtkVolumeButton
GtkVolumeButton — A button which pops up a volume control

https://developer.gnome.org/gtk3/unstable/GtkVolumeButton.html
"
Class {
	#name : #GtkVolumeButton,
	#superclass : #GtkScaleButton,
	#category : #'Mars-Gtk-Widget-Buttons'
}

{ #category : #private }
GtkVolumeButton class >> buttonNew [

	^ self ffiCall: #(GtkVolumeButton *gtk_volume_button_new (void))
]

{ #category : #accessing }
GtkVolumeButton class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gtk_volume_button_init(void *object))
]

{ #category : #accessing }
GtkVolumeButton class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_volume_button_get_type())
]

{ #category : #private }
GtkVolumeButton class >> newWithIconSize: size min: min max: max step: step icons: icons [

	self shouldNotImplement
]
