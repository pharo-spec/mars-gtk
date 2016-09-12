printing
printOneLineContentsOn: stream
	stream print: self target; << '('; print: self handle; << ')'