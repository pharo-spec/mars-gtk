"
GtkBuilder — Build an interface from an XML UI definition

https://developer.gnome.org/gtk3/stable/GtkBuilder.html
"
Class {
	#name : #GtkBuilder,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Widget-Builder'
}

{ #category : #private }
GtkBuilder class >> gtk_builder_new_from_file: filename [

	^ self ffiCall: #(GtkBuilder *gtk_builder_new_from_file (const gchar *filename))
]

{ #category : #private }
GtkBuilder class >> gtk_builder_new_from_string: string length: length [

	^ self ffiCall: #(GtkBuilder *gtk_builder_new_from_string (
		const gchar *string,
		gssize length))
]

{ #category : #'instance creation' }
GtkBuilder class >> newFromFile: fileName [

	^ (self gtk_builder_new_from_file: fileName) initialize
]

{ #category : #'instance creation' }
GtkBuilder class >> newFromReference: aReference [

	^ self newFromFile: aReference fullName
]

{ #category : #'instance creation' }
GtkBuilder class >> newFromString: aString [

	^ (self gtk_builder_new_from_string: aString length: aString size) initialize
]

{ #category : #accessing }
GtkBuilder >> getObject: name [
	
	^ self ffiCall: #(GObject *gtk_builder_get_object (self, const gchar *name))
]

{ #category : #accessing }
GtkBuilder >> getObject: aName as: aGtkClass [

	^ aGtkClass fromHandle: (self getObject: aName) getHandle
]
