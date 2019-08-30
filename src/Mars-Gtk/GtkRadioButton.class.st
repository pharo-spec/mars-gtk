"
GtkRadioButton
GtkRadioButton — A choice from multiple check buttons

https://developer.gnome.org/gtk3/unstable/GtkRadioButton.html
"
Class {
	#name : #GtkRadioButton,
	#superclass : #GtkCheckButton,
	#category : #'Mars-Gtk-Widget-Buttons'
}

{ #category : #private }
GtkRadioButton class >> buttonNew [

	^ self buttonNewInGroup: GtkRadioButtonGroup new
]

{ #category : #private }
GtkRadioButton class >> buttonNewInGroup: aGroup [

	"aGroup should be an existing radio button group, or NULL if you are creating a new group"

	^ self ffiCall: #(GtkRadioButton *gtk_radio_button_new (GtkRadioButtonGroup *aGroup))
]

{ #category : #private }
GtkRadioButton class >> buttonNewInGroup: aGroup withLabel: utf8EncodedString [

	"aGroup should be an existing radio button group, or NULL if you are creating a new group"

	^ self ffiCall: #(GtkRadioButton *gtk_radio_button_new_with_label (GtkRadioButtonGroup *aGroup, String utf8EncodedString))
]

{ #category : #private }
GtkRadioButton class >> buttonNewInSameGroupAs: aRadioButton [

	^ self ffiCall: #(GtkRadioButton *gtk_radio_button_new_from_widget (GtkRadioButton *aRadioButton))
]

{ #category : #private }
GtkRadioButton class >> buttonNewInSameGroupAs: aRadioButton withLabel: utf8EncodedString [

	^ self ffiCall: #(GtkRadioButton *gtk_radio_button_new_with_label_from_widget (GtkRadioButton *aRadioButton, String utf8EncodedString))
]

{ #category : #accessing }
GtkRadioButton class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_radio_button_get_type())
]

{ #category : #'instance creation' }
GtkRadioButton class >> newInGroup: aGroup [

	^ (self buttonNewInGroup: aGroup)
		initialize;
		yourself
]

{ #category : #'instance creation' }
GtkRadioButton class >> newInGroup: aGroup withLabel: aLabel [

	^ (self buttonNewInGroup: aGroup withLabel: aLabel)
		initialize;
		yourself
]

{ #category : #'instance creation' }
GtkRadioButton class >> newInSameGroupAs: aRadioButton [

	^ (self buttonNewInSameGroupAs: aRadioButton)
		initialize;
		yourself
]

{ #category : #'instance creation' }
GtkRadioButton class >> newInSameGroupAs: aRadioButton withLabel: aLabel [

	^ (self buttonNewInSameGroupAs: aRadioButton withLabel: aLabel)
		initialize;
		yourself
]

{ #category : #private }
GtkRadioButton class >> newLabel: aString [

	^ self newInGroup: GtkRadioButtonGroup new withLabel: aString
]

{ #category : #events }
GtkRadioButton >> connectGroupChanged: aBlock [

	self connect: 'group-changed' do: aBlock
]

{ #category : #accessing }
GtkRadioButton >> joinGroupOf: aRadioButton [

	^ self ffiCall: #(void *gtk_radio_button_join_group (self, GtkRadioButton *aRadioButton))
]

{ #category : #accessing }
GtkRadioButton >> radioGroup [

	^ self ffiCall: #(GtkRadioButtonGroup *gtk_radio_button_get_group (self))
]

{ #category : #accessing }
GtkRadioButton >> radioGroup: aRadioGroup [

	^ self ffiCall: #(void *gtk_radio_button_get_group (self, GtkRadioButtonGroup *aRadioGroup))
]
