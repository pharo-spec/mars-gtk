"
GtkCheckMenuItem
GtkCheckMenuItem — A menu item with a check box

https://developer.gnome.org/gtk3/stable/GtkCheckMenuItem.html
"
Class {
	#name : #GtkCheckMenuItem,
	#superclass : #GtkMenuItem,
	#category : #'Mars-Gtk-Widget-Menu'
}

{ #category : #accessing }
GtkCheckMenuItem class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_check_menu_item_get_type())
]

{ #category : #private }
GtkCheckMenuItem class >> menuItemNew [

	^ self ffiCall: #(GtkCheckMenuItem *gtk_check_menu_item_new (void))
]

{ #category : #accessing }
GtkCheckMenuItem >> active: aBoolean [

	^ self ffiCall: #(void gtk_check_menu_item_set_active (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkCheckMenuItem >> beActive [

	^ self active: true
]

{ #category : #accessing }
GtkCheckMenuItem >> beConsistent [

	^ self inconsistent: false
]

{ #category : #accessing }
GtkCheckMenuItem >> beInconsistent [

	^ self inconsistent: true
]

{ #category : #accessing }
GtkCheckMenuItem >> beNonActive [

	^ self active: false
]

{ #category : #events }
GtkCheckMenuItem >> connectToggled: aBlock [

	(GToggledCallback do: aBlock) connectTo: self
]

{ #category : #accessing }
GtkCheckMenuItem >> drawAsRadio: aBoolean [

	^ self ffiCall: #(void gtk_check_menu_item_set_draw_as_radio (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkCheckMenuItem >> drawsAsRadio [

	^ self ffiCall: #(gboolean gtk_check_menu_item_get_draw_as_radio (self))
]

{ #category : #accessing }
GtkCheckMenuItem >> inconsistent: aBoolean [

	^ self ffiCall: #(void gtk_check_menu_item_set_inconsistent (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkCheckMenuItem >> isActive [

	^ self ffiCall: #(gboolean gtk_check_menu_item_get_active (self))
]

{ #category : #accessing }
GtkCheckMenuItem >> isInconsistent [

	^ self ffiCall: #(gboolean gtk_check_menu_item_get_inconsistent (self))
]
