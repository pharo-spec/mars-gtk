accessing
platformApplication
	^ platformApplication ifNil: [ platformApplication :=  self toolkit applicationClass application: self ]