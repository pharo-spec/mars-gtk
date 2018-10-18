Class {
	#name : #GtkMenuAdapter,
	#superclass : #GtkMenuBaseAdapter,
	#category : #'Mars-Spec'
}

{ #category : #building }
GtkMenuAdapter >> addModelTo: gtkWidget [

	self model menuGroups 
		do: [ :eachGroup | 
			eachGroup menuItems 
				do: [ :each | gtkWidget add: each buildWithSpec ] ]
		separatedBy: [ 
			gtkWidget add: GtkSeparatorMenuItem new ]	
]

{ #category : #accessing }
GtkMenuAdapter >> gtkClass [

	^ GtkMenu
]
