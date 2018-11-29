"
GtkHeaderBar
GtkHeaderBar — A box with a centered child

https://developer.gnome.org/gtk3/stable/GtkHeaderBar.html
"
Class {
	#name : #GtkHeaderBar,
	#superclass : #GtkContainer,
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #private }
GtkHeaderBar class >> headerBarNew [

	^ self ffiCall: #(GtkHeaderBar *gtk_header_bar_new (void))
]

{ #category : #'instance creation' }
GtkHeaderBar class >> new [

	^ self headerBarNew initialize
]

{ #category : #private }
GtkHeaderBar >> basicSubtitle [

	^ self ffiCall: #(String gtk_header_bar_get_subtitle (self))
]

{ #category : #private }
GtkHeaderBar >> basicSubtitle: utf8EncodedString [

	self ffiCall: #(void gtk_header_bar_set_subtitle (self, String utf8EncodedString))
]

{ #category : #private }
GtkHeaderBar >> basicTitle [

	^ self ffiCall: #(String gtk_header_bar_get_title (self))
]

{ #category : #private }
GtkHeaderBar >> basicTitle: utf8EncodedString [

	self ffiCall: #(void gtk_header_bar_set_title (self, String utf8EncodedString))
]

{ #category : #accessing }
GtkHeaderBar >> customTitleWidget [

	^ self ffiCall: #(GtkWidget *gtk_header_bar_get_custom_title (self))
]

{ #category : #accessing }
GtkHeaderBar >> customTitleWidget: aWidget [

	^ self ffiCall: #(void gtk_header_bar_set_custom_title (self, GtkWidget *aWidget))
]

{ #category : #accessing }
GtkHeaderBar >> doNotShowStandardWindowDecorations [

	self showStandardWindowDecorations: false
]

{ #category : #accessing }
GtkHeaderBar >> doNotShowSubtitle [

	^ self showSubtitle: false
]

{ #category : #initialization }
GtkHeaderBar >> initialize [
	super initialize.
	self showStandardWindowDecorations
]

{ #category : #accessing }
GtkHeaderBar >> packEnd: aWidget [

	^ self ffiCall: #(void gtk_header_bar_pack_end (self, GtkWidget *aWidget))
]

{ #category : #accessing }
GtkHeaderBar >> packStart: aWidget [

	^ self ffiCall: #(void gtk_header_bar_pack_start (self, GtkWidget *aWidget))
]

{ #category : #accessing }
GtkHeaderBar >> showStandardWindowDecorations [

	self showStandardWindowDecorations: true
]

{ #category : #accessing }
GtkHeaderBar >> showStandardWindowDecorations: aBoolean [

	^ self ffiCall: #(void gtk_header_bar_set_show_close_button (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkHeaderBar >> showSubtitle [

	^ self showSubtitle: true
]

{ #category : #accessing }
GtkHeaderBar >> showSubtitle: aBoolean [

	^ self ffiCall: #(void gtk_header_bar_set_has_subtitle(self, gboolean aBoolean))
]

{ #category : #accessing }
GtkHeaderBar >> showsStandardWindowDecorations [

	^ self ffiCall: #(gboolean gtk_header_bar_set_show_close_button (self))
]

{ #category : #accessing }
GtkHeaderBar >> showsSubtitle [

	^ self ffiCall: #(gboolean gtk_header_bar_get_has_subtitle(self))
]

{ #category : #accessing }
GtkHeaderBar >> subtitle [

	^ self basicSubtitle asByteArray utf8Decoded
]

{ #category : #accessing }
GtkHeaderBar >> subtitle: aString [

	^ self basicSubtitle: aString utf8Encoded asString
]

{ #category : #accessing }
GtkHeaderBar >> title [

	^ self basicTitle asByteArray utf8Decoded
]

{ #category : #accessing }
GtkHeaderBar >> title: aString [

	^ self basicTitle: aString utf8Encoded asString
]
