"
GtkSpinButton — Retrieve an integer or floating-point number from the user

https://developer.gnome.org/gtk3/stable/GtkSpinButton.html
"
Class {
	#name : #GtkSpinButton,
	#superclass : #GtkEntry,
	#pools : [
		'GtkInputPurpose'
	],
	#category : #'Mars-Gtk-Widget-Input'
}

{ #category : #accessing }
GtkSpinButton class >> defaultAdjustment [

	^ GtkAdjustment new
]

{ #category : #accessing }
GtkSpinButton class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gtk_spin_button_init(void *object))
]

{ #category : #accessing }
GtkSpinButton class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_spin_button_get_type())
]

{ #category : #'instance creation' }
GtkSpinButton class >> new [ 
	
	^ self 
		newAdjustment: self defaultAdjustment
		climbRate: 1.0
		digits: 0
]

{ #category : #'instance creation' }
GtkSpinButton class >> newAdjustment: anAdjustment climbRate: aFloat digits: aNumber [

	^ (self 
		spinButtonNewAdjustment: anAdjustment 
		climbRate: aFloat asFloat
		digits: aNumber)
		initialize
]

{ #category : #'instance creation' }
GtkSpinButton class >> newClimbRate: aFloat digits: aNumber [
	
	^ self 
		newAdjustment: self defaultAdjustment
		climbRate: aFloat asFloat
		digits: aNumber
]

{ #category : #'instance creation' }
GtkSpinButton class >> newDigits: aNumber [
	
	^ self 
		newAdjustment: self defaultAdjustment
		climbRate: 1.0
		digits: aNumber
]

{ #category : #'instance creation' }
GtkSpinButton class >> newWithRangeMinimum: min maximum: max step: step [

	 ^ (self 
		spinButtonNewWithRangeMin: min 
			max: max 
			step: step)
		initialize
]

{ #category : #private }
GtkSpinButton class >> spinButtonNewAdjustment: adjustment climbRate: climb_rate digits: digits [

	^ self ffiCall: #(GtkSpinButton *gtk_spin_button_new (
		GtkAdjustment *adjustment,
		gdouble climb_rate,
 		guint digits))
]

{ #category : #private }
GtkSpinButton class >> spinButtonNewWithRangeMin: min max: max step: step [

	^ self ffiCall: #(GtkSpinButton *gtk_spin_button_new_with_range (
		gdouble min,
		gdouble max,
		gdouble step))
]

{ #category : #accessing }
GtkSpinButton >> adjustment [

	^ self ffiCall: #(GtkAdjustment *gtk_spin_button_get_adjustment (self))
]

{ #category : #accessing }
GtkSpinButton >> adjustment: adjustment [

	^ self ffiCall: #(void gtk_spin_button_set_adjustment (self, GtkAdjustment *adjustment))
]

{ #category : #accessing }
GtkSpinButton >> beNumber [ 

	super beNumber.
	self numeric: true
]

{ #category : #accessing }
GtkSpinButton >> climbRate [

	^ self gObjectGetDouble: 'climb-rate'
]

{ #category : #accessing }
GtkSpinButton >> climbRate: rate [

	^ self gObjectSet: 'climb-rate' toDouble: rate asFloat
]

{ #category : #accessing }
GtkSpinButton >> digits [

	^ self ffiCall: #(guint gtk_spin_button_get_digits (self))
]

{ #category : #accessing }
GtkSpinButton >> digits: digits [

	^ self ffiCall: #(void gtk_spin_button_set_digits (self, guint digits))
]

{ #category : #private }
GtkSpinButton >> getRangeMin: min max: max [
	
	self ffiCall: #(void gtk_spin_button_get_range (self, gdouble *min, gdouble *max))
]

{ #category : #testing }
GtkSpinButton >> isNumeric [

	self ffiCall: #(gboolean gtk_spin_button_get_numeric (self))
]

{ #category : #accessing }
GtkSpinButton >> numeric: numeric [

	self ffiCall: #(void gtk_spin_button_set_numeric (self, gboolean numeric))
]

{ #category : #accessing }
GtkSpinButton >> range [
	| type min max |

	
	type := self class resolveType: 'gdouble'.
	min := type newBuffer.
	max := type newBuffer.
	self getRangeMin: min max: max.
	^ (min floatAt: 1) @ (max floatAt: 1)
	
]

{ #category : #accessing }
GtkSpinButton >> rangeMinimum: minFloat maximum: maxFloat [

	self 
		setRangeMin: minFloat asFloat 
		max: maxFloat asFloat 
]

{ #category : #private }
GtkSpinButton >> setRangeMin: min max: max [

	self ffiCall: #(void gtk_spin_button_set_range (self, gdouble min, gdouble max))
	 
]

{ #category : #private }
GtkSpinButton >> setValue: value [

	self ffiCall: #(void gtk_spin_button_set_value (self, gdouble value))
]

{ #category : #accessing }
GtkSpinButton >> value: aFloat [

	^ self setValue: aFloat asFloat
]

{ #category : #accessing }
GtkSpinButton >> valueAsFloat [

	^ self ffiCall: #(gdouble gtk_spin_button_get_value (self))
]

{ #category : #accessing }
GtkSpinButton >> valueAsInt [

	^ self ffiCall: #(gint gtk_spin_button_get_value_as_int (self))
]
