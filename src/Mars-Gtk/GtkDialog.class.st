"
GtkDialog
GtkDialog — Create popup windows

https://developer.gnome.org/gtk3/stable/GtkDialog.html
"
Class {
	#name : #GtkDialog,
	#superclass : #GtkWindow,
	#instVars : [
		'buttons',
		'contentArea'
	],
	#pools : [
		'GtkResponseType'
	],
	#category : #'Mars-Gtk-Widget-Window'
}

{ #category : #private }
GtkDialog class >> gtkDialogNew [

	^ self ffiCall: #(GtkDialog *gtk_dialog_new (void))
]

{ #category : #private }
GtkDialog class >> new [

	^ self gtkDialogNew initialize
]

{ #category : #accessing }
GtkDialog >> addActionWidget: widget withResponseId: responseId [

	^ self ffiCall: #(void gtk_dialog_add_action_widget (self, GtkWidget *widget, gint responseId))
]

{ #category : #accessing }
GtkDialog >> addButton: aString do: aBlock [

	buttons add: aBlock.
	self 
		addButtonWithLabel: aString 
		withResponseId: buttons size
]

{ #category : #private }
GtkDialog >> addButtonWithLabel: aText withResponseId: aResponseId [

	self 
		basicAddButtonWithLabel: aText utf8Encoded asString 
		withResponseId: aResponseId
]

{ #category : #accessing }
GtkDialog >> addDefaultButton: aString do: aBlock [

	self addButton: aString do: aBlock.
	self defaultResponse: buttons size
]

{ #category : #private }
GtkDialog >> basicAddButtonWithLabel: utf8EncodedLabel withResponseId: aResponseId [

	^ self ffiCall: #(GtkButton *gtk_dialog_add_button (self, String utf8EncodedLabel, gint aResponseId))
]

{ #category : #private }
GtkDialog >> basicContentArea [

	^ self ffiCall: #(GtkBox *gtk_dialog_get_content_area (self))
]

{ #category : #private }
GtkDialog >> basicRun [

	^ self ffiCall: #(gint gtk_dialog_run (self))
]

{ #category : #accessing }
GtkDialog >> close [
		
	self halt
]

{ #category : #accessing }
GtkDialog >> contentArea [

	^ contentArea ifNil:[ contentArea := self basicContentArea initialize ]
]

{ #category : #accessing }
GtkDialog >> defaultResponse: responseId [

	^ self ffiCall: #(void gtk_dialog_set_default_response (self, gint responseId))
]

{ #category : #accessing }
GtkDialog >> headerBar [

	^ self ffiCall: #(GtkWidget *gtk_dialog_get_header_bar (self))
]

{ #category : #initialization }
GtkDialog >> initialize [

	super initialize.
	buttons := OrderedCollection new
]

{ #category : #accessing }
GtkDialog >> response: response_id [

	self ffiCall: #(void gtk_dialog_response (self, gint response_id))
]

{ #category : #accessing }
GtkDialog >> run [
	| result |
	
	result := self basicRun.
	result = 0 ifTrue: [ ^ self ].
	result < 0 ifTrue: [ ^ GtkResponseType fromInteger: result ].
	(buttons at: result) fork
]

{ #category : #accessing }
GtkDialog >> showAll [
	"You need to call 'run'"

	self shouldNotImplement
]
