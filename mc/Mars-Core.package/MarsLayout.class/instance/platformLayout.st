accessing
platformLayout
	^ platformLayout ifNil: [ platformLayout := self createPlatformLayout ]