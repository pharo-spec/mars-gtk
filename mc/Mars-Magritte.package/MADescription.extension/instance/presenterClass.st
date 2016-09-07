*Mars-Magritte
presenterClass
	^ self propertyAt: #presenterClass ifAbsent: [ self class defaultPresenterClass ]	