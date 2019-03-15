Class {
	#name : #GtkRevealerTransitionType,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_REVEALER_TRANSITION_TYPE_CROSSFADE',
		'GTK_REVEALER_TRANSITION_TYPE_NONE',
		'GTK_REVEALER_TRANSITION_TYPE_SLIDE_DOWN',
		'GTK_REVEALER_TRANSITION_TYPE_SLIDE_LEFT',
		'GTK_REVEALER_TRANSITION_TYPE_SLIDE_RIGHT',
		'GTK_REVEALER_TRANSITION_TYPE_SLIDE_UP'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'accessing enum' }
GtkRevealerTransitionType class >> GTK_REVEALER_TRANSITION_TYPE_CROSSFADE [
	"This method was automatically generated"
	^ GTK_REVEALER_TRANSITION_TYPE_CROSSFADE
]

{ #category : #'accessing enum' }
GtkRevealerTransitionType class >> GTK_REVEALER_TRANSITION_TYPE_NONE [
	"This method was automatically generated"
	^ GTK_REVEALER_TRANSITION_TYPE_NONE
]

{ #category : #'accessing enum' }
GtkRevealerTransitionType class >> GTK_REVEALER_TRANSITION_TYPE_SLIDE_DOWN [
	"This method was automatically generated"
	^ GTK_REVEALER_TRANSITION_TYPE_SLIDE_DOWN
]

{ #category : #'accessing enum' }
GtkRevealerTransitionType class >> GTK_REVEALER_TRANSITION_TYPE_SLIDE_LEFT [
	"This method was automatically generated"
	^ GTK_REVEALER_TRANSITION_TYPE_SLIDE_LEFT
]

{ #category : #'accessing enum' }
GtkRevealerTransitionType class >> GTK_REVEALER_TRANSITION_TYPE_SLIDE_RIGHT [
	"This method was automatically generated"
	^ GTK_REVEALER_TRANSITION_TYPE_SLIDE_RIGHT
]

{ #category : #'accessing enum' }
GtkRevealerTransitionType class >> GTK_REVEALER_TRANSITION_TYPE_SLIDE_UP [
	"This method was automatically generated"
	^ GTK_REVEALER_TRANSITION_TYPE_SLIDE_UP
]

{ #category : #'enum declaration' }
GtkRevealerTransitionType class >> enumDecl [
	^ #(
	GTK_REVEALER_TRANSITION_TYPE_NONE         0
	GTK_REVEALER_TRANSITION_TYPE_CROSSFADE    1
	GTK_REVEALER_TRANSITION_TYPE_SLIDE_RIGHT  2
	GTK_REVEALER_TRANSITION_TYPE_SLIDE_LEFT   3
	GTK_REVEALER_TRANSITION_TYPE_SLIDE_UP     4
	GTK_REVEALER_TRANSITION_TYPE_SLIDE_DOWN   5
	)
]
