Class {
	#name : #GdkEventMask,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GDK_ALL_EVENTS_MASK',
		'GDK_BUTTON1_MOTION_MASK',
		'GDK_BUTTON2_MOTION_MASK',
		'GDK_BUTTON3_MOTION_MASK',
		'GDK_BUTTON_MOTION_MASK',
		'GDK_BUTTON_PRESS_MASK',
		'GDK_BUTTON_RELEASE_MASK',
		'GDK_ENTER_NOTIFY_MASK',
		'GDK_EXPOSURE_MASK',
		'GDK_FOCUS_CHANGE_MASK',
		'GDK_KEY_PRESS_MASK',
		'GDK_KEY_RELEASE_MASK',
		'GDK_LEAVE_NOTIFY_MASK',
		'GDK_POINTER_MOTION_HINT_MASK',
		'GDK_POINTER_MOTION_MASK',
		'GDK_PROPERTY_CHANGE_MASK',
		'GDK_PROXIMITY_IN_MASK',
		'GDK_PROXIMITY_OUT_MASK',
		'GDK_SCROLL_MASK',
		'GDK_STRUCTURE_MASK',
		'GDK_SUBSTRUCTURE_MASK',
		'GDK_VISIBILITY_NOTIFY_MASK'
	],
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_ALL_EVENTS_MASK [
	"This method was automatically generated"
	^ GDK_ALL_EVENTS_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_BUTTON1_MOTION_MASK [
	"This method was automatically generated"
	^ GDK_BUTTON1_MOTION_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_BUTTON2_MOTION_MASK [
	"This method was automatically generated"
	^ GDK_BUTTON2_MOTION_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_BUTTON3_MOTION_MASK [
	"This method was automatically generated"
	^ GDK_BUTTON3_MOTION_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_BUTTON_MOTION_MASK [
	"This method was automatically generated"
	^ GDK_BUTTON_MOTION_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_BUTTON_PRESS_MASK [
	"This method was automatically generated"
	^ GDK_BUTTON_PRESS_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_BUTTON_RELEASE_MASK [
	"This method was automatically generated"
	^ GDK_BUTTON_RELEASE_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_ENTER_NOTIFY_MASK [
	"This method was automatically generated"
	^ GDK_ENTER_NOTIFY_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_EXPOSURE_MASK [
	"This method was automatically generated"
	^ GDK_EXPOSURE_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_FOCUS_CHANGE_MASK [
	"This method was automatically generated"
	^ GDK_FOCUS_CHANGE_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_KEY_PRESS_MASK [
	"This method was automatically generated"
	^ GDK_KEY_PRESS_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_KEY_RELEASE_MASK [
	"This method was automatically generated"
	^ GDK_KEY_RELEASE_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_LEAVE_NOTIFY_MASK [
	"This method was automatically generated"
	^ GDK_LEAVE_NOTIFY_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_POINTER_MOTION_HINT_MASK [
	"This method was automatically generated"
	^ GDK_POINTER_MOTION_HINT_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_POINTER_MOTION_MASK [
	"This method was automatically generated"
	^ GDK_POINTER_MOTION_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_PROPERTY_CHANGE_MASK [
	"This method was automatically generated"
	^ GDK_PROPERTY_CHANGE_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_PROXIMITY_IN_MASK [
	"This method was automatically generated"
	^ GDK_PROXIMITY_IN_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_PROXIMITY_OUT_MASK [
	"This method was automatically generated"
	^ GDK_PROXIMITY_OUT_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_SCROLL_MASK [
	"This method was automatically generated"
	^ GDK_SCROLL_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_STRUCTURE_MASK [
	"This method was automatically generated"
	^ GDK_STRUCTURE_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_SUBSTRUCTURE_MASK [
	"This method was automatically generated"
	^ GDK_SUBSTRUCTURE_MASK
]

{ #category : #'accessing enum' }
GdkEventMask class >> GDK_VISIBILITY_NOTIFY_MASK [
	"This method was automatically generated"
	^ GDK_VISIBILITY_NOTIFY_MASK
]

{ #category : #'enum declaration' }
GdkEventMask class >> enumDecl [

	^ { 
	#GDK_EXPOSURE_MASK		. 1 << 1.
	#GDK_POINTER_MOTION_MASK	. 1 << 2.
	#GDK_POINTER_MOTION_HINT_MASK	. 1 << 3.
	#GDK_BUTTON_MOTION_MASK	. 1 << 4.
	#GDK_BUTTON1_MOTION_MASK	. 1 << 5.
	#GDK_BUTTON2_MOTION_MASK	. 1 << 6.
	#GDK_BUTTON3_MOTION_MASK	. 1 << 7.
	#GDK_BUTTON_PRESS_MASK		. 1 << 8.
	#GDK_BUTTON_RELEASE_MASK	. 1 << 9.
	#GDK_KEY_PRESS_MASK		. 1 << 10.
	#GDK_KEY_RELEASE_MASK		. 1 << 11.
	#GDK_ENTER_NOTIFY_MASK		. 1 << 12.
	#GDK_LEAVE_NOTIFY_MASK		. 1 << 13.
	#GDK_FOCUS_CHANGE_MASK		. 1 << 14.
	#GDK_STRUCTURE_MASK		. 1 << 15.
	#GDK_PROPERTY_CHANGE_MASK	. 1 << 16.
	#GDK_VISIBILITY_NOTIFY_MASK	. 1 << 17.
	#GDK_PROXIMITY_IN_MASK		. 1 << 18.
	#GDK_PROXIMITY_OUT_MASK	. 1 << 19.
	#GDK_SUBSTRUCTURE_MASK		. 1 << 20.
	#GDK_SCROLL_MASK               . 1 << 21.
	#GDK_ALL_EVENTS_MASK		. 16r3FFFFE	
	 }
]
