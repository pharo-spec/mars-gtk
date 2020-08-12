"
Describes constraints to positioning of popovers. More values may be added to this enumeration in the future.

https://developer.gnome.org/gtk3/stable/GtkPopover.html#GtkPopoverConstraint
"
Class {
	#name : #GtkPopoverConstraint,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_POPOVER_CONSTRAINT_NONE',
		'GTK_POPOVER_CONSTRAINT_WINDOW'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'accessing enum' }
GtkPopoverConstraint class >> GTK_POPOVER_CONSTRAINT_NONE [
	"This method was automatically generated"
	^ GTK_POPOVER_CONSTRAINT_NONE
]

{ #category : #'accessing enum' }
GtkPopoverConstraint class >> GTK_POPOVER_CONSTRAINT_WINDOW [
	"This method was automatically generated"
	^ GTK_POPOVER_CONSTRAINT_WINDOW
]

{ #category : #'enum declaration' }
GtkPopoverConstraint class >> enumDecl [
	^ #(
	GTK_POPOVER_CONSTRAINT_NONE 	0
  	GTK_POPOVER_CONSTRAINT_WINDOW	1
	)
]
