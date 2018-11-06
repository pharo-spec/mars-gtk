"
GtkDialog
GtkDialog — Create popup windows

https://developer.gnome.org/gtk3/stable/GtkDialog.html
"
Class {
	#name : #GtkDialog,
	#superclass : #GtkWindow,
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
GtkDialog >> addButtonWithLabel: aText withResponseId: aResponseId [

	self 
		basicAddButtonWithLabel: aText utf8Encoded asString 
		withResponseId: aResponseId
]

{ #category : #private }
GtkDialog >> basicAddButtonWithLabel: utf8EncodedLabel withResponseId: aResponseId [

	^ self ffiCall: #(GtkButton *gtk_dialog_add_button (self, String utf8EncodedLabel, gint aResponseId))
]

{ #category : #accessing }
GtkDialog >> contentArea [

	^ self ffiCall: #(GtkBox *gtk_dialog_get_content_area (self))
]

{ #category : #accessing }
GtkDialog >> defaultResponse: responseId [

	^ self ffiCall: #(void gtk_dialog_set_default_response (self, gint responseId))
]

{ #category : #accessing }
GtkDialog >> headerBar [

	^ self ffiCall: #(GtkWidget * gtk_dialog_get_header_bar (self))
]

{ #category : #accessing }
GtkDialog >> run [

	^ self ffiCall: #(gint gtk_dialog_run (self))
]
