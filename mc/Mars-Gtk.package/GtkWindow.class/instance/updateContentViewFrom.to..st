updating
updateContentViewFrom: oldPlatformView to: newPlatformView
	"Updates window content view. 
	 If there is an old one, it has to remove it. 
	 Otherwise, it just adds it"
	
	oldPlatformView ifNotNil: [ self removeContentView: oldPlatformView ].
	self addContentView: newPlatformView