Trait {
	#name : #TGtkHaveWrappingScrollBars,
	#instVars : [
		'innerWidget'
	],
	#category : #'Mars-Spec-Adapter-List'
}

{ #category : #'private accessing' }
TGtkHaveWrappingScrollBars >> innerWidget [
	
	^ innerWidget
]

{ #category : #building }
TGtkHaveWrappingScrollBars >> wrapWidget: gtkWidget [

	innerWidget := gtkWidget.
	self model hasScrollBars ifFalse: [ ^ super wrapWidget: gtkWidget ].
	^ self wrapWithScrollableWindow: innerWidget
]
