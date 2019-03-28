"
GtkCssProvider — CSS-like styling for widgets

https://developer.gnome.org/gtk3/stable/GtkCssProvider.html
"
Class {
	#name : #GtkCssProvider,
	#superclass : #GtkStyleProvider,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Misc'
}

{ #category : #private }
GtkCssProvider class >> cssProviderNew [
	^ self ffiCall: #(GtkCssProvider *gtk_css_provider_new (void))
	
]

{ #category : #private }
GtkCssProvider class >> fileNameToUTF8: aString [
	| encoded read written error |
	
	read := ExternalAddress new.
	written := ExternalAddress new.
	error := GError externalNew autoRelease.
	encoded := self 
		fileNameToUTF8: aString 
		len: aString size 
		read: read 
		written: written
		error: error.
		
	error isOk ifFalse: [ 
		GtkError signal: error messageString ].
	
	^ encoded
]

{ #category : #private }
GtkCssProvider class >> fileNameToUTF8: opsysstring len: len read: bytes_read written: bytes_written error: error [
	self ffiCall: #(gchar *g_filename_to_utf8 (
		const gchar *opsysstring,
		gssize len,
		gsize *bytes_read,
		gsize *bytes_written,
		GError *error))
]

{ #category : #'instance creation' }
GtkCssProvider class >> fromPath: aString [

	^ self new loadFromPath: aString
]

{ #category : #'instance creation' }
GtkCssProvider class >> fromString: aString [

	^ self new loadFromData: aString
]

{ #category : #'instance creation' }
GtkCssProvider class >> new [ 
	^ self cssProviderNew initialize
]

{ #category : #accessing }
GtkCssProvider >> loadFromData: aString [
	| error |
	
	error := GError new.
	(self loadFromData: aString length: aString size error: error)
		ifFalse: [ GtkError signal: error messageString ]
]

{ #category : #private }
GtkCssProvider >> loadFromData: data length: length error: error [
	^ self ffiCall: #(gboolean gtk_css_provider_load_from_data (
		self,
		const gchar *data,
		gssize length,
		GError *error))
]

{ #category : #accessing }
GtkCssProvider >> loadFromPath: path [
	| encodedPath error |
	
	error  := GError new.
	encodedPath := self class fileNameToUTF8: path.
	(self loadFromPath: encodedPath error: error getHandle) 
		ifFalse: [ GtkError signal: error messageString ]
]

{ #category : #private }
GtkCssProvider >> loadFromPath: path error: error [
	^ self ffiCall: #(gboolean gtk_css_provider_load_from_path (
		self, 
		const gchar *path,
		0))
]

{ #category : #accessing }
GtkCssProvider >> toString [ 

	^ self ffiCall: #(char *gtk_css_provider_to_string (self))
]
