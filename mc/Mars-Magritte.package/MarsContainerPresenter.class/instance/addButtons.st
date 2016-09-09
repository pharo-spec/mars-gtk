accessing
addButtons
	self addButtons: { 
		MarsButtonPresenter label: 'Accept' icon: #smallOk asIcon action: [ :this | this save ].
		MarsButtonPresenter label: 'Cancel' icon: #smallCancel asIcon action: [ :this | this cancel ] 
	}