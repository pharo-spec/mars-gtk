rendering
render: aRenderable
	window := self newGtkWindow: aRenderable.
	
	"self installActionsOnModel: window fromPresentation: aRenderable .
	self installKeystrokeActionsOnMorph: window fromPresentation: aRenderable."
	"self basicRender: aRenderable."
	
	^ window	