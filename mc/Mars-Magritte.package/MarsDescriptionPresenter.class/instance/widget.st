accessing
widget
	^ widget ifNil: [ widget := self buildWidget ]