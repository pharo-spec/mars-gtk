rendering
render: aRenderable
	| toolbar container |
	
	window := self buildWindow: aRenderable.
	window title: (self titleFor: aRenderable).
	
	container := window.
	aRenderable hasToolbar ifTrue: [ 
		toolbar := self buildToolbarFor: aRenderable.
		container := self ensureBox: container inWindow: window.
		container packStart: toolbar expand: false fill: false padding: 0 ].
	
	"self installActionsOnModel: window fromPresentation: aRenderable .
	self installKeystrokeActionsOnMorph: window fromPresentation: aRenderable."
	"self basicRender: aRenderable."
	
	^ window	