"
GtkSeparatorMenuItem — A separator used in menus

https://developer.gnome.org/gtk3/stable/GtkSeparatorMenuItem.html
"
Class {
	#name : #GtkSeparatorMenuItem,
	#superclass : #GtkMenuItem,
	#category : #'Mars-Gtk-Widget-Menu'
}

{ #category : #accessing }
GtkSeparatorMenuItem class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_separator_menu_item_get_type())
]

{ #category : #'instance creation' }
GtkSeparatorMenuItem class >> new [

	^ self separatorMenuItemNew initialize
]

{ #category : #private }
GtkSeparatorMenuItem class >> separatorMenuItemNew [ 
	
		^ self ffiCall: #(GtkSeparatorMenuItem *gtk_separator_menu_item_new (void))
]
