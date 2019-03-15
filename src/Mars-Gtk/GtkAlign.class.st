"
I control how a widget deals with extra space in a single (x or y) dimension.

https://developer.gnome.org/gtk3/stable/GtkWidget.html#GtkAlign
"
Class {
	#name : #GtkAlign,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_ALIGN_BASELINE',
		'GTK_ALIGN_CENTER',
		'GTK_ALIGN_END',
		'GTK_ALIGN_FILL',
		'GTK_ALIGN_START'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'accessing enum' }
GtkAlign class >> GTK_ALIGN_BASELINE [
	"This method was automatically generated"
	^ GTK_ALIGN_BASELINE
]

{ #category : #'accessing enum' }
GtkAlign class >> GTK_ALIGN_CENTER [
	"This method was automatically generated"
	^ GTK_ALIGN_CENTER
]

{ #category : #'accessing enum' }
GtkAlign class >> GTK_ALIGN_END [
	"This method was automatically generated"
	^ GTK_ALIGN_END
]

{ #category : #'accessing enum' }
GtkAlign class >> GTK_ALIGN_FILL [
	"This method was automatically generated"
	^ GTK_ALIGN_FILL
]

{ #category : #'accessing enum' }
GtkAlign class >> GTK_ALIGN_START [
	"This method was automatically generated"
	^ GTK_ALIGN_START
]

{ #category : #'enum declaration' }
GtkAlign class >> enumDecl [
	^ #(
	GTK_ALIGN_FILL 			0
	GTK_ALIGN_START 		1
	GTK_ALIGN_END 			2
	GTK_ALIGN_CENTER 		3
	GTK_ALIGN_BASELINE	 	4
	)
]
