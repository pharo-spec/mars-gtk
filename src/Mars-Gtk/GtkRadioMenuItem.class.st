"
GtkRadioMenuItem
GtkRadioMenuItem — A choice from multiple check menu items

https://developer.gnome.org/gtk3/stable/GtkRadioMenuItem.html
"
Class {
	#name : #GtkRadioMenuItem,
	#superclass : #GtkCheckMenuItem,
	#category : #'Mars-Gtk-Widget-Menu'
}

{ #category : #private }
GtkRadioMenuItem class >> basicNewLabel: utf8EncodedLabel [

	^ self ffiCall: #(GtkRadioMenuItem *gtk_radio_menu_item_new_with_label (0, String utf8EncodedLabel))
]

{ #category : #private }
GtkRadioMenuItem class >> basicNewLabel: utf8EncodedLabel fromWidget: aRadioMenuItem [

	^ self ffiCall: #(GtkRadioMenuItem *gtk_radio_menu_item_new_with_label_from_widget (GtkRadioMenuItem *aRadioMenuItem, String utf8EncodedLabel))
]

{ #category : #accessing }
GtkRadioMenuItem class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gtk_radio_menu_item_init(void *object))
]

{ #category : #accessing }
GtkRadioMenuItem class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_radio_menu_item_get_type())
]

{ #category : #'instance creation' }
GtkRadioMenuItem class >> newLabel: aString [

	^ (self basicNewLabel: aString) initialize
]

{ #category : #'instance creation' }
GtkRadioMenuItem class >> newLabel: aString fromWidget: aWidget [

	^ (self basicNewLabel: aString fromWidget: aWidget) initialize
]

{ #category : #events }
GtkRadioMenuItem >> connectGroupChanged: aBlock [

	self connect: 'group-changed' do: aBlock
]

{ #category : #'menu protocol' }
GtkRadioMenuItem >> group [

	^ self ffiCall: #(void * gtk_radio_menu_item_get_group (self))
]

{ #category : #'menu protocol' }
GtkRadioMenuItem >> group: aGroup [

	self ffiCall: #(void gtk_radio_menu_item_set_group (self, void *aGroup))
]

{ #category : #'menu protocol' }
GtkRadioMenuItem >> joinGroupOf: aRadioMenuItem [

	^ self ffiCall: #(void gtk_radio_menu_item_join_group (self, GtkRadioMenuItem *aRadioMenuItem))
]
