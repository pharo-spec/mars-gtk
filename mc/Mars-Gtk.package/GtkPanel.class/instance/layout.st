accessing
layout 
	^ layout ifNil: [ layout := self class defaultLayoutClass panel: self ]