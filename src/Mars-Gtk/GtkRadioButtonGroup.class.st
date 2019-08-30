"
I implement a convenience interface to a gtk radio button.
A radio button group is implemented in gtk as a GSList.

Do not create me manually! Check GtkRadioButton instead.
"
Class {
	#name : #GtkRadioButtonGroup,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Widget-Buttons'
}

{ #category : #accessing }
GtkRadioButtonGroup class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_radio_button_group_get_type())
]
