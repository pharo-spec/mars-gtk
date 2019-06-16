Class {
	#name : #GtkTestResource,
	#superclass : #TestResource,
	#category : #'Mars-Gtk-Tests'
}

{ #category : #running }
GtkTestResource >> setUp [

	GtkApplication ensureRunning
]
