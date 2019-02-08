"
GtkInfoBar
GtkInfoBar — Report important messages to the user

https://developer.gnome.org/gtk3/stable/GtkInfoBar.html
"
Class {
	#name : #GtkInfoBar,
	#superclass : #GtkWidget,
	#pools : [
		'GtkMessageType'
	],
	#category : #'Mars-Gtk-Widget-Display'
}

{ #category : #private }
GtkInfoBar class >> gtkInfoBarNew [

	^ self ffiCall: #(GtkInfoBar *gtk_info_bar_new (void))
]

{ #category : #private }
GtkInfoBar class >> new [

	^ self gtkInfoBarNew initialize
]

{ #category : #adding }
GtkInfoBar >> addActionWidget: child withId: responseId [

	self ffiCall: #(void gtk_info_bar_add_action_widget (self, GtkWidget *child, gint responseId))
]

{ #category : #adding }
GtkInfoBar >> addButtonWithLabel: label withId: responseId [

	^ self 
		basicAddButtonWithLabel: label
		withId: responseId
]

{ #category : #private }
GtkInfoBar >> basicAddButtonWithLabel: utf8EncodedLabel withId: responseId [

	self ffiCall: #(GtkButton *gtk_info_bar_add_button (self, const String utf8EncodedLabel, gint responseId))
]

{ #category : #adding }
GtkInfoBar >> beError [

	self messageType: GTK_MESSAGE_ERROR
]

{ #category : #adding }
GtkInfoBar >> beInfo [

	self messageType: GTK_MESSAGE_INFO
]

{ #category : #adding }
GtkInfoBar >> beQuestion [

	self messageType: GTK_MESSAGE_QUESTION
]

{ #category : #adding }
GtkInfoBar >> beWarning [

	self messageType: GTK_MESSAGE_WARNING
]

{ #category : #events }
GtkInfoBar >> connectClose: aBlock [

	self connect: 'close' do: aBlock
]

{ #category : #events }
GtkInfoBar >> connectResponse: aBlock [

	self 
		connect: 'response' 
		signature: #(void (void *infobar, long responseid, void *user_data))
		do: [ :infobar :responseid :user_data | 
			[ aBlock value: responseid ] fork ]
]

{ #category : #adding }
GtkInfoBar >> doNotShowCloseButton [

	^ self showCloseButton: false
]

{ #category : #adding }
GtkInfoBar >> hide [

	^ self reveal: false
]

{ #category : #adding }
GtkInfoBar >> isRevealed [

	^ self ffiCall: #(gboolean gtk_info_bar_get_revealed (self))
]

{ #category : #adding }
GtkInfoBar >> messageType [

	^ self ffiCall: #(GtkMessageType gtk_info_bar_get_message_type (self))
]

{ #category : #adding }
GtkInfoBar >> messageType: aType [

	^ self ffiCall: #(void gtk_info_bar_set_message_type (self, GtkMessageType aType))
]

{ #category : #adding }
GtkInfoBar >> reveal [

	^ self reveal: true
]

{ #category : #adding }
GtkInfoBar >> reveal: aBoolean [

	^ self ffiCall: #(void gtk_info_bar_set_revealed (self, gboolean aBoolean))
]

{ #category : #adding }
GtkInfoBar >> showCloseButton [

	^ self showCloseButton: true
]

{ #category : #adding }
GtkInfoBar >> showCloseButton: aBoolean [

	^ self ffiCall: #(void gtk_info_bar_set_show_close_button (self, gboolean aBoolean))
]

{ #category : #adding }
GtkInfoBar >> showsCloseButton [

	^ self ffiCall: #(gboolean gtk_info_bar_get_show_close_button (self))
]
