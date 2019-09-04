"
GtkMenuItem — The widget used for item in menus

https://developer.gnome.org/gtk3/stable/GtkMenuItem.html
"
Class {
	#name : #GtkMenuItem,
	#superclass : #GtkBin,
	#instVars : [
		'submenu'
	],
	#category : #'Mars-Gtk-Widget-Menu'
}

{ #category : #accessing }
GtkMenuItem class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_menu_item_get_type())
]

{ #category : #private }
GtkMenuItem class >> menuItemNew [

	^ self ffiCall: #(GtkMenuItem *gtk_menu_item_new (void))
]

{ #category : #'instance creation' }
GtkMenuItem class >> new [

	^ self menuItemNew initialize
]

{ #category : #'instance creation' }
GtkMenuItem class >> newLabel: aString [

	^ self new 
		label: aString;
		yourself
]

{ #category : #signaling }
GtkMenuItem >> connectActivate: aBlock [

	self connect: 'activate' do: aBlock
]

{ #category : #accessing }
GtkMenuItem >> label [

	^ self ffiCall: #(const gchar *gtk_menu_item_get_label (self))
]

{ #category : #accessing }
GtkMenuItem >> label: label [

	^ self ffiCall: #(void gtk_menu_item_set_label (self, const gchar *label))
]

{ #category : #'private primitives' }
GtkMenuItem >> menuItemSetSubmenu: aSubmenu [

	self ffiCall: #(void gtk_menu_item_set_submenu (self, GtkWidget *submenu))	

]

{ #category : #accessing }
GtkMenuItem >> submenu: aSubmenu [
	
	submenu := aSubmenu.
	self menuItemSetSubmenu: aSubmenu
]
