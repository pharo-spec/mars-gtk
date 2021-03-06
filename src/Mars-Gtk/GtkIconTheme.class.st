"
GtkIconTheme — Looking up icons by name

https://developer.gnome.org/gtk3/3.24/GtkIconTheme.html
"
Class {
	#name : #GtkIconTheme,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Widget-Display'
}

{ #category : #'instance creation' }
GtkIconTheme class >> default [

	^ self getDefault
]

{ #category : #private }
GtkIconTheme class >> getDefault [

	^ self ffiCall: #(GtkIconTheme *gtk_icon_theme_get_default ())
]

{ #category : #accessing }
GtkIconTheme >> allContextNames [

	^ ((GList fromHandle: self getContextNames) 
		collect: [ :data | data readStringUTF8 ])
		reject: [ :each | each isNil ]
]

{ #category : #accessing }
GtkIconTheme >> allIcons [

	^ self allNames collect: [ :each | GtkImage newIconForButtonNamed: each ]
]

{ #category : #accessing }
GtkIconTheme >> allNames [

	^ (GList fromHandle: self getAllIconNames) collect: [ :data | data readStringUTF8 ]
]

{ #category : #accessing }
GtkIconTheme >> allNamesByContext [
	| namesByContext |
	
	namesByContext := Dictionary new.
	self allContextNames do: [ :each |
		namesByContext at: each put: (self namesInContext: each) ].
	^ namesByContext
]

{ #category : #private }
GtkIconTheme >> getAllIconNames [

	^ self ffiCall: #("GList *"void *gtk_icon_theme_list_icons (self, NULL))
]

{ #category : #private }
GtkIconTheme >> getContextNames [ 

	^ self ffiCall: #("GList *"void *gtk_icon_theme_list_contexts (self))
]

{ #category : #private }
GtkIconTheme >> getIconNames: context [

	^ self ffiCall: #("GList *"void *gtk_icon_theme_list_icons (self, const gchar *context))
]

{ #category : #accessing }
GtkIconTheme >> iconsInContext: aName [

	^ (self namesInContext: aName) collect: [ :each | GtkImage newIconForButtonNamed: each ]
]

{ #category : #accessing }
GtkIconTheme >> loadIconName: iconName size: iconSize [ 
	| pixbuf error |		

	error := GError new.
	pixbuf := self loadIconName: iconName size: iconSize flags: 0 error: error.
	error isOk ifFalse: [ 
		GtkError signal: error messageString ].	
	pixbuf initialize.
	^ pixbuf
]

{ #category : #private }
GtkIconTheme >> loadIconName: icon_name size: size flags: flags error: error [ 

	self ffiCall: #(GdkPixbuf *gtk_icon_theme_load_icon(
		self, 
		const gchar *icon_name,
		gint size,
		"GtkIconLookupFlags"gint flags,
		"GError **"GError *error))
]

{ #category : #accessing }
GtkIconTheme >> namesInContext: aString [

	^ (GList fromHandle: (self getIconNames: aString)) collect: [ :data | data readStringUTF8 ]
]
