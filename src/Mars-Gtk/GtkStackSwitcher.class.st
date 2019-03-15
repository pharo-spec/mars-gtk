"
GtkStackSwitcher
GtkStackSwitcher — A controller for GtkStack

https://developer.gnome.org/gtk3/stable/GtkStackSwitcher.html
"
Class {
	#name : #GtkStackSwitcher,
	#superclass : #GtkBox,
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #'instance creation' }
GtkStackSwitcher class >> forStack: aStack [

	^ self new stack: aStack; yourself
]

{ #category : #'instance creation' }
GtkStackSwitcher class >> gtkNewStackSwitcher [

	^ self ffiCall: #(GtkStackSwitcher * gtk_stack_switcher_new (void))
]

{ #category : #'instance creation' }
GtkStackSwitcher class >> new [

	^ self gtkNewStackSwitcher initialize
]

{ #category : #accessing }
GtkStackSwitcher >> stack [

	^ self ffiCall: #(GtkStack gtk_stack_switcher_get_stack (self))
]

{ #category : #accessing }
GtkStackSwitcher >> stack: aStack [

	self ffiCall: #(void gtk_stack_switcher_set_stack (self, GtkStack *aStack))
]
