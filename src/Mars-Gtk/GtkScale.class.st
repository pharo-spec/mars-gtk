"
GtkScale
GtkScale — A slider widget for selecting a value from a range

https://developer.gnome.org/gtk3/stable/GtkScale.html
"
Class {
	#name : #GtkScale,
	#superclass : #GtkWidget,
	#pools : [
		'GtkOrientation',
		'GtkPositionType'
	],
	#category : #'Mars-Gtk-Widget-Input'
}

{ #category : #private }
GtkScale class >> gtkNewOrientation: orientation min: min max: max step: step [

	^ self ffiCall: #(GtkScale * gtk_scale_new_with_range (GtkOrientation orientation,
                          gdouble min,
                          gdouble max,
                          gdouble step))
]

{ #category : #'instance creation' }
GtkScale class >> newHorizontalMin: min max: max step: step [

	^ self newOrientation: GTK_ORIENTATION_HORIZONTAL min: min max: max step: step
]

{ #category : #private }
GtkScale class >> newOrientation: orientation min: min max: max step: step [

	^ (self gtkNewOrientation: orientation min: min max: max step: step) initialize
]

{ #category : #'instance creation' }
GtkScale class >> newVerticalMin: min max: max step: step [

	^ self newOrientation: GTK_ORIENTATION_VERTICAL min: min max: max step: step
]

{ #category : #accessing }
GtkScale >> addMarkAtValue: value withPosition: position [

	^ self ffiCall: #(void gtk_scale_add_mark (self, gdouble value,
                    GtkPositionType position,
                    0))
]

{ #category : #accessing }
GtkScale >> addMarkAtValue: value withPosition: position withText: markup [

	self basicAddMarkAtValue: value withPosition: position withText: markup
]

{ #category : #private }
GtkScale >> basicAddMarkAtValue: value withPosition: position withText: utf8EncodedString [

	^ self ffiCall: #(void gtk_scale_add_mark (self, gdouble value,
                    GtkPositionType position,
                    String utf8EncodedString))
]

{ #category : #accessing }
GtkScale >> clearMarks [

	self ffiCall: #(void gtk_scale_clear_marks (self))
]

{ #category : #accessing }
GtkScale >> digits [

	^ self ffiCall: #(gint gtk_scale_get_digits (self))
]

{ #category : #accessing }
GtkScale >> digits: digits [

	self ffiCall: #(void gtk_scale_set_digits (self, gint digits))
]

{ #category : #accessing }
GtkScale >> drawValue: aBoolean [

	^ self ffiCall: #(void gtk_scale_set_draw_value (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkScale >> drawsValue [

	^ self ffiCall: #(gboolean gtk_scale_get_draw_value (self))
]

{ #category : #accessing }
GtkScale >> hasOrigin [

	^ self ffiCall: #(gboolean gtk_scale_get_has_origin (self))
]

{ #category : #accessing }
GtkScale >> hasOrigin: aBoolean [

	^ self ffiCall: #(void gtk_scale_set_has_origin (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkScale >> valueAtBottom [

	self valuePosition: GTK_POS_BOTTOM
]

{ #category : #accessing }
GtkScale >> valueAtLeft [

	self valuePosition: GTK_POS_LEFT
]

{ #category : #accessing }
GtkScale >> valueAtRight [

	self valuePosition: GTK_POS_RIGHT
]

{ #category : #accessing }
GtkScale >> valueAtTop [

	self valuePosition: GTK_POS_TOP
]

{ #category : #accessing }
GtkScale >> valuePosition [

	^ self ffiCall: #(GtkPositionType gtk_scale_get_value_pos (self))
]

{ #category : #accessing }
GtkScale >> valuePosition: aPosition [

	self ffiCall: #(void gtk_scale_set_value_pos (self, GtkPositionType aPosition))
]
