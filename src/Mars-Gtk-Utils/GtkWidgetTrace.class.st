Class {
	#name : #GtkWidgetTrace,
	#superclass : #Object,
	#instVars : [
		'widgetClass',
		'handle'
	],
	#category : #'Mars-Gtk-Utils'
}

{ #category : #accessing }
GtkWidgetTrace >> handle [
	^ handle
]

{ #category : #accessing }
GtkWidgetTrace >> handle: anObject [
	handle := anObject
]

{ #category : #accessing }
GtkWidgetTrace >> widgetClass [
	^ widgetClass
]

{ #category : #accessing }
GtkWidgetTrace >> widgetClass: anObject [
	widgetClass := anObject
]
