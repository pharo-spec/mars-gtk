printing
printOneLineContentsOn: stream
	stream print: self widget; << '('; print: self widget getHandle; << ')'