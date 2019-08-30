"
I'm the foundation of a system dialog. 
System dialogs are the ones that are in the hierachy of GtkDialog: 

https://developer.gnome.org/gtk3/stable/GtkDialog.html#GtkDialog.object-hierarchy
"
Class {
	#name : #GtkSystemDialog,
	#superclass : #GtkBaseDialog,
	#instVars : [
		'response'
	],
	#pools : [
		'GtkFileChooserAction',
		'GtkResponseType'
	],
	#category : #'Mars-Gtk-Widget-Window'
}

{ #category : #accessing }
GtkSystemDialog class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_system_dialog_get_type())
]

{ #category : #events }
GtkSystemDialog >> connectResponse: aBlock [

	self 
		connect: 'response' 
		signature: #(void (void *infobar, gint responseid, void *user_data))
		do: [ :infobar :responseid :user_data | aBlock value: responseid ]
]

{ #category : #initialization }
GtkSystemDialog >> initialize [ 

	super initialize.
	self center.
	self connectResponse: [ :id | 
		response := GtkResponseType fromInteger: id. 
		self respond ]
]

{ #category : #testing }
GtkSystemDialog >> isOk [ 

	^ self response == GTK_RESPONSE_OK
]

{ #category : #running }
GtkSystemDialog >> response [

	^ response
]

{ #category : #running }
GtkSystemDialog >> run [ 

	super run.
	^ self response
]
