"
GtkToggleToolButton
GtkToggleToolButton — A GtkToolItem containing a toggle button

https://developer.gnome.org/gtk3/stable/GtkToggleToolButton.html
"
Class {
	#name : #GtkToggleToolButton,
	#superclass : #GtkToolButton,
	#category : #'Mars-Gtk-Widget-Toolbar'
}

{ #category : #accessing }
GtkToggleToolButton class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_toggle_tool_button_get_type())
]

{ #category : #private }
GtkToggleToolButton class >> toolItemNew [

	^ self ffiCall: #(GtkToggleToolButton *gtk_toggle_tool_button_new (void))
]

{ #category : #accessing }
GtkToggleToolButton >> active [

	^ self ffiCall: #(gboolean gtk_toggle_tool_button_get_active (self))
]

{ #category : #accessing }
GtkToggleToolButton >> active: aBoolean [

	^ self ffiCall: #(void gtk_toggle_tool_button_set_active (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkToggleToolButton >> connectToggled: aBlock [

	(GToggledCallback do: aBlock) connectTo: self
]
