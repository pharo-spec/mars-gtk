"
GtkTextTagTable — Collection of tags that can be used together

https://developer.gnome.org/gtk3/stable/GtkTextTagTable.html
"
Class {
	#name : #GtkTextTagTable,
	#superclass : #GObject,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Misc'
}

{ #category : #accessing }
GtkTextTagTable class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gtk_text_tag_table_init(void *object))
]

{ #category : #accessing }
GtkTextTagTable class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_text_tag_table_get_type())
]

{ #category : #'instance creation' }
GtkTextTagTable class >> new [ 

	^ self textTagTableNew initialize
]

{ #category : #private }
GtkTextTagTable class >> textTagTableNew [ 

	^ self ffiCall: #(GtkTextTagTable *gtk_text_tag_table_new (void))
]

{ #category : #adding }
GtkTextTagTable >> add: tag [

	^ self ffiCall: #(gboolean gtk_text_tag_table_add (self, GtkTextTag *tag))
]

{ #category : #accessing }
GtkTextTagTable >> size [

	^ self ffiCall: #(gint gtk_text_tag_table_get_size (self))
]
