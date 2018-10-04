"
I'm a representation of an adjustable bounded value.

https://developer.gnome.org/gtk3/stable/GtkAdjustment.html
"
Class {
	#name : #GtkAdjustment,
	#superclass : #FFIExternalObject,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#pools : [
		'GtkTypes'
	],
	#category : 'Mars-Gtk-Misc'
}

{ #category : #private }
GtkAdjustment class >> adjustementValue: value lower: lower upper: upper stepIncrement: step_increment pageIncrement: page_increment pageSize: page_size [  
	^ self ffiCall: #(GtkAdjustment *gtk_adjustment_new (
		gdouble value,
		gdouble lower,
		gdouble upper,
		gdouble step_increment,
 		gdouble page_increment,
		gdouble page_size))
]

{ #category : #'instance creation' }
GtkAdjustment class >> newValue: value lower: lower upper: upper stepIncrement: step_increment pageIncrement: page_increment pageSize: page_size [
	^ (self adjustementValue: value lower: lower upper: upper stepIncrement: step_increment pageIncrement: page_increment pageSize: page_size) initialize
]
