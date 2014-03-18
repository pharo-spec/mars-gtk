accessing
objCBridge:spec
	spec project: 'ObjCBridge' with: [ 
		spec 
			className: 'ConfigurationOfOldAlien';
			loads: #('ObjectiveCBridge');
			version: #stable;
			repository: 'http://www.squeaksource.com/Alien' ].
	