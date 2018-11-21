"
GtkLinkButton
GtkLinkButton — Create buttons bound to a URL

https://developer.gnome.org/gtk3/unstable/GtkLinkButton.html
"
Class {
	#name : #GtkLinkButton,
	#superclass : #GtkButton,
	#category : #'Mars-Gtk-Widget-Buttons'
}

{ #category : #private }
GtkLinkButton class >> buttonNew [
	
	self shouldNotImplement
]

{ #category : #private }
GtkLinkButton class >> buttonNewWithLabel: utf8EncodedString [
	
	self shouldNotImplement
]

{ #category : #private }
GtkLinkButton class >> buttonNewWithUri: utf8EncodedUrl [
	
	^ self ffiCall: #(GtkLinkButton *gtk_link_button_new (const gchar *utf8EncodedUrl))
]

{ #category : #private }
GtkLinkButton class >> buttonNewWithUri: utf8EncodedUrl withLabel: utf8EncodedString [
	
	^ self ffiCall: #(GtkLinkButton *gtk_link_button_new_with_label (const gchar *utf8EncodedUrl, const gchar *utf8EncodedString))
]

{ #category : #'instance creation' }
GtkLinkButton class >> newWithUri: aString [

	^ (self buttonNewWithUri: aString utf8Encoded) initialize
]

{ #category : #'instance creation' }
GtkLinkButton class >> newWithUri: aString withLabel: aLabel [

	^ (self 
		buttonNewWithUri: aString utf8Encoded 
		withLabel: aLabel utf8Encoded)
		initialize
]

{ #category : #events }
GtkLinkButton >> connectActivateLink: aBlock [

	self connect: 'activate-link' do: aBlock
]

{ #category : #private }
GtkLinkButton >> gtkLinkButtonGetUri [

	^ self ffiCall: #(gchar *gtk_link_button_get_uri (self))
]

{ #category : #private }
GtkLinkButton >> gtkLinkButtonSetUri: utf8EncodedUri [

	^ self ffiCall: #(void gtk_link_button_set_uri (self, gchar* utf8EncodedUri))
]

{ #category : #accessing }
GtkLinkButton >> isVisited [

	^ self ffiCall: #(gboolean gtk_link_button_get_visited (self))
]

{ #category : #accessing }
GtkLinkButton >> uri [

	^ self gtkLinkButtonGetUri asByteArray utf8Decoded
]

{ #category : #accessing }
GtkLinkButton >> uri: aString [

	^ self gtkLinkButtonSetUri: aString utf8Encoded
]

{ #category : #accessing }
GtkLinkButton >> visited: aBoolean [

	^ self ffiCall: #(void gtk_link_button_set_visited (self, gboolean visited))
]
