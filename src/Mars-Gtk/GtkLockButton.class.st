"
GtkLockButton
GtkLockButton — A widget to unlock or lock privileged operations

https://developer.gnome.org/gtk3/unstable/GtkLockButton.html
"
Class {
	#name : #GtkLockButton,
	#superclass : #GtkButton,
	#category : #'Mars-Gtk-Widget-Buttons'
}

{ #category : #private }
GtkLockButton class >> buttonNew [
	
	self shouldNotImplement
]

{ #category : #private }
GtkLockButton class >> buttonNewWithLabel: utf8EncodedString [
	
	self shouldNotImplement
]

{ #category : #accessing }
GtkLockButton class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_lock_button_get_type())
]

{ #category : #private }
GtkLockButton class >> newWithPermission: permission [

	^ self ffiCall: #(GtkLockButton *gtk_lock_button_new (GPermission *permission))

]

{ #category : #accessing }
GtkLockButton >> permission [

	^ self ffiCall: #(GPermission *gtk_lock_button_get_permission (self))
]

{ #category : #accessing }
GtkLockButton >> permission: permission [

	^ self ffiCall: #(void gtk_lock_button_get_permission (self, GPermission *permission))
]
