"
GtkStackSidebar
GtkStackSidebar — An automatic sidebar widget

https://developer.gnome.org/gtk3/stable/GtkStackSidebar.html#gtk-stack-sidebar-set-stack
"
Class {
	#name : #GtkStackSidebar,
	#superclass : #GtkBin,
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #'instance creation' }
GtkStackSidebar class >> forStack: aStack [

	^ self new stack: aStack; yourself
]

{ #category : #private }
GtkStackSidebar class >> gtkNewStackSidebar [

	^ self ffiCall: #(GtkStackSidebar *gtk_stack_sidebar_new (void))
]

{ #category : #'instance creation' }
GtkStackSidebar class >> new [

	^ self gtkNewStackSidebar initialize
]

{ #category : #accessing }
GtkStackSidebar >> stack [

	^ self ffiCall: #(GtkStack gtk_stack_sidebar_get_stack (self))
]

{ #category : #accessing }
GtkStackSidebar >> stack: aStack [

	self ffiCall: #(void gtk_stack_sidebar_set_stack (self, GtkStack *aStack))
]
