accessing
baseline: spec 
	<baseline>
	
	spec for: #pharo do: [
		spec repository: 'filetree://./repository/mc'. 
		
		spec
			package: 'Mars-Core';
			package: 'Mars-Sand' with: [ 
				spec requires: #('Mars-Core') ];
			package: 'Mars-Gtk' with: [ 
				spec requires: #('Mars-Core') ].
			 
		spec 
			group: 'default' with: #('internal');
			group: 'internal' with: #('Mars-Core' 'Mars-Sand');
			group: 'gtk' with: #('Mars-Core' 'Mars-Gtk');
			group: 'all' with: #('internal''gtk') ]