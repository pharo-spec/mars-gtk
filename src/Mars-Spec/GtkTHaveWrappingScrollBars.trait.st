Trait {
	#name : #GtkTHaveWrappingScrollBars,
	#instVars : [
		'innerWidget'
	],
	#category : #'Mars-Spec-Adapter-List'
}

{ #category : #'private accessing' }
GtkTHaveWrappingScrollBars >> innerWidget [
	
	^ innerWidget
]

{ #category : #building }
GtkTHaveWrappingScrollBars >> wrapWidget: gtkWidget [

	innerWidget := gtkWidget.
	self model hasScrollBars ifFalse: [ ^ super wrapWidget: gtkWidget ].
	^ self wrapWithScrollableWindow: innerWidget
]
