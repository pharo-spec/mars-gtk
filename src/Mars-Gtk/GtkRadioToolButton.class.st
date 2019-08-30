"
GtkRadioToolButton
GtkRadioToolButton — A toolbar item that contains a radio button

https://developer.gnome.org/gtk3/stable/GtkRadioToolButton.html
"
Class {
	#name : #GtkRadioToolButton,
	#superclass : #GtkToggleToolButton,
	#category : #'Mars-Gtk-Widget-Toolbar'
}

{ #category : #accessing }
GtkRadioToolButton class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gtk_radio_tool_button_init(void *object))
]

{ #category : #accessing }
GtkRadioToolButton class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_radio_tool_button_get_type())
]

{ #category : #'instance creation' }
GtkRadioToolButton class >> newInSameGroupAs: aRadioButton [

	^ (self toolItemNewInSameGroupAs: aRadioButton)
		initialize;
		yourself
]

{ #category : #private }
GtkRadioToolButton class >> toolItemNew [

	^ self ffiCall: #(GtkRadioToolButton * gtk_radio_tool_button_new (0))
]

{ #category : #private }
GtkRadioToolButton class >> toolItemNewInSameGroupAs: aRadioToolButton [

	^ self ffiCall: #(GtkRadioToolButton * gtk_radio_tool_button_new_from_widget (GtkRadioToolButton *aRadioToolButton))
]

{ #category : #accessing }
GtkRadioToolButton >> group [

	^ self ffiCall: #(void * gtk_radio_tool_button_get_group (self))
]

{ #category : #accessing }
GtkRadioToolButton >> group: aGroup [

	self ffiCall: #(void gtk_radio_tool_button_set_group (self, void *aGroup))
]
