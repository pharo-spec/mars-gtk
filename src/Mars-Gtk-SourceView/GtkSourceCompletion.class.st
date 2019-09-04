"
GtkSourceCompletion — Main Completion Object

https://developer.gnome.org/gtksourceview/stable/GtkSourceCompletion.html
"
Class {
	#name : #GtkSourceCompletion,
	#superclass : #GObject,
	#instVars : [
		'providers'
	],
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #accessing }
GtkSourceCompletion >> addProvider: provider [
	| ok error |
	
	error := GError new.
	ok := self addProvider: provider error: error. 
	ok ifFalse: [ 
		GtkError signal: error messageString ].
	self keepProvider: provider
	
]

{ #category : #private }
GtkSourceCompletion >> addProvider: provider error: error [

	^ self ffiCall: #(gboolean gtk_source_completion_add_provider (
		self,
 		GObject *provider,
   		GError *error))
]

{ #category : #'library path' }
GtkSourceCompletion >> ffiLibraryName [

	^ GtkSourceViewLibrary
]

{ #category : #private }
GtkSourceCompletion >> keepProvider: provider [
	
	providers ifNil: [ providers := Set new ].
	providers add: provider	
]
