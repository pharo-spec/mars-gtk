"
GInitiallyUnowned is derived from GObject. The only difference between the two is that the initial reference of a GInitiallyUnowned is flagged as a ""floating"" reference. This means that it is not specifically claimed to be ""owned"" by any code portion. The main motivation for providing floating references is C convenience. In particular, it allows code to be written as:

https://developer.gnome.org/gobject/stable/gobject-The-Base-Object-Type.html#GInitiallyUnowned
"
Class {
	#name : #GInitiallyUnowned,
	#superclass : #GObject,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Misc'
}

{ #category : #initialization }
GInitiallyUnowned >> autoObjectUnref [

	"do not unref"
	self flag: #TODO. "I am maybe leaking here! Review the GInitiallyUnowned logic.
	https://developer.gnome.org/gobject/stable/gobject-The-Base-Object-Type.html#GInitiallyUnowned"
]
