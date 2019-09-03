Class {
	#name : #GtkSourceCompletionProviderForTest,
	#superclass : #GInterface,
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #private }
GtkSourceCompletionProviderForTest class >> definitionClass [

	^ GtkSourceCompletionProviderIface
]

{ #category : #accessing }
GtkSourceCompletionProviderForTest >> map: interface [

	interface 
		map: #get_priority with: [ :provider | 0 ];
		map: #get_name with: [ :provider | self name ];
		map: #populate with: [ :provider :context | self populate: context ].
	
]
