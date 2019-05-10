Extension { #name : #AthensCairoSurface }

{ #category : #'*Mars-Gtk' }
AthensCairoSurface >> directDrawDuring: aBlock [
	"You may draw on receiver only when inside a block and only using provided canvas object.
	This ensures releasing system resources used after finishing drawing"

	currentCanvas ifNotNil: [ self attemptToRecurseDrawing ].
	[
		currentCanvas := context.
		aBlock cull: currentCanvas.
		self flush.
	] ensure: [
		currentCanvas := nil ].
]

{ #category : #'*Mars-Gtk' }
AthensCairoSurface >> fromCanvas: aCanvas [

	session := Smalltalk session.
	"id := self class registerSurface: self."
	context := aCanvas.
	builder := AthensCairoPathBuilder new.
	builder context: context.
	ftFontRenderer := CairoFreetypeFontRenderer new 
		canvas: context;
		yourself
]

{ #category : #'*Mars-Gtk' }
AthensCairoSurface >> getHandle [

	^ handle
]
