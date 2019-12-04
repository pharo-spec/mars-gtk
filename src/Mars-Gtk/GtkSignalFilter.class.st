Class {
	#name : #GtkSignalFilter,
	#superclass : #Object,
	#category : #'Mars-Gtk-Signal'
}

{ #category : #actions }
GtkSignalFilter >> install [

	GtkSignal activeFilter: self
]

{ #category : #testing }
GtkSignalFilter >> isFiltered: aSignal [

	^ self subclassResponsibility
]

{ #category : #testing }
GtkSignalFilter >> isFilteredClass: aSignalClass [

	^ self subclassResponsibility
]

{ #category : #testing }
GtkSignalFilter >> isTracing: aSignal [

	^ (self isFiltered: aSignal) not
]

{ #category : #testing }
GtkSignalFilter >> isTracingFilter [
	
	^ false
]
