"
The “populate-popup” signal

void
user_function (GtkTextView *text_view,
               GtkWidget   *popup,
               gpointer     user_data)

The ::populate-popup signal gets emitted before showing the context menu of the text view.
If you need to add items to the context menu, connect to this signal and append your items to the popup , which will be a GtkMenu in this case.
If “populate-all” is TRUE, this signal will also be emitted to populate touch popups. In this case, popup will be a different container, e.g. a GtkToolbar.
The signal handler should not make assumptions about the type of widget , but check whether popup is a GtkMenu or GtkToolbar or another kind of container.
"
Class {
	#name : #GPopulatePopupCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GPopulatePopupCallback >> do: aBlock [ 

	^ super do: [ :text :popup :user_data | 
		aBlock value: (GtkMenu fromHandle: popup) ]
]

{ #category : #accessing }
GPopulatePopupCallback >> signalName [

	^ 'populate-popup'
]

{ #category : #accessing }
GPopulatePopupCallback >> signature [

	^ #(void (void *text_view, void *popup, gpointer *user_data))
]
