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
		separatedBy: [ self flag: #TODO. "add a separator" ]	
]

{ #category : #accessing }
GtkMenuAdapter >> gtkClass [

	^ GtkMenu
]
