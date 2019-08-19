"
I'm a representation of an adjustable bounded value.

https://developer.gnome.org/gtk3/stable/GtkAdjustment.html
"
Class {
	#name : #GtkAdjustment,
	#superclass : #GObject,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Misc'
}

{ #category : #private }
GtkAdjustment class >> adjustementValue: value lower: lower upper: upper stepIncrement: step_increment pageIncrement: page_increment pageSize: page_size [

	^ self ffiCall: #(GtkAdjustment *gtk_adjustment_new (
		gdouble value,
		gdouble lower,
		gdouble upper,
		gdouble step_increment,
 		gdouble page_increment,
		gdouble page_size))
]

{ #category : #'instance creation' }
GtkAdjustment class >> newDefault [ 
	
	^ self 
		newValue: 0 
		lower: 0 
		upper: 100 
		stepIncrement: 1 
		pageIncrement: 10
		pageSize: 0
]

{ #category : #'instance creation' }
GtkAdjustment class >> newValue: value lower: lower upper: upper stepIncrement: step_increment pageIncrement: page_increment pageSize: page_size [

	^ (self 
		adjustementValue: value 
		lower: lower 
		upper: upper 
		stepIncrement: step_increment 
		pageIncrement: page_increment 
		pageSize: page_size) 
		initialize
]

{ #category : #accessing }
GtkAdjustment >> configureValue: value lower: lower upper: upper stepIncrement: step_increment pageIncrement: page_increment pageSize: page_size [

	^ self ffiCall: #(void gtk_adjustment_configure (self,
		gdouble value,
		gdouble lower,
		gdouble upper,
		gdouble step_increment,
		gdouble page_increment,
		gdouble page_size))
]

{ #category : #accessing }
GtkAdjustment >> lower [

	^ self ffiCall: #(gdouble gtk_adjustment_get_lower (self))
]

{ #category : #accessing }
GtkAdjustment >> pageIncrement [

	^ self ffiCall: #(gdouble gtk_adjustment_get_page_increment (self))
]

{ #category : #accessing }
GtkAdjustment >> pageSize [

	^ self ffiCall: #(gdouble gtk_adjustment_get_page_size (self))
]

{ #category : #accessing }
GtkAdjustment >> upper [

	^ self ffiCall: #(gdouble gtk_adjustment_get_upper (self))
]

{ #category : #accessing }
GtkAdjustment >> value [ 

	^ self ffiCall: #(gdouble gtk_adjustment_get_value (self))
]

{ #category : #accessing }
GtkAdjustment >> value: value [

	self ffiCall: #(void gtk_adjustment_set_value (self, gdouble value))
]
