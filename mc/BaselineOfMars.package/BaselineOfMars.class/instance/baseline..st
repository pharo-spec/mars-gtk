accessing
baseline: spec 
	<baseline>
	
	spec for: #pharo do: [
		spec repository: 'filetree://./repository/mc'. 
		
		self alien:spec.
		self objCBridge: spec.
		
		spec
			package: 'Mars-Core';
			package: 'Mars-Sand' with: [ 
				spec requires: #('Mars-Core') ];
			package: 'Mars-Gtk' with: [ 
				spec requires: #('Mars-Core' 'Alien') ];
			package: 'Mars-Cocoa' with: [ 
				spec requires: #('Mars-Core' 'Alien' 'ObjCBridge') ].
			 
		spec 
			group: 'default' with: #('internal');
			group: 'internal' with: #('Mars-Core' 'Mars-Sand');
			group: 'cocoa' with: #('Mars-Core' 'Mars-Cocoa');
			group: 'gtk' with: #('Mars-Core' 'Mars-Gtk');
			group: 'all' with: #('internal' 'cocoa' 'gtk') ]