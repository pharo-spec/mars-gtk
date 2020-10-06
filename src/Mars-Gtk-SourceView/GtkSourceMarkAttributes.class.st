"
GtkSourceMarkAttributes — The source mark attributes object

https://developer.gnome.org/gtksourceview/stable/GtkSourceMarkAttributes.html
"
Class {
	#name : #GtkSourceMarkAttributes,
	#superclass : #GObject,
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #'instance creation' }
GtkSourceMarkAttributes class >> new [

	^ self sourceMarkAttributesNew initialize
]

{ #category : #private }
GtkSourceMarkAttributes class >> sourceMarkAttributesNew [

	^ self 
		ffiCall: #(GtkSourceMarkAttributes *gtk_source_mark_attributes_new (void))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceMarkAttributes >> background [
	| background |

	background := GdkRGBA new.
	^ (self getBackground: background)
		ifTrue: [ background ]
		ifFalse: [ nil ]
]

{ #category : #accessing }
GtkSourceMarkAttributes >> background: background [

	^ self 
		ffiCall: #(void gtk_source_mark_attributes_set_background (self, const GdkRGBA *background))
		module: GtkSourceViewLibrary
]

{ #category : #private }
GtkSourceMarkAttributes >> getBackground: background [

	^ self 
		ffiCall: #(gboolean gtk_source_mark_attributes_get_background (self, GdkRGBA *background))
		module: GtkSourceViewLibrary	
]

{ #category : #accessing }
GtkSourceMarkAttributes >> iconName [

	^ self 
		ffiCall: #(gchar *gtk_source_mark_attributes_get_icon_name(self)) 
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceMarkAttributes >> iconName: icon_name [

	^ self 
		ffiCall: #(void gtk_source_mark_attributes_set_icon_name(self, const gchar *icon_name)) 
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceMarkAttributes >> pixbuf [

	^ self 
		ffiCall: #(GdkPixbuf *gtk_source_mark_attributes_get_pixbuf(self)) 
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceMarkAttributes >> pixbuf: pixbuf [

	^ self 
		ffiCall: #(void gtk_source_mark_attributes_set_pixbuf(self, GdkPixbuf *pixbuf)) 
		module: GtkSourceViewLibrary
]
