accessing
widgetOn: aContainer
	^ widget ifNil: [ widget := self buildWidgetOn: aContainer ]