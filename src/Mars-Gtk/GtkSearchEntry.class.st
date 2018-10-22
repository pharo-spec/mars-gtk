"
GtkSearchEntry
GtkSearchEntry — An entry which shows a search icon

https://developer.gnome.org/gtk3/stable/GtkSearchEntry.html
"
Class {
	#name : #GtkSearchEntry,
	#superclass : #GtkEntry,
	#category : #'Mars-Gtk-Widget-Input'
}

{ #category : #private }
GtkSearchEntry class >> gtkSearchEntryNew [

	^ self ffiCall: #(GtkSearchEntry *gtk_search_entry_new (void))
]

{ #category : #'instance creation' }
GtkSearchEntry class >> new [

	^ self gtkSearchEntryNew initialize
]

{ #category : #events }
GtkSearchEntry >> connectNextMatch: aBlock [

	^ self connect: 'next-match' do: aBlock
]

{ #category : #events }
GtkSearchEntry >> connectPreviousMatch: aBlock [

	^ self connect: 'previous-match' do: aBlock
]

{ #category : #events }
GtkSearchEntry >> connectSearchChanged: aBlock [

	^ self connect: 'search-changed' do: aBlock
]

{ #category : #events }
GtkSearchEntry >> connectStopSearch: aBlock [

	^ self connect: 'stop-search' do: aBlock
]

{ #category : #events }
GtkSearchEntry >> handleEvent: anEvent [

	^ self ffiCall: #(gboolean gtk_search_entry_handle_event (self, GdkEvent *event))
]
