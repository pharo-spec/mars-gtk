"
Clipboards — Storing data on clipboards

https://developer.gnome.org/gtk3/stable/gtk3-Clipboards.html
"
Class {
	#name : #GtkClipboard,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'instance creation' }
GtkClipboard class >> defaultForDisplay: aDisplay [

	^ (self getDefaultClipboard: aDisplay) initialize

]

{ #category : #'instance creation' }
GtkClipboard class >> forSelection [

	"from documentation: https://developer.gnome.org/gdk3/stable/gdk3-Selections.html#GDK-SELECTION-CLIPBOARD:CAPS
	
	#define GDK_SELECTION_CLIPBOARD 	_GDK_MAKE_ATOM (69)"
	^ (self gtkClipboardGet: (ExternalAddress fromAddress: 69)) initialize
]

{ #category : #accessing }
GtkClipboard class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_clipboard_get_type())
]

{ #category : #private }
GtkClipboard class >> getDefaultClipboard: display [

	^ self ffiCall: #(GtkClipboard *gtk_clipboard_get_default (GdkDisplay *display))
]

{ #category : #private }
GtkClipboard class >> gtkClipboardGet: selection [

	^ self ffiCall: #(GtkClipboard *gtk_clipboard_get ("GdkAtom"gpointer selection))
]

{ #category : #accessing }
GtkClipboard >> clear [
	
	^ self ffiCall: #(void gtk_clipboard_clear (self))
]

{ #category : #accessing }
GtkClipboard >> text: text [
	
	self ffiCall: #(void gtk_clipboard_set_text (self, const gchar *text, (gint)-1))
]

{ #category : #accessing }
GtkClipboard >> waitForText [
	
	^ self ffiCall: #(gchar *gtk_clipboard_wait_for_text (self))
]
