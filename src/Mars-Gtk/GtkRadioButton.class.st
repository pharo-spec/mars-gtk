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

	^ self buttonNewInGroup: ExternalAddress null
]

{ #category : #private }
GtkRadioButton class >> buttonNewInGroup: aGroup [

	"aGroup should be an existing radio button group, or NULL if you are creating a new group"

	^ self ffiCall: #(GtkRadioButton gtk_radio_button_new (GtkRadioButtonGroup *aGroup))
]

{ #category : #private }
GtkRadioButton class >> buttonNewInGroup: aGroup withLabel: utf8EncodedString [

	"aGroup should be an existing radio button group, or NULL if you are creating a new group"

	^ self ffiCall: #(GtkRadioButton gtk_radio_button_new_with_label (GtkRadioButtonGroup *aGroup, const gchar *utf8EncodedString))
]

{ #category : #private }
GtkRadioButton class >> buttonNewInSameGroupAs: aRadioButton [

	^ self ffiCall: #(GtkRadioButton gtk_radio_button_new_from_widget (GtkRadioButton *aRadioButton))
]

{ #category : #private }
GtkRadioButton class >> buttonNewInSameGroupAs: aRadioButton withLabel: utf8EncodedString [

	^ self ffiCall: #(GtkRadioButton gtk_radio_button_new_with_label_from_widget (GtkRadioButton *aRadioButton, const gchar *label))
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
