accessing
interface
	^ interface ifNil: [ interface := self createInterface ]