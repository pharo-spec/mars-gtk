private
childFromRowWidget: aHandle
	aHandle isNull ifTrue: [ ^ nil ].
	^ (GtkListBoxRow fromHandle: aHandle) firstChild