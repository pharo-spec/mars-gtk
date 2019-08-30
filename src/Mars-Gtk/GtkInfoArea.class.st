"
I am an utility to show GtkInfoBars.
I wrap the functionality so users do not have to code it all the time.

While GtkInfoBar provides the functionality to display information bars (and whatever you want, 
in fact), you still need to include those bars into a container, that you usually append into a 
window or other containers. 

This component is a base definition of a container dedicated to display information bars, but it 
can be used as any GtkBox.
"
Class {
	#name : #GtkInfoArea,
	#superclass : #GtkBox,
	#category : #'Mars-Gtk-Widget-Display'
}

{ #category : #private }
GtkInfoArea class >> boxNewOrientation: orientation spacing: spacing [

	^ self ffiCall: #(GtkInfoArea *gtk_box_new (GtkOrientation orientation, gint spacing))
]

{ #category : #accessing }
GtkInfoArea class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_info_area_get_type())
]

{ #category : #'instance creation' }
GtkInfoArea class >> new [

	^ (self boxNewOrientation: GTK_ORIENTATION_VERTICAL spacing: 0) initialize
]

{ #category : #'instance creation' }
GtkInfoArea class >> newHorizontal [

	self error: 'Use #new'
]

{ #category : #'instance creation' }
GtkInfoArea class >> newVertical [

	self error: 'Use #new'
]

{ #category : #accessing }
GtkInfoArea >> addError: aString [

	self 
		addMessage: aString 
		type: #beError
]

{ #category : #accessing }
GtkInfoArea >> addInfo: aString [

	self 
		addMessage: aString 
		type: #beInfo
]

{ #category : #private }
GtkInfoArea >> addMessage: aString type: aSelector [

	self 
		addWidget: (GtkLabel newLabel: aString) 
		type: aSelector
]

{ #category : #accessing }
GtkInfoArea >> addQuestion: aString [

	self 
		addMessage: aString 
		type: #beQuestion
]

{ #category : #accessing }
GtkInfoArea >> addWarning: aString [

	self 
		addMessage: aString 
		type: #beWarning
]

{ #category : #private }
GtkInfoArea >> addWidget: aWidget type: aSelector [

		| infoBar |

	infoBar := GtkInfoBar new. 
	infoBar perform: aSelector.
	infoBar showCloseButton.
	infoBar contentArea 
		packStart: aWidget
		expand: false
		fill: false
		padding: 0.
	infoBar connectResponse: [ :id | infoBar hide ].
	infoBar connectHide: [ self remove: infoBar ].
	
	self 
		packStart: infoBar expand: false fill: false padding: 0; 
		showAll
]
