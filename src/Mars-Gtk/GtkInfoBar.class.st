"
GtkInfoBar
GtkInfoBar — Report important messages to the user

https://developer.gnome.org/gtk3/stable/GtkInfoBar.html
"
Class {
	#name : #GtkInfoBar,
	#superclass : #GtkWidget,
	#instVars : [
		'contentArea'
	],
	#pools : [
		'GtkMessageType'
	],
	#category : #'Mars-Gtk-Widget-Display'
}

{ #category : #private }
GtkInfoBar class >> gtkInfoBarNew [

	^ self ffiCall: #(GtkInfoBar *gtk_info_bar_new (void))
]

{ #category : #convenience }
GtkInfoBar class >> info: aString [
	| infoBar |

	infoBar := self new. 
	infoBar beInfo.
	infoBar showCloseButton.
	infoBar contentArea 
		packStart: (GtkLabel newLabel: aString)
		expand: false
		fill: false
		padding: 0.
	infoBar connectResponse: [ :id | infoBar hide ].
		
	^ infoBar
]

{ #category : #'instance creation' }
GtkInfoBar class >> new [

	^ self gtkInfoBarNew initialize
]

{ #category : #accessing }
GtkInfoBar >> addActionWidget: child withId: responseId [

	self ffiCall: #(void gtk_info_bar_add_action_widget (self, GtkWidget *child, gint responseId))
]

{ #category : #accessing }
GtkInfoBar >> addButtonWithLabel: label withId: responseId [

	^ self 
		basicAddButtonWithLabel: label
		withId: responseId
]

{ #category : #private }
GtkInfoBar >> basicAddButtonWithLabel: utf8EncodedLabel withId: responseId [

	self ffiCall: #(GtkButton *gtk_info_bar_add_button (self, const String utf8EncodedLabel, gint responseId))
]

{ #category : #private }
GtkInfoBar >> basicContentArea [

	^ self ffiCall: #(GtkBox *gtk_info_bar_get_content_area (self))
]

{ #category : #accessing }
GtkInfoBar >> beError [

	self messageType: GTK_MESSAGE_ERROR
]

{ #category : #accessing }
GtkInfoBar >> beInfo [

	self messageType: GTK_MESSAGE_INFO
]

{ #category : #accessing }
GtkInfoBar >> beQuestion [

	self messageType: GTK_MESSAGE_QUESTION
]

{ #category : #accessing }
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
		signature: #(void (void *infobar, gint responseid, void *user_data))
		do: [ :infobar :responseid :user_data | aBlock value: responseid ]
]

{ #category : #accessing }
GtkInfoBar >> contentArea [
	
	^ contentArea ifNil: [ 
		contentArea := self basicContentArea initialize ]
]

{ #category : #accessing }
GtkInfoBar >> doNotShowCloseButton [

	^ self showCloseButton: false
]

{ #category : #accessing }
GtkInfoBar >> hide [

	^ GtkLibrary uniqueInstance 
		matchVersion: '3.22.29'
		ifTrue: [ self reveal: false ]
		ifFalse: [ super hide ]
]

{ #category : #accessing }
GtkInfoBar >> isRevealed [

	^ self ffiCall: #(gboolean gtk_info_bar_get_revealed (self))
]

{ #category : #accessing }
GtkInfoBar >> messageType [

	^ self ffiCall: #(GtkMessageType gtk_info_bar_get_message_type (self))
]

{ #category : #accessing }
GtkInfoBar >> messageType: aType [

	^ self ffiCall: #(void gtk_info_bar_set_message_type (self, GtkMessageType aType))
]

{ #category : #accessing }
GtkInfoBar >> reveal [

	^ self reveal: true
]

{ #category : #accessing }
GtkInfoBar >> reveal: aBoolean [

	^ self ffiCall: #(void gtk_info_bar_set_revealed (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkInfoBar >> showCloseButton [

	^ self showCloseButton: true
]

{ #category : #accessing }
GtkInfoBar >> showCloseButton: aBoolean [

	^ self ffiCall: #(void gtk_info_bar_set_show_close_button (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkInfoBar >> showsCloseButton [

	^ self ffiCall: #(gboolean gtk_info_bar_get_show_close_button (self))
]
