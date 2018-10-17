"
GtkMenu — A menu widget

https://developer.gnome.org/gtk3/stable/GtkMenu.html
"
Class {
	#name : #GtkMenu,
	#superclass : #GtkMenuShell,
	#category : #'Mars-Gtk-Widget-Menu'
}

{ #category : #private }
GtkMenu class >> menuNew [ 

	^ self ffiCall: #(GtkMenu *gtk_menu_new (void))
]

{ #category : #'instance creation' }
GtkMenu class >> new [

	^ self menuNew initialize
]

{ #category : #'as yet unclassified' }
GtkMenu >> adaptFromSpec: aMenuPresenter [

		
	super adaptFromSpec: aMenuPresenter
]

{ #category : #accessing }
GtkMenu >> title [

	^ self ffiCall: #(const gchar *gtk_menu_get_title (self))
]

{ #category : #accessing }
GtkMenu >> title: title [

	^ self ffiCall: #(void gtk_menu_set_title (self, const gchar *title))
]
