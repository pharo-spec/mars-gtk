Class {
	#name : #GtkSignalFilterAll,
	#superclass : #GtkSignalFilter,
	#category : #'Mars-Gtk-Signal'
}

{ #category : #testing }
GtkSignalFilterAll >> isFiltered: aSignal [

	^ true
]

{ #category : #testing }
GtkSignalFilterAll >> isFilteredClass: aSignalClass [

	^ true
]
