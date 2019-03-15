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

{ #category : #private }
GtkVolumeButton class >> newWithIconSize: size min: min max: max step: step icons: icons [

	self shouldNotImplement
]
