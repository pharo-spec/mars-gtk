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
	#category : #'Mars-Gtk-Widget'
}

{ #category : #accessing }
GtkSpinButton class >> defaultAdjustment [

	^ GtkAdjustment new
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

	^ self 
		spinButtonNewAdjustment: anAdjustment 
		climbRate: aFloat asFloat
		digits: aNumber
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

{ #category : #private }
GtkSpinButton class >> spinButtonNewAdjustment: adjustment climbRate: climb_rate digits: digits [

	^ self ffiCall: #(GtkSpinButton *gtk_spin_button_new (
		GtkAdjustment *adjustment,
		gdouble climb_rate,
 		guint digits))
]
