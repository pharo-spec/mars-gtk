Class {
	#name : #GtkSourceView,
	#superclass : #GtkTextView,
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #example }
GtkSourceView class >> example [

	GtkApplication ensureRunning.
	GtkWindow new
		title: 'Source view example';
		add: GtkSourceView new;
		showAll
]

{ #category : #'instance creation' }
GtkSourceView class >> new [ 

	^ self sourceViewNew initialize
]

{ #category : #private }
GtkSourceView class >> sourceViewNew [

	^ self 
		ffiCall: #(GtkSourceView *gtk_source_view_new ())
		module: GtkSourceViewLibrary
]
