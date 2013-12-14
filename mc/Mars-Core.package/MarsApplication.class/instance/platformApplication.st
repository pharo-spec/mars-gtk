accessing
platformApplication
	^ platformApplication ifNil: [ platformApplication :=  self toolkit applicationClass new ]