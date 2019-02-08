"
GtkProgressBar
GtkProgressBar — A widget which indicates progress visually

https://developer.gnome.org/gtk3/stable/GtkProgressBar.html
"
Class {
	#name : #GtkProgressBar,
	#superclass : #GtkWidget,
	#category : #'Mars-Gtk-Widget-Display'
}

{ #category : #private }
GtkProgressBar class >> gtkProgressBarNew [

	^ self ffiCall: #(GtkProgressBar *gtk_progress_bar_new (void))
]

{ #category : #'instance creation' }
GtkProgressBar class >> new [

	^ self gtkProgressBarNew initialize
]

{ #category : #private }
GtkProgressBar >> basicText [

	^ self ffiCall: #(String gtk_progress_bar_get_text (self))
]

{ #category : #private }
GtkProgressBar >> basicText: utf8EncodedText [

	^ self ffiCall: #(void gtk_progress_bar_set_text (self, String utf8EncodedText))
]

{ #category : #accessing }
GtkProgressBar >> beInverted [

	^ self inverted: true
]

{ #category : #accessing }
GtkProgressBar >> beNormal [

	^ self inverted: false
]

{ #category : #accessing }
GtkProgressBar >> doNotShowText [

	self showText: false
]

{ #category : #accessing }
GtkProgressBar >> inverted [

	self ffiCall: #(gboolean gtk_progress_bar_get_inverted (self))
]

{ #category : #accessing }
GtkProgressBar >> inverted: aBoolean [

	self ffiCall: #(void gtk_progress_bar_set_inverted (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkProgressBar >> progress [

	^ self ffiCall: #(gdouble gtk_progress_bar_get_fraction (self))
]

{ #category : #accessing }
GtkProgressBar >> progress: fraction [

	self ffiCall: #(void gtk_progress_bar_set_fraction (self, gdouble fraction))
]

{ #category : #accessing }
GtkProgressBar >> pulse [

	^ self ffiCall: #(void gtk_progress_bar_pulse (self))
]

{ #category : #accessing }
GtkProgressBar >> pulseStep [

	^ self ffiCall: #(gdouble gtk_progress_bar_get_pulse_step (self))
]

{ #category : #accessing }
GtkProgressBar >> pulseStep: fraction [

	self ffiCall: #(void gtk_progress_bar_set_pulse_step (self, gdouble fraction))
]

{ #category : #accessing }
GtkProgressBar >> showText [

	self showText: true
]

{ #category : #accessing }
GtkProgressBar >> showText: aBoolean [

	^ self ffiCall: #(void gtk_progress_bar_set_show_text (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkProgressBar >> showsText [

	^ self ffiCall: #(gboolean gtk_progress_bar_get_show_text (self))
]

{ #category : #accessing }
GtkProgressBar >> text [

	^ self basicText
]

{ #category : #accessing }
GtkProgressBar >> text: aString [

	self basicText: aString
]
