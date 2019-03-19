Extension { #name : #GtkScale }

{ #category : #'*Mars-Spec' }
GtkScale >> marks: aCollectionOfMarks [
	self clearMarks.
	aCollectionOfMarks
		do: [ :m | 
			self
				addMarkAtValue: m value
				withPosition: GtkPositionType GTK_POS_BOTTOM
				withText: m text ].
]
