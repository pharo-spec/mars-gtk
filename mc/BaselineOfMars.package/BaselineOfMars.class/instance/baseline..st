baseline
baseline: spec
	<baseline>
	spec for: #common do: [
		self beacon: spec.
		self magritte3: spec.
		spec
			package: 'Mars-Gtk' with: [ spec requires: 'Beacon' ];
			package: 'Mars-Magritte' with: [ spec requires: #('Mars-Gtk' 'Magritte3') ] ]