"
GtkMenuButton
GtkMenuButton — A widget that shows a popup when clicked on

https://developer.gnome.org/gtk3/unstable/GtkMenuButton.html
"
Class {
	#name : #GtkMenuButton,
	#superclass : #GtkToggleButton,
	#pools : [
		'GtkArrowType'
	],
	#category : #'Mars-Gtk-Widget-Buttons'
}

{ #category : #private }
GtkMenuButton class >> buttonNew [

	^ self ffiCall: #(GtkMenuButton *gtk_menu_button_new (void))
]

{ #category : #private }
GtkMenuButton class >> buttonNewWithLabel: utf8EncodedString [

	self shouldNotImplement
]

{ #category : #accessing }
GtkMenuButton >> alignMenuWithWidget: aWidget [

	^ self ffiCall: #(void gtk_menu_button_set_align_widget (self, GtkWidget *aWidget))
]

{ #category : #accessing }
GtkMenuButton >> bePopupDirectionDown [

	self popupDirection: GTK_ARROW_DOWN
]

{ #category : #accessing }
GtkMenuButton >> bePopupDirectionLeft [

	self popupDirection: GTK_ARROW_LEFT
]

{ #category : #accessing }
GtkMenuButton >> bePopupDirectionNone [

	self popupDirection: GTK_ARROW_NONE
]

{ #category : #accessing }
GtkMenuButton >> bePopupDirectionRight [

	self popupDirection: GTK_ARROW_RIGHT
]

{ #category : #accessing }
GtkMenuButton >> bePopupDirectionUp [

	self popupDirection: GTK_ARROW_UP
]

{ #category : #accessing }
GtkMenuButton >> menuModel [

	^ self ffiCall: #(GMenuModel *gtk_menu_button_get_menu_model (self))
]

{ #category : #accessing }
GtkMenuButton >> menuModel: aMenuModel [

	self ffiCall: #(void gtk_menu_button_set_menu_model (self, GMenuModel *aMenuModel))
]

{ #category : #accessing }
GtkMenuButton >> popOver [

	^ self ffiCall: #(GtkPopover *gtk_menu_button_set_popover (self))
]

{ #category : #accessing }
GtkMenuButton >> popOver: aPopover [

	self ffiCall: #(void gtk_menu_button_set_popover (self, GtkPopover *aPopover))
]

{ #category : #accessing }
GtkMenuButton >> popUp [

	^ self ffiCall: #(GtkMenu *gtk_menu_button_get_popup (self))
]

{ #category : #accessing }
GtkMenuButton >> popUp: aMenu [

	self ffiCall: #(void gtk_menu_button_set_popup (self, GtkMenu *aMenu))
]

{ #category : #accessing }
GtkMenuButton >> popupDirection [

	^ self ffiCall: #(GtkArrowType gtk_menu_button_get_direction (self))
]

{ #category : #private }
GtkMenuButton >> popupDirection: direction [

	^ self ffiCall: #(void gtk_menu_button_set_direction (self, GtkArrowType direction))
]

{ #category : #accessing }
GtkMenuButton >> usePopover: aBoolean [

	^ self ffiCall: #(void gtk_menu_button_set_use_popover (self, gboolean aBoolean))
]

{ #category : #testing }
GtkMenuButton >> usesPopover [

	^ self ffiCall: #(gboolean gtk_menu_button_get_use_popover (self))
]

{ #category : #accessing }
GtkMenuButton >> widgetAlignedWithMenu [

	^ self ffiCall: #(GtkWidget *gtk_menu_button_get_align_widget (self))
]