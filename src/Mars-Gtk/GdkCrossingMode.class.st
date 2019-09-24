Class {
	#name : #GdkCrossingMode,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GDK_CROSSING_DEVICE_SWITCH',
		'GDK_CROSSING_GRAB',
		'GDK_CROSSING_GTK_GRAB',
		'GDK_CROSSING_GTK_UNGRAB',
		'GDK_CROSSING_NORMAL',
		'GDK_CROSSING_STATE_CHANGED',
		'GDK_CROSSING_TOUCH_BEGIN',
		'GDK_CROSSING_TOUCH_END',
		'GDK_CROSSING_UNGRAB'
	],
	#category : #'Mars-Gtk-Base-Events'
}

{ #category : #'accessing enum' }
GdkCrossingMode class >> GDK_CROSSING_DEVICE_SWITCH [
	"This method was automatically generated"
	^ GDK_CROSSING_DEVICE_SWITCH
]

{ #category : #'accessing enum' }
GdkCrossingMode class >> GDK_CROSSING_GRAB [
	"This method was automatically generated"
	^ GDK_CROSSING_GRAB
]

{ #category : #'accessing enum' }
GdkCrossingMode class >> GDK_CROSSING_GTK_GRAB [
	"This method was automatically generated"
	^ GDK_CROSSING_GTK_GRAB
]

{ #category : #'accessing enum' }
GdkCrossingMode class >> GDK_CROSSING_GTK_UNGRAB [
	"This method was automatically generated"
	^ GDK_CROSSING_GTK_UNGRAB
]

{ #category : #'accessing enum' }
GdkCrossingMode class >> GDK_CROSSING_NORMAL [
	"This method was automatically generated"
	^ GDK_CROSSING_NORMAL
]

{ #category : #'accessing enum' }
GdkCrossingMode class >> GDK_CROSSING_STATE_CHANGED [
	"This method was automatically generated"
	^ GDK_CROSSING_STATE_CHANGED
]

{ #category : #'accessing enum' }
GdkCrossingMode class >> GDK_CROSSING_TOUCH_BEGIN [
	"This method was automatically generated"
	^ GDK_CROSSING_TOUCH_BEGIN
]

{ #category : #'accessing enum' }
GdkCrossingMode class >> GDK_CROSSING_TOUCH_END [
	"This method was automatically generated"
	^ GDK_CROSSING_TOUCH_END
]

{ #category : #'accessing enum' }
GdkCrossingMode class >> GDK_CROSSING_UNGRAB [
	"This method was automatically generated"
	^ GDK_CROSSING_UNGRAB
]

{ #category : #'enum declaration' }
GdkCrossingMode class >> enumDecl [
	"self initializeEnumeration; rebuildEnumAccessors"
	
	^ #(
		GDK_CROSSING_NORMAL          0
		GDK_CROSSING_GRAB            1
		GDK_CROSSING_UNGRAB          2
		GDK_CROSSING_GTK_GRAB        3
		GDK_CROSSING_GTK_UNGRAB      4
		GDK_CROSSING_STATE_CHANGED   5
		GDK_CROSSING_TOUCH_BEGIN     6
		GDK_CROSSING_TOUCH_END       7
		GDK_CROSSING_DEVICE_SWITCH   8
	)
]
