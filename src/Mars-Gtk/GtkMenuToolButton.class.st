"
GtkMenuToolButton
GtkMenuToolButton — A GtkToolItem containing a button with an additional dropdown menu

https://developer.gnome.org/gtk3/stable/GtkMenuToolButton.html
"
Class {
	#name : #GtkMenuToolButton,
	#superclass : #GtkToolButton,
	#category : #'Mars-Gtk-Widget-Toolbar'
}

{ #category : #private }
GtkMenuToolButton class >> toolButtonNew: icon_widget label: label [ 

	^ self ffiCall: #(GtkMenuToolButton *gtk_menu_tool_button_new (GtkWidget *icon_widget, String label))
]

{ #category : #api }
GtkMenuToolButton >> arrowTooltipText: aString [

	self basicArrowTooltipText: aString
]

{ #category : #api }
GtkMenuToolButton >> basicArrowTooltipText: utf8EncodedText [

	self ffiCall: #(void gtk_menu_tool_button_set_arrow_tooltip_text (self, String utf8EncodedText))
]

{ #category : #events }
GtkMenuToolButton >> connectShowMenu: aBlock [

	self connect: 'show-menu' do: aBlock
]

{ #category : #api }
GtkMenuToolButton >> menu [

	^ self ffiCall: #(GtkMenu gtk_menu_tool_button_get_menu (self))
]

{ #category : #api }
GtkMenuToolButton >> menu: aMenu [

	^ self ffiCall: #(void gtk_menu_tool_button_set_menu (self, GtkMenu *aMenu))
]
