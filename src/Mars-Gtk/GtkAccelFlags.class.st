"
https://people.gnome.org/~ryanl/gtk/html/gtk3-Standard-Enumerations.html#GtkAccelFlags
"
Class {
	#name : #GtkAccelFlags,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_ACCEL_LOCKED',
		'GTK_ACCEL_MASK',
		'GTK_ACCEL_VISIBLE'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'accessing enum' }
GtkAccelFlags class >> GTK_ACCEL_LOCKED [
	"This method was automatically generated"
	^ GTK_ACCEL_LOCKED
]

{ #category : #'accessing enum' }
GtkAccelFlags class >> GTK_ACCEL_MASK [
	"This method was automatically generated"
	^ GTK_ACCEL_MASK
]

{ #category : #'accessing enum' }
GtkAccelFlags class >> GTK_ACCEL_VISIBLE [
	"This method was automatically generated"
	^ GTK_ACCEL_VISIBLE
]

{ #category : #'enum declaration' }
GtkAccelFlags class >> enumDecl [
	
	^ #(
 	GTK_ACCEL_VISIBLE        1 "display in GtkAccelLabel?"
	GTK_ACCEL_LOCKED         2 "is it removable?"
	GTK_ACCEL_MASK           16r07
)
]
