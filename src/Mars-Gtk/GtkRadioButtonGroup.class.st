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
GtkRadioButtonGroup class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gtk_radio_button_group_init(void *object))
]

{ #category : #accessing }
GtkRadioButtonGroup class >> gType [ 

	^ nil
]
