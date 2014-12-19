accessing
accelGroupHandle
	^ accelGroupHandle ifNil: [ accelGroupHandle := self createAccelGroupHandle ]