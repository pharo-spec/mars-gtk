accessing
version
	^ String streamContents: [ :stream | 
		stream 
			print: self gtkGetMajorVersion;
			nextPut: $.;
			print: self gtkGetMinorVersion;
			nextPut: $.;
			print: self gtkGetMicroVersion ]