accessing
baseline: spec 
	<baseline>
	
	spec for: #pharo do: [
		spec repository: 'filetree://repository/mc'. 
		
		spec
			package: 'Mars-Core';
			package: 'Mars-Gtk' with: [ 
				spec requires: #('Mars-Core') ];
			package: 'Mars-Tests' with: [ 
				spec requires: #('Mars-Core' 'Mars-Gtk') ];
			package: 'Mars-Gtk-Tests' with: [ 
				spec requires: #('Mars-Tests' 'Mars-Gtk') ].
			 
		spec 
			group: 'default' with: #('gtk');
			group: 'gtk' with: #('Mars-Core' 'Mars-Gtk');
			group: 'all' with: #('gtk' 'tests');
			group: 'tests' with: #('Mars-Tests' 'Mars-Gtk-Tests') ]