"
GtkToggleButton
GtkToggleButton — Create buttons which retain their state

https://developer.gnome.org/gtk3/unstable/GtkToggleButton.html
"
Class {
	#name : #GtkToggleButton,
	#superclass : #GtkButton,
	#category : #'Mars-Gtk-Widget-Buttons'
}

{ #category : #private }
GtkToggleButton class >> buttonNew [
	^ self ffiCall: #(GtkToggleButton *gtk_toggle_button_new ())
]

{ #category : #private }
GtkToggleButton class >> buttonNewWithLabel: utf8EncodedString [

	^ self ffiCall: #(GtkToggleButton *gtk_toggle_button_new_with_label (String utf8EncodedString))
]

{ #category : #accessing }
GtkToggleButton class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gtk_toggle_button_init(void *object))
]

{ #category : #accessing }
GtkToggleButton class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_toggle_button_get_type())
]

{ #category : #accessing }
GtkToggleButton >> active: aBoolean [

	^ self ffiCall: #(gboolean gtk_toggle_button_set_active (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkToggleButton >> beActive [

	self active: true
]

{ #category : #accessing }
GtkToggleButton >> beNonActive [

	self active: false
]

{ #category : #events }
GtkToggleButton >> connectToggled: aBlock [

	self connect: 'toggled' do: aBlock
]

{ #category : #accessing }
GtkToggleButton >> doNotDrawIndicator [

	^ self drawIndicator: false
]

{ #category : #accessing }
GtkToggleButton >> drawIndicator [

	^ self drawIndicator: true
]

{ #category : #accessing }
GtkToggleButton >> drawIndicator: aBoolean [

	^ self ffiCall: #(void gtk_toggle_button_set_mode (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkToggleButton >> getActive [
	^ self ffiCall: #(gboolean gtk_toggle_button_get_active (self))
]

{ #category : #accessing }
GtkToggleButton >> inconsistent: aBoolean [

	^ self ffiCall: #(void gtk_toggle_button_set_inconsistent (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkToggleButton >> isActive [

	^ self ffiCall: #(gboolean gtk_toggle_button_get_active (self))
]

{ #category : #accessing }
GtkToggleButton >> isDrawingIndicator [

	^ self ffiCall: #(gboolean gtk_toggle_button_get_mode (self))
]

{ #category : #accessing }
GtkToggleButton >> isInconsistent [

	^ self ffiCall: #(gboolean gtk_toggle_button_get_inconsistent (self))
]
