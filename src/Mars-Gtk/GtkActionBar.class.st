"
GtkActionBar — A full width bar for presenting contextual actions

https://developer.gnome.org/gtk3/stable/GtkActionBar.html
"
Class {
	#name : #GtkActionBar,
	#superclass : #GtkBin,
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #private }
GtkActionBar class >> actionBarNew [

	^ self ffiCall: #(GtkActionBar *gtk_action_bar_new (void))
]

{ #category : #accessing }
GtkActionBar class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gtk_action_bar_init(void *object))
]

{ #category : #accessing }
GtkActionBar class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_action_bar_get_type())
]

{ #category : #'instance creation' }
GtkActionBar class >> new [

	^ self actionBarNew initialize
]

{ #category : #private }
GtkActionBar >> basicPackEnd: child [

	^ self ffiCall: #(void gtk_action_bar_pack_end (self, GtkWidget *child))
]

{ #category : #private }
GtkActionBar >> basicPackStart: child [

	^ self ffiCall: #(void gtk_action_bar_pack_start (self, GtkWidget *child))
]

{ #category : #accessing }
GtkActionBar >> centerWidget [
	"It will answer a generic widget, you need to 'cast' it to what it really is. 
	 Default is GtkBox (TO VERIFY)"

	^ self ffiCall: #(GtkWidget *gtk_action_bar_get_center_widget (self))
]

{ #category : #accessing }
GtkActionBar >> centerWidget: center_widget [

	^ self ffiCall: #(void gtk_action_bar_set_center_widget (
		self,
		GtkWidget *center_widget))
]

{ #category : #accessing }
GtkActionBar >> packEnd: child [ 

	self keepWidget: child.
	self basicPackEnd: child.

	^ child
]

{ #category : #accessing }
GtkActionBar >> packStart: child [ 

	self keepWidget: child.
	self basicPackStart: child.

	^ child
]
